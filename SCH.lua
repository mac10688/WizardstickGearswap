NukeTypeIndex = 2
NukeSet = {"Magic Attack Bonus","Magic Burst", "Vagary"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

EngagedSetIndex = 1
EngagedSet = {"None", "Accuracy"}

RegenSetIndex = 1
RegenSet = {"Potency", "Duration"}

WeaponSetIndex = 1
WeaponSet = {"Akademos", "Grioavolr", "Gada", "None"}

Kiting = false

send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleRegenSet')
send_command('bind f11 gs c CycleIdleSet')
send_command('bind ^f11 gs c CycleEngagedSet')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
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

        equip_set(player.status)
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
    elseif command == 'CycleRegenSet' then
        RegenSetIndex = RegenSetIndex % #RegenSet + 1

        local regen_set = RegenSet[RegenSetIndex]
        add_to_chat(122, 'Regen Set: ' .. regen_set)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeTypeIndex]
        local idle_set = IdleSet[IdleSetIndex]
        local regen_set = RegenSet[RegenSetIndex]
        local weapon_set = WeaponSet[WeaponSetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' || Idle Set: ' .. idle_set .. ' || Regen Set: ' .. regen_set .. ' || Weapon Set: ' .. weapon_set)
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

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    idle_cape = { name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10'}}
    nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    cure_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%'}}
    fc_cape = idle_cape
    int_enfeeble_cape = nuke_cape
    mnd_enfeeble_cape = cure_cape

    merlinic_head_mab = { name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Occult Acumen"+4','Mag. Acc.+11','"Mag.Atk.Bns."+8'}}
    merlinic_head_mb = { name="Merlinic Hood", augments={'Attack+14','Magic burst dmg.+8%','Mag. Acc.+11'}}

    merlinic_body_mab = { name="Merlinic Jubbah", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic dmg. taken -2%','CHR+1','Mag. Acc.+14','"Mag.Atk.Bns."+9'}}
    merlinic_body_mb = {}

    merlinic_legs_mab = { name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','CHR+8','Mag. Acc.+15'}}
    merlinic_legs_mb = { name="Merlinic Shalwar", augments={'Mag. Acc.+22','Magic burst dmg.+10%','MND+2','"Mag.Atk.Bns."+13'}}

    merlinic_feet_mab = { name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+1%','INT+7','Mag. Acc.+15','"Mag.Atk.Bns."+14'}}
    merlinic_feet_mb = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5'}}


    sets.WeaponSet = {}
    sets.WeaponSet["None"] = {}
    sets.WeaponSet["Akademos"] = {main="Akademos", sub="Enki strap"}
    sets.WeaponSet["Grioavolr"] = {main="Grioavolr", sub="Enki strap"}
    sets.WeaponSet["Gada"] = {main="Gada", sub="Ammurapi shield"}

    
    sets.precast = {}

    sets.ja = {}
    sets.ja['Tabula Rasa'] = { legs="Pedagogy Pants +3" }
    sets.ja['Enlightenment'] = {body="Pedagogy gown +3"}
    sets.ja['Sublimation'] = {head="Academic's mortarboard +3", body="Pedagogy gown +3"}
    -- sets.precast.ja['Altruism'] = {}
    sets.ja['Focalization'] = {head="Pedagogy mortarboard +3"}

    sets.engaged = {}
    sets.engaged["Accuracy"] = {
        head="Jhakri coronal +2",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary earring",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        waist="Eschan stone",
        legs="Jhakri slops +2",
        feet="Jhakri pigaches +2"
    }

    ------------
    -- Buff Sets
    ------------	
    -- Gear that needs to be worn to **actively** enhance a current player buff.
    -- Fill up following with your avaible pieces.
    sets.buff = {}
    sets.buff['Rapture'] = {head="Arbatel bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +3"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}	
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {} -- I left it there still if it becomes needed so the SCH.lua file won't need modification should you want to use this set


    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.buff.grimoire = {
		head="Pedagogy Mortarboard +3",
		feet="Academic's loafers +3",
    }

    --64% fc
    sets.precast.fc = {
        ammo="Incantor stone", --fast cast 2%
        head="Academic's mortarboard +3", --fast cast 8%
        neck="Voltsurge torque", --fast cast 4%
        ear1="Loquacious Earring", --fast cast 2%
        ear2="Etiolation earring", --fast cast 1%
        body="Shango robe", --fast cast 8%
        hands="Academic's bracers +3", --fast cast 8%
        ring1="Kishar ring", --fast cast 4%
        ring2="Prolix Ring", --fast cast 2%
        back=fc_cape, --fast cast 10%
        waist="Channeler's stone", --fast cast 2%
        legs="Lengo pants", --fast cast 5%
        feet="Pedagogy loafers +3" --fast cast 8%
    }

    sets.precast["Stoneskin"] = set_combine(sets.precast.fc, {
        head="Umuthi hat"
    })

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        legs="Mallquis trews +2",
        left_ring="Mallquis Ring",
        left_ear="Barkarole earring"
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.fc, {})
    
    sets.precast.fc.cure = set_combine(sets.precast.fc, {
        back="Pahtli cape" -- cure spellcasting time -8%
    })

  


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        ammo="Pemphredo tathlum",
        head="Vanya hood",
        hands="Academic's bracers +3",
        waist="Austerity belt +1",
        feet="Medium's sabots"
    }

    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = set_combine(sets.precast.fc, {
        ammo="Pemphredo tathlum",
        head=merlinic_head_mab,
        neck="Argute stole +1",
        ear1="Barkarole earring",
        ear2="Friomisi earring",
        body="Pedagogy gown +3",
        hands="Amalric gages +1",
        left_ring="Stikini Ring",
        right_ring="Shiva Ring +1",
        back=nuke_cape,
        waist="Eschan stone",
        legs="Pedagogy pants +3",
        feet="Pedagogy loafers +3"
    })

    --Tier 2 spells for mb without killing
    sets.midcast.elemental["Vagary"] = {
        main="Gada",
        sub="Sors shield",
        ammo="Incantor Stone",
        head=merlinic_head_mab,
        neck="Voltsurge Torque",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        body="Shango Robe",
        hands="Academic's bracers +3",
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
        back=idle_cape,
        waist="Eschan stone",
        legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13'}},
        feet=merlinic_feet_mab
    }

    --MB: 10 Akademos
    --MB1: 48
    --MB2: 12
    --Total MB: 60
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Pedagogy Mortarboard +3", --MB2: 4
        neck="Argute stole +1", --MB: 7
        body="Merlinic Jubbah", --MB: 10
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20'}}, --MB2: 6
        legs=merlinic_legs_mb, --MB: 10
        feet=merlinic_feet_mb, --MB: 11
        left_ring="Mujin band" --MB2: 5
    })

    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.helix = set_combine(sets.midcast.elemental["Magic Burst"], {
        -- Amalric Nails +1 are beating Arbatel Loafers +1 for Helix atm, YMMV
        feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        waist="Refoccilation Stone",
    })

    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.dark_helix = set_combine(sets.midcast.helix, {
		head="Pixie Hairpin +1"
    })
    
    sets.midcast.enfeebling = set_combine(sets.precast.fc, {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Academic's mortarboard +3",
        neck="Erra pendant",
        ear1="Gwati earring",
        ear2="Regal earring",
        hands="Academic's bracers +3",
        ring1="Stikini ring",
        ring2="Kishar ring",
        back=nuke_cape,
        waist="Luminary sash",
        legs="Chironic hose",
        feet="Academic's loafers +3"
    })

    sets.midcast.int_enfeebling = set_combine(sets.midcast.enfeebling, {
        back = int_enfeeble_cape
    })

    sets.midcast.mnd_enfeebling = set_combine(sets.midcast.enfeebling, {
        back = mnd_enfeeble_cape
    })

    sets.midcast.cure = set_combine(sets.precast.fc, {
        main="Gada",
        sub="Ammurapi shield",
        head="Vanya hood",
        body="Chironic doublet",
        hands="Kaykaus cuffs",
        back=cure_cape,
        ring1="Sirona'a ring",
        legs="Chironic hose",
        feet="Kaykaus boots"
    })

    ------------
    -- Regen
    ------------

    sets.midcast.enhancement_duration = {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        body="Telchine chasuble",
        hands="Telchine gloves",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    }

    sets.midcast["Sneak"] = sets.midcast.enhancement_duration
    sets.midcast["Invisible"] = sets.midcast.enhancement_duration

    sets.midcast.regen = {}
    sets.midcast.regen["Potency"] = set_combine(sets.midcast.enhancement_duration, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1"
    })

    sets.midcast.regen["Duration"] = sets.midcast.enhancement_duration

    sets.midcast.drain_aspir = set_combine(sets.precast.fc, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        ring1="Excelsis ring",
        waist="Fucho-no-obi",
        legs="Pedagogy pants +3",
        feet="Merlinic crackows"
    })

    sets.midcast.healing = set_combine(sets.precast.fc, {

    })

    sets.midcast["Cursna"] = set_combine(sets.midcast.healing, {
        neck="Debilis Medallion",
        body="Pedagogy gown +3",
        ring1="Haoma's ring",
        ring2="Haoma's ring",
        feet="Gendewitha Galoshes"
    })

    sets.midcast.enhancing = set_combine(sets.midcast.enhancement_duration, {
        main="Gada",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1",
        ear1="Andoaa earring",
        body="Pedagogy gown +3",
        hands="Chironic gloves",
        waist="Olympus sash",
        ring1="Stikini ring",
        ring2="Stikini ring"
    })

    sets.midcast.storm = set_combine(sets.midcast.enhancement_duration,{
		feet="Pedagogy loafers +3",
    })

    sets.midcast.refresh = set_combine(sets.midcast.enhancement_duration,{
		head="Amalric Coif +1",
    })

    sets.midcast.aquaveil = sets.midcast.refresh

    sets.ws = {}
    sets.ws["Shattersoul"] = {}
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        ear1="Loquacious earring",
        ear2="Etiolation earring",
        neck="Sanctity necklace",
        body="Pedagogy gown +3",
        hands="Kaykaus cuffs",
        ring1="Prolix ring",
        ring2="Vengeful ring",
        waist="Luminary sash",
        legs="Merlinic shalwar",
        feet="Kaykaus boots"
    }

    sets.idle = {
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
        feet="Academic's loafers +3"
    }
    sets.idle["Refresh"] = sets.idle

    sets.idle["PDT"] = set_combine(sets.idle, {
        right_ring="Gelatinous ring"
    })

    sets.idle["MDT"] = set_combine(sets.idle, {
        right_ring="Vengeful ring"
    })

    sets.kiting = {
        ring2="Shneddick ring"
    }

    coroutine.schedule(lockstyle,2)

