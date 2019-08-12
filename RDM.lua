res = require('resources')

Weapon_Sets = {"Empty", "Sword Physical Weapon Skill", "Sword Magical Weapon Skill", "Dagger Physical Weapon Skill", "Dagger Magical Weapon Skill"}
WeaponSetsIndex = 1

NukeSet = {"Low-acc", "High-acc"}
NukeSetIndex = 1

EngagedMode = {"Tank", "Offense"}
EngagedModeIndex = 1

PhysicalAccuracyMode = {"High-acc", "Low-acc"}
PhysicalAccuracyModeIndex = 1

IdleMode = {"Refresh", "Damage Taken"}
IdleModeIndex = 2

EnhancingMagicMode = {"Duration", "Potency"}
EnhancingMagicModeIndex = 1

MagicAccuracyMode = {"High-acc", "Low-acc"}
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

IntEnfeebles = S{"Blind", "Blind II", "Bind"}

MagicAccEnfeebles = S{"Gravity", "Gravity II", "Break", "Inundation", "Sleep", "Sleep II", "Dispel", "Dia", "Dia II", "Dia III"}


send_command("bind f9 gs c TankMode")
send_command("bind ^f9 gs Cycle IdleMode")
send_command("bind f10 gs c OffensiveMode")
send_command("bind ^f10 gs Cycle PhysicalAccuracyMode")
send_command("bind @f10 gs Toggle EnspellMode")
send_command("bind ^f11 gs Cycle MagicMode")
send_command("bind !f11 gs Cycle EnhancingMode")
send_command("bind f12 gs RefreshSet")
send_command('bind ^k gs c toggle Kiting')

function file_unload()
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind @f10')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind ^k')
end

