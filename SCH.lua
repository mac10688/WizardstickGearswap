NukeTypeIndex = 2
NukeSet = {"Magic Attack Bonus","Magic Burst"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

RegenSetIndex = 1
RegenSet = {"Hybrid", "Duration", "Potency"}

WeaponSetIndex = 1
WeaponSet = {"Any", "Grioavolr", "Akademos"}

Kiting = false

send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleRegenSet')
send_command('bind f11 gs c CycleIdleSet')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
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
    idle_cape = { name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Occ. inc. resist. to stat. ailments+10'}}
    nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    cure_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+7','"Cure" potency +10%','Spell interruption rate down-10%'}}
    int_enfeeble_cape = nuke_cape
    mnd_enfeeble_cape = healing_cape

    sets.WeaponSet = {}
    sets.WeaponSet["Akademos"] = {main="Akademos", sub="Enki strap"}
    sets.WeaponSet["Grioavolr"] = {main="Grioavolr", sub="Enki strap"}
    
    sets.precast = {}

    sets.ja = {}
    sets.ja['Tabula Rasa'] = { legs="Pedagogy Pants +1" }
    sets.ja['Enlightenment'] = {body="Pedagogy gown +1"}
    sets.ja['Sublimation'] = {head="Academic mortar +1", body="Pedagogy gown +1"}
    -- sets.precast.ja['Altruism'] = {}
    sets.ja['Focalization'] = {head="Pedagogy mortarboard +1"}

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
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}	
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {} -- I left it there still if it becomes needed so the SCH.lua file won't need modification should you want to use this set


    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.buff.grimoire = {
		head="Pedagogy Mortarboard +1",
		feet="Academic's loafers +1",
    }

    --37% fc
    sets.precast.fc = {
        main="Grioavolr", --fast cast 4%
        head="Merlinic hood", --fast cast 8%
        neck="Voltsurge torque",
        left_ear="Loquacious Earring", --fast cast 2%
        right_ring="Prolix Ring", --fast cast 2%
        body="Merlinic jubbah", --fast cast 8%
        ring1="Kishar ring", --fast cast 4%
        waist="Channeler's stone", --fast cast 2%
        legs="Lengo pants",
        feet="Merlinic crackows" --fast cast 5%
    }

    sets.precast["Stoneskin"] = set_combine(sets.precast.fc, {
        head="Umuthi hat"
    })

    sets.precast.cure = set_combine(sets.precast.fc, {

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
        main="Grioavolr",
        head="Vanya hood",
        hands="Shrieker's cuffs",
        waist="Austerity belt +1",
        feet="Medium's sabots"
    }

    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = set_combine(sets.precast.fc, {
        main="Akademos",
        sub="Enki Strap",
        ammo="Pemphredo tathlum",
        head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Occult Acumen"+4','Mag. Acc.+11','"Mag.Atk.Bns."+8'}},
        neck="Argute stole +1",
        ear1="Barkarole earring",
        ear2="Friomisi earring",
        body="Jhakri robe +2",
        hands="Amalric gages +1",
        left_ring="Stikini Ring",
        right_ring="Shiva Ring +1",
        back=nuke_cape,
        waist="Eschan stone",
        legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','CHR+8','Mag. Acc.+15'}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+1%','INT+7','Mag. Acc.+15','"Mag.Atk.Bns."+14'}},
    })

    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        main="Grioavolr",
        head={ name="Merlinic Hood", augments={'Attack+14','Magic burst dmg.+8%','Mag. Acc.+11',}},
        neck="Argute stole +1",
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20'}},
        legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+20','Magic burst dmg.+6%','Mag. Acc.+7',}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19','Magic burst dmg.+5%','MND+10','"Mag.Atk.Bns."+14',}},
        left_ring="Mujin band",
        right_ring="Locus ring",
        ear2="Static earring"
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
        head="Befouled crown",
        neck="Erra pendant",
        ear1="Gwati earring",
        ear2="Regal earring",
        ring1="Stikini ring",
        ring2="Kishar ring",
        waist="Luminary sash",
        back=nuke_cape
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
        head = "Vanya hood",
        body="Pedagogy gown +1",
        hands = "Kaykaus cuffs",
        back = cure_cape,
        ring1="Sirona'a ring",
        legs = "Gyve trousers",
        feet = "Kaykaus boots"
    })

    ------------
    -- Regen
    ------------
    sets.midcast.regen = {}
    sets.midcast.regen["Hybrid"] = set_combine(sets.midcast.conserve_mp, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1",
        body="Telchine chasuble"
    })

    sets.midcast.regen["Duration"] = set_combine(sets.midcast.conserve_mp, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1",
        body="Telchine chasuble"
    })

    sets.midcast.regen["Potency"] = set_combine(sets.midcast.conserve_mp, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1",
        body="Telchine chasuble"
    })

    sets.midcast.drain_aspir = set_combine(sets.precast.fc, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        feet="Merlinic crackows",
        ring1="Excelsis ring",
        waist="Fucho-no-obi"
    })

    sets.midcast.status_removal = set_combine(sets.precast.fc, {

    })

    sets.midcast.cursna = set_combine(sets.midcast.status_removal, {
        neck="Debilis Medallion",
        body="Pedagogy gown +1",
        hands="Fanatic gloves",
        ring1="Haoma's ring",
        ring2="Haoma's ring",
        legs="Theophany pantaloons +3",
        feet="Gendewitha Galoshes"
    })

    sets.midcast.enhancing = set_combine(sets.midcast.conserve_mp, {
        main="Gada",
        sub="Ammurapi shield",
        head="Arbatel bonnet +1",
        ear1="Andoaa earring",
        body="Pedagogy gown +1",
        hands="Chironic gloves",
        waist="Olympus sash",
        ring1="Stikini ring",
        ring2="Stikini ring"
    })

    sets.midcast.storm = set_combine(sets.midcast.enhancing,{
		feet="Pedagogy loafers +1",
    })

    sets.midcast.refresh = set_combine(sets.midcast.enhancing,{
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
        main="Akademos",
        ammo="Staunch tathlum +1",
        sub="Mensch strap +1",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Jhakri robe +2",
        hands="Shrieker's cuffs",
        left_ring="Defending ring",
        right_ring="Vengeful ring",
        back=idle_cape,
        waist="Slipor sash",
        legs="Assiduity pants"
    }

    sets.idle["PDT"] = {}
    sets.idle["MDT"] = {}

    sets.kiting = {
        ring2="Shneddick ring"
    }

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
    local idleSet = IdleSet[IdleSetIndex]
    -- print(idleSet)
    equip(sets.idle[idleSet])

    if Kiting then
        equip(set_combine(set_to_equip, sets.kiting))
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end