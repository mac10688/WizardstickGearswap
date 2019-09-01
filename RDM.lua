res = require('resources')

Weapon_Sets = {"Empty", "Sword", "Dagger", "Staff", "Dual Wield"}
WeaponSetsIndex = 1

NukeSet = {"Low Acc", "High Acc", "Magic Burst"}
NukeSetIndex = 1

EngagedMode = {"Tank", "Offense"}
EngagedModeIndex = 1

PhysicalAccuracyMode = {"High Acc", "Low Acc"}
PhysicalAccuracyModeIndex = 1

IdleMode = {"Refresh", "Damage Taken"}
IdleModeIndex = 2

EnhancingMagicMode = {"Duration", "Potency"}
EnhancingMagicModeIndex = 1

MagicAccuracyMode = {"High Acc", "Low Acc"}
MagicAccuracyModeIndex = 1

EnspellActive = true
Kiting = false

MndEnfeebles = S{"Paralyze", "Paralyze II"
                , "Slow", "Slow II"
                , "Addle", "Addle II"
                , "Silence"
                , "Blind", "Blind II"
                , "Distract", "Distract II", "Distract III"
                , "Frazzle", "Frazzle II", "Frazzle III"
            }

IntEnfeebles = S{"Bind"}

MagicAccEnfeebles = S{"Gravity", "Gravity II", "Break", "Inundation", "Sleep", "Sleep II", "Dispel", "Dia", "Dia II", "Dia III"}

send_command("bind f9 gs c TankMode")
send_command("bind ^f9 gs c Cycle IdleMode")
send_command("bind f10 gs c OffensiveMode")
send_command("bind ^f10 gs c Cycle PhysicalAccuracyMode")
send_command("bind @f10 gs c Toggle EnspellMode")
send_command("bind !f10 gs c Cycle WeaponSet")
send_command("bind ^f11 gs c Cycle MagicMode")
send_command('bind @f11 gs c Cycle NukeSet')
send_command("bind !f11 gs c Cycle EnhancingMode")
send_command("bind f12 gs c RefreshSet")
send_command('bind ^k gs c Toggle Kiting')


function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind @f10')
    send_command('unbind !f10')
    send_command('unbind ^f11')
    send_command('unbind @f11')
    send_command('unbind !f11')
    send_command("unbind f12")
    send_command('unbind ^k')
    enable('main', 'sub')
end

