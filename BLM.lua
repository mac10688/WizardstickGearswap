NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

WeaponSetIndex = 1
WeaponSet = {"Laevateinn", "Any"}

EngagedSetIndex = 1
EngagedSet = {"None", "Accuracy"}

Kiting = false

send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleIdleSet')
send_command('bind f11 gs c CycleEngagedSet')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')

    enable('main', 'sub')
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
    elseif command == 'CycleEngagedSet' then
        EngagedSetIndex = EngagedSetIndex % #EngagedSet + 1

        local engaged_set = EngagedSet[EngagedSetIndex]
        add_to_chat(122, 'Engaged Set: ' .. engaged_set)
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
    local magic_int_ws = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%'}}

    sets.WeaponSet = {}
    sets.WeaponSet["Laevateinn"] = {main="Laevateinn", sub="Khonsu"}

    sets.engaged = {}
    sets.engaged["Accuracy"] = {
        head="Jhakri coronal +2",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Archmage's coat +3",
        hands="Archmage's gloves +3",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        waist="Grunfeld rope",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3",
        back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Haste+10','Mag. Evasion+15'}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.precast = {}

    

    sets.precast.ja = {}
    sets.precast.ja['Manafont'] = { body = "Archmage's coat +3"}
    sets.precast.ja['Elemental Seal'] = {}
    sets.precast.ja['Mana Wall'] = { feet = "Wicce sabots +1" }
    sets.precast.ja['Enmity Douse'] = {}
    sets.precast.ja['Manawell'] = {}
    sets.precast.ja['Subtle Sorcery'] = {}
    sets.precast.ja['Cascade'] = {}

    --44% fc
    sets.precast.fc = {
        head="Merlinic hood", --fast cast 8%
        body="Merlinic jubbah", --fast cast 8%
        hands="Agwu's gages", --fast cast 6%
        legs="Lengo pants",
        feet="Merlinic crackows", --fast cast 5%
        waist="Embla sash", --fast cast 5%
        ear1="Malignance earring", --fast cast 4%
        ear2="Loquacious Earring", --fast cast 2%
        ring2="Prolix Ring", --fast cast 2%
        ring1="Kishar ring" --fast cast 4%
    }

    

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        head="Wicce petasos +1",
        ear2="Barkarole earring",
        body="Wicce Coat +1",
        ring1="Mallquis Ring",
        legs="Mallquis trews +2",
        feet="Spaekona's sabots +3"
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
        head="Archmage's petasos +3",
        body="Archmage's coat +3",
        hands="Archmage's gloves +3",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3",
        neck="Sorcerer's stole +1",
        waist="Sacro cord",
        ear1="Malignance earring",
        ear2="Barkarole earring",        
        left_ring="Freke ring",
        right_ring="Shiva Ring +1",
        back=magic_atk_cape,
    }

    sets.precast['Impact'] = set_combine(sets.precast.fc, {
        head=empty,
        body='Twilight cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head=empty,
        ring2="Archon ring",
        body='Twilight cloak'
    })

    sets.midcast['Comet'] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Pixie hairpin +1",
        ring2="Archon ring",
    })

    --MB1 Total: 44
    --MB2 Total: 33
    --MB Total: 77
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Ea hat +1", --MB: 6 MB2:6
        neck="Sorcerer's stole +1", --MB: 7
        body="Ea houppelande", --MB: 8 MB2:8
        hands="Amalric gages +1", --MB2: 6
        legs="Ea slops +1", --MB: 8 MB2:8
        feet="Spaekona's sabots +3", --MB: 10
        right_ring="Mujin band", --MB2: 5
        back=magic_atk_cape --MB 5
    })

    sets.midcast.elemental.AncientMagic = { head = "Archmage's petasos +3"}

    sets.midcast.elemental.debuff = {
        head="Ea hat +1",
        neck="Sorcerer's stole +1",
        ear1="Regal earring",
        body="Ea houppelande",
        hands="Amalric gages +1",
        ring1="Freke ring",
        ring2="Shiva ring +1",
        back=magic_atk_cape,
        waist="Embla sash",
        legs="Archmage's tonban +3",
        feet="Jhakri pigaches +2"
    }

    sets.midcast.enfeebling = set_combine(sets.midcast.fast_recast, {
        ammo="Pemphredo tathlum",
        head = "Spaekona's petasos +3",
        neck = "Sorcerer's stole +1",
        left_ear = "Regal earring",
        right_ear="Malignance earring",
        body = "Spaekona's coat +3",
        hands= "Spaekona's gloves +3",
        left_ring="Stikini Ring +1",
        right_ring="Kishar Ring",
        back=magic_atk_cape,
        waist="Luminary Sash",
        legs="Archmage's tonban +3",
        feet="Spaekona's sabots +3"
    })

    sets.midcast.cure = set_combine(sets.midcast.fast_recast, {
        head = "Vanya hood",
        neck="Incanter's torque",
        body = "Vrikodara jupon",
        hands = "Shrieker's cuffs",
        ring1 = "Haoma's ring",
        ring2 = "Menelaus's ring",
        back = "Solemnity cape",
        waist = "Embla sash",
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
        legs="Spaekona's tonban +3",
        feet="Merlinic crackows"
    })

    sets.midcast.aspir = set_combine(sets.midcast.drain, {
        feet="Archmage's sabots +3"
    })

    sets.midcast.enhancing_magic = set_combine(sets.midcast.conserve_mp, {
        head="Telchine cap",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Telchine chasuble",
        hands="Telchine gloves",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    })

    local physical_int_ws = {
        head="Archmage's petasos +3",
        neck="Sorcerer's stole +1",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Archmage's coat +3",
        hands="Jhakri cuffs +2",
        ring1="Shiva ring +1",
        ring2="Freke ring",
        back=magic_int_ws,
        waist="Fotia belt",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3"
    }

    local magical_int_ws = {
        head="Archmage's petasos +3",
        neck="Sorcerer's stole +1",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Archmage's coat +3",
        hands="Jhakri cuffs +2",
        ring1="Shiva ring +1",
        ring2="Freke ring",
        back=magic_int_ws,
        waist="Orpheus's sash",
        legs="Archmage's tonban +3",
        feet="Archmage's sabots +3"
    }

    local dark_magic_affinity = {head="Pixie hairpin +1", ring1="Archon ring"}
    local dark_magic_int_ws = set_combine(magical_int_ws, dark_magic_affinity)

    sets.ws = {}

    -- STR 40% | Physical
    sets.ws["Heavy Swing"] = physical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.ws["Rock Crusher"] = magical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.ws["Earth Crusher"] = magical_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.ws["Starburst"] = dark_magic_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.ws["Sunburst"] = dark_magic_int_ws
    
    -- STR 100% | Physical
    sets.ws["Shell Crusher"] = physical_int_ws
    
    -- STR 50% | Physical
    sets.ws["Full Swing"] = physical_int_ws
    
    -- INT 50% MND 50% | Physical
    sets.ws["Spirit Taker"] = physical_int_ws
    
    -- STR 30% MND 50% | Physical
    sets.ws["Retribution"] = physical_int_ws
    
    -- INT 85% | Physical
    sets.ws["Shattersoul"] = physical_int_ws

    -- STR 30% INT 30% | Magical
    sets.ws["Cataclysm"] = dark_magic_int_ws

    -- INT 80%  | Magical
    sets.ws["Vidohunir"] = dark_magic_int_ws

    -- MAX MP
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        neck="Sanctity necklace",
        body="Spaekona's coat +3",
        hands="Spaekona's gloves +3",
        ring1="Mephitas's ring +1",
        ring2="Mephitas's ring",
        waist="Luminary sash",
        legs="Spaekona's tonban +2",
        feet="Spaekona's sabots +3"
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
        legs="Assiduity pants +1",
        feet="Archmage's sabots +3"
    }
    sets.idle["PDT"] = sets.idle["Refresh"]
    sets.idle["MDT"] = sets.idle["Refresh"]

    sets.kiting = {
        ring2="Shneddick ring"
    }

    coroutine.schedule(lockstyle,8)