end

-------------------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description that each of sets of related
-- spells all fall under.
-------------------------------------------------------------------------------------------------------------------

spell_maps = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Full Cure']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',    
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',['Refresh II']='Refresh',['Refresh III']='Refresh',
    ['Burn']='ElementalEnfeeble',['Frost']='ElementalEnfeeble',['Choke']='ElementalEnfeeble',['Rasp']='ElementalEnfeeble',['Shock']='ElementalEnfeeble',['Drown']='ElementalEnfeeble',
    ['Pyrohelix']='Helix',['Cryohelix']='Helix',['Anemohelix']='Helix',['Geohelix']='Helix',['Ionohelix']='Helix',['Hydrohelix']='Helix',['Luminohelix']='Helix',['Noctohelix']='DarkHelix',
    ['Pyrohelix II']='Helix',['Cryohelix II']='Helix',['Anemohelix II']='Helix',['Geohelix II']='Helix',['Ionohelix II']='Helix',['Hydrohelix II']='Helix',['Luminohelix II']='Helix',['Noctohelix II']='DarkHelix',
    ['Firestorm']='Storm',['Hailstorm']='Storm',['Windstorm']='Storm',['Sandstorm']='Storm',['Thunderstorm']='Storm',['Rainstorm']='Storm',['Aurorastorm']='Storm',['Voidstorm']='Storm',
    ['Firestorm II']='Storm',['Hailstorm II']='Storm',['Windstorm II']='Storm',['Sandstorm II']='Storm',['Thunderstorm II']='Storm',['Rainstorm II']='Storm',['Aurorastorm II']='Storm',['Voidstorm II']='Storm',
}