function get_sets()

    Cape = {}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Mag. Evasion+15'}}
    Cape.Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15'}}
    Cape.Melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Cape.Ws = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Attack+10','Weapon skill damage +10%','Damage taken-5%'}}

    sets.idle = {}

    sets.idle["Damage Taken"] = {
        main="Mafic cudgel",
        sub="Genmei shield",
        ammo="Staunch tathlum +1",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Ayanmo manopolas +2",
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back=Cape.Int,
        waist="Slipor sash",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2"
    }

    sets.idle["Refresh"] = set_combine(sets.idle["Damage Taken"], {
        main="Bolelabunga",
        ammo="Homiliary",
        head="Befouled crown",
        body="Shamash robe",
        waist="Fucho-no-Obi"
    })

    sets.kite = {
        legs="Carmine cuisses +1"
    }

    sets.ja = {}
    sets.ja["Convert"] = {}

    sets.weapons = {}
    sets.weapons["Empty"] = {}
    sets.weapons["Sword"] = {main = "Kaja Sword", sub="Genmei shield"}
    sets.weapons["Dagger"] = {main = "Kaja knife", sub="Genmei shield"}
    sets.weapons["Staff"] = {main = "Grioavolr", sub="Enki strap"}
    sets.weapons["Dual Wield"] = {main = "Kaja sword", sub = "Kaja knife"}
        
    sets.engaged = {
        ammo="Ginsen",
        head="Ayanmo zucchetto +2",
        neck="Anu Torque",
        ear1="Dignitary's earring",
        ear2="Sherida Earring",
        body="Ayanmo Corazza +2",
        ring1="Chirich ring +1",
        ring2="Ilabrat Ring",
        back=Cape.Melee,
        waist="Grunfeld rope",
        legs="Carmine cuisses +1",
        feet="Carmine greaves +1"
    }

    sets.engaged["Low Acc"] = set_combine( sets.engaged, {

    })

    sets.engaged["High Acc"] = set_combine( sets.engaged["Low Acc"], {
        neck="Sanctity Necklace",
        ear2="Telos earring",
        ring2="Chirich ring +1",
        feet="Aya. Gambieras +2"
    })

    sets.engaged.enspell ={
        hands="Aya. Manopolas +2",
        legs="Vitiation Tights +1",
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+9','Enh. Mag. eff. dur. +20'}},
    }

    sets.engaged.dw = {}
    sets.engaged.dw["Low Acc"] = sets.engaged["Low Acc"]
    sets.engaged.dw["High Acc"] = set_combine(sets.engaged["High Acc"], {
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}}
    })

    sets.engaged.dw["Low Acc"].enspell = set_combine(sets.engaged.dw["Low Acc"], sets.engaged.enspell)
    sets.engaged.dw["High Acc"].enspell = set_combine(sets.engaged.dw["High Acc"], sets.engaged.enspell)
    
    sets.engaged.sw = {}
    sets.engaged.sw["Low Acc"] = sets.engaged["Low Acc"]
    sets.engaged.sw["High Acc"] = sets.engaged["High Acc"]

    sets.engaged.sw["Low Acc"].enspell = set_combine(sets.engaged.sw["Low Acc"], sets.engaged.enspell)
    sets.engaged.sw["High Acc"].enspell = set_combine(sets.engaged.sw["High Acc"], sets.engaged.enspell)

    sets.engaged.sw["Damage Taken"] = {
        ammo="Staunch tathlum +1",
        head="Aya. Zucchetto +2",
        neck="Loricate Torque +1",
        ear1="Genmei Earring",
        ear2="Odnowa Earring +1",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        ring1="Ayanmo Ring",
        ring2="Defending Ring",
        back=Cape.Int,
        waist="Slipor sash",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2"
    }

    sets.fc = {   
        head="Atrophy chapeau +2",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        body="Vitiation tabard +1",
        hands="Leyline gloves",
        ring1="Kishar Ring",
        legs="Aya. Cosciales +2",
        feet="Merlinic Crackows"
    }

    sets.midcast = {}
    
    sets.midcast.cure = {
        sub="Sors shield",
        head="Vanya hood",
        body="Vrikodara jupon",
        hands="Kaykaus cuffs",
        ring1="Haoma's ring",
        ring2="Haoma's ring",
        back=Cape.Mnd,
        legs="Chironic hose",
        feet="Kaykaus boots"
    }

    sets.midcast.enhancing = {
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Befouled Crown",
        neck="Duelist's Torque +1",
        ear1="Mendi. Earring",
        ear2="Calamitous Earring",
        body="Viti. Tabard +1",
        hands="Vitiation gloves +1",
        ring1="Stikini ring",
        ring2="Stikini ring",
        waist="Olympus sash",
        legs="Atrophy Tights +2",
        feet="Leth. Houseaux +1",
        back=Cape.Mnd
    }
    
    sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing, {
        head="Telchine Cap",
        body="Telchine body",
        hands="Atrophy gloves +2",
        legs="Telchine Braconi",
        feet="Lethargy houseaux +1"
    })

    sets.midcast.enhancing["Duration"].Self = set_combine(sets.midcast.enhancing["Duration"], {
        feet="Telchine pigaches"
    })

    sets.midcast.enhancing["Potency"] = sets.midcast.enhancing
    sets.midcast.enhancing["Potency"].Self = sets.midcast.enhancing

    sets.midcast.enhancing.spikes = set_combine(sets.midcast.enhancing, {
        legs="Vitiation tights +1"
    })

    sets.midcast.enhancing.gain = set_combine(sets.midcast.enhancing, {
        hands="Vitiation Gloves +1"
    })

    sets.midcast.enhancing.refresh = set_combine(sets.midcast.enhancing["Duration"], {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +1"
    })

    sets.midcast.enhancing.refresh.Self = set_combine(sets.midcast.enhancing["Duration"], {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +1"
    })

    sets.midcast.enhancing.regen = set_combine(sets.midcast.enhancing["Duration"], {
    })

    sets.midcast.enhancing.regen.Self = set_combine(sets.midcast.enhancing["Duration"], {

    })

    sets.midcast.enfeebling = {
        main="Gada",
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head="Atrophy chapeau +2",
        neck="Duelist's Torque +1",
        ear1="Digni. Earring",
        ear2="Regal earring",
        body="Atrophy Tabard +3",
        hands="Vitiation gloves +1",
        ring1="Stikini ring",
        ring2="Stikini ring",
        waist="Luminary Sash",
        back=Cape.Int,
        legs="Chironic hose",
        feet="Vitiation Boots +1"
    }

    sets.midcast.enfeebling.mnd = set_combine(sets.midcast.enfeebling, {
        back=Cape.Mnd
    })

    sets.midcast.enfeebling.mnd["High Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
    })
            
    sets.midcast.enfeebling.mnd["Low Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
        ring2="Kishar Ring"
    })

    sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling, {
        back=Cape.Int
    })
        
    sets.midcast.enfeebling.int["High Acc"] = set_combine(sets.midcast.enfeebling.int, {
    })
            
    sets.midcast.enfeebling.int["Low Acc"]= set_combine(sets.midcast.enfeebling.int, {
        body="Lethargy Sayon +1",
        right_ring="Kishar Ring"
    })

    merlinic_head_mab = { name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Occult Acumen"+4','Mag. Acc.+11','"Mag.Atk.Bns."+8'}}
    merlinic_body_mab = { name="Merlinic Jubbah", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic dmg. taken -2%','CHR+1','Mag. Acc.+14','"Mag.Atk.Bns."+9'}}
    merlinic_legs_mab = { name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','CHR+8','Mag. Acc.+15'}}
    merlinic_feet_mab = { name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+1%','INT+7','Mag. Acc.+15','"Mag.Atk.Bns."+14'}}

    sets.midcast.elemental = {
        ammo="Pemphredo tathlum",
        head=merlinic_head_mab,
        neck="Sanctity Necklace",
        ear1="Barkarole earring",
        ear2="Friomisi earring",
        body=merlinic_body_mab,
        hands="Amalric gages +1",
        left_ring="Shiva Ring",
        right_ring="Shiva Ring +1",
        back=Cape.Int,
        waist="Eschan stone",
        legs=merlinic_legs_mab,
        feet=merlinic_feet_mab
    }

    sets.midcast.dark_magic = set_combine(sets.midcast.elemental, {
        head="Pixie hairpin +1",
        neck="Erra pendant",
        ring1="Evanescence ring",
        waist="Fucho-no-obi",
    })
    
    sets.midcast.drain = set_combine(sets.midcast.dark_magic, {
        ring2="Excelsis ring",
        waist="Fucho-no-obi",
        feet="Merlinic crackows"
    })

    sets.midcast.aspir = sets.midcast.drain

    sets.midcast.elemental["Low Acc"] = set_combine(sets.midcast.elemental, {})
    sets.midcast.elemental["High Acc"] = set_combine(sets.midcast.elemental, {})

    merlinic_feet_mb = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5'}}
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental, {
        main="Grioavolr",
        sub="Enki strap",
        ammo="Pemphredo Tathlum",
        head="Ea hat",
        neck="Mizu. Kubikazari",
        ear1="Friomisi Earring",
        ear2="Static Earring",
        body="Ea houppelande",
        hands="Amalric gages +1",
        ring1="Locus Ring",
        ring2="Mujin Band",
        waist="Eschan Stone",
        legs="Ea slops",
        feet=merlinic_feet_mb
    })

    sets.ws = {}
    
    sets.ws.magic = {
        ammo="Pemphredo Tathlum",
        head="Viti. Chapeau +2",
        neck="Fotia gorget",
        ear1="Ishvara Earring",
        ear2="Friomisi Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        ring1="Jhakri Ring",
        ring2="Apate Ring",
        back=Cape.Int,
        waist="Fotia belt",
        legs="Jhakri Slops +2",
        feet="Vitiation Boots +3"
    }

    sets.ws.physical = {
        ammo="Ginsen",
        head="Viti. Chapeau +1",
        neck="Fotia gorget",
        ear1="Ishvara Earring",
        ear2="Sherida Earring",
        body="Viti. Tabard +1",
        hands="Jhakri cuffs +2",
        ring1="Jhakri Ring",
        ring2="Apate Ring",
        back=Cape.Ws,
        waist="Fotia belt",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2"
    }
        
    sets.ws["Red Lotus Blade"] = sets.ws.magic

    sets.ws["Seraph Blade"] = sets.ws.magic

    sets.ws["Circle Blade"] = sets.ws.physical

    sets.ws["Vorpal Blade"] = sets.ws.physical

    sets.ws["Savage Blade"] = set_combine( sets.ws.physical, {
    })

    sets.ws["Death Blossom"] = sets.ws["Savage Blade"]

    sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
        head="Pixie Hairpin +1",
    })

    sets.ws["Chant du Cygne"] = set_combine(sets.ws.physical, {
    })

    sets.ws["Requiescat"] = set_combine(sets.ws.physical, {
    })
    
    sets.ws["Evisceration"] = set_combine(sets.ws.physical, {
    })

    sets.ws["Aeolian Edge"] = set_combine(sets.ws.magic, {
    })

    sets.ws["Exenterator"] = set_combine(sets.ws.physical, {
    })

end

function precast(spell)
    -- print_set(spell)
    if spell.action_type == "Magic" then
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

function midcast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then   
        -- Healing Magic --
        if string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') or string.find(spell.english, "Curaga") then
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
            else
                equip(sets.midcast.cure)
            end
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if string.find(spell.english, "Regen") then
                if(spell.target.name == player.name) then
                    equip(sets.midcast.enhancing.regen.Self)
                else
                    equip(sets.midcast.enhancing.regen)
                end
                
            elseif string.find(spell.english, "Refresh") then
                if(spell.target.name == player.name) then
                    equip(sets.midcast.enhancing.refresh.Self)
                else
                    equip(sets.midcast.enhancing.refresh)
                end
            elseif string.find(spell.english, "Spikes") then
                equip(sets.midcast.enhancing.spikes)
            elseif spell.english:startswith("Gain-") then
                equip(sets.midcast.enhancing.gain)
            else
                if(spell.target.name == player.name) then
                    local enhancingMode = EnhancingMagicMode[EnhancingMagicModeIndex]
                    equip(sets.midcast.enhancing[enhancingMode].Self)
                else
                    local enhancingMode = EnhancingMagicMode[EnhancingMagicModeIndex]
                    equip(sets.midcast.enhancing[enhancingMode])
                end
                
            end
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' then
            local magicAccuracyMode = MagicAccuracyMode[MagicAccuracyModeIndex]
            if MndEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.mnd[magicAccuracyMode])
            elseif IntEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.int[magicAccuracyMode])
            elseif MagicAccEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.int["High Acc"])
            else
                equip(sets.midcast.enfeebling)
            end
            
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            local nuke_set = NukeSet[NukeSetIndex]
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
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
        local engagedMode = EngagedMode[EngagedModeIndex]
        if engagedMode == "Tank" then
            equip(sets.engaged.sw["Damage Taken"])
        else
            local accuracyMode = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
            local enspellWeatherMapping = {['Earth']={"Enstone", "Enstone II"},
                                           ['Water']= {"Enwater", "Enwater II"},
                                           ['Air']={"Enaero", "Enaero II"},
                                           ['Fire']={"Enfire", "Enfire II"},
                                           ['Ice']={"Enblizzard", "Enblizzard II"},
                                           ['Lightning']={"Enthunder", "Enthunder II"},
                                           ['Light']={"Enthunder", "Enthunder II"},
                                           ['Dark']={"Enblizzard", "Enblizzard II"}}
            if IsDualWield() then
                if EnspellActive and IsEnspellActive() then
                    equip(sets.engaged.dw[accuracyMode].enspell)

                    local buffToCheckForObiForDay = enspellWeatherMapping[world.day_element] or {"", ""}
                    local buffToCheckForObiForWeather = enspellWeatherMapping[world.weather_element] or {"", ""}
                    if buffactive[buffToCheckForObiForDay[1]] or buffactive[buffToCheckForObiForDay[2]] or buffactive[buffToCheckForObiForWeather[1]] or buffactive[buffToCheckForObiForWeather[2]] then
                        equip({waist = "Hachirin-no-Obi"})
                    end
                else
                    equip(sets.engaged.dw[accuracyMode])
                end
            else
                if EnspellActive and IsEnspellActive() then
                    equip(sets.engaged.sw[accuracyMode].enspell)
                    
                    local buffToCheckForObiForDay = enspellWeatherMapping[world.day_element] or {"", ""}
                    local buffToCheckForObiForWeather = enspellWeatherMapping[world.weather_element] or {"", ""}
                    if buffactive[buffToCheckForObiForDay[1]] or buffactive[buffToCheckForObiForDay[2]] or buffactive[buffToCheckForObiForWeather[1]] or buffactive[buffToCheckForObiForWeather[2]] then
                        equip({waist = "Hachirin-no-Obi"})
                    end
                else
                    equip(sets.engaged.sw[accuracyMode])
                end
            end
        end
        
   else
        local idleMode = IdleMode[IdleModeIndex]
        equip(sets.idle[idleMode])
   end

   if Kiting then
    equip(sets.kite)
   end

   local weaponSet = Weapon_Sets[WeaponSetsIndex]
   
   enable('main', 'sub')
   equip(sets.weapons[weaponSet])
   if weaponSet ~= "Empty" then
       disable('main', 'sub')
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

