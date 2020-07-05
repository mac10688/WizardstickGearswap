WeaponSets = {"Melee", "Nuke"}
WeaponSetIndex = 1

StandardSets = {"Attack", "FullDT"}
StandardSetIndex = 1


send_command('bind f10 gs c CycleOffensiveMode')
send_command('bind f11 gs c CycleStandardSet')
send_command('bind f12 gs c Refresh')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function get_sets()
--This function prepares your equipment sets.

    sets.engaged = {}
    sets.weaponset = {}
    sets.weaponset['Melee'] = {
        main={ name="Colada", augments={'Sklchn.dmg.+2%','Accuracy+22 Attack+22','DMG:+3'}},
        sub={ name="Colada", augments={'"Dbl.Atk."+1','DEX+6','Accuracy+8','Attack+12','DMG:+18'}}
    }

    sets.weaponset['Nuke'] = {
        main='Nibiru cudgel', 
        sub='Nibiru cudgel'
    }

    sets.standardSet = {}
    sets.standardSet['Attack'] = {
        ammo="Ginsen",
        head="Dampening tam",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1",
        legs="Samnuha tights",
        feet="Carmine greaves +1",
        neck="Sanctity necklace",
        waist="Grunfeld rope",
        left_ear="Dignitary's earring",
        right_ear="Telos earring",
        left_ring="Epona's Ring",
        right_ring="Petrov ring",
        back="Rosmerta's cape",
    }

    sets.standardSet['FullDT'] = {
        ammo="Staunch Tathlum +1",
        head="Ayanmo zucchetto +2",
        body="Shamash robe",
        hands="Ayanmo manopolas +2",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2" ,
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Genmei earring",
        right_ear="Etiolation earring",
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back="Moonbeam Cape",
    }
	
    sets.precast = {}
    
    sets.ws = {}
    sets.ws["Chant du Cygne"] = {
        ammo="Falcon eye",
        head="Ayanmo zuchetto +2",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1",
        legs="Samnuha tights",
        feet="Ayanmo gambieras +2",
        neck="Sanctity necklace",
        waist="Zoran's belt",
        left_ear="Moonshade earring",
        right_ear="Ishvara earring",
        left_ring="Rajas ring",
        right_ring="Petrov ring",
        back="Rosmerta's cape"
    }

    sets.ws["Requiescat"] = sets.ws["Chant du Cygne"]
    sets.ws["True Strike"] = sets.ws["Chant du Cygne"]

    sets.ws["Sanguine"] = {
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

	sets.fc = {
        head="Herculean Helm",
        body="Vrikodara jupon",
        hands="Leyline Gloves",
        legs="Lengo pants",
        feet="Chelona Boots",
        neck="Voltsurge Torque",
        left_ear="Loquac. Earring",
        right_ear="Etiolation earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back="Swith Cape",
    }
	

	sets.precast.Diffusion = { feet="Luhlaza Charuqs" }
	
	sets.midcast = {}
		
	sets.midcast.nuke = {
        ammo="Hydrocera",
        head="Jhakri coronal +2",
        body="Shamash robe",
        hands="Amalric gages +1",
        legs="Jhakri slops +2",
        feet="Jhakri pigaches +2",
        neck="Sanctity Necklace",
        waist="Sacro cord",
        left_ear="Friomisi earring",
        right_ear="Regal earring",
        left_ring="Stikini ring",
        right_ring="Shiva Ring +1",
        back="Cornflower Cape",
    }
	sets.midcast["Mighty Guard"] = {
        feet="Luhlaza Charuqs"
    }

    --spell.english == 'Spectral Floe' or spell.english == 'Tenebral Crush' or spell.english == 'Anvil Lightning' or spell.english == 'Searing Tempest' or spell.english == 'Entomb' or spell.english == 'Magic Hammer' or spell.english == 'Subduction' or spell.english == 'Charged Whisker'
    sets.midcast["Spectral Floe's"] = sets.midcast.nuke
    sets.midcast["Tenebral Crush"] = sets.midcast.nuke
    sets.midcast["Anvil Lightning"] = sets.midcast.nuke
    sets.midcast["Searing Tempest"] = sets.midcast.nuke
    sets.midcast["Entomb"] = sets.midcast.nuke
    sets.midcast["Magic Hammer"] = sets.midcast.nuke
    sets.midcast["Subduction"] = sets.midcast.nuke
    sets.midcast["Charged Whisker"] = sets.midcast.nuke


    sets.midcast["Carcharian Verve"] = sets.midcast["Mighty Guard"]
	
	sets.midcast["Sudden Lunge"] = {
        ammo="Honed Tathlum",
        head="Ayanmo zucchetto +2",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +1",
        neck="Sanctity Necklace",
        waist="Grunfeld rope",
        left_ear="Hermetic earring",
        right_ear="Heartseeker Earring",
        left_ring="Ramuh Ring",
        right_ring="Ayanmo ring",
        back="Cornflower Cape",
    }

    sets.midcast["Sweeping Gouge"] = sets.midcast["Sudden Lunge"]
	
	sets.midcast.MagAcc = {
        ammo="Ghastly Tathlum",
        body="Shamash robe",
        hands="Jhakri cuffs +2",
        legs="Ayanmo cosciales +2",
        feet="Jhakri pigaches +2",
        neck="Sanctity Necklace",
        waist="Sacro cord",
        left_ear="Hermetic earring",
        right_ear="Brutal Earring",
        left_ring="Ayanmo ring",
        right_ring="Paguroidea Ring",
        back="Cornflower Cape",
    }

    sets.midcast["Dream Flower"] = sets.midcast.MagAcc

    sets.kiting = {
        legs="Carmine cuisses +1"
    }

    sets.ja = {}
    lockstyle()

end

-----------------------------------------------------------------------------------

function self_command(command)
    if command == 'CycleOffensiveMode' then
        WeaponSetIndex = WeaponSetIndex % #WeaponSets + 1
        equip_set(player.status)

        local mode = WeaponSets[WeaponSetIndex]
        add_to_chat(122, 'Weapon Set: ' .. mode)

    elseif command == 'CycleStandardSet' then
        StandardSetIndex = StandardSetIndex % #StandardSets + 1
        equip_set(player.status)

        local mode = StandardSets[StandardSetIndex]
        add_to_chat(122, 'Standard Set Mode: ' .. mode)
    elseif command == 'Refresh' then
        equip_set(player.status)

        offensiveMode = WeaponSets[WeaponSetIndex]
        standardSetMode = StandardSets[StandardSetIndex]

        add_to_chat(122, 'Offensive Mode: ' .. offensiveMode .. ' || Standard Set Mode: ' .. standardSetMode)
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

-----------------------------------------------------------------------------------

function precast(spell)
    if spell.type == "WeaponSkill" then
        if sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        end
    elseif spell.type == "JobAbility" then
        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])
        end
    elseif spell.type == "Magic" then
        if sets.precast[spell.english] then
            equip(sets.precast[spell.english])
        else
            equip(sets.fc)
        end
    end
end

-----------------------------------------------------------------------------------

function midcast(spell)
    if spell.action_type == 'Magic' then
        if sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        else
            equip(sets.midcast.nuke)
        end
    end

end

function equip_set(status)

    local weaponset = WeaponSets[WeaponSetIndex]
    -- print(weapon_set)
    equip(sets.weaponset[weaponset])

    local mode = StandardSets[StandardSetIndex]
    equip(sets.standardSet[mode])

    if Kiting then
        equip(sets.kiting)
    end
end

-----------------------------------------------------------------------------------

function aftercast(spell)
    --This function performs after the action has taken place
	equip_set(player.status)
end

-----------------------------------------------------------------------------------

function status_change(new,old)
    equip_set(new)
end

-----------------------------------------------------------------------------------

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

-----------------------------------------------------------------------------------

function lockstyle()
    if player.main_job == 'RUN' then send_command('@input /lockstyleset 16') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end
