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

TankModes = {"pdt", "mdt", "resist-status", "kb"}
TankModeIndex = 1

HybridModes = {"pdt", "mdt", "th"}
HybridModeIndex = 1

WeaponSetMode = {"epeo", "lionheart", "Lycurgos"}
WeaponSetIndex = 1

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
end

function get_sets()

    local status_ailment_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Occ. inc. resist. to stat. ailments+10'}}
    local fast_cast_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local dt_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%'}}
    local atk_cape = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    local dimi_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}

    local herc_head_ws = { name="Herculean Helm", augments={'DEX+1','CHR+3','Weapon skill damage +5%','Accuracy+17 Attack+17','Mag. Acc.+20 "Mag.Atk.Bns."+20'}}
    local herc_hand_ws = { name="Herculean Gloves", augments={'AGI+1','STR+12','Weapon skill damage +8%','Accuracy+11 Attack+11'}}
    local herc_body_ws = { name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +4%','DEX+10','Attack+3'}}
    local herc_legs_ws = { name="Herculean Trousers", augments={'Potency of "Cure" effect received+4%','STR+1','Weapon skill damage +8%','Accuracy+13 Attack+13','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}

    sets.tank = {}
    --DT: 52
    sets.tank["pdt"] = {
        ammo="Staunch tathlum +1", --dt: 3
        head="Nyame helm", --dt: 7
        neck="Futhark torque +2",--dt: 7
        ear1="Odnowa earring +1",--dt: 3
        ear2="Tuisto earring",
        body="Nyame mail", --dt: 9
        hands="Turms mittens +1",
        ring1="Shadow ring", --dt: 10
        ring2={name="Moonlight ring", bag="wardrobe6"}, --dt: 5
        back= dt_cape,--dt: 5
        waist="Flume belt +1",
        legs="Erilaz leg guards +3",  --dt: 13
        feet="Turms leggings +1"
    }

    --dt: 53
    --mdb: 61
    --meva: 690
    --resist elements: 65-75
    --resist status: 19
    sets.tank["mdt"] = {
        ammo="Staunch tathlum +1", --dt:3 status: 11
        head="Erilaz galea +3", --mdb:9 meva:119
        neck="Warder's charm +1", --resist:20
        ear1="Sanare earring", --mdb:4 meva:9
        ear2="Erilaz earring +1", --dt:5 meva:11   
        body="Erilaz surcoat +3", --mdb:10 meva:130 
        hands="Erilaz gauntlets +3", --dt:11 mdb:7 meva:87 status:8
        ring1="Shadow ring",
        ring2={name="Moonlight ring", bag="wardrobe6"}, --dt:5
        back=dt_cape, --meva: 20 dt:5
        waist="Engraved belt", --resist:20
        legs="Erilaz leg guards +3", --dt:13 mdb: 10 meva:157
        feet="Erilaz greaves +3" --dt:11 mdb:9 meva:157 resist:35
    }

    sets.tank["resist-status"] = set_combine( sets.tank["mdt"], {
        back=status_ailment_cape,
        hands="Erilaz gauntlets +3"
    })

    sets.tank["kb"] = set_combine( sets.tank["mdt"], {
        back="Repulse mantle",
        ring2="Vocane ring +1",
        legs="Dashing subligar"
    })

    --81 enmmity
    sets.enmity = set_combine( sets.tank["pdt"], {
        ammo="Aqreqaq bomblet", -- 2 enmity
        head="Halitus helm", -- 8 enmity
        neck="Futhark torque +2", --10 enmity
        ear1="Cryptic earring", --4 enmity
        body="Emet Harness +1", --10 enmity
        -- ear2="Friomisi earring",
        ring1="Supershear ring", -- 5 enmity
        hands="Kurys gloves", -- 9 enmity
        ring2="Vengeful ring", --3 enmity
        back=dt_cape, -- 10 enmity
        legs="Erilaz leg guards +3", --13 enmity
        feet="Erilaz greaves +3" --8 enmity
    })

    sets.weaponset = {}
    sets.weaponset["epeo"] = {main="Epeolatry", sub="Utu grip"}
    sets.weaponset["lionheart"] = {main="Lionheart", sub="Utu grip"}
    sets.weaponset["Lycurgos"] = {main="Lycurgos", sub="Utu grip"}
    --Be very precise about spelling the ability name or it won't be swapped to for job abilities
    sets.ja = {}

    --Run job abilities
    sets.ja['Vallation'] = set_combine(sets.enmity, {
        body="Runeist coat +3",
        legs="Futhark trousers +3",
        back=dt_cape
    })

    sets.ja['Valiance'] = set_combine(sets.enmity, sets.ja['Vallation'])
    sets.ja['Pflug'] = set_combine(sets.enmity, {feet="Runeist bottes +3"})
    sets.ja['Battuta'] = set_combine(sets.enmity, {head="Futhark bandeau +3"})
    sets.ja['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    
    sets.ja['Lunge'] = set_combine(sets.enmity, {
        ammo="Yamarang",
        head="Agwu's cap",
        neck="Sanctity necklace",
        -- ear1="Novio Earring",
        -- ear2="Friomisi Earring",
        body="Agwu's robe",
        hands="Agwu's gages",
        ring1="Metamorph ring +1",
        ring2="Shiva ring +1",
        back="Evasionist's Cape",
        waist="Orpheus's sash",
        legs="Agwu's slops",
        feet="Agwu's pigaches"
    })

    sets.ja['Swipe'] = sets.ja['Lunge']
    sets.ja['Gambit'] = set_combine(sets.enmity, {hands="Runeist Mitons +3"})
    sets.ja['Rayke'] = set_combine(sets.enmity, {feet="Futhark Boots +3"})
    sets.ja['Elemental Sforzo'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.ja['Swordplay'] = set_combine(sets.enmity, {hands="Futhark Mitons +3"})
    sets.embolden = {back="Evasionist's cape"}
    sets.ja['Vivacious Pulse'] = set_combine(sets.enmity, {head="Erilaz galea +3"})
    sets.ja['One for All'] = set_combine(sets.enmity, {})

    --war sub
    sets.ja['Provoke'] = sets.enmity
    sets.ja['Warcry'] = sets.enmity
    sets.ja['Defender'] = sets.enmity
    sets.ja['Aggressor'] = sets.enmity

    --drk sub
    sets.ja['Weapon Bash'] = sets.enmity
    sets.ja['Souleater'] = sets.enmity
    sets.ja['Last Resort'] = sets.enmity

    --Fast cast: 28%
    sets.fc = {
        head="Runeist bandeau +3", --fc 12%
        neck="Voltsurge torque", --fc 4%
        ear1="Etiolation earring",
        body="Erilaz surcoat +3", --fc 13%
        hands="Leyline gloves", --fc 8%
        ring1="Kishar ring",
        -- legs="Ayanmo cosciales +2", --fc 6%
        back=fast_cast_cape,
        feet="Carmine greaves +1"
    }

    --Enhancing magic casting time -13%
    sets.fc.enhancing = set_combine( sets.fc, {
        legs="Futhark trousers +3"
    })

    sets.midcast = {}
    sets.midcast.enmity = set_combine(sets.tank["pdt"], {
        ammo="Staunch tathlum +1",
        head="Halitus helm",
        body="Emet harness +1",
        ear1="Cryptic earring",
        hands="Kurys gloves",
        ring1="Eihwaz ring",
        back=dt_cape,
        waist="Audumbla sash",
        legs="Erilaz leg guards +3",
        feet="Erilaz greaves +3"
    })

    --110%
    sets.midcast.SIRD = set_combine(sets.tank["pdt"], {
        ammo="Staunch tathlum +1", --11%
        head="Erilaz galea +3", --20%
        neck="Moonlight necklace", --15%
        ear1="Magnetic earring", --8%
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        hands="Regal Gauntlets", --15%
        back=fast_cast_cape, --10%
        waist="Audumbla sash", --10%
        legs="Carmine cuisses +1", --20%
    })

    sets.midcast.SIRD.enmity = set_combine(sets.midcast.SIRD, {
        -- head="Halitus helm",
        body="Emet harness +1",
        ring1="Eihwaz ring"
    })

    --blu sub
    sets.midcast["Sheep Song"] = sets.midcast.SIRD
    sets.midcast["Blank Gaze"] = sets.midcast.SIRD
    sets.midcast["Jettatura"] = sets.midcast.SIRD
    sets.midcast["Soporific"] = sets.midcast.SIRD
    sets.midcast["Cursed Sphere"] = sets.midcast.SIRD
    sets.midcast["Geist Wall"] = sets.midcast.SIRD
    sets.midcast["Healing Breeze"] = sets.midcast.SIRD

    --drk sub
    sets.midcast["Stun"] = sets.midcast.enmity

    --Enhancing magic duration: 45%
    sets.midcast.enhancing = set_combine(sets.midcast.SIRD, {
        head="Erilaz galea +3", --Enhancing magic effect duration +25%
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        waist="Audumbla sash",
        legs="Futhark trousers +3" --Enhancing magic duration +20%
    })

    sets.midcast["Cocoon"] = sets.midcast.SIRD
    sets.midcast["Flash"] = sets.midcast.enmity
    sets.midcast.enhancing["Foil"] = sets.midcast.enmity

    --Regen effect duration: +21
    sets.midcast.enhancing["Regen"] = set_combine(sets.midcast.enhancing, {
        head="Runeist bandeau +3"
    })
    sets.midcast.enhancing["Regen II"] = sets.midcast.enhancing["Regen"]
    sets.midcast.enhancing["Regen III"] = sets.midcast.enhancing["Regen"]
    sets.midcast.enhancing["Regen IV"] = sets.midcast.enhancing["Regen"]

    --Phalanx: +5
    sets.midcast.enhancing["Phalanx"] = set_combine(sets.midcast.enhancing, {
        head="Futhark bandeau +3",
        body={ name="Herculean Vest", augments={'STR+2','AGI+2','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10'}},
        hands="Herculean gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs="Taeon tights",
        feet="Taeon boots"
    })

    -- Weaponskill sets
    sets.ws = { 
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Petrov ring",
        ring2="Regal ring",
        back=atk_cape,
        waist="Fotia belt",        
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }
    
    --Stat Modifier: 73~85% Str
    --Attack Moddifier: 0.85
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Resolution'] = { 
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2="Regal ring",
        back=atk_cape,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }
    
    --Stat Modifier: 80% Dex
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Dimidiation'] = {
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Sherida earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2="Ilabrat ring",
        back=dimi_cape,
        waist="Fotia belt", 
        legs="Lustratio subligar +1",
        feet="Lustratio leggings +1"
    }

    --Stat Modifier: 80% Vit
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Herculean Slash'] = sets.ws

    --Stat Modifier: 30% Str, 30% Mnd
    --DT: 
    --PDT:
    --MDT:
    --Accuracy:
    sets.ws['Shockwave'] = sets.ws

    sets.engaged = {}

    sets.engaged.pure_offense = {}
    sets.engaged.pure_offense["multi-hit"] = {
        ammo="Yamarang",
        head="Dampening tam",
        neck="Anu torque",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ear1="Telos earring",
        ear2="Sherida earring",
        ring1="Niqmaddu ring",
        ring2="Epona's ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Samnuha tights",
        feet="Nyame sollerets"
    }

    sets.engaged.pure_offense["accuracy"] = {
        ammo="Yamarang",
        head="Runeist bandeau +3",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Chirich ring +1",
        ring2="Regal ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.hybrid = {}
    sets.engaged.hybrid["pdt"] = {
        ammo="Yamarang",
        head="Nyame helm",
        neck="Futhark torque +2",
        ear1="Telos Earring",
        ear2="Sherida earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.hybrid["mdt"] = sets.engaged.hybrid["pdt"]

    sets.engaged.hybrid["th"] = set_combine(sets.engaged.hybrid["pdt"], {
        body={ name="Herculean Vest", augments={'Accuracy+1','INT+1','"Treasure Hunter"+2','Accuracy+10 Attack+10'}},
        waist="Chaac belt"
    })

    sets.kiting = {
        legs="Carmine cuisses +1",
        feet="Hippomenes socks +1"
    }

    sets.HolyWater = {
        neck="Nicander's necklace",
        ring1={name="Blenmot's ring +1", bag="warddrobe5"},
        ring2={name="Blenmot's ring +1", bag="warddrobe6"} 
    }

    coroutine.schedule(lockstyle,2)

end

-----------------------------------------------------------------------------------

--Read the current state of engaged mode, tank mode and kiting mode to determine the gear to put on
function SetGearToState(state)
    -- print(state)
    local weaponsetMode = WeaponSetMode[WeaponSetIndex]
    equip(sets.weaponset[weaponsetMode])
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
    elseif command == "phal" then
        equip(sets.midcast.enhancing["Phalanx"])
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
    elseif spell.type == "Item" then
        if spell.name == "Holy Water" or spell.name == "Hallowed Water" then
            equip(sets.HolyWater)
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

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") and gain then
        SetGearToState(player.status)
    end
    if buff == 'Embolden' and gain then
        equip(sets.embolden)
        disable('back')
    elseif buff == 'Embolden' and not gain then
        enable('back')
        SetGearToState(player.status)
    end
end

-----------------------------------------------------------------------------------

function lockstyle()
    if player.main_job == 'RUN' then send_command('@input /lockstyleset 5') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end