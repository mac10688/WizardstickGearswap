--[[
    
    Keyboard Bindings
        F9: Use Tank Gear
        Ctrl + F9: Cycle tank gear set
        F10: Use pure offense gear
        Ctrl + F10: Cycle through offense set
        F11: Set hybrid gearset
        Ctrl + F11: Cycle through hybrid sets
        F12: Refresh gear set to current state
        Ctrl + k: Toggle kiting Mode

    Gearswap functions useful for debugging:
    Lua script: print_set() for printing big objects
                print() for simple strings
    FFXI: //gs debugmode
          //gs showswaps
          note: to turn them off, run the command again
--]]

function help()
    add_to_chat(122, 'Keyboard Bindings:')
    add_to_chat(122, 'F9: Tank Mode')
    add_to_chat(122, 'Ctrl + F9: Cycle Tank Modes')
    add_to_chat(122, 'F10: Offense Mode')
    add_to_chat(122, 'Ctrl + F10: Cycle Offense Modes')
    add_to_chat(122, 'F10: Hybrid Mode')
    add_to_chat(122, 'Ctrl + F10: Cycle Hybrid Modes')
    add_to_chat(122, 'F12: Refresh gear set to current state')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
    add_to_chat(122, 'Ctrl + w: cyle weaponset')
    add_to_chat(122, '//gs c help: To see this information again')
end

help()

Modes = { "tank", "pure-offense", "hybrid" }
ModeIndex = 1

OffenseModes = { "multi-hit", "accuracy"}
OffenseModeIndex = 1

TankModes = {"pdt", "mdt", "resist-status"}
TankModeIndex = 1

HybridModes = {"pdt", "mdt"}
HybridModeIndex = 1

WeaponSetMode = {"epeo", "lionheart"}
WeaponSetIndex = 1

GripSetMode = {"Utu", "Mensch"}
GripSetIndex = 1

Kiting = false

--Bind f9 - f12 keys 
send_command('bind f9 gs c TankMode')
send_command('bind ^f9 gs c Cycle TankModeAttribute')
send_command('bind f10 gs c OffenseMode')
send_command('bind ^f10 gs c Cycle OffenseModeAttribute')
send_command('bind f11 gs c HybridMode')
send_command('bind ^f11 gs c Cycle HybridMode')
send_command('bind f12 gs c Refresh')
send_command('bind ^k gs c toggle kiting')
send_command('bind ^w gs c cycle weaponset')
send_command('bind ^g gs c cycle gripset')

function file_unload()
    --When the file unloads, unbind the commands
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
    send_command('unbind f12')
    send_command('unbind ^k')
    send_command('unbind ^w')
    send_command('unbind ^g')
end