---- .::Precast Functions::. ---->
function precast(spell)
    -- print_set(spell)
    local spellType = spell_maps[spell.name]
    if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.action_type == 'Magic' then
        if spellType == "Cure" or spellType == "Curaga" then
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

        -- extends Fast cast set with Grimoire recast aligned 
        if buffactive['addendum: black'] or buffactive['dark arts'] then
            if spell.type == 'BlackMagic' then
                equip(sets.buff.grimoire)
            end
        elseif buffactive['addendum: white'] or buffactive['light arts'] then
            if spell.type == 'WhiteMagic' then
                equip(sets.buff.grimoire)
            end
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
    local spellType = spell_maps[spell.name]
    if spell.action_type == 'Magic' then   
        -- Healing Magic --
        if spellType == "Cure" or spellType == "Curaga" then
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
            else
                equip(sets.midcast.cure)
            end
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if spellType == "Regen" then
                local regenMode = RegenSet[RegenSetIndex]
                equip(sets.midcast.regen[regenMode])
            elseif spellType == "Storm" then
                equip(sets.midcast.storm)
            elseif spellType == "Refresh" then
                equip(sets.midcast.refresh)
            elseif spell.name == "Aquaveil" then
                equip(sets.midcast.aquaveil)
            else
                equip(sets.midcast.enhancing)   
            end    
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'BlackMagic' then -- to do: better rule for this.
            equip(sets.midcast.IntEnfeebling)
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'WhiteMagic' then -- to do: better rule for this.
            equip(sets.midcast.MndEnfeebling)
        elseif string.find(spell.english, 'Aspir') or string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain_aspir)
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            if spellType == 'DarkHelix' then
                equip(sets.midcast.dark_helix)
            elseif spellType == 'Helix' then
                equip(sets.midcast.helix)
            else
                local nuke_set = NukeSet[NukeTypeIndex]
                if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
                else
                    equip(sets.midcast.elemental[nuke_set])
                end
            end
        elseif sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        end

        if buffactive['Perpetuance'] and (spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic') then
            equip(sets.buff['Perpetuance'])
        end
        if buffactive['Rapture'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Rapture'])
        end
        if spell.skill == 'Elemental Magic' and spellType ~= 'ElementalEnfeeble' then
            if buffactive['Ebullience'] and spell.english ~= 'Impact' then
                equip(sets.buff['Ebullience'])
            end
            if buffactive['Immanence'] then
                equip(sets.buff['Immanence'])
            end
            if buffactive['Klimaform'] and spell.element == world.weather_element then
                equip(sets.buff['Klimaform'])
            end
        end
    
        if buffactive['Penury'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Penury']) 
        end
        if buffactive['Parsimony'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Parsimony'])
        end
        if buffactive['Celerity'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Celerity'])
        end
        if buffactive['Alacrity'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Alacrity'])
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
    
    
    local weapon_set = WeaponSet[WeaponSetIndex]
    equip(sets.WeaponSet[weapon_set])


    if Kiting then
        equip(set_combine(set_to_equip, sets.kiting))
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    equip_set(player.status)
end

function lockstyle()
    if player.main_job == 'SCH' then send_command('@input /lockstyleset 13') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,4)
end