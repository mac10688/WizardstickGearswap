Nuke_Sets = {"magic-atk-bonus", "magic-accuracy" ,"magic-burst"}
Nuke_Set_Index = 3

Luopan_Idle_On = true

Kiting = false

send_command('bind f9 gs c cycle nuke_sets')
send_command('bind f10 gs c toggle loupon_idle_On')
send_command('bind f12 gs c refresh gear')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function help()
    add_to_chat(122, 'Keyboard Bindings:')
    add_to_chat(122, 'F9: Cycle Nuke Sets')
    add_to_chat(122, 'F10: Toggle Loupon Idle Mode')
    add_to_chat(122, 'F12: Refresh gearset')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function get_sets()
    local ws_boots = { name="Merlinic Crackows", augments={'Attack+25','Crit.hit rate+3','Weapon skill damage +10%','Mag. Acc.+16 "Mag.Atk.Bns."+16'}}

    sets.ja = {}
    sets.ja['Bolster'] = {body="Bagua tunic +3"}
    sets.ja['Life cycle'] = {body="Geomancy tunic +3", back="Nantosuelta's cape"}
    sets.ja['Full Circle'] = {
        head="Azimuth hood +1",
        hands="Bagua mitaines +3"
    }
    sets.ja['Concentric Pulse'] = { head="Bagua galero +3" }

    sets.fc = {
        head="Merlinic hood",
        neck="Voltsurge torque",
        ear2="Loquacious Earring",
        ear1="Etiolation earring",
        body="Shango robe",
        hands="Agwu's gages",
        ring1="Prolix ring",
        ring2="Kishar ring",
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Embla sash",
        legs="Geomancy pants +3",
        feet="Merlinic crackows"
    }

    sets.fc.cure = set_combine(sets.fc, {
    })

    sets.fc.elemental_magic = set_combine(sets.fc, {
        hands="Bagua mitaines +3"
    })

    sets.fc["Stoneskin"] = set_combine(sets.fc, {
        head="Umuthi hat"
    })

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        head="Vanya hood",
        waist="Austerity belt +1",
        legs="Geomancy pants +3",
        feet="Medium's sabots"
    }

    sets.midcast.geomancy = set_combine(sets.midcast.conserve_mp, {
        main="Idris", 
        range="Dunna",
        neck="Bagua charm +2",
        body="Bagua tunic +3",
        hands="Geomancy mitaines +3",
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
    })

    sets.midcast.geomancy.indi = set_combine(sets.midcast.geomancy, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +1",
        body="Bagua tunic +3",
        hands="Geomancy mitaines +3",
        back="Lifestream cape",
        legs="Bagua pants +3",
        feet="Azimuth gaiters +1"
    })

    --50% cure
    sets.midcast.cure = set_combine(sets.midcast.conserve_mp, {
        head="Vanya hood", --10%
        body="Vrikodara Jupon", --13%
        hands="Geomancy mitaines +3", --Mnd +43
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back="Solemnity cape", --7%
        legs="Gyve trousers", --10%
        feet="Medium's sabots" --7%
    })

    sets.midcast.dark_magic = set_combine(sets.midcast.conserve_mp, {
        neck="Erra pendant",
        body="Geomancy tunic +3",
        ring1="Evanescence ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
        legs="Azimuth tights +1"
    })
    
    sets.midcast.drain = set_combine(sets.midcast.dark_magic, {
        head="Pixie Hairpin +1",
        ring1="Archon ring",
        ring2="Excelsis ring",        
        waist="Fucho-no-obi",
        feet="Merlinic crackows"
    })

    sets.midcast.aspir = sets.midcast.drain

    sets.midcast.elemental = {}

    sets.midcast.elemental["magic-accuracy"] = {
        sub="Ammurapi shield",
        head="Bagua galero +3",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Geomancy tunic +3",
        hands="Geomancy mitaines +3",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        waist="Luminary sash",
        legs="Geomancy pants +3",
        feet="Geomancy sandals +3",
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    }

    sets.midcast["Stun"] = sets.midcast.elemental["magic-accuracy"]

    sets.midcast.elemental["magic-atk-bonus"] = {
        sub="Ammurapi shield",
        head="Bagua galero +3",
        neck="Sanctity necklace",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Bagua tunic +3",
        hands="Amalric gages +1",
        ring1="Shiva ring +1",
        ring2="Freke ring",
        waist="Sacro cord",
        legs="Bagua pants +3",
        feet="Bagua sandals +3",
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    }

    --MB: 43
    --MB2: 34
    --Total MB: 74
    sets.midcast.elemental["magic-burst"] = set_combine(sets.midcast.elemental["magic-atk-bonus"], {
        head="Ea hat +1", --MB: 7 MB2:7
        neck="Mizukage-no-Kubikazari", -- MB: 10
        body="Ea houppelande", --MB: 8 MB2:8
        hands="Amalric gages +1", --MB2: 6
        ring1="Mujin band", --MB2: 5
        legs="Ea slops +1", --MB: 8 MB2:8
        feet=merlinic_feet_mb --MB: 11
    })

    sets.midcast.enfeeble = {
        sub="Ammurapi shield",
        ammo="Dunna",
        head="Befouled crown",
        neck="Incanter's torque",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Geomancy tunic +3",
        hands="Geomancy mitaines +3",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}},
        waist="Luminary sash",
        legs="Geomancy pants +3",
        feet="Bagua sandals +3"
    }

    sets.fc['Impact'] = set_combine(sets.fc, {
        head=empty,
        body='Twilight cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.elemental["magic-atk-bonus"], {
        head=empty,
        ring1="Archon ring",
        body='Twilight cloak'
    })

    sets.midcast.enhancing = set_combine(sets.midcast.conserve_mp, {
        sub="Ammurapi shield",
        head="Befouled crown",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        waist="Embla sash"
    })

    sets.idle = {
        main="Idris",
        sub="Genmei shield",
        range="Dunna",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Agwu's gages",
        ring1="Defending Ring",
        ring2="Vengeful ring",
        back={ name="Nantosuelta's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5'}},
        waist="Slipor sash",
        legs="Geomancy pants +3",
        feet="Azimuth gaiters +1"
    }

    sets.idle.luopan = set_combine(sets.idle, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +1",
        neck="Bagua charm +2",
        hands="Geomancy mitaines +3",
        back={ name="Nantosuelta's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5'}},
        feet="Bagua sandals +3"
    })

    sets.engaged = {
        head="Nyame Helm",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame Mail",
        hands="Gazu bracelet +1",
        ring1="Chirich ring +1",
        ring2="Chirich ring +1",
        back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%'}},
        waist="Grunfeld rope",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.kiting = {
        feet="Geomancy sandals +3"
    }

    sets.fc["Dispelga"] = {main="Daybreak"}
    sets.midcast["Dispelga"] = {main="Daybreak"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.ws = {
        head="Nyame helm",
        body="Nyame mail",
        hands="Jhakri Cuffs +2",
        legs="Nyame flanchard",
        feet=ws_boots,
        neck="Fotia Gorget",
        waist="Grunfeld Rope",
        ear1="Moonshade earring",
        ear2="Regal Earring",
        ring1="Rufescent Ring",
        ring2="Shukuyu Ring",
        back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    }

    sets.ws['Shining Strike'] = set_combine(sets.ws, {})
    sets.ws['Seraph Strike'] = set_combine(sets.ws, {})
    sets.ws['Brainshaker'] = set_combine(sets.ws, {})
    sets.ws['Starlight'] = set_combine(sets.ws, {})
    sets.ws['Moonlight'] = set_combine(sets.ws, {})
    sets.ws['Skullbreaker'] = set_combine(sets.ws, {})
    sets.ws['True Strike'] = set_combine(sets.ws, {})
    sets.ws['Judgment'] = set_combine(sets.ws, {})
    sets.ws['Hexa Strike'] = set_combine(sets.ws, {waist="Fotia belt"})
    sets.ws['Black Halo'] = set_combine(sets.ws, {})
    sets.ws['Flash Nova'] = set_combine(sets.ws, {})
    sets.ws['Realmrazer'] = set_combine(sets.ws, {waist="Fotia belt"})
    sets.ws['Exudation'] = set_combine(sets.ws, {})


    sets.kiting = {
        feet="Geomancy sandals +3"
    }

    coroutine.schedule(lockstyle,9)

end

function precast(spell)
    -- print_set(spell)
    if sets.fc[spell.english] then
        equip(sets.fc[spell.english])
    elseif (sets.ja[spell.english]) then
        equip(sets.ja[spell.english])
    elseif spell.name:startswith("Cure") or spell.name:startswith("Curaga") or spell.name:startswith("Cura") then
        equip(sets.fc.cure)
    elseif spell.action_type == "Magic" then
        if sets.fc[spell.name] then
            equip(sets.fc[spell.name])
        else
            equip(sets.fc)
        end
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    end
end

function midcast(spell)
    -- print_set(spell)
    if(sets.midcast[spell.name]) then
        equip(sets.midcast[spell.name])
    elseif spell.name:startswith("Indi-") then
        equip(sets.midcast.geomancy.indi)
    elseif spell.name:startswith("Geo-") then
        equip(sets.midcast.geomancy)
    elseif spell.name:startswith("Cure") or spell.name:startswith("Curaga") or spell.name:startswith("Cura") then
        if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
            equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
        else
            equip(sets.midcast.cure)
        end
    elseif spell.skill == "Enhancing Magic" then
        equip(sets.midcast.enhancing)
    elseif spell.skill == "Enfeebling Magic" then
        equip(sets.midcast.enfeeble)
    elseif spell.skill == "Elemental Magic" then
        local nuke_set = Nuke_Sets[Nuke_Set_Index]
        if world.day_element == spell.element or world.weather_element == spell.element then
            equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
        else
            equip(sets.midcast.elemental[nuke_set])
        end
    elseif spell.skill == "Dark Magic" then
        if spell.name:startswith("Drain") then
            equip(sets.midcast.drain)
        elseif spell.name:startswith("Aspir") then
            equip(sets.midcast.aspir)
        else
            equip(sets.midcast.dark_magic)
        end
    end
end


function equip_set(status)
    if status == 'Engaged' then
        equip(sets.engaged)
    elseif pet.isvalid and Luopan_Idle_On then
        equip(sets.idle.luopan)
    else
        equip(sets.idle)
    end

    if Kiting then
        equip(sets.kiting)
    end
end

function aftercast(spell)
    if (not spell.name:startswith('Geo-')) and spell.name ~= 'Full Circle' and spell.name ~= 'Radial Arcana' and spell.name ~= 'Mending Halation' and spell.name ~= 'Concentric Pulse' then
        equip_set(player.status)
    end
end

function pet_change(pet,gain)
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
    if command == 'cycle nuke_sets' then
        Nuke_Set_Index = Nuke_Set_Index % #Nuke_Sets + 1
        send_command('@input /echo ----- Nuke Set changed to '..Nuke_Sets[Nuke_Set_Index]..' -----')
        equip_set(player.status)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == 'toggle loupon_idle_On' then
        Luopan_Idle_On = not Luopan_Idle_On
        if Luopan_Idle_On then
            send_command('@input /echo ----- Loupon Idle Set On -----')
        else
            send_command('@input /echo ----- Loupon Idle Set Off -----')
        end
        equip_set(player.status)
    elseif command == "refresh gear" then
        lockstyle()
        equip_set(player.status)
    end
end

function lockstyle()
    if player.main_job == 'GEO' then send_command('@input /lockstyleset 2') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,9)
end