function IsDualWield()
    local equipment = windower.ffxi.get_items('equipment')
    local sub = windower.ffxi.get_items(equipment.sub_bag, equipment.sub)
    local item = res.items[sub.id]
    return item.category == "Weapon"
end

function self_command(command)  
    if command == "TankMode" then
        EngagedModeIndex = 1
        add_to_chat(122,  "Tank Mode: On")
        SetGearToState(player.status)
    elseif command == "OffensiveMode" then
        EngagedModeIndex = 2
        add_to_chat(122,  "Offensive Mode: On")
        SetGearToState(player.status)
    elseif command == "Cycle IdleMode" then
        IdleModeIndex = IdleModeIndex % #IdleMode + 1
        add_to_chat(122,  "Idle Mode: " .. IdleMode[IdleModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle PhysicalAccuracyMode" then
        PhysicalAccuracyModeIndex = PhysicalAccuracyModeIndex % #PhysicalAccuracyMode + 1
        add_to_chat(122,  "Physical Accuracy Mode: " .. PhysicalAccuracyMode[PhysicalAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Toggle EnspellMode" then
        EnspellActive = not EnspellActive
        add_to_chat(122,  "Enspell Mode: " .. (EnspellActive and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle MagicMode" then
        MagicAccuracyModeIndex = MagicAccuracyModeIndex % #MagicAccuracyMode + 1
        add_to_chat(122,  "Magic Accuracy Mode: " .. MagicAccuracyMode[MagicAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle EnhancingMode" then
        EnhancingMagicModeIndex = EnhancingMagicModeIndex % #EnhancingMagicMode + 1
        add_to_chat(122,  "Enhancing Magic Mode: " .. EnhancingMagicMode[EnhancingMagicModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle NukeSet" then
        NukeSetIndex = NukeSetIndex % #NukeSet + 1
        add_to_chat(122,  "Nuke Mode: " .. NukeSet[NukeSetIndex])
        SetGearToState(player.status)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeSetIndex]
        local idle_set = IdleMode[IdleModeIndex]

        SetGearToState(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' Idle Set: ' .. idle_set)
    elseif command == "Toggle Kiting" then
        Kiting = not Kiting
        add_to_chat(122,  "Kiting Mode: " .. (Kiting and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle WeaponSet" then
        WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
        add_to_chat(122,  "Weapon Set: " .. Weapon_Sets[WeaponSetsIndex])
        SetGearToState(player.status)
    end
    
end