function get_sets()

    local status_ailment_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Occ. inc. resist. to stat. ailments+10'}}
    local fast_cast_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local dt_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%'}}
    local atk_cape = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4'}}
    local dimi_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}
    sets.enmity = {
        neck="Futhark torque +1",
        ear1="Cryptic earring",
        ear2="Friomisi earring",
        -- ring1="Supershear ring",
        ring2="Vengeful ring",
        legs="Erilaz leg guards +1",
        feet="Erilaz greaves +1",
        body="Emet Harness +1",
        back=dt_cape,
        hands="Kurys gloves",
        ammo="Aqreaqa bomblet"
    }

    sets.weaponset = {}
    sets.weaponset["epeo"] = {main="Epeolatry", }
    sets.weaponset["lionheart"] = {main="Lionheart", }

    sets.gripset = {}
    sets.gripset["Utu"] = {sub="Utu grip"}
    sets.gripset["Mensch"] = {sub="Mensch strap +1"}
    --Be very precise about spelling the ability name or it won't be swapped to for job abilities
    sets.ja = {}

    --Run job abilities
    sets.ja['Vallation'] = {
        body="Runeist's coat +2",
        legs="Futhark trousers +3",
        back=dt_cape
    }

    sets.ja['Valiance'] = sets.ja['Vallation']
    sets.ja['Pflug'] = {feet="Runeist's bottes +2"}
    sets.ja['Battuta'] = {head="Futhark bandeau +3"}
    sets.ja['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    
    sets.ja['Lunge'] = {
        ammo="Yamarang",
        head="Thaumas Hat",
        neck="Eddy Necklace",
        ear1="Novio Earring",
        ear2="Friomisi Earring",
        body="Vanir Cotehardie",
        ring1="Acumen Ring",
        ring2="Omega Ring",
        back="Evasionist's Cape",
        waist="Yamabuki-no-obi",
        legs="Iuitl Tights +1",
        feet="Qaaxo Leggings"}

    sets.ja['Swipe'] = sets.ja['Lunge']
    sets.ja['Gambit'] = {hands="Runeist's Mitons +2"}
    sets.ja['Rayke'] = {feet="Futhark Boots +1"}
    sets.ja['Elemental Sforzo'] = {body="Futhark Coat 3"}
    sets.ja['Swordplay'] = {hands="Futhark Mitons +1"}
    sets.ja['Embolden'] = {back="Evasionist's cape"}
    sets.ja['Vivacious Pulse'] = {head="Erilaz galea +1"}
    sets.ja['One For All'] = set_combine(sets.enmity, {})

    --war sub
    sets.ja['Provoke'] = sets.enmity
    sets.ja['Warcry'] = sets.enmity
    sets.ja['Defender'] = sets.enmity
    sets.ja['Aggressor'] = sets.enmity

    --drk sub
    sets.ja['Weapon Bash'] = sets.enmity
    sets.ja['Souleater'] = sets.enmity
    sets.ja['Last Resort'] = sets.enmity

    --Fast cast: 25%
    sets.fc = {
        head="Runeist's bandeau +3", --fc 12%
        neck="Voltsurge torque", --fc 4%
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        body="Vrikodara jupon", --fc 5%
        hands="Leyline gloves", --fc 8% (one day!) 
        ring2="Kishar ring",
        legs="Ayanmo cosciales +2", --fc 6%
        back=fast_cast_cape,
        feet="Carmine greaves +1"
    }

    --Enhancing magic casting time -13%
    sets.fc.enhancing = set_combine( sets.fc, {
        legs="Futhark trousers +3"
    })

    sets.midcast = set_combine(sets.enmity, {
        ammo="Staunch tathlum +1",
        head="Runeist's bandeau +3",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        body="Vrikodara jupon",
        hands="Leyline gloves",
        ring2="Kishar ring",
        back=fast_cast_cape,
        waist="Ioskeha belt +1",
        feet="Carmine greaves +1"
    })

    --blu sub
    sets.midcast["Sheep Song"] = sets.midcast
    sets.midcast["Blank Gaze"] = sets.midcast
    sets.midcast["Jettatura"] = sets.midcast

    --drk sub
    sets.midcast["Stun"] = sets.midcast

    --Enhancing magic duration: 35%
    sets.midcast.enhancing = {
        head="Erilaz galea +1", --Enhancing magic effect duration +15%
        hands="Runeist's mitons +2", --Enhancing magic skill +15
        waist="Austerity belt +1",
        legs="Futhark trousers +3" --Enhancing magic duration +20%
    }

    sets.midcast["Flash"] = sets.midcast
    sets.midcast.enhancing["Foil"] = sets.midcast

    --Regen effect duration: +21
    sets.midcast.enhancing["Regen"] = set_combine(sets.midcast.enhancing, {
        head="Runeist's bandeau +3"
    })

    --Phalanx: +5
    sets.midcast.enhancing["Phalanx"] = set_combine(sets.midcast.enhancing, {
        head="Futhark bandeau +3"
    })

    -- Weaponskill sets
    sets.ws = { 
        ammo="Mantoptera eye",
        head="Meghanada visor +2",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Meghanada cuirie +2",
        hands="Meghanada gloves +2",
        ring1="Petrov ring",
        ring2="Rajas Ring",
        waist="Latria sash",
        legs="Samnuha tights",
        feet="Meghanada jambeaux +2"
    }
    
    --Stat Modifier: 73~85% Str
    --Attack Moddifier: 0.85
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Resolution'] = { 
        ammo="Knobkierrie",
        head={ name="Herculean Helm", augments={'Accuracy+24 Attack+24','Crit. hit damage +1%','STR+7','Accuracy+13','Attack+8'}},
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Adhemar jacket +1",
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','STR+10','Accuracy+6'}},
        ring1="Petrov ring",
        ring2="Niqmaddu ring",
        back=atk_cape,
        waist="Fotia belt",
        legs={ name="Herculean Trousers", augments={'Accuracy+20 Attack+20','STR+6','Accuracy+11'}},
        feet="Meghanada jambeaux +2"
    }
    
    --Stat Modifier: 80% Dex
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Dimidiation'] = {
        ammo="Knobkierrie",
        head="Futhark bandeau +3",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Sherida earring",
        body="Adhemar jacket +1",
        hands="Meghanada gloves +2",
        ring1="Niqmaddu ring",
        ring2="Ilabrat ring",
        back=dimi_cape,
        waist="Fotia belt", 
        legs="Samnuha tights",
        feet="Meghanada jambeaux +2"
    }

    --Stat Modifier: 80% Vit
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Herculean Slash'] = { 
        ammo="Mantoptera eye",
        head="Runeist's bandeau +3",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Futhark coat +3",
        hands="Meghanada gloves +2",
        ring1="Petrov ring",
        ring2="Supershear ring",
        waist="Fotia belt",
        legs="Carmine cuisses +1",
        feet="Erilaz greaves +1"
    }

    --Stat Modifier: 30% Str, 30% Mnd
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Shockwave'] = { 
        ammo="Knobkierrie",
        head="Futhark bandeau +3",
        neck="Futhark torque +1",
        ear1="Sherida earring",
        ear2="Ishvara earring",
        body="Futhark coat +3",
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','STR+10','Accuracy+6'}},
        ring1="Petrov ring",
        ring2="Niqmaddu ring",
        back=dimi_cape,
        waist="Fotia belt",
        legs="Futhark trousers +3",
        feet="Meghanada jambeaux +2"
    }

    sets.tank = {}


    --DT: 28
    --PDT: 65
    --MDT: 31
    --Haste: 25
    --Accuracy: 11
    sets.tank["pdt"] = {
        ammo="Staunch tathlum +1", --dt: 2
        head="Futhark bandeau +3", --dt: 5 haste: 8
        neck="Futhark torque +1",--dt: 5
        ear1="Odnowa earring +1", --mdt: 2
        ear2="Etiolation earring",
        body="Futhark coat +3", --dt: 7 haste: 4
        hands="Turms mittens +1", --pdt: 2 haste: 5
        ring1="Defending ring", --dt: 10
        ring2="Moonbeam ring", --pdt: 3
        back= dt_cape,--pdt: 5
        waist="Flume belt +1", --haste: 6 acc: 11
        legs="Erilaz leg guards +1",  --pdt: 7 haste: 6
        feet="Erilaz greaves +1" --pdt: 5 haste: 4
    }

    sets.tank["mdt"] = {
        ammo="Staunch tathlum +1", --dt: 2 status: 10
        head="Erilaz galea +1", --mdb: 5 meva: 69 haste: 8
        neck="Inquisitor bead necklace", --mdb: 8
        ear1="Odnowa earring +1", --dt: 2 acc: 5~10
        ear2="Hearty earring", --status: 5
        body="Runeist's coat +2", --mdb: 6 meva: 84 haste: 4 
        hands="Turms mittens +1", --mdb: 5 meva: 101 haste: 4
        ring1="Defending ring", --dt: 10
        ring2="Vengeful ring", --meva: 9
        back=dt_cape, --meva: 20
        waist="Flume belt +1",
        legs="Runiest's trousers +2", --mdb: 5 meva: 69 pdt: 3 rele: 6 haste: 6 status: 6
        feet="Erilaz greaves +1" --mdb: 5 meva: 107 pdt: 5 rele: 25 haste: 4
    }

    sets.tank["resist-status"] = set_combine( sets.tank["mdt"], {
        back=status_ailment_cape,
        hands="Erilaz gauntlets +1"
    })

    sets.engaged = {}

    sets.engaged.pure_offense = {}
    sets.engaged.pure_offense["multi-hit"] = {
        ammo="Ginsen",
        head="Dampening tam",
        neck="Anu torque",
        ear1="Telos earring",
        ear2="Sherida earring",
        body="Adhemar jacket +1",
        hands="Adhemar wristbands +1",
        ring1="Niqmaddu ring",
        ring2="Epona's ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Samnuha tights",
        feet="Meghanada jambeaux +2"
    }

    sets.engaged.pure_offense["accuracy"] = {
        ammo="Yamarang",
        head="Meghanada visor +2",
        neck="Ej necklace",
        ear1="Telos earring",
        ear2="Mache earring",
        body="Meghanada cuirie +2",
        hands="Adhemar wristbands +1",
        left_ring="Supershear ring",
        ring2="Moonbeam ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Carmine cuisses +1",
        feet="Meghanada jambeaux +2"
    }

    sets.engaged.hybrid = {}
    sets.engaged.hybrid["pdt"] = {
        ammo="Ginsen",
        head="Ayanmo zucchetto +2",
        neck="Futhark torque +1",
        ear1="Telos Earring",
        ear2="Sherida earring",
        body="Futhark coat +3",
        hands="Adhemar wristbands +1",
        ring1="Moonbeam ring",
        ring2="Ilabrat ring",
        back=dt_cape,
        waist="Ioskeha belt +1",
        legs="Meghanada chausses +2",
        feet="Ayanmo gambieras +2"
    }

    sets.engaged.hybrid["mdt"] = sets.engaged.hybrid["pdt"]

    sets.kiting = {
        legs="Carmine cuisses +1",
        feet="Hippomenes socks +1"
    }

    coroutine.schedule(lockstyle,2)

