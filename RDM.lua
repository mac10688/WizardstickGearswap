res = require('resources')

Weapon_Sets = {"Empty", "Sword", "Dagger", "Staff"}
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
end

function get_sets()

    Cape = {}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}


    sets.idle = {}

    sets.idle["Damage Taken"] = {
        main="Mafic cudgel",
        sub="Genmei shield",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Ayanmo manopolas +2",
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back="",
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
    sets.weapons["Sword"] = {main = "Colada", sub="Genmei shield"}
    sets.weapons["Dagger"] = {main = "Malevolence", sub="Genmei shield"}
    sets.weapons["Staff"] = {main = "Grioavolr", sub="Enki strap"}
        
    sets.engaged = {
        ammo="Ginsen",
        head="Ayanmo zucchetto +2",
        neck="Anu Torque",
        ear1="Digni. Earring",
        ear2="Sherida Earring",
        ring2="Ilabrat Ring",
        body="Ayanmo Corazza +2",
        waist="Grunfeld rope"
    }

    sets.engaged["Low Acc"] = set_combine( sets.engaged, {

    })

    sets.engaged["High Acc"] = set_combine( sets.engaged["Low Acc"], {
        ammo="Amar Cluster",
        head="Aya. Zucchetto +2",
        neck="Sanctity Necklace",
        body="Ayanmo corazza +2",
        ear1="Dignitary's earring",
        ear2="Telos earring",
        body="Ayanmo corazza +2",
        ring1="Chirich ring +1",
        ring2="Chirich ring +1",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
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
        ammo="Ginsen",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Loricate Torque",
        left_ear="Genmei Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Ayanmo Ring",
        right_ring="Defending Ring",
        back=Cape.Int
    }

    sets.fc = {   
        head="Atrophy chapeau +1",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        body="Vitiation tabard +1",
        hands="Leyline gloves",
        waist="Sailfi Belt +1",
        ring1="Kishar Ring",
        ring2="Defending Ring",
        back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}},
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
        legs="Chironic hose",
        feet="Kaykaus boots"
    }

    sets.midcast.enhancing = {
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Befouled Crown",
        body="Viti. Tabard +1",
        hands="Vitiation gloves +1",
        legs="Atrophy Tights +1",
        feet="Leth. Houseaux +1",
        neck="Duelist's Torque +1",
        waist="Sailfi Belt +1",
        ear1="Mendi. Earring",
        ear2="Calamitous Earring",
        ring1="Stikini ring",
        ring2="Stikini ring",
        back=Cape.Int
        }
    
    sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing, {
        head="Leth. Chappel +1",
        hands="Atrophy Gloves +1",
        legs="Leth. Fuseau +1",
    })

    sets.midcast.enhancing["Duration"].Self = set_combine(sets.midcast.enhancing["Duration"], {
        head="Telchine Cap",
        body="Vitiation Tabard +2",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine pigaches"
    })

    sets.midcast.enhancing["Potency"] = sets.midcast.enhancing
    sets.midcast.enhancing["Potency"].Self = sets.midcast.enhancing

    sets.midcast.enhancing.refresh = set_combine(sets.midcast.enhancing["Duration"], {
        body="Atrophy Tabard +2",
        legs="Lethargy Fuseau +1"
    })

    sets.midcast.enhancing.refresh.Self = set_combine(sets.midcast.enhancing["Duration"], {
        head="Telchine Cap",
        body="Atrophy Tabard +2",
        legs="Lethargy Fuseau +1",
        left_ring="Defending Ring"
    })

    sets.midcast.enhancing.regen = set_combine(sets.midcast.enhancing["Duration"], {
        body="Telchine Chas.",
        back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    })

    sets.midcast.enhancing.regen.Self = set_combine(sets.midcast.enhancing["Duration"], {
        head="Telchine Cap",
        body="Telchine Chas.",
        legs="Telchine Braconi",
        back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    })

    sets.midcast.enfeebling = {
        main="Gada",
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head="Vitiation chapeau +1",
        neck="Duelist's Torque +1",
        ear1="Digni. Earring",
        ear2="Gwati Earring",
        body="Atrophy Tabard +1",
        hands="Vitiation gloves +1",
        ring1="Stikini ring",
        ring2="Stikini ring",
        waist="Luminary Sash",
        back=Cape.Int,
        legs="Chironic hose",
        feet="Vitiation Boots +1"
    }

    sets.midcast.enfeebling.mnd = set_combine(sets.midcast.enfeebling, {
    })

    sets.midcast.enfeebling.mnd["High Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
        body="Atrophy Tabard +3",
        right_ring="Sangoma Ring",
    })
            
    sets.midcast.enfeebling.mnd["Low Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
        right_ring="Kishar Ring"
    })

    sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling, {
        back=Cape.int
    })
        
    sets.midcast.enfeebling.int["High Acc"] = set_combine(sets.midcast.enfeebling.int, {
        body="Atrophy Tabard +2",
        right_ring="Sangoma Ring"
    })
            
    sets.midcast.enfeebling.int["Low Acc"]= set_combine(sets.midcast.enfeebling.int, {
        body="Lethargy Sayon +1",
        right_ring="Kishar Ring"
    })

    sets.midcast.elemental = {
        ammo="Pemphredo tathlum",
        head="Viti. Chapeau +1",
        neck="Sanctity Necklace",
        ear1="Barkarole earring",
        ear2="Friomisi earring",
        body="Jhakri robe +2",
        hands="Amalric gages +1",
        left_ring="Shiva Ring",
        right_ring="Shiva Ring +1",
        back=Cape.int,
        waist="Eschan stone",
        legs="Amalric Slops +1",
        feet="Jhakri Pigaches +2",}
    sets.midcast.elemental["Low Acc"] = set_combine(sets.midcast.elemental, {})
    sets.midcast.elemental["High Acc"] = set_combine(sets.midcast.elemental, {})
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental, {
        main="Grioavolr",
        sub="Enki strap",
        ammo="Pemphredo Tathlum",
        head="Ea hat",
        body="Ea houppelande",
        hands="Amalric gages +1",
        legs="Ea slops",
        feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5',}},
        neck="Mizu. Kubikazari",
        waist="Eschan Stone",
        ear1="Friomisi Earring",
        ear2="Static Earring",
        ring1="Locus Ring",
        ring2="Mujin Band"
    })

    sets.ws = {}
    
    sets.ws.magic = {
        ammo="Pemphredo Tathlum",
        head="Viti. Chapeau +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +2",
        feet="Vitiation Boots +3",
        neck="Sanctity Necklace",
        waist="Acuity Belt +1",
        left_ear="Ishvara Earring",
        right_ear="Friomisi Earring",
        left_ring="Jhakri Ring",
        right_ring="Apate Ring",
        back=Cape.Int,
        }

    sets.ws.physical = {
        ammo="Amar Cluster",
        head="Viti. Chapeau +1",
        body="Viti. Tabard +1",
        hands="Atrophy Gloves +2",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
        neck="Caro Necklace",
        waist="Sulla Belt",
        left_ear="Ishvara Earring",
        right_ear="Sherida Earring",
        left_ring="Jhakri Ring",
        right_ring="Apate Ring",
        back=Cape.Int
    }
        
    sets.ws["Red Lotus Blade"] = sets.ws.magic

    sets.ws["Seraph Blade"] = sets.ws.magic

    sets.ws["Circle Blade"] = sets.ws.physical

    sets.ws["Vorpal Blade"] = sets.ws.physical

    sets.ws["Savage Blade"] = set_combine( sets.ws.physical, {
        ammo="Regal Gem",
        feet="Vitiation Boots +3",
        waist="Luminary Sash",		
        right_ring="Rajas Ring",
        back=Cape.Int
    })

    sets.ws["Death Blossom"] = sets.ws["Savage Blade"]

    sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
        head="Pixie Hairpin +1",
        waist="Luminary Sash",
        right_ring="Stikini Ring",
        back=Cape.int
    })

    sets.ws["Chant du Cygne"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
        body="Ayanmo Corazza +2",
        legs="Viti. Tights +1",
        feet="Aya. Gambieras +2",
        left_ring="Ilabrat Ring",
        back=Cape.int
    })

    sets.ws["Requiescat"] = set_combine(sets.ws.physical, {
        ammo="Regal Gem",
        body="Viti. Tabard +3",
        hands="Atrophy Gloves +2",
        legs="Viti. Tights +3",
        feet="Vitiation Boots +3",
        waist="Luminary Sash",
        left_ring="Stikini Ring",
        right_ring="Ilabrat Ring",
    })
    
    sets.ws["Evisceration"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
        body="Ayanmo Corazza +2",
        legs="Viti. Tights +3",
        feet="Aya. Gambieras +2",
        left_ring="Apate Ring",
        right_ring="Ilabrat Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
    })

    sets.ws["Aeolian Edge"] = set_combine(sets.ws.magic, {
        head="Jhakri Coronal +2",
        feet="Vitiation Boots +3"
    })

    sets.ws["Exenterator"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
        body="Ayanmo Corazza +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Anu Torque",
        left_ring="Apate Ring",
        right_ring="Ilabrat Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
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

function SetGearToState(state)
    if state == "Engaged" then
        local engagedMode = EngagedMode[EngagedModeIndex]
        if engagedMode == "Tank" then
            equip(sets.engaged.sw["Damage Taken"])
        else
            local accuracyMode = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
            if IsDualWield() then
                if EnspellActive then
                    equip(sets.engaged.dw[accuracyMode].enspell)
                else
                    equip(sets.engaged.dw[accuracyMode])
                end
            else
                if EnspellActive then
                    equip(sets.engaged.sw[accuracyMode].enspell)
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