function get_sets()

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
	sets.weapons["Sword Physical Weapon Skill"] = {main = "Crocea Mors", sub = "Vitiation Sword"}
	sets.weapons["Sword Magical Weapon Skill"] = {main = "Crocea Mors", sub = "Emissary"}
	sets.weapons["Dagger Physical Weapon Skill"] = {main = "Eletta Knife", sub = "Demers. Degen +1"}
	sets.weapons["Dagger Magical Weapon Skill"] = {main = "Eletta Knife", sub = "Emissary"}
    	
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

	sets.engaged["Low-acc"] = set_combine( sets.engaged, {

	})

	sets.engaged["High-acc"] = set_combine( sets.engaged["Low-acc"], {
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
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+9','Enh. Mag. eff. dur. +20'}},
	}

	sets.engaged.dw = {}
	sets.engaged.dw["Low-acc"] = sets.engaged["Low-acc"]
	sets.engaged.dw["High-acc"] = set_combine(sets.engaged["High-acc"], {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}}
	})

	sets.engaged.dw["Low-acc"].enspell = set_combine(sets.engaged.dw["Low-acc"], sets.engaged.enspell)
	sets.engaged.dw["High-acc"].enspell = set_combine(sets.engaged.dw["High-acc"], sets.engaged.enspell)
	
	sets.engaged.sw = {}
	sets.engaged.sw["Low-acc"] = sets.engaged["Low-acc"]
	sets.engaged.sw["High-acc"] = sets.engaged["High-acc"]

	sets.engaged.sw["Low-acc"].enspell = set_combine(sets.engaged.sw["Low-acc"], sets.engaged.enspell)
	sets.engaged.sw["High-acc"].enspell = set_combine(sets.engaged.sw["High-acc"], sets.engaged.enspell)

	sets.engaged.sw["Damage Taken"] = {
		ammo="Ginsen",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Ayanmo Ring",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
	}

    sets.fc = {   
		head="Merlinic hood",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
    	ear2="Loquacious earring",
		body="Shango robe",
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
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3",
		legs="Atrophy Tights +2",
		feet="Leth. Houseaux +1",
		neck="Duelist's Torque",
		waist="Sailfi Belt +1",
		ear1="Mendi. Earring",
		ear2="Calamitous Earring",
		ring1="Stikini ring",
		ring2="Stikini ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+9','Enh. Mag. eff. dur. +20'}}
	}
	
	sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing, {
		head="Leth. Chappel +1",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
	})

	sets.midcast.enhancing["Duration"].Self = set_combine(sets.midcast.enhancing["Duration"], {
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine gloves",
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}},
		legs="Telchine Braconi",
		feet="Telchine pigaches"
	})

	sets.midcast.enhancing["Potency"] = sets.midcast.enhancing

	sets.midcast.enhancing.refresh = set_combine(sets.midcast.enhancing["Duration"], {
		body="Atrophy Tabard +3"
	})

	sets.midcast.enhancing.refresh.self = set_combine(sets.midcast.enhancing["Duration"], {
		head="Telchine Cap",
		left_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
	})

	sets.midcast.enhancing.regen = set_combine(sets.midcast.enhancing["Duration"], {
		body="Telchine Chas.",
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
	})

	sets.midcast.enhancing.regen.self = set_combine(sets.midcast.enhancing["Duration"], {
		head="Telchine Cap",
		body="Telchine Chas.",
		legs="Telchine Braconi",
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
	})

    sets.midcast.enfeebling = {
		main="Crocea Mors",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Viti. Chapeau +3",
		neck="Duelist's Torque",
		ear1="Digni. Earring",
		ear2="Gwati Earring",
		hands={ name="Kaykaus Cuffs +", augments={'MP+80','MND+12','Mag. Acc.+20'}},
		ring1="Stikini ring",
		ring2="Stikini ring",
		waist="Luminary Sash",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Fast Cast"+4','Mag. Acc.+15'}},
		feet="Vitiation Boots +3"
	}

    sets.midcast.enfeebling.mnd = set_combine(sets.enfeebling, {
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','"Regen"+5'}}
	})

	sets.midcast.enfeebling.mnd["High-acc"] = set_combine(sets.midcast.enfeebling.mnd, {
		body="Atrophy Tabard +3",
		right_ring="Sangoma Ring",
	})
    		
	sets.midcast.enfeebling.mnd["Low-acc"] = set_combine(sets.midcast.enfeebling.mnd, {
		right_ring="Kishar Ring"
	})

	sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling, {
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10'}}
	})
		
	sets.midcast.enfeebling.int["High-acc"] = {
		body="Atrophy Tabard +3",
		right_ring="Sangoma Ring"
	}
    		
	sets.midcast.enfeebling.int["Low-acc"]= {
		body="Lethargy Sayon +1",
		right_ring="Kishar Ring"
	}

	sets.midcast.elemental = {}
	sets.midcast.elemental["Low-acc"] = {}
	sets.midcast.elemental["High-acc"] = {}

	sets.midcast.cure = {}

	sets.ws = {}
	
	sets.ws.magic = {
		ammo="Pemphredo Tathlum",
		head="Viti. Chapeau +3",
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
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%',}}
	}

	sets.ws.physical = {
		ammo="Amar Cluster",
		head="Viti. Chapeau +3",
		body="Jhakri Robe +2",
		hands="Atrophy Gloves +3",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Caro Necklace",
		waist="Sulla Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Jhakri Ring",
		right_ring="Apate Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}}
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
		back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
	})

	sets.ws["Death Blossom"] = sets.ws["Savage Blade"]

	sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
		head="Pixie Hairpin +1",
		waist="Luminary Sash",
		right_ring="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%'}}
	})

	sets.ws["Chant du Cygne"] = set_combine(sets.ws.physical, {
		ammo="Ginsen",
		body="Ayanmo Corazza +2",
		legs="Viti. Tights +3",
		feet="Aya. Gambieras +2",
		left_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
	})

	sets.ws["Requiescat"] = set_combine(sets.ws.physical, {
		ammo="Regal Gem",
		body="Viti. Tabard +3",
		hands="Atrophy Gloves +3",
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

	if player.status == "Engaged" then
		disable( 'main', 'sub')
	end

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
					equip(sets.midcast.enhancing.regen.self)
				else
					equip(sets.midcast.enhancing.regen)
				end
				
			elseif string.find(spell.english, "Refresh") then
				if(spell.target.name == player.name) then
					equip(sets.midcast.enhancing.refresh.self)
				else
					equip(sets.midcast.enhancing.refresh)
				end
			else
				local enhancingMode = EnhancingMagicMode[EnhancingMagicModeIndex]
				equip(sets.midcast.enhancing[enhancingMode])
			end
		-- Enfeebling Magic --         
		elseif spell.skill == 'Enfeebling Magic' then
			local magicAccuracyMode = MagicAccuracyMode[MagicAccuracyModeIndex]
			if MndEnfeebles[spell.name] then
				equip(sets.midcast.enfeebling.mnd[magicAccuracyMode])
			elseif IntEnfeebles[spell.name] then
				equip(sets.midcast.enfeebling.int[magicAccuracyMode])
			elseif MagicAccEnfeebles[spell.name] then
				equip(sets.midcast.enfeebling.int["High-acc"])
			else
				equip(sets.midcast.enfeebling)
			end
			
		-- Elemental Magic --      
		elseif spell.skill == 'Elemental Magic' then
			local nuke_set = NukeSet[NukeTypeIndex]
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
	enable('main', 'sub')
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
   equip(sets.weapons[weaponSet])

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
        add_to_chat(122,  "Tank Mode On")
        SetGearToState(player.status)
    elseif command == "OffensiveMode" then
        EngagedModeIndex = 2
        add_to_chat(122,  "Offensive Mode On")
        SetGearToState(player.status)
    elseif command == "Cycle IdleMode" then
        IdleModeIndex = IdleModeIndex % #IdleMode + 1
        add_to_chat(122,  "Idle Mode" .. IdleMode[IdleModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle PhysicalAccuracyMode" then
        PhysicalAccuracyModeIndex = PhysicalAccuracyModeIndex % #PhysicalAccuracyMode + 1
        add_to_chat(122,  "Physical Accuracy Mode" .. PhysicalAccuracyMode[PhysicalAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Toggle EnspellMode" then
        EnspellActive = not EnspellActive
        add_to_chat(122,  "Enspell Mode" .. (EnspellActive and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle MagicMode" then
        MagicAccuracyModeIndex = MagicAccuracyModeIndex % #MagicAccuracyMode + 1
        add_to_chat(122,  "Magic Accuracy Mode" .. MagicAccuracyMode[MagicAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle EnhancingMode" then
        EnhancingMagicMode = EnhancingMagicModeIndex % #EnhancingMagicMode + 1
        add_to_chat(122,  "Enhancing Magic Mode" .. EnhancingMagicMode[EnhancingMagicModeIndex])
		SetGearToState(player.status)
	elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeTypeIndex]
        local idle_set = IdleSet[IdleSetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' Idle Set: ' .. idle_set)
    elseif command == "Toggle Kiting" then
        Kiting = not Kiting
        add_to_chat(122,  "Kiting Mode" .. (Kiting and "On" or "Off"))
        SetGearToState(player.status)
    end
    
end