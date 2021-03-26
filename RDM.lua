res = require('resources')

Weapon_Sets = {"Sword", "Magic Accuracy", "Dual Wield", "Odin", "Savage"}
WeaponSetsIndex = 2

PhysicalAccuracyMode = {"High Acc", "Multi-Attack"}
PhysicalAccuracyModeIndex = 2

MagicAccuracyMode = {"Magic Accuracy", "Potency/Duration"}
MagicAccuracyModeIndex = 1

Kiting = false

MndEnfeebles = S{"Paralyze", "Paralyze II"
                , "Slow", "Slow II"
                , "Addle", "Addle II"
                , "Distract", "Distract II", "Distract III"
                , "Frazzle", "Frazzle II", "Frazzle III"
            }

IntEnfeebles = S{ "Blind", "Blind II"
                 , "Gravity", "Gravity II"
                 , "Bind"
                 , "Break"
                 , "Dispel", "Dispelga"
                 , "Dia", "Dia II", "Dia III"
                 , "Bio", "Bio II", "Bio III"
                 , "Silence"
                 , "Inundation"
                 , "Sleep", "Sleep II", "Sleepga"}

Duration = S{"Bind"
            , "Break"
            , "Silence"
            , "Sleep", "Sleep II", "Sleepga"
            , "Inundation"}

Potency = S{"Paralyze", "Paralyze II"
            , "Slow", "Slow II"
            , "Addle", "Addle II"
            , "Distract", "Distract II", "Distract III"
            , "Frazzle", "Frazzle II", "Frazzle III"
            , "Blind", "Blind II"
            , "Gravity", "Gravity II"
            
            }

send_command("bind f9 gs c Cycle WeaponSet")
send_command("bind f10 gs c Cycle MagicMode")
send_command("bind f11 gs c Cycle PhysicalAccuracyMode")
send_command("bind f12 gs c RefreshSet")
send_command('bind ^k gs c Toggle Kiting')


function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command("unbind f12")
    send_command('unbind ^k')
end

