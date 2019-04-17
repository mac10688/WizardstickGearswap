NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

send_command('bind f9 gs c CycleNukeSet')
send_command('bind f10 gs c CycleIdleSet')
send_command('bind f12 gs c RefreshSet')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')
end

function self_command(command)
    -- print(command)
    if command == 'CycleNukeSet' then
        NukeTypeIndex = NukeTypeIndex % #NukeSet + 1

        local nuke_set = NukeSet[NukeTypeIndex]
        add_to_chat(122, 'Nuke Set: ' .. nuke_set)
    elseif command == 'CycleIdleSet' then
        IdleSetIndex = IdleSetIndex % #IdleSet + 1

        local idle_set = IdleSet[IdleSetIndex]
        add_to_chat(122, 'Idle Set: ' .. idle_set)
    elseif command == 'RefreshSet' then

    end
end

function get_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.precast = {}

    sets.precast.ja = {}
    sets.precast.ja['Tabula Rasa'] = {}
    sets.precast.ja['Enlightenment'] = {}
    sets.precast.ja['Sublimation'] = {}
    sets.precast.ja['Altruism'] = {}
    sets.precast.ja['Focalization'] = {}

    --37% fc
    sets.precast.fc = {
        main="Grioavolr", --fast cast 4%
        head="Merlinic hood", --fast cast 8%
        body="Shango robe", --fast cast 8%
        hands="Magavan mitts", --fast cast 2%
        feet="Merlinic crackows", --fast cast 5%
        waist="Channeler's stone", --fast cast 2%
        left_ear="Loquacious Earring", --fast cast 2%
        right_ring="Prolix Ring", --fast cast 2%
        ring1="Kishar ring" --fast cast 4%
    }

    sets.precast.fc.grimoire = {}
    sets.precast.fc.elemental = set_combine(sets.precast.FC, {
        legs="Mallquis trews +1",
        left_ring="Mallquis Ring"
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.FC, {})

    sets.precast.fc.cure =set_combine(sets.precast.FC, {
        back="Pahtli cape" -- cure spellcasting time -8%
    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        main="Grioavolr",
        ammo="Pemphredo tathlum",
        head="Telchine cap",
        neck="Deviant necklace",
        ear2="Calamitous earring",
        back="Solemnity cape",
        feet="Kaykaus boots"
    }

    sets.midcast.elemental = {}
    sets.midcast.elemental["Free Nuke"] = set_combine(sets.midcast.conserve_mp, {
        main="Akademos",
        sub="Niobid strap",
        ammo="Pemphredo tathlum",
        head="Jhakri coronal",
        body="Jhakri robe +2",
        hands="Amalric gages +1",
        neck="Mizukage-no-Kubikazari",
        ear1="Hermetic earring",
        ear2="Friomisi earring",
        ring1="Jhakri ring",
        ring2="Resonance ring",
        waist="Eschan stone",
        legs="Merlinic shalwar",
        feet="Merlinic crackows"
    })

    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.conserve_mp, {
        main="Akademos",
        sub="Niobid strap",
        ammo="Pemphredo tathlum",
        head="Merlinic hood",
        body="Jhakri robe +2",
        hands="Amalric gages +1",
        neck="Mizukage-no-Kubikazari",
        ear1="Hermetic earring",
        ear2="Friomisi earring",
        ring1="Jhakri ring",
        ring2="Mujin band",
        waist="Eschan stone",
        legs="Merlinic shalwar",
        feet="Jhakri pigaches +2"
    })

    sets.midcast.enfeebling = set_combine(sets.midcast.conserve_mp, {
        main="Akademos",
        head="Jhakri coronal",
        neck="Sanctity necklace",
        ring1="Kishar ring"
    })

    sets.midcast.cure = set_combine(sets.midcast.conserve_mp, {
        head = "Kaykaus mitra",
        body = "Kaykaus bliaut",
        hands = "Kaykaus cuffs",
        ring1 = "Prolix ring",
        ring2 = "Persis ring",
        back = "Solemnity cape",
        waist = "Channeler's stone",
        legs = "Kaykaus tights",
        feet = "Kaykaus boots"
    })

    sets.midcast.regen = set_combine(sets.midcast.conserve_mp, {
        main="Bolelabunga",
        body="Telchine chasuble"
    })

    sets.midcast.drain_aspir = set_combine(sets.midcast.conserve_mp, {
        neck="Erra pendant",
        feet="Merlinic crackows"
    })

    sets.midcast.status_removal = set_combine(sets.midcast.conserve_mp, {

    })

    sets.midcast.cursna = set_combine(sets.midcast.StatusRemoval, {

    })

    sets.midcast.enhancing_magic = set_combine(sets.midcast.conserve_mp, {
        ear1="Andoaa earring"
    })

    sets.ws = {}

    sets.idle = {}
    sets.idle["Refresh"] = {
        main="Akademos",
        sub="Enki Strap",
        body="Jhakri robe +2",
        neck="Loricate torque",
        legs="Assiduity pants +1"
    }
    sets.idle["PDT"] = {}
    sets.idle["MDT"] = {}

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
            equip(sets.precast.fc.Elemental)
        else
            equip(sets.precast.fc)
        end
    -- Job Abilities --
    elseif spell.type == 'JobAbility' then
        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])  
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
            equip(sets.midcast.elemental[nuke_set])
        end
    end
end

function SetIdleSet()
    local idle_set = IdleSet[IdleSetIndex]
    -- add_to_chat(122, 'Idle Set: ' .. idle_set)
    equip(sets.idle[idle_set])
end

function aftercast(spell)
    --This function performs after the action has taken place
    SetIdleSet()
end