end

-----------------------------------------------------------------------------------

--Read the current state of engaged mode, tank mode and kiting mode to determine the gear to put on
function SetGearToState(state)
    -- print(state)
    local weaponsetMode = WeaponSetMode[WeaponSetIndex]
    equip(sets.weaponset[weaponsetMode])
    local gripSet = GripSetMode[GripSetIndex]
    equip(sets.gripset[gripSet])
    if state == 'Engaged' then
        local mode = Modes[ModeIndex]
        -- print(mode)
        if mode == "tank" then
            local tankMode = TankModes[TankModeIndex]
            equip(sets.tank[tankMode])
        elseif mode == "pure-offense" then
            local offenseMode = OffenseModes[OffenseModeIndex]
            equip(sets.engaged.pure_offense[offenseMode])
        else
            local hybridMode = HybridModes[HybridModeIndex]
            equip(sets.engaged.hybrid[hybridMode])
        end
    else
        local tankMode = TankModes[TankModeIndex]
        equip(sets.tank[tankMode])
    end
    
    if Kiting then
        equip(sets.kiting)
    end

    

end

-----------------------------------------------------------------------------------

--This function is used to read commands sent to gearswap from the ffix chat window
--i.e. //gs c CycleEngagedMode
function self_command(command)
    if command == 'TankMode' then
        ModeIndex = 1
        SetGearToState(player.status)

        local mode = TankModes[TankModeIndex]
        add_to_chat(122, 'Tank Mode Set: ' .. mode)
    elseif command == 'Cycle TankModeAttribute' then
        TankModeIndex = TankModeIndex % #TankModes + 1
        SetGearToState(player.status)

        local mode = TankModes[TankModeIndex]
        add_to_chat(122, 'Tank Mode Set: ' .. mode)
    elseif command == 'OffenseMode' then
        ModeIndex = 2
        SetGearToState(player.status)

        local mode = OffenseModes[OffenseModeIndex]
        add_to_chat(122, 'Offense Mode Set: ' .. mode)
    elseif command == "Cycle OffenseModeAttribute" then
        OffenseModeIndex = OffenseModeIndex % #OffenseModes + 1
        SetGearToState(player.status)

        local mode = OffenseModes[OffenseModeIndex]
        add_to_chat(122, 'Offense Mode Set: ' .. mode)
    elseif command == "HybridMode" then
        ModeIndex = 3
        SetGearToState(player.status)

        local mode = HybridModes[HybridModeIndex]
        add_to_chat(122, 'Hybrid Mode Set: ' .. mode)
    elseif command == "Cycle HybridMode" then
        HybridModeIndex = HybridModeIndex % #HybridModes + 1
        SetGearToState(player.status)

        local mode = HybridModes[HybridModeIndex]
        add_to_chat(122, 'Hybrid Mode Set: ' .. mode)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting

        SetGearToState(player.status)

        if Kiting then
            add_to_chat(122, 'Kiting on')
        else
            add_to_chat(122, 'Kiting off')
        end
    elseif command == 'cycle weaponset' then
        WeaponSetIndex = WeaponSetIndex % #WeaponSetMode + 1

        SetGearToState(player.status)
        local mode = WeaponSetMode[WeaponSetIndex]
        add_to_chat(122, 'Weapon Set: ' .. mode)
    elseif command == 'cycle gripset' then
        GripSetIndex = GripSetIndex % #GripSetMode + 1

        SetGearToState(player.status)
        local mode = GripSetMode[GripSetIndex]
        add_to_chat(122, 'Grip Set: ' .. mode)
    elseif command == 'Refresh' then
        SetGearToState(player.status)

        local mode = Modes[ModeIndex]
        local kitingMode = (Kiting and "On" or "Off")

        if ModeIndex == 1 then
            local tankMode = TankModes[TankModeIndex]
            add_to_chat(122, 'Mode: ' .. mode .. ' || Type: ' .. tankMode .. ' || Kiting: ' .. kitingMode)
        elseif ModeIndex == 2 then
            local offenseMode = OffenseModes[OffenseModeIndex]
            add_to_chat(122, 'Mode: ' .. mode .. ' || Type: ' .. offenseMode .. ' || Kiting: ' .. kitingMode)
        else
            local hybridMode = HybridModes[HybridModeIndex]
            add_to_chat(122, 'Mode: ' .. mode .. ' || Type: ' .. hybridMode .. ' || Kiting: ' .. kitingMode)
        end
        lockstyle()
    elseif command == 'help' then
        help()
    end