function get_sets()

    Cape = {}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Mag. Evasion+15'}}
    Cape.Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15'}}
    Cape.Melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Cape.Ws = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Attack+10','Weapon skill damage +10%','Damage taken-5%'}}

    sets.idle = {}

    sets.idle = {
        head="Vitiation chapeau +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Malignance gloves",
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back=Cape.Int,
        waist="Slipor sash",
        legs="Ayanmo cosciales +2",
        feet="Malignance boots"
    }

    sets.kite = {
        legs="Carmine cuisses +1"
    }

    sets.ja = {}
    sets.ja["Convert"] = {}
    sets.ja["Saboteur"] = {hands="Lethargy gantherots +1"}
    sets.ja["Chainspell"] = {body="Vitiation tabard +3"}

    sets.weapons = {}
    sets.weapons["Sword"] = {main = "Crocea Mors", sub="Sacro bulwark"}
    sets.weapons["Magic Accuracy"] = {main = "Crocea Mors", sub="Ammurapi shield"}
    sets.weapons["Dual Wield"] = {main = "Crocea Mors", sub = "Tauret"}
    sets.weapons["Odin"] = {main = "Aern Dagger", sub = "Qutrub Knife"}
    sets.weapons["Savage"] = {main = "Naegling", sub = "Thibron"}

    sets.ranged_ammo = {}
    sets.ranged_ammo["Magic Accuracy"] = {ranged="Ullr", ammo="Antlion arrow"}
    sets.ranged_ammo["Potency/Duration"] = {ranged=empty, ammo="Regal Gem"}
        
    sets.engaged = {
        head="Ayanmo zucchetto +2",
        neck="Anu Torque",
        ear1="Dignitary's earring",
        ear2="Sherida Earring",
        body="Malignance tabard",
        hands="Malignance gloves",
        ring1={name="Chirich ring +1", bag="wardrobe"},
        ring2="Hetairoi ring",
        back=Cape.Melee,
        waist="Grunfeld rope",
        legs="Carmine cuisses +1",
        feet="Malignance boots"
    }

    sets.engaged["Multi-Attack"] = set_combine( sets.engaged, {

    })

    sets.engaged["High Acc"] = set_combine( sets.engaged, {
        neck="Sanctity Necklace",
        ear2="Telos earring",
        ring2={name="Chirich ring +1", bag="wardrobe3"},
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2"
    })

    sets.engaged.enspell ={
        hands="Aya. Manopolas +2",
        legs="Vitiation Tights +3",
        -- back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+9','Enh. Mag. eff. dur. +20'}},
        waist="Orpheus's sash"
    }

    sets.engaged.dw = {}
    sets.engaged.dw["Multi-Attack"] = set_combine(sets.engaged["Multi-Attack"], {
        waist="Reiki yotai"
    })

    sets.engaged.dw["High Acc"] = set_combine(sets.engaged["High Acc"], {
        waist="Reiki yotai",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}}
    })

    sets.engaged.dw["Multi-Attack"].enspell = set_combine(sets.engaged.dw["Multi-Attack"], sets.engaged.enspell)
    sets.engaged.dw["High Acc"].enspell = set_combine(sets.engaged.dw["High Acc"], sets.engaged.enspell)
    
    sets.engaged.sw = {}
    sets.engaged.sw["Multi-Attack"] = sets.engaged["Multi-Attack"]
    sets.engaged.sw["High Acc"] = sets.engaged["High Acc"]

    sets.engaged.sw["Multi-Attack"].enspell = set_combine(sets.engaged.sw["Multi-Attack"], sets.engaged.enspell)
    sets.engaged.sw["High Acc"].enspell = set_combine(sets.engaged.sw["High Acc"], sets.engaged.enspell)

    sets.fc = {   
        head="Atrophy chapeau +3",
        ear1="Etiolation earring",
        ear2="Malignance earring",
        body="Vitiation tabard +3",
        hands="Leyline gloves",
        ring1="Kishar Ring",
        waist="Embla Sash",
        legs="Aya. Cosciales +2"
    }

    sets.midcast = {}
    
    sets.midcast.cure = {
        head="Vanya hood",
        body="Vrikodara jupon",
        hands="Kaykaus cuffs",
        ring1="Haoma's ring",
        ring2="Menelaus's ring",
        back=Cape.Mnd,
        legs="Chironic hose",
        feet="Kaykaus boots"
    }

    sets.midcast.enhancing = {
        head="Befouled Crown",
        neck="Duelist's Torque +1",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Vitiation Tabard +3",
        hands="Vitiation gloves +1",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        waist="Embla sash",
        legs="Atrophy Tights +3",
        feet="Leth. Houseaux +1",
        back=Cape.Mnd
    }

    sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing, {
        head="Telchine cap",
        neck="Duelist's Torque +1",
        body="Vitation tabard +3",
        hands="Atrophy gloves +3",
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Lethargy houseaux +1"
    })

    sets.midcast.enhancing["Duration"].Composure = set_combine(sets.midcast.enhancing, {
        head="Lethargy Chappel +1",
        neck="Duelist's Torque +1",
        hands="Lethargy gantherots +1",
        body="Lethargy sayon +1",
        waist="Embla sash",
        legs="Lethargy fuseau +1",
        feet="Lethargy houseaux +1"
    })

    sets.midcast.enhancing.spikes = set_combine(sets.midcast.enhancing, {
        legs="Vitiation tights +3"
    })

    sets.midcast.enhancing.gain = set_combine(sets.midcast.enhancing, {
        hands="Vitiation Gloves +3"
    })

    sets.midcast.enhancing.refresh = set_combine(sets.midcast.enhancing["Duration"], {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +1"
    })

    sets.midcast.enhancing.regen = sets.midcast.enhancing["Duration"]

    sets.midcast["Phalanx"] = set_combine(sets.midcast.enhancing,
    {
        hands="Taeon gloves",
        legs="Taeon tights",
        feet="Taeon boots"
    })

    sets.midcast.enfeebling = {
        head="Vitiation chapeau +3",
        neck="Duelist's Torque +1",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Atrophy Tabard +3",
        hands="Lethargy gantherots +1",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        waist="Luminary Sash",
        back=Cape.Int,
        legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Cure" potency +7%','INT+12','"Mag.Atk.Bns."+8'}},
        feet="Vitiation Boots +3"
    }

    sets.midcast.enfeebling.mnd = set_combine(sets.midcast.enfeebling, {
        ear2="Snotra Earring",
        back=Cape.Mnd
    })
    
    sets.midcast.enfeebling.mnd["Magic Accuracy"] = set_combine(sets.midcast.enfeebling.mnd, {
        head="Atrophy chapeau +3"
    })

    sets.midcast.enfeebling.mnd["Potency"] = set_combine(sets.midcast.enfeebling.mnd, {
        body="Lethargy sayon +1"
    })

    sets.midcast.enfeebling.mnd["Duration"] = set_combine(sets.midcast.enfeebling.mnd, {
        ear2="Snotra Earring",
        ring2="Kishar ring",
        legs="Lethargy Fuseau +1", --22 MACC, 10% Duration set bonus--
        feet="Lethargy Houseaux +1" --10% Duration set bonus--
    })

    sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling, {
        back=Cape.Int
    })

    sets.midcast.enfeebling.int["Magic Accuracy"] = set_combine(sets.midcast.enfeebling.int, {
        head="Atrophy chapeau +3",
        hands="Malignance gloves"
    })

    sets.midcast.enfeebling.int["Potency"] = set_combine(sets.midcast.enfeebling.int, {
        body="Lethargy sayon +1"        
    })

    sets.midcast.enfeebling.int["Duration"] = set_combine(sets.midcast.enfeebling.int, {
        ear2="Snotra Earring",
        ring2="Kishar ring",
        legs="Lethargy Fuseau +1", --22 MACC, 10% Duration set bonus--
        feet="Lethargy Houseaux +1" --10% Duration set bonus--
    })

    sets.midcast["Stun"] = sets.midcast.enfeebling.int["Magic Accuracy"]
    sets.midcast["Dispel"] = sets.midcast.enfeebling.int["Magic Accuracy"]
    sets.midcast["Dispelga"] = sets.midcast.enfeebling.int["Magic Accuracy"]

    sets.midcast["Dia"] = sets.midcast.enfeebling.int["Duration"]
    sets.midcast["Dia II"] = sets.midcast.enfeebling.int["Duration"]
    sets.midcast["Dia III"] = sets.midcast.enfeebling.int["Duration"]

    sets.midcast["Bio I"] = sets.midcast.enfeebling.int["Duration"]
    sets.midcast["Bio II"] = sets.midcast.enfeebling.int["Duration"]
    sets.midcast["Bio III"] = sets.midcast.enfeebling.int["Duration"]

    sets.midcast.elemental = {
        head="Ea hat +1",
        neck="Mizu. Kubikazari",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Ea houppelande",
        hands="Amalric gages +1",
        ring1="Shiva ring +1",
        ring2="Freke ring",
        waist="Sacro cord",
        legs="Ea slops +1",
        feet="Merlinic Crackows"
    }

    sets.midcast.dark_magic = set_combine(sets.midcast.elemental, {
        head="Pixie hairpin +1",
        neck="Erra pendant",
        ring1="Evanescence ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
    })
    
    sets.midcast.drain = set_combine(sets.midcast.dark_magic, {
        ring2="Excelsis ring",
        waist="Fucho-no-obi",
        feet="Merlinic crackows"
    })

    sets.midcast.aspir = sets.midcast.drain

    sets.fc['Impact'] = set_combine(sets.fc, {
        head=empty,
        body='Twilight cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.elemental, {
        head=empty,
        body='Twilight cloak',
        ring2="Archon ring"
    })

    sets.fc['Dispelga'] = set_combine(sets.fc, {
        main="Daybreak"
    })

    sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeebling.int.macc, {
        main="Daybreak"
    })

    sets.ws = {}
    
    sets.ws.magic = {
        head="Vitiation Chapeau +3",
        neck="Fotia gorget",
        ear1="Ishvara Earring",
        ear2="Malignance earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        ring1="Jhakri Ring",
        ring2="Shiva ring +1",
        back=Cape.Int,
        waist="Orpheus's sash",
        legs="Jhakri Slops +2",
        feet="Vitiation Boots +3"
    }

    sets.ws.physical = {
        head="Vitiation Chapeau +3",
        neck="Fotia gorget",
        ear1="Ishvara Earring",
        ear2="Sherida Earring",
        body="Vitiation tabard +3",
        hands="Atrophy gloves +3",
        ring1="Jhakri Ring",
        ring2="Ilabrat ring",
        back=Cape.Ws,
        waist="Fotia belt",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2"
    }
        
    sets.ws["Red Lotus Blade"] = sets.ws.magic
    sets.ws["Seraph Blade"] = sets.ws.magic
    sets.ws["Circle Blade"] = sets.ws.physical
    sets.ws["Vorpal Blade"] = sets.ws.physical
    sets.ws["Savage Blade"] = set_combine(sets.ws.physical, {
        ear2="Regal earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring"
    })
    sets.ws["Death Blossom"] = sets.ws.physical
    sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
        head="Pixie Hairpin +1",
        ring1="Archon ring"
    })

    sets.ws["Chant du Cygne"] = sets.ws.physical
    sets.ws["Requiescat"] = sets.ws.physical    
    sets.ws["Evisceration"] = sets.ws.physical
    sets.ws["Aeolian Edge"] = sets.ws.magic
    sets.ws["Exenterator"] = sets.ws.physical

    coroutine.schedule(lockstyle,8)

