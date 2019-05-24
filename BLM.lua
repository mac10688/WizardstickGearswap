NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

WeaponSetIndex = 1
WeaponSet = {"Any", "Grioavolr", "Lathi"}

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
    sets.precast.ja['Manafont'] = {}
    sets.precast.ja['Elemental Seal'] = {}
    sets.precast.ja['Mana Wall'] = {}
    sets.precast.ja['Enmity Douse'] = {}
    sets.precast.ja['Manawell'] = {}
    sets.precast.ja['Subtle Sorcery'] = {}
    sets.precast.ja['Cascade'] = {}

    --37% fc
    sets.precast.fc = {
        main="Grioavolr", --fast cast 4%
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
        main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15'}},
        sub="Enki strap",
        ammo="Pemphredo tathlum",
        sub="Enki Strap",
        head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Occult Acumen"+4','Mag. Acc.+11','"Mag.Atk.Bns."+8'}},
        body="Spaekona's Coat +2",
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20'}},
        legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','CHR+8','Mag. Acc.+15'}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+1%','INT+7','Mag. Acc.+15','"Mag.Atk.Bns."+14'}},
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Barkarole earring",
        right_ear="Friomisi earring",
        left_ring="Stikini Ring",
        right_ring="Shiva Ring +1",
        back=magic_atk_cape,
    }

    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Ea hat",
        neck="Mizukage-no-Kubikazari",
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20'}},
        legs="Ea slops",
        feet="Jhakri pigaches +2",
        left_ring="Mujin band",
        back=magic_atk_cape
    })

    sets.midcast.enfeebling = set_combine(sets.midcast.fast_recast, {
        main = "Gada",
        sub = "Ammurapi shield",
        ammo="Hydrocera",
        head = "Befouled Crown",
        neck = "Imbodla Necklace",
        left_ear = "Regal earring",
        right_ear = "Dignitary's earring",
        left_ring="Stikini Ring",
        right_ring="Kishar Ring",
        waist="Luminary Sash",
        feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%'}}
    })

    sets.midcast.cure = set_combine(sets.midcast.fast_recast, {
        main = "Gada",
        sub = "Sors shield",
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
        main="Bolelabunga",
        body="Telchine chasuble"
    })

    sets.midcast.drain_aspir = set_combine(sets.midcast.fast_recast, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        feet="Merlinic crackows"
    })

    sets.midcast.enhancing_magic = set_combine(sets.midcast.conserve_mp, {
        ear1="Andoaa earring"
    })

    sets.ws = {}
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        ear1="Loquacious earring",
        ear2="Etiolation earring",
        neck="Sanctity necklace",
        body="Pedagogy gown +1",
        hands="Kaykaus cuffs",
        ring1="Prolix ring",
        ring2="Vengeful ring",
        waist="Luminary sash",
        legs="Merlinic shalwar",
        feet="Kaykaus boots"
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
        elseif string.find(spell.english, 'Aspir') or string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain_aspir)
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            local nuke_set = NukeSet[NukeTypeIndex]
            if world.day_element == spell.element or world.weather_element == spell.element then
                equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
            else
                equip(sets.midcast.elemental[nuke_set])
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
    if player.main_job == 'BLM' then send_command('@input /lockstyleset 12') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,4)
end