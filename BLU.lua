offensiveModes = {"Melee", "Nuke"}
offensiveModeIndex = 1
standardSets = {"Attack", "FullDT"}
standardSetIndex = 1

function user_setup()
    send_command('bind f10 gs c CycleOffensiveMode')
    send_command('bind f11 gs c CycleStandardSet')
    send_command('bind f12 gs c Refresh')
end

function file_unload()
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
end

user_setup()

function get_sets()
--This function prepares your equipment sets.

    sets.engaged = {}
    sets.offensiveMode = {}
    sets.offensiveMode['Melee'] = {
        main={ name="Colada", augments={'Sklchn.dmg.+2%','Accuracy+22 Attack+22','DMG:+3',}},
        sub={ name="Colada", augments={'"Dbl.Atk."+1','DEX+6','Accuracy+8','Attack+12','DMG:+18',}}
    }

    sets.offensiveMode['Nuke'] = {
        main='Nibiru cudgel', 
        sub='Nibiru cudgel'
    }

    sets.standardSet = {}
    sets.standardSet['Attack'] = {
        ammo="Falcon eye",
        head="Ayanmo zucchetto +2",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1",
        legs="Jhakri slops +2",
        feet="Battlecast gaiters",
        neck="Sanctity necklace",
        waist="Zoran's belt",
        left_ear="Steelflash earring",
        right_ear="Bladeborn earring",
        left_ring="Epona's Ring",
        right_ring="Petrov ring",
        back="Rosmerta's cape",
    }

    sets.standardSet['FullDT'] = {
        ammo="Staunch Tathlum +1",
        head="Ayanmo zucchetto +2",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2" ,
        neck="Loricate Torque +1",
        waist="Flume Belt",
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back="Moonbeam Cape",
    }
	
	sets.precast = {}	
	sets.precast.CDC = {
        ammo="Falcon eye",
        head="Ayanmo zuchetto +2",
        body="Adhemar Jacket +1",
        hands="Jhakri cuffs +2",
        legs="Jhakri slops +2",
        feet="Ayanmo gambieras +1",
        neck="Sanctity necklace",
        waist="Zoran's belt",
        left_ear="Moonshade earring",
        right_ear="Ishvara earring",
        left_ring="Rajas ring",
        right_ring="Petrov ring",
        back="Rosmerta's cape",
    }
	sets.precast.FastCast = {
        head="Herculean Helm",
        body="Vrikodara jupon",
        -- hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
        legs="Lengo pants",
        feet="Chelona Boots",
        neck="Voltsurge Torque",
        left_ear="Loquac. Earring",
        right_ear="Etiolation earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back="Swith Cape",
    }
	sets.precast.Sanguine = {
        ammo="Ghastly Tathlum",
        head="Herculean Helm",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        legs="Jhakri slops +2",
        feet="Jhakri pigaches +2",
        neck="Sanctity Necklace",
        waist="Latria sash",
        left_ear="Hermetic earring",
        right_ear="Hecate's Earring",
        left_ring="Acumen Ring",
        right_ring="Shiva Ring",
        back="Cornflower Cape",
    }

	sets.precast.Diffusion = { feet="Luhlaza Charuqs" }
	
	sets.midcast = {}
		
	sets.midcast.nuke = {
        ammo="Hydrocera",
        head="Jhakri coronal +2",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        legs="Jhakri slops +2",
        feet="Jhakri pigaches +2",
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Friomisi earring",
        right_ear="Hecate's Earring",
        left_ring="Arvina ringlet +1",
        right_ring="Shiva Ring",
        back="Cornflower Cape",
    }
	sets.midcast.MG = {
        feet="Luhlaza Charuqs"
    }
	
	sets.midcast.SL = {
        ammo="Honed Tathlum",
        head="Ayanmo zucchetto +2",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +1",
        neck="Sanctity Necklace",
        waist="Eschan stone",
        left_ear="Hermetic earring",
        right_ear="Heartseeker Earring",
        left_ring="Ramuh Ring",
        right_ring="Ayanmo ring",
        back="Cornflower Cape",
    }
	
	sets.midcast.MagAcc = {
        ammo="Ghastly Tathlum",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        legs="Ayanmo cosciales +2",
        feet="Jhakri pigaches +2",
        neck="Sanctity Necklace",
        waist="Eschan stone",
        left_ear="Hermetic earring",
        right_ear="Brutal Earring",
        left_ring="Ayanmo ring",
        right_ring="Paguroidea Ring",
        back="Cornflower Cape",
    }

end

function SetOffensiveMode()
    local mode = offensiveModes[offensiveModeIndex]
    equip(sets.offensiveMode[mode])

end

function SetStandardSetMode()
    local mode = standardSets[standardSetIndex]
    equip(sets.standardSet[mode])
end

-----------------------------------------------------------------------------------

function self_command(command)
    if command == 'CycleOffensiveMode' then
        offensiveModeIndex = offensiveModeIndex % #offensiveModes + 1
        SetOffensiveMode()

        local mode = offensiveModes[offensiveModeIndex]
        add_to_chat(122, 'Offensive Mode: ' .. mode)

    elseif command == 'CycleStandardSet' then
        standardSetIndex = standardSetIndex % #standardSets + 1
        SetStandardSetMode()

        local mode = standardSets[standardSetIndex]
        add_to_chat(122, 'Standard Set Mode: ' .. mode)
    elseif command == 'Refresh' then
        SetOffensiveMode()
        SetStandardSetMode()

        offensiveMode = offensiveModes[offensiveModeIndex]
        standardSetMode = standardSets[standardSetIndex]

        add_to_chat(122, 'Offensive Mode: ' .. offensiveMode .. ' || Standard Set Mode: ' .. standardSetMode)
    end
end

-----------------------------------------------------------------------------------

function precast(spell)
--This function performs right before the action is sent to the server.
	if spell.english == 'Chant du Cygne' or spell.english == 'Requiescat' or spell.english == 'True Strike' then
        equip(sets.precast.CDC)
    elseif spell.english == 'Sanguine Blade' then
        equip(sets.midcast.Sanguine)
    elseif spell.english == 'Diffusion' or spell.english == 'Mighty Guard' or spell.english == 'Carcharian Verve' then
        equip(sets.precast.Diffusion)
    elseif spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
        equip(sets.precast.FastCast)
    elseif spell.skill == 'Blue Magic' then 
        equip(sets.precast.FastCast)
    end

end

-----------------------------------------------------------------------------------

function midcast(spell)
--This function performs after precast but before the action is sent to the server.
	if spell.english == 'Spectral Floe' or spell.english == 'Tenebral Crush' or spell.english == 'Anvil Lightning' or spell.english == 'Searing Tempest' or spell.english == 'Entomb' or spell.english == 'Magic Hammer' or spell.english == 'Subduction' or spell.english == 'Charged Whisker' then 
		equip(sets.midcast.nuke)
    elseif spell.english == 'Sudden Lunge' or spell.english == 'Sweeping Gouge' then
		equip(sets.midcast.SL)
	elseif spell.english == 'Mighty Guard' or spell.english == 'Carcharian Verve' then
		equip(sets.midcast.MG)
    elseif spell.english == 'Dream Flower' then 
		equip(sets.midcast.MagAcc)
	end

end

-----------------------------------------------------------------------------------

function aftercast(spell)
    --This function performs after the action has taken place
	SetStandardSetMode()
end

-----------------------------------------------------------------------------------

function status_change(new,old)
    -- SetStandardSetMode()
end

-----------------------------------------------------------------------------------