end

function precast(spell)
    -- print_set(spell)
    if sets.fc[spell.name] then
        equip(sets.fc[spell.name])
    elseif spell.action_type == "Magic" then
        equip(sets.fc)
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        end
    elseif spell.type == "JobAbility" then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    end
end

-- enhancing_map = {
--     ['Barfire']='Potency',['Barstone']='',['Barsleep']='', ['Barwater']='',
--     ['Temper']='Potency',['Temper II']='Temper',
--     ['Regen']='Duration',['Regen II']='Duration',
--     ['Haste']='Duration',['Haste II']='Duration'
--     ['Refresh']='Duration',['Refresh II']='Duration',['Refresh III']='Duration',
--     ['Firestorm']='Duration',['Hailstorm']='Duration',['Windstorm']='Duration',['Sandstorm']='Duration',['Thunderstorm']='Duration',['Rainstorm']='Duration',['Aurorastorm']='Duration',['Voidstorm']='Duration',
-- }

function midcast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then   
        -- Healing Magic --
        if sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        elseif string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') or string.find(spell.english, "Curaga") then
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
            else
                equip(sets.midcast.cure)
            end
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if string.find(spell.english, "Regen") then
                equip(sets.midcast.enhancing.regen)                
            elseif string.find(spell.english, "Refresh") then
                equip(sets.midcast.enhancing.refresh)
            elseif string.find(spell.english, "Spikes") then
                equip(sets.midcast.enhancing.spikes)
            elseif spell.english:startswith("Gain-") then
                equip(sets.midcast.enhancing.gain)
            elseif spell.english:startswith("Haste") then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.enhancing["Duration"].Composure)
                else
                    equip(sets.midcast.enhancing["Duration"])
                end
            elseif spell.english:startswith("Flurry") then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.enhancing["Duration"].Composure)
                else
                    equip(sets.midcast.enhancing["Duration"])
                end
            elseif spell.english:startswith("Refresh") then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.enhancing["Duration"].Composure)
                else
                    equip(sets.midcast.enhancing["Duration"])
                end
            elseif string.find(spell.english, "storm") then
                    equip(sets.midcast.enhancing["Duration"])
            elseif spell.english == "Sneak" then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.enhancing["Duration"].Composure)
                else
                    equip(sets.midcast.enhancing["Duration"])
                end
            elseif spell.english == "Invisible" then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.enhancing["Duration"].Composure)
                else
                    equip(sets.midcast.enhancing["Duration"])
                end
            else                
                equip(sets.midcast.enhancing)
            end
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' then
            local magicAccuracyMode = MagicAccuracyMode[MagicAccuracyModeIndex]
            if MndEnfeebles[spell.name] then
                if magicAccuracyMode == "Potency/Duration" then
                    if Duration[spell.name] then
                        equip(sets.midcast.enfeebling.mnd["Duration"])
                    elseif Potency[spell.name] then
                        equip(sets.midcast.enfeebling.mnd["Potency"])
                    else
                        equip(sets.midcast.enfeebling.mnd["Magic Accuracy"])
                    end
                else
                    equip(sets.midcast.enfeebling.mnd[magicAccuracyMode])
                end                
            elseif IntEnfeebles[spell.name] then
                if magicAccuracyMode == "Potency/Duration" then
                    if Duration[spell.name] then
                        equip(sets.midcast.enfeebling.int["Duration"])
                    elseif Potency[spell.name] then
                        equip(sets.midcast.enfeebling.int["Potency"])
                    else
                        equip(sets.midcast.enfeebling.int["Magic Accuracy"])
                    end
                else
                    equip(sets.midcast.enfeebling.int[magicAccuracyMode])
                end
            else
                equip(sets.midcast.enfeebling)
            end

            if buffactive["Saboteur"] then
                equip(sets.ja["Saboteur"])
            end
            
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            if (spell.target.distance < 5) then
                equip( set_combine(sets.midcast.elemental, {waist = "Orpheus's sash"}))
            elseif (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( set_combine(sets.midcast.elemental, {waist = "Hachirin-no-Obi"}))
            else
                equip(sets.midcast.elemental)
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
end

function aftercast(spell)
    --print_set(spell)
    SetGearToState(player.status)
end

function status_change(new, old)

    SetGearToState(new)
end

function buff_change(buff,gain)
    -- print_set(buff)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        SetGearToState(player.status)
    elseif S{"Enstone", "Enstone II", "Enwater", "Enwater II", "Enaero", "Enaero II", "Enfire", "Enfire II", "Enthunder", "Enhunder II", "Enblizzard", "Enblizzard II"}[buff] then
        SetGearToState(player.status)
    end
end

function SetGearToState(state)
    -- print(buffactive["Enstone"])
    if state == "Engaged" then

        local accuracyMode = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
        if IsDualWield() then
            if IsEnspellActive() then
                equip(sets.engaged.dw[accuracyMode].enspell)
            else
                equip(sets.engaged.dw[accuracyMode])
            end
        else
            if IsEnspellActive() then
                equip(sets.engaged.sw[accuracyMode].enspell)
            else
                equip(sets.engaged.sw[accuracyMode])
            end
        end
    else
        equip(sets.idle)
    end

    local magicMode = MagicAccuracyMode[MagicAccuracyModeIndex]
    equip(sets.ranged_ammo[magicMode])

    local weaponSet = Weapon_Sets[WeaponSetsIndex]
    equip(sets.weapons[weaponSet])

   if Kiting then
    equip(sets.kite)
   end
end

function IsEnspellActive()
    return (
        buffactive["Enstone"] or buffactive["Enstone II"]
        or buffactive["Enwater"] or buffactive["Enwater II"]
        or buffactive["Enaero"] or buffactive["Enaero II"]
        or buffactive["Enfire"] or buffactive["Enfire II"]
        or buffactive["Enblizzard"] or buffactive["Enblizzard II"]
        or buffactive["Enthunder"] or buffactive["Enthunder II"])
end

function lockstyle()
    if player.main_job == 'RDM' then send_command('@input /lockstyleset 6') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end

function IsDualWield()
    local equipment = windower.ffxi.get_items('equipment')
    local sub = windower.ffxi.get_items(equipment.sub_bag, equipment.sub)
    local item = res.items[sub.id]
    return item.category == "Weapon"
end

function self_command(command)  
    if command == "Cycle PhysicalAccuracyMode" then
        PhysicalAccuracyModeIndex = PhysicalAccuracyModeIndex % #PhysicalAccuracyMode + 1
        local physicalSet = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
        add_to_chat(122,  "Physical Accuracy Mode: " .. physicalSet)
        SetGearToState(player.status)
    elseif command == "Cycle MagicMode" then
        MagicAccuracyModeIndex = MagicAccuracyModeIndex % #MagicAccuracyMode + 1
        local magicMode = MagicAccuracyMode[MagicAccuracyModeIndex]
        add_to_chat(122,  "Magic Accuracy Mode: " .. magicMode)
        equip(sets.ranged_ammo[magicMode])
        SetGearToState(player.status)
    elseif command == 'RefreshSet' then
        SetGearToState(player.status)
        local physicalSet = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
        local weaponSet = Weapon_Sets[WeaponSetsIndex]
        local magicMode = MagicAccuracyMode[MagicAccuracyModeIndex]

        add_to_chat(122, "Weapon Set:" .. weaponSet .. " | Enfeeble Mode: " .. magicMode .. " | Engaged Mode: " .. physicalSet)
        SetGearToState(player.status)
        lockstyle()
    elseif command == "Toggle Kiting" then
        Kiting = not Kiting
        add_to_chat(122,  "Kiting Mode: " .. (Kiting and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle WeaponSet" then
        WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
        local weaponSet = Weapon_Sets[WeaponSetsIndex]
        add_to_chat(122,  "Weapon Set: " .. weaponSet)
        equip(sets.weapons[weaponSet])
        SetGearToState(player.status)
    end
    
end