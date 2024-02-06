res = require('resources')

Weapon_Sets = {"Sword", "Magic Accuracy", "Dual Wield", "Odin", "Savage", "Club", "Club2", "AE", "Burst"}
WeaponSetsIndex = 2

PhysicalAccuracyMode = {"High Acc", "Multi-Attack", "PDT" }
PhysicalAccuracyModeIndex = 2

MagicAccuracyMode = {"Magic Accuracy", "Potency/Duration"}
MagicAccuracyModeIndex = 2

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
    Cape.Fc = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Mag. Evasion+15'}}
    Cape.Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}}
    Cape.Tp = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    Cape.Dw = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%'}}
    Cape.Str_WS = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Dex_WS = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Mnd_WS = { name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    
    sets.idle = {
        ammo="Staunch tathlum +1",
        head="Lethargy chappel +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Lethargy sayon +3",
        hands="Malignance gloves",
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back=Cape.Int,
        waist="Slipor sash",
        legs="Nyame flanchard",
        feet="Malignance boots"
    }

    sets.kite = {
        legs="Carmine cuisses +1"
    }

    sets.ja = {}
    sets.ja["Convert"] = {}
    
    sets.ja["Chainspell"] = {body="Vitiation tabard +3"}

    sets.buff = {}
    sets.buff["Saboteur"] = {hands="Lethargy gantherots +3"}

    sets.weapons = {}
    sets.weapons["Sword"] = {main = "Crocea Mors", sub="Sacro bulwark"}
    sets.weapons["Magic Accuracy"] = {main = "Crocea Mors", sub="Ammurapi shield"}
    sets.weapons["Dual Wield"] = {main = "Crocea Mors", sub = "Daybreak"}
    sets.weapons["Odin"] = {main = "Aern Dagger", sub = "Qutrub Knife"}
    sets.weapons["Savage"] = {main = "Naegling", sub = "Thibron"}
    sets.weapons["Club"] = {main="Maxentius", sub="Thibron"}
    sets.weapons["Club2"] = {main="Maxentius", sub="Sacro bulwark"}
    sets.weapons["AE"] = {main="Tauret", sub="Malevolence"}
    sets.weapons["Burst"] = {main="Bunzi's rod", sub="Ammurapi shield"}

        
    sets.engaged = {
        ranged=empty,
        ammo="Coiste bodhar",
        head="Malignance chapeau",
        neck="Anu Torque",
        ear1="Sherida Earring",
        ear2="Lethargy earring +2",
        body="Malignance tabard",
        hands="Malignance gloves",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2="Hetairoi ring",
        back=Cape.Dw,
        waist="Grunfeld rope",
        legs="Malignance tights",
        feet="Malignance boots"
    }

    -- sets.engaged = {
    --     head="Lethargy chappel +3",
    --     neck="Anu Torque",
    --     ear1="Sherida Earring",
    --     ear2="Dignitary's earring",        
    --     body="Lethargy sayon +3",
    --     hands="Lethargy gantherots +3",
    --     ring1={name="Chirich ring +1", bag="wardrobe5"},
    --     ring2="Hetairoi ring",
    --     back=Cape.Melee,
    --     waist="Grunfeld rope",
    --     legs="Lethargy fuseau +3",
    --     feet="Lethargy houseaux +3"
    -- }

    sets.engaged["Multi-Attack"] = set_combine( sets.engaged, {

    })

    sets.engaged["High Acc"] = set_combine( sets.engaged, {
        ring2={name="Chirich ring +1", bag="wardrobe6"},
    })

    sets.engaged["PDT"] = set_combine(sets.engaged, {
        neck="Loricate torque +1",
        ring2="Defending ring"
    })

    sets.engaged.enspell ={
        -- hands="Ayanmo Manopolas +2",
        -- legs="Vitiation Tights +3",
        -- back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+9','Enh. Mag. eff. dur. +20'}},
        waist="Orpheus's sash"
    }

    sets.engaged.dw = {}
    sets.engaged.dw["Multi-Attack"] = set_combine(sets.engaged["Multi-Attack"], {
        waist="Reiki yotai"
    })

    sets.engaged.dw["High Acc"] = set_combine(sets.engaged["High Acc"], {
        waist="Reiki yotai",
    })

    sets.engaged.dw["PDT"] = set_combine(sets.engaged["PDT"], {
        waist="Reiki yotai",
    })

    sets.engaged.dw["Multi-Attack"].enspell = set_combine(sets.engaged.dw["Multi-Attack"], sets.engaged.enspell)
    sets.engaged.dw["High Acc"].enspell = set_combine(sets.engaged.dw["High Acc"], sets.engaged.enspell)
    sets.engaged.dw["PDT"].enspell = set_combine(sets.engaged.dw["PDT"], sets.engaged.enspell)
    
    sets.engaged.sw = {}
    sets.engaged.sw["Multi-Attack"] = sets.engaged["Multi-Attack"]
    sets.engaged.sw["High Acc"] = sets.engaged["High Acc"]
    sets.engaged.sw["PDT"] = sets.engaged["PDT"]

    sets.engaged.sw["Multi-Attack"].enspell = set_combine(sets.engaged.sw["Multi-Attack"], sets.engaged.enspell)
    sets.engaged.sw["High Acc"].enspell = set_combine(sets.engaged.sw["High Acc"], sets.engaged.enspell)
    sets.engaged.sw["PDT"].enspell = set_combine(sets.engaged.sw["PDT"], sets.engaged.enspell)

    --rdm inherit 38
    --50
    --83 total
    sets.fc = {   
        head="Atrophy chapeau +3", --16
        ear1="Malignance earring", --1
        ear2="Lethargy earring +2", --9
        body="Vitiation tabard +3", --15
        hands="Lethargy gantherots +3", --8
        ring1="Medada's ring", --10%
        ring2="Defending ring", --4
        back=Cape.Fc,
        waist="Platinum moogle belt", --5
        legs="Malignance tights",
        feet="Lethargy houseaux +3"
    }

    sets.midcast = {}
    
    sets.midcast.cure = {
        head="Lethargy chappel +3",
        neck="Loricate torque +1",
        body="Bunzi's robe",
        hands="Lethargy gantherots +3",
        ring1="Defending ring",
        ring2="Menelaus's ring",
        back=Cape.Mnd,
        legs="Atrophy tights +3",
        feet="Kaykaus boots"
    }

    sets.midcast.enhancing = {
        head="Befouled Crown",
        neck="Incanter's torque",
        ear1="Mimir earring",
        ear2="Lethargy earring +2",
        body="Vitiation Tabard +3",
        hands="Vitiation gloves +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Embla sash",
        legs="Atrophy Tights +3",
        feet="Lethargy Houseaux +3",
        back="Ghostfyre cape"
    }

    sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing, {
        main="Colada",
        head="Telchine cap",
        ear2="Lethargy earring +2",
        neck="Duelist's torque +2",
        body="Vitiation tabard +3",
        hands="Atrophy gloves +3",
        waist="Embla sash",
        back="Ghostfyre cape",
        legs="Telchine braconi",
        feet="Lethargy houseaux +3"
    })

    sets.midcast.enhancing["Duration"].Composure = set_combine(sets.midcast.enhancing, {
        main="Colada",
        head="Lethargy Chappel +3",
        neck="Duelist's torque +2",
        ear2="Lethargy earring +2",
        hands="Atrophy gloves +3",
        body="Lethargy sayon +3",
        waist="Embla sash",
        back="Ghostfyre cape",
        legs="Lethargy fuseau +3",
        feet="Lethargy houseaux +3"
    })

    sets.midcast["Aquaveil"] = set_combine(sets.midcast.enhancing["Duration"].Composure, { 
        hands="Regal cuffs"
    })

    sets.midcast["Temper II"] = set_combine(sets.midcast.enhancing, {
        neck="Incanter's torque"
    })

    sets.midcast.enhancing.spikes = set_combine(sets.midcast.enhancing, {
        legs="Vitiation tights +3"
    })

    sets.midcast.enhancing.gain = set_combine(sets.midcast.enhancing, {
        hands="Vitiation Gloves +3"
    })

    sets.midcast.enhancing.refresh = {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +3"
    }

    sets.midcast.enhancing.regen = sets.midcast.enhancing["Duration"]

    sets.midcast.phal = set_combine(sets.midcast.enhancing,
    {
        hands="Taeon gloves",
        legs="Taeon tights",
        feet="Taeon boots"
    })
    sets.midcast.phal.Self = sets.midcast.phal

    sets.midcast.phal.Others = sets.midcast.enhancing['Duration']
    sets.midcast.phal.Others.Composure = sets.midcast.enhancing['Duration'].Composure

    sets.midcast.absorb = {
        head="Atrophy Chapeau +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Erra Pendant",
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        ear1="Regal Earring",
        ear2="Lethargy Earring +2",
        ring1="Medada's Ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast.enfeebling = {
        ranged=empty,
        ammo="Regal gem",
        main="Contemplator +1",
        sub="Enki strap",
        head="Lethargy chapeau +3",
        neck="Duelist's torque +2",
        ear1="Malignance earring",
        ear2="Lethargy earring +2",
        body="Lethargy sayon +3",
        hands="Lethargy gantherots +3",
        ring1="Medada's ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Obstinate Sash",
        back=Cape.Int,
        legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Cure" potency +7%','INT+12','"Mag.Atk.Bns."+8'}},
        feet="Vitiation Boots +3"
    }

    sets.midcast.enfeebling.mnd = set_combine(sets.midcast.enfeebling, {
        ear1="Snotra Earring",
        back=Cape.Mnd
    })
    
    sets.midcast.enfeebling.mnd["Magic Accuracy"] = set_combine(sets.midcast.enfeebling.mnd, {
        ranged="Ullr",
        ammo=empty,
        head="Atrophy chapeau +3"
    })

    sets.midcast.enfeebling.mnd["Potency"] = set_combine(sets.midcast.enfeebling.mnd, {
        body="Lethargy sayon +3"
    })

    sets.midcast.enfeebling.mnd["Duration"] = set_combine(sets.midcast.enfeebling.mnd, {
        ear1="Snotra Earring",
        hands="Regal cuffs",
        ring2="Kishar ring"
    })

    sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling, {
        ring1="Medada's ring",
        back=Cape.Int
    })

    sets.midcast.enfeebling.int["Magic Accuracy"] = set_combine(sets.midcast.enfeebling.int, {
        ranged="Ullr",
        ammo=empty
    })

    sets.midcast.enfeebling.int["Potency"] = set_combine(sets.midcast.enfeebling.int, {
        body="Lethargy sayon +3"        
    })

    sets.midcast.enfeebling.int["Duration"] = set_combine(sets.midcast.enfeebling.int, {
        ear2="Snotra Earring",
        hands="Regal cuffs",
        ring2="Kishar ring"
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
        main="Bunzi's rod",
        sub="Ammurapi shield",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1",
        neck="Duelist's torque +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Ea houppelande +1",
        hands="Bunzi's gloves",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back=Cape.Int,
        waist="Acuity belt +1",
        legs="Lethargy fuseau +3",
        feet="Lethargy houseaux +3"
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
        body='Crepuscular cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.elemental, {
        main="Bunzi's rod",
        sub="Ammurapi shield",
        ranged="Ullr",
        ammo=empty,
        head=empty,
        neck="Duelist's torque +2",
        ear1="Malignance earring",
        ear2="Lethargy earring +2",
        body="Crepuscular cloak",
        hands="Lethargy gantherots +3",
        ring1="Medada's ring",
        ring2="Metamporh ring +1",
        back=Cape.Int,
        waist="Acuity belt +1",
        legs="Lethargy fuseau +3",
        feet="Lethargy houseaux +3"
    })

    sets.fc['Dispelga'] = set_combine(sets.fc, {
        main="Daybreak"
    })

    sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeebling.int.macc, {
        main="Daybreak"
    })

    sets.ws = {}
    
    sets.ws.magic = {
        ammo="Sroda tathlum",
        head="Lethargy chappel +3",
        neck="Sibyl Scarf",
        ear1="Moonshade earring",
        ear2="Regal earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Freke ring",
        back=Cape.Int,
        waist="Orpheus's sash",
        legs="Nyame flanchard",
        feet="Lethargy houseaux +3"
    }

    sets.ws.physical = {
        ammo="Coiste bodhar",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Sherida Earring",
        ear2="Lethargy earring +2",        
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Rufescent ring",
        ring2="Ilabrat ring",
        back=Cape.Mnd_WS,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet="Lethargy houseaux +3"
    }

    sets.ws["Empyreal Arrow"] = sets.ws.physical
    
    sets.ws["Aeolian Edge"] = sets.ws.magic

    sets.ws["Red Lotus Blade"] = sets.ws.magic

    sets.ws["Seraph Blade"] = set_combine(sets.ws.magic,{
        ring2="Shukuyu ring",
        back=Cape.Mnd_WS
    })
    
    sets.ws["Circle Blade"] = set_combine(sets.ws.physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.ws["Vorpal Blade"] = set_combine(sets.ws.physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.ws["Savage Blade"] = set_combine(sets.ws.physical, {
        neck="Republican platinum medal",
        ear1="Regal earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        waist="Sailfi belt +1",
        back=Cape.Str_WS
    })

    sets.ws["Death Blossom"] = set_combine(sets.ws.physical, {
        ring2="Shukuyu ring"
    })

    sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
        ear1="Regal earring",
        neck="Duelist's torque +2",
        head="Pixie Hairpin +1",
        ring1="Medada's ring",
        ring2="Archon ring",
        back=Cape.Mnd_WS
    })

    sets.ws["Chant du Cygne"] = set_combine(sets.ws.physical, {
        back=Cape.Dex_WS
    })
    
    sets.ws["Requiescat"] = {
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sanctity Necklace",
        waist="Kentarch Belt +1",
        left_ear="Crep. Earring",
        right_ear="Lethargy Earring +2",
        left_ring="Rufescent Ring",
        right_ring="Chirich Ring +1",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    sets.ws["Evisceration"] = sets.ws.physical
    sets.ws["Aeolian Edge"] = sets.ws.magic
    sets.ws["Exenterator"] = sets.ws.physical
    sets.ws["Black Halo"] = sets.ws.physical

    sets.HolyWater = {
        neck="Nicander's necklace",
        ring1={name="Blenmot's ring +1", bag="warddrobe5"},
        ring2={name="Blenmot's ring +1", bag="warddrobe6"} 
    }

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
    elseif spell.type == "Item" then
        if spell.name == "Holy Water" or spell.name == "Hallowed Water" then
            equip(sets.HolyWater)
        end
    end
end

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
                equip(sets.midcast.enhancing.refresh)
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
            elseif spell.english:startswith("Phalanx") then
                if spell.target.type ~= "SELF" and buffactive["Composure"] then
                    equip(sets.midcast.phal.Others.Composure)
                elseif spell.target.type ~= "SELF" and not buffactive["Composure"] then
                    equip(sets.midcast.phal.Others)
                else
                    equip(sets.midcast.phal.Self)
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
                equip(sets.buff["Saboteur"])
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
            elseif spell.name:startswith("Absorb-") then
                equip(sets.midcast.absorb)
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
    if player.main_job == 'RDM' then send_command('@input /lockstyleset 4') end
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
        SetGearToState(player.status)
    elseif command == 'RefreshSet' then
        SetGearToState(player.status)
        local physicalSet = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
        local weaponSet = Weapon_Sets[WeaponSetsIndex]
        local magicMode = MagicAccuracyMode[MagicAccuracyModeIndex]

        add_to_chat(122, "Weapon Set: " .. weaponSet .. " | Enfeeble Mode: " .. magicMode .. " | Engaged Mode: " .. physicalSet)
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