end

ElementalDebuffs = S{"Burn", "Frost", "Choke", "Rasp", "Shock", "Drown"}
AncientMagic = S{"Flare", "Flare II", "Freeze", "Freeze II", "Tornado", "Tornado II", "Quake", "Quake II", "Burst", "Burst II", "Flood", "Flood II"}

---- .::Precast Functions::. ---->
function precast(spell)
    -- print_set(spell)
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.action_type == 'Magic' then
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
    -- print_set(spell.target)
    if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
    elseif spell.action_type == 'Magic' then
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

                local distance = windower.ffxi.get_mob_by_index(spell.target.index).distance:sqrt()
                if distance < 5 then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Orpheus's sash"}))                                
                elseif world.day_element == spell.element or world.weather_element == spell.element then
                    equip({waist = "Hachirin-no-Obi"})
                end

                if AncientMagic[spell.egnlish] then
                    equip(sets.midcast.elemental.AncientMagic)
                end

                if player.mp < 1000 then
                    equip({body="Spaekona's Coat +3"})
                end
            end
        end
    end
end

function equip_set(status)
    if status == "Engaged" and EngagedSet[EngagedSetIndex] ~= "None" then
        local engagedSet = EngagedSet[EngagedSetIndex]
        equip(sets.engaged[engagedSet])
    else
        local idleSet = IdleSet[IdleSetIndex]
    -- print(idleSet)
        equip(sets.idle[idleSet])
    end

    local weapon_set_mode = WeaponSet[WeaponSetIndex]
    if weapon_set_mode ~= "Any" then
        equip(sets.WeaponSet[weapon_set_mode])
    end

    if buffactive['Mana Wall'] then
        equip(sets.precast.ja['Mana Wall'])
    end

    if Kiting then
        equip(sets.kiting)
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    equip_set(new)
end

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

function lockstyle()
    if player.main_job == 'BLM' then send_command('@input /lockstyleset 3') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end