end

-----------------------------------------------------------------------------------

function precast(spell)
    -- print_set(spell) --print out the spell structure to chat log. Useful for debugging. Uncomment to use
    if spell.type == 'WeaponSkill' then
        --Check to see if we have the specific weaponskill set defined, if we do, use it, if not, use the generic sets.ws
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.fc.enhancing)
    elseif spell.action_type == 'Magic' then
        --Just use a magic fast cast set
        equip(sets.fc)
    elseif spell.action_type == 'Ability' then
        --If we have a set for jobability defined, use it
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    end

end

-----------------------------------------------------------------------------------

function midcast(spell)
    -- print_set(spell) --print out the spell structure to chat log. Useful for debugging. Uncomment to use
    local tankMode = TankModes[TankModeIndex]
    local tankSet = sets.tank[tankMode] --Put on the tank gear, to take off the fast cast set, it's not needed anymore
    if spell.skill == 'Enhancing Magic' then
        --If we have a specific set for the enhancing magic spell, use it, otherwise use the generic
        if sets.midcast.enhancing[spell.name] then
            local midcastSet = set_combine(tankSet, sets.midcast.enhancing[spell.name])
            equip(midcastSet)
        else
            local midcastSet = set_combine(tankSet, sets.midcast.enhancing)
            equip(midcastSet)
        end
    elseif sets.midcast[spell.name] then -- If we have a midcast set for the specific spell, use it
        equip(set_combine(tankSet, sets.midcast[spell.name]))
    elseif spell.action_type == 'Magic' then
        equip(set_combine(tankSet, sets.midcast))
    end
end

-----------------------------------------------------------------------------------

function aftercast(spell)
    --After ws, ability, or spell is used reset the gear to the state
    SetGearToState(player.status)
end

function filtered_action(spell)
    SetGearToState(player.status)
end

-----------------------------------------------------------------------------------

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    SetGearToState(new)
end

-----------------------------------------------------------------------------------

function lockstyle()
    if player.main_job == 'RUN' then send_command('@input /lockstyleset 9') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,4)
end