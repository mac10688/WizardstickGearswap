NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

WeaponSetIndex = 1
WeaponSet = {"Lathi", "Grioavolr", "Any",}

Kiting = false

send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleIdleSet')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function self_command(command)
    -- print(command)
    if command == 'CycleNukeSet' then
        NukeTypeIndex = NukeTypeIndex % #NukeSet + 1

        local nuke_set = NukeSet[NukeTypeIndex]
        add_to_chat(122, 'Nuke Set: ' .. nuke_set)
    elseif command == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1

        local weapon_set = WeaponSet[WeaponSetIndex]
        if weapon_set == 'Any' then
            enable('main', 'sub')
        else
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
            disable('main', 'sub')
        end

        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif command == 'CycleIdleSet' then
        IdleSetIndex = IdleSetIndex % #IdleSet + 1

        local idle_set = IdleSet[IdleSetIndex]
        add_to_chat(122, 'Idle Set: ' .. idle_set)
        equip_set(player.status)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeTypeIndex]
        local idle_set = IdleSet[IdleSetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' Idle Set: ' .. idle_set)
        lockstyle()
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    end
end

function get_sets()

    local magic_atk_cape = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local idle_cape = { name="Taranus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Phys. dmg. taken-10%'}}


    sets.WeaponSet = {}
    sets.WeaponSet["Lathi"] = {main="Lathi", sub="Enki strap"}
    sets.WeaponSet["Grioavolr"] = {main="Grioavolr", sub="Enki strap"}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.precast = {}

    sets.precast.ja = {}
    sets.precast.ja['Manafont'] = { body = "Archmage's coat +3"}
    sets.precast.ja['Elemental Seal'] = {}
    sets.precast.ja['Mana Wall'] = {}
    sets.precast.ja['Enmity Douse'] = {}
    sets.precast.ja['Manawell'] = {}
    sets.precast.ja['Subtle Sorcery'] = {}
    sets.precast.ja['Cascade'] = {}

    --37% fc
    sets.precast.fc = {
        head="Merlinic hood", --fast cast 8%
        body="Merlinic jubbah", --fast cast 8%
        legs="Lengo pants",
        feet="Merlinic crackows", --fast cast 5%
        waist="Channeler's stone", --fast cast 2%
        right_ear="Loquacious Earring", --fast cast 2%
        ring2="Prolix Ring", --fast cast 2%
        ring1="Kishar ring" --fast cast 4%
    }

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        legs="Mallquis trews +2",
        left_ring="Mallquis Ring",
        left_ear="Barkarole earring"
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.fc, {})

    sets.precast.fc.cure =set_combine(sets.precast.fc, {
        back="Pahtli cape" -- cure spellcasting time -8%
    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.fast_recast = sets.precast.fc

    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = {
        ammo="Pemphredo tathlum",
        sub="Enki Strap",
        head="Archmage's petasos +3",
        body="Archmage's coat +3",
        hands="Archmage's gloves +3",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3",
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Barkarole earring",
        right_ear="Friomisi earring",
        left_ring="Stikini Ring",
        right_ring="Shiva Ring +1",
        back=magic_atk_cape,
    }

    --MB1 Total: 49
    --MB2 Total: 32
    --MB Total: 81
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Ea hat", --MB: 6 MB2:6
        neck="Sorcerer's stole +1", --MB: 7
        ear2="Static earring", --MB: 5
        body="Ea houppelande", --MB: 8 MB2:8
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20'}}, --MB2: 6
        legs="Ea slops", --MB: 7 MB2:7
        feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5'}}, --MB: 11
        left_ring="Mujin band", --MB2: 5
        back=magic_atk_cape --MB 5
    })

    sets.midcast.elemental.AncientMagic = { head = "Archmage's petasos +3"}

    sets.midcast.elemental.debuff = {
        head="Ea hat",
        neck="Sorcerer's stole +1",
        ear1="Regal earring",
        body="Ea houppelande",
        hands="Amalric gages +1",
        ring1="Stikini ring",
        ring2="Shiva ring +1",
        back=magic_atk_cape,
        belt="Channeler's stone",
        legs="Archmage's tonban +3",
        feet="Jhakri pigaches +2"
    }

    sets.midcast.enfeebling = set_combine(sets.midcast.fast_recast, {
        ammo="Pemphredo tathlum",
        head = "Archmage's petasos +3",
        neck = "Sorcerer's stole +1",
        left_ear = "Regal earring",
        right_ear = "Dignitary's earring",
        body = "Spaekona's coat +2",
        hands= "Archmage's gloves +3",
        left_ring="Stikini Ring",
        right_ring="Kishar Ring",
        back=magic_atk_cape,
        waist="Luminary Sash",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3"
    })

    sets.midcast.cure = set_combine(sets.midcast.fast_recast, {
        head = "Vanya hood",
        body = "Vrikodara jupon",
        hands = "Shrieker's cuffs",
        ring1 = "Haoma's ring",
        ring2 = "Haoma's ring",
        back = "Solemnity cape",
        waist = "Channeler's stone",
        legs = "Gyve trousers",
        feet = "Medium's sabots"
    })

    sets.midcast.regen = set_combine(sets.midcast.fast_recast, {
        body="Telchine chasuble"
    })

    sets.midcast.drain = set_combine(sets.midcast.fast_recast, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        hands="Archmage's gloves +3",
        feet="Merlinic crackows"
    })

    sets.midcast.aspir = set_combine(sets.midcast.drain, {
        feet="Archmage's sabots +3"
    })

    sets.midcast.enhancing_magic = set_combine(sets.midcast.conserve_mp, {
        ear1="Andoaa earring"
    })

    sets.ws = {}
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        neck="Sanctity necklace",
        body="Shamash robe",
        hands="Telchine gloves",
        ring1="Mephitas's ring +1",
        ring2="Vengeful ring",
        waist="Luminary sash",
        legs="Ea slops",
        feet="Archmage's sabots +3"
    }

    sets.idle = {}
    sets.idle["Refresh"] = {
        ammo="Staunch tathlum +1",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Shrieker's cuffs",
        left_ring="Defending ring",
        right_ring="Vengeful ring",
        back=idle_cape,
        waist="Slipor sash",
        legs="Assiduity pants +1"
    }
    sets.idle["PDT"] = {}
    sets.idle["MDT"] = {}

    sets.kiting = {
        ring2="Shneddick ring"
    }

    coroutine.schedule(lockstyle,2)

end

ElementalDebuffs = S{"Burn", "Frost", "Choke", "Rasp", "Shock", "Drown"}
AncientMagic = S{"Flare", "Flare II", "Freeze", "Freeze II", "Tornado", "Tornado II", "Quake", "Quake II", "Burst", "Burst II", "Flood", "Flood II"}

---- .::Precast Functions::. ---->
function precast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then
        -- Everything that have a specific name set -- 
        if sets.precast[spell.english] then
            equip(sets.precast[spell.english]) 
        -- Healing Magic --
        elseif string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') then
            equip(sets.precast.fc.cure)
        -- Enhancing Magic --  
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.fc.enhancing)
        -- Elemental Magic --  
        elseif spell.skill == 'Elemental Magic' then
            equip(sets.precast.fc.elemental)
        else
            equip(sets.precast.fc)
        end
    -- Job Abilities --
    elseif spell.type == 'JobAbility' then
        if sets.precast.ja[spell.english] then
            equip(sets.precast.ja[spell.english])  
        end
    -- Weaponskills --
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then 
            equip(sets.ws[spell.english])
        else
            equip(sets.ws)
        end
    end    
end

---- .::Midcast Functions::. ---->
function midcast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then
        -- Healing Magic --
        if string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') or string.find(spell.english, "Curaga") then
            equip(sets.midcast.cure)
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if string.find(spell.english, 'Regen') then
                equip(sets.midcast.regen)
            else
                equip(sets.midcast.enhancing_magic)   
            end    
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast.enfeebling) 
        elseif string.find(spell.english, 'Aspir') then
            equip(sets.midcast.aspir)
        elseif string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain)
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            if ElementalDebuffs[spell.english] then
                equip(sets.midcast.elemental.debuff)
            else
                local nuke_set = NukeSet[NukeTypeIndex]
                equip(sets.midcast.elemental[nuke_set])
                
                if world.day_element == spell.element or world.weather_element == spell.element then
                    equip({waist = "Hachirin-no-Obi"})
                end

                if AncientMagic[spell.egnlish] then
                    equip(sets.midcast.elemental.AncientMagic)
                end

                if player.mpp < 60 then
                    equip({body="Spaekona's Coat +2"})
                end
            end
        end
    end
end

function equip_set(status)
    local idleSet = IdleSet[IdleSetIndex]
    equip(sets.idle[idleSet])

    local weapon_set_mode = WeaponSet[WeaponSetIndex]
    if weapon_set_mode ~= "Any" then
        equip(sets.WeaponSet[weapon_set_mode])
    end

    if Kiting then
        equip(sets.kiting)
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function lockstyle()
    if player.main_job == 'BLM' then send_command('@input /lockstyleset 15') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,4)
end