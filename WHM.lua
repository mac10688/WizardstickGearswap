TP_Set_Names = {"Delay Cap" ,"Acc"}
TP_Index = 1

Idle_Set_Names = {'MDT', 'PDT', 'Refresh'}
Idle_Index = 1

WeaponSet = {"None", "Dual Wield"}
WeaponSetIndex = 1

Kiting = false

send_command('bind f9 gs c equip refresh')
send_command('bind ^f9 gs c cycle TP set')
send_command('bind @f9 gs c CycleWeaponSet')
send_command('bind f10 gs c equip pdt')
send_command('bind f11 gs c equip mdt')
send_command('bind f12 gs c refresh set')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind @f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function help()
    add_to_chat(122, 'Keyboard Bindings:')
    add_to_chat(122, 'F9: Refresh set')
    add_to_chat(122, 'Ctrl + F9: Cycle TP set')
    add_to_chat(122, 'F10: Turn on idle pdt')
    add_to_chat(122, 'F11: Turn on idle mdt')
    add_to_chat(122, 'F12: Reset gear and turn on job abilities')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function get_sets()

    sets.conserve_mp = {
        head="Vanya hood",
        hands="Fanatic gloves",
        waist="Austerity belt +1",
        legs="Lengo pants",
        feet="Medium's sabots"
    }

    sets.WeaponSet = {}
    sets.WeaponSet["None"] = {main="Daybreak", sub="Genmei shield"}
    sets.WeaponSet["Dual Wield"] = {main="Maxentius", sub="Tishtrya"}
    
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.divine_caress = {hands="Ebers mitts +3"}
    sets.afflatus_solace = {body="Ebers Bliaut +3"}

	--- Sets for Enhanced Job Abilities ---
	
	sets.ja = {}
	
    sets.ja['Afflatus Solace'] = sets.afflatus_solace
    sets.ja['Benediction'] = {body="Piety Bliaut +3"}
    sets.ja['Devotion'] = {body="Piety Cap +3"}
	
    local fastcast_cape = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local attack_cape = { name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Haste+10','Mag. Evasion+15'}}
    local physical_mnd_ws_cape = { name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
	
    --- Fast Cast Sets ---
    -- 74% fc
    -- 12% for cures
	sets.fc = {
        ammo="Incantor Stone", --2%
        head="Ebers cap +3", --13%
        neck="Cleric's torque +2", --10%
        ear1="Malignance earring",
        -- ear2="Loquacious Earring", --2%
        ear2="Ebers earring +1",
        body="Pinga tunic +1", --15%
        hands="Fanatic gloves", --7%
        ring1="Medada's Ring", --10%
        ring2="Defending ring",
        -- ring2="Kishar ring", --4%        
        back=fastcast_cape, --10%
        waist="Embla Sash", --5%
        -- legs="Lengo pants", --5%
        legs="Ebers pantaloons +3",
    }
	
    sets.fc.heal = set_combine(sets.fc, {main="Yagrush", legs="Ebers pantaloons +3"})
    
    sets.fc.cure = set_combine(sets.fc, {
        -- sub="Sors shield",
        ammo="Incantor stone",
        head="Ebers cap +3",
        ear1="Nourishing earring +1",
        feet="Ebers duckbills +3"
    })
    
    sets.fc.stoneskin = set_combine(sets.fc, {
        head="Umuthi hat"
    })
	
	sets.ws = {
        head="Nyame helm",
        body="Nyame helm",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade earring",
        ear2="Telos earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=physical_mnd_ws_cape
    }

    local physical_mnd_ws = {
        head="Piety cap +3",
        body="Nyame helm",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Piety duckbills +3",
        neck="Fotia Gorget",
        waist="Grunfeld rope",
        ear1="Regal earring",
        ear2="Moonshade earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        back=physical_mnd_ws_cape,
    }

    local magical_mnd_ws = {

    }
	
    sets.ws["Shining Strike"] = magical_mnd_ws
    sets.ws["Seraph Strike"] = magical_mnd_ws
    sets.ws["Brainshaker"] = physical_mnd_ws
    sets.ws["Starlight"] = {neck="Combatant's torque"}
    sets.ws["Moonlight"] = {neck="Combatant's torque"}
    sets.ws["Skullbreaker"] = physical_mnd_ws
    sets.ws["True Strike"] = physical_mnd_ws
    sets.ws["Judgment"] = physical_mnd_ws
    sets.ws["Hexa Strike"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.ws["Black Halo"] = physical_mnd_ws
    sets.ws["Flash Nova"] = magical_mnd_ws
    sets.ws["Realmrazer"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.ws["Dagan"] = physical_mnd_ws
    sets.ws["Mystic Boon"] = physical_mnd_ws
	  
	
    sets.engaged = {}
    
    sets.engaged['Delay Cap'] = {
        ammo="Crepuscular pebble",
        head="Bunzi's hat",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Sanctity Necklace",
        waist="Grunfeld Rope",
        ear1="Telos earring",
        ear2="Ebers earring +1",
        ring1="Petrov Ring",
        ring2="Chirich ring +1",
        back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15'}}
    }

	sets.engaged['Acc'] = set_combine( sets.engaged['Delay Cap'], {
        hands="Gazu bracelets +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1"
    })
    
    sets.idle = {}
	
    --30% physical
    --51% dmg
    --6% magic dmg
	sets.idle['PDT'] = {
        main="Daybreak", --10% physical
        sub="Genmei shield", --10% physical
        ammo="Staunch tathlum +1", --3% dmg
        head="Nyame helm", --7% dmg
        neck="Loricate Torque +1", --6% dmg
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Shamash robe", --10% physical
        hands="Bunzi's gloves", --7% dmg
        ring1="Ayanmo ring", --3% dmg
        ring2="Defending Ring", --10% dmg
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10'}},
        waist="Slipor sash", --3% magic dmg
        legs="Bunzi's pants", --8% dmg
        feet="Ebers duckbills +3" --7% dmg
    }
                
    sets.idle['MDT'] = {
        main="Daybreak",
        sub="Genmei shield",
        ammo="Staunch tathlum +1",
        head="Nyame helm",
        neck="Loricate Torque +1",
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Shamash robe",
        hands="Bunzi's gloves",
        ring1="Inyanga ring",
        ring2="Defending Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10'}},
        waist="Slipor sash",
        legs="Bunzi's pants",
        feet="Nyame sollerets"
    }

    --Refresh +10
    sets.idle['Refresh'] = set_combine(sets.idle['MDT'], {
        ammo="Homiliary",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs={ name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}
    })

    sets.midcast = {}

    sets.midcast.status_removal = {
        main="Yagrush",
        head="Vanya hood",
        neck="Cleric's torque +2",
        body="Ebers Bliaut +3",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Austerity belt +1",
        legs="Ebers pantaloons +3"
    }

    sets.midcast.cursna = set_combine( sets.midcast.status_removal, {
        neck="Debilis Medallion",
        hands="Fanatic gloves",
        ring1="Haoma's ring",
        ring2="Menelaus's Ring",
        legs="Theophany pantaloons +3",
        feet="Gendewitha Galoshes +1"
    })
	
    --Cure: 55%
    --Cure II: 22
    sets.midcast.cure = {
        main="Raetic Rod +1", --Cure I: 23% Cure II: 10%
        ammo="Incantor Stone",
        head="Ebers cap +3", --22%
        neck="Cleric's torque +2", --10%
        ear1="Glorious earring", --Cure II: 2%
        ear2="Ebers earring +1",      
        body="Theophany bliaut +3", --Cure II: 6%
        hands="Theophany mitts +3", --Cure II: 4%
        ring1="Medada's ring",
        ring2="Persis ring",        
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Austerity belt +1",
        legs="Ebers pantaloons +3",
        feet="Ebers duckbills +3"
    }

    sets.midcast.raise = set_combine(sets.conserve_mp, sets.fc)

    sets.midcast.enhancing = {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        neck="Incanter's torque",
        body="Telchine chasuble",
        hands="Inyanga dastanas +2",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Fi follet cape +1",
        waist="Embla sash",
        legs="Piety Pantaloons +3",
        feet="Theophany duckbills +3"
    }

    sets.midcast.enhancing.duration = set_combine(sets.midcast.enhancing, {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        body="Telchine chasuble",
        hands="Telchine gloves",
        legs="Telchine braconi",
    })

    sets.midcast.bar_element = set_combine( sets.midcast.enhancing, {
        main="Beneficus",
        head="Ebers cap +3",
        body="Ebers Bliaut +3",
        legs="Piety Pantaloons +3",
        feet="Ebers duckbills +3"
    })

    sets.midcast.bar_status = set_combine(sets.midcast.enhancing.duration, {
        neck="Sroda necklace"
    })

    sets.midcast['Barfira'] = sets.midcast.bar_element
    sets.midcast['Barblizzara'] = sets.midcast.bar_element
    sets.midcast['Baraera'] = sets.midcast.bar_element
    sets.midcast['Barstonra'] = sets.midcast.bar_element
    sets.midcast['Barthundra'] = sets.midcast.bar_element
    
    sets.midcast['Barsleepra'] = sets.midcast.bar_status
    sets.midcast['Barpoisonra'] = sets.midcast.bar_status
    sets.midcast['Barparalyzra'] = sets.midcast.bar_status
    sets.midcast['Barblindra'] = sets.midcast.bar_status
    sets.midcast['Barsilencera'] = sets.midcast.bar_status
    sets.midcast['Barpetra'] = sets.midcast.bar_status
    sets.midcast['Barvira'] = sets.midcast.bar_status
    sets.midcast['Baramnesra'] = sets.midcast.bar_status
    
    sets.midcast['Auspice'] = set_combine( sets.midcast.enhancing.duration, {
        feet="Ebers duckbills +3"
    })

    sets.midcast['Aurorastorm'] = sets.midcast.enhancing.duration

    sets.midcast['Haste'] = sets.midcast.enhancing.duration

    sets.midcast["Aquaveil"] = set_combine(sets.midcast.enhancing.duration, { 
        hands="Regal cuffs"
    })

    sets.midcast.protect = set_combine(sets.midcast.enhancing.duration, {
    })

    sets.midcast.shell = set_combine(sets.midcast.enhancing.duration, {
    })

    sets.midcast.regen = set_combine(sets.midcast.enhancing.duration, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Inyanga tiara +2",
        body="Piety bliaut +3",
        hands="Ebers mitts +3",
        legs="Theophany pantaloons +3",
        feet="Theophany duckbills +3"
    })

    sets.midcast.enfeebling = {
        main="Gada",
        ammo="Hydrocera",
        head="Befouled crown",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Theophany bliaut +3",
        hands="Regal cuffs",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Kishar ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Obstinate sash",
        legs="Chironic hose",
        feet="Theophany duckbills +3"
    }

    sets.midcast.banish = {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ipoca beret",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Theophany bliaut +3",
        hands="Fanatic gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Orpheus's sash",
        legs="Theophany pantaloons +3",
        feet="Medium's Sabots"
    }

    sets.midcast.holy = {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Bunzi's hat",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Orpheus's sash",
        legs="Bunzi's pants",
        feet="Bunzi's sabots"
    }

    sets.fc['Impact'] = set_combine(sets.fc, {
        head=empty,
        body='Crepuscular cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.enfeebling, {
        head=empty,
        ring2="Archon ring",
        body='Crepuscular cloak'
    })

    sets.kiting = {
        ring2="Shneddick ring +1",
        feet="Hippomenes socks +1"
    }

    sets.HolyWater = {
        neck="Nicander's necklace",
        ring1={name="Blenmot's ring +1", bag="warddrobe5"},
        ring2={name="Blenmot's ring +1", bag="warddrobe6"} 
    }

    coroutine.schedule(lockstyle,2)

end

function precast(spell)
    -- print_set(spell)
    if sets.fc[spell.english] then
        equip(sets.fc[spell.english])
    elseif (sets.ja[spell.english]) then
        equip(sets.ja[spell.english])
    elseif spell.skill == 'Healing Magic' or spell.name == "Erase" then
        if spell.name:contains("Cure") or spell.name:contains("Curaga") or spell.name:contains("Cura") then
            equip(sets.fc.cure)
        else
            equip(sets.fc.heal)
        end
    elseif spell.name == "Stoneskin" then
        equip(sets.fc.stoneskin)
    elseif spell.action_type == "Magic" then
        equip(sets.fc)
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    elseif spell.type == "Item" then
        if spell.name == "Holy Water" or spell.name == "Hallowed Water" then
            equip(sets.HolyWater)
        end
    end
end

function midcast(spell)
    print_set(spell)
    -- equip(sets.idle[Idle_Set_Names[Idle_Index]])
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
    elseif spell.skill == 'Healing Magic' or spell.name == "Erase" then
        if spell.name:contains("Cure") then
            if buffactive['Afflatus Solace'] then
                local solace_cure_set = set_combine(sets.midcast.cure, sets.afflatus_solace)
                equip(solace_cure_set)
            else
                equip(sets.midcast.cure)
            end
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
            end
        elseif spell.name:contains("Curaga") or spell.name:contains("Cura") then
            equip(sets.midcast.cure)
        elseif spell.name:contains("Raise") or spell.name == "Arise" then
            equip(sets.midcast.raise)
        elseif spell.name == "Cursna" then
            if buffactive['Divine Caress'] then
                local cursna_divine_caress_set = set_combine(sets.midcast.cursna, sets.divine_caress)
                equip(cursna_divine_caress_set)
            else
                equip(sets.midcast.cursna)
            end            
        else
            if buffactive['Divine Caress'] then
                local status_removal_dc = set_combine(sets.midcast.status_removal, sets.divine_caress)
                equip(status_removal_dc)
            else
                equip(sets.midcast.status_removal)
            end
        end    
	--Enfeebling Magic	
    elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast.enfeebling)		
	--Enhancing Magic		
    elseif spell.skill == 'Enhancing Magic' then
        if spell.name == 'Stoneskin' then
            equip(sets.midcast.stoneskin)
        elseif spell.english:contains('Regen') then
            equip(sets.midcast.regen)
        elseif spell.english:contains('Protect') then
            equip(sets.midcast.protect)
        elseif spell.english:contains('Shell') then
            equip(sets.midcast.shell)
        elseif sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        else
            equip(sets.midcast.enhancing)
        end
    elseif spell.skill == "Divine Magic" then
        if spell.english:contains('Banish') then
            equip(sets.midcast.banish)
        elseif spell.english:contains('Holy') then
            equip(sets.midcast.holy)
        end
    end    
end

function equip_set(status)
    local set_to_equip = nil
    if status=='Engaged' then
        equip(sets.engaged[TP_Set_Names[TP_Index]])
    else
        equip(sets.idle[Idle_Set_Names[Idle_Index]])
    end

    if Kiting then
        equip(sets.kiting)
    end
end

function aftercast(spell)
    equip_set(player.status)
end

function status_change(new,old)
    equip_set(new)
end

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

function self_command(command)
    if command == 'equip refresh' then
        Idle_Index = 3
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip_set(player.status)
    elseif command == 'cycle TP set' then
        TP_Index = TP_Index % #TP_Set_Names + 1
        send_command('@input /echo ----- TP Set changed to '..TP_Set_Names[TP_Index]..' -----')
        equip_set(player.status)
    elseif command == 'equip pdt' then
        Idle_Index = 2
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip_set(player.status)
    elseif command == 'equip mdt' then
        Idle_Index = 1
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip_set(player.status)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1
        local weapon_set = WeaponSet[WeaponSetIndex]

        if weapon_set ~= 'None' then
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
            disable('main', 'sub')
        else
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
        end
        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif command == 'refresh set' then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end

        local kitingStatus = (Kiting and "On" or "Off")
        send_command('@input /echo Idle Set: '..Idle_Set_Names[Idle_Index]..' || TP Set: '..TP_Set_Names[TP_Index]..' || Kite: '..kitingStatus )
        equip_set(player.status)
        lockstyle()
    end
end

--I don't like this stuff in my gear swap. Uncomment if you do.
-- function buff_change(buff,gain_or_loss)
--     if gain_or_loss and buff == 'Silence' then
-- 		send_command('@input /item "Echo Drops" <me>')
-- 	elseif gain_or_loss and buff == 'Paralyze' then
-- 		send_command('@input /item "Remedy" <me>')
--     end
-- end

function lockstyle()
    if player.main_job == 'WHM' then send_command('@input /lockstyleset 7') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end