OffensiveSpecModes = {"acc", "tp", "hybrid"}
OffensiveSpecModeIndex = 1

Kiting = false

send_command('bind f9 gs c Cycle OffensiveSpecMode')
send_command('bind f12 gs c Refresh')
send_command('bind ^k gs c Toggle Kiting')

function help()
    add_to_chat(122, 'gs available commands:')
    add_to_chat(122, '//gs c Cycle OffensiveSpecMode: Acc, tp, hybrid')
    add_to_chat(122, '//gs c Toggle Kiting')
    add_to_chat(122, '//gs c Refresh: Refresh gear set to current state')
    add_to_chat(122, '//gs c Help: To see this information again')
end

function get_sets()

    sets.idle = {}--No gear should be defined here
    sets.idle['pdt'] = {}
    sets.idle['mdt'] = {}
    sets.idle['regen'] = {}

    sets.ws = {
        head={ name="Herculean Helm", augments={'DEX+1','CHR+3','Weapon skill damage +5%','Accuracy+17 Attack+17','Mag. Acc.+20 "Mag.Atk.Bns."+20'}},
        body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +4%','DEX+10','Attack+3'}},
        hands={ name="Herculean Gloves", augments={'AGI+1','STR+12','Weapon skill damage +8%','Accuracy+11 Attack+11'}},
        legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%'}},
        feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15'}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Petrov Ring",
    }
    sets.ws['Evisceration'] = sets.ws
    sets.ws['Shark Bite'] = sets.ws
    sets.ws['Dancing Edge'] = sets.ws
    
    sets.melee = {
        head="Dampening tam",
        neck="Anu torque",
        ear1="Sherida earring",
        ear2="Telos earring",
        body="Malignance tabard",
        hands="Malignance gloves",
        ring1="Moonbeam ring",
        ring2={name="Chirich ring +1", bag="wardrobe"},
        waist="Chaac belt",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Haste+10','Damage taken-5%'}},
        legs="Samnuha tights",
        feet="Meghanada jambeaux +2"
    }
    sets.melee['acc'] = sets.melee
    sets.melee['tp'] = sets.melee
    sets.melee['hybrid'] = sets.melee
    
    sets.ja = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    
    --Follow this pattern to define all job abilities you have gear for
    sets.ja['Fold'] = { }

    sets.kiting = {}

    sets.fc = {}
    sets.fc["Utsusemi: Ichi"] = set_combine(sets.fc, {})
    sets.fc["Utsusemi: Ni"] = sets.fc["Utsusemi: Ichi"]

    sets.midcast = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    sets.midcast.fastcast = { } --Fast cast gear can go here to reduce recast timers

end

-----------------------------------------------------------------------------------

--Read the current state of engaged mode, tank mode and kiting mode to determine the gear to put on
function SetGearToState(status)
    
    if status == "Engaged" then
        local offensiveSpecMode = OffensiveSpecModes[OffensiveSpecModeIndex]
        equip(sets.melee[offensiveSpecMode])
    else
        equip(sets.idle)
    end
    
    if Kiting then
        result = set_combine(result, sets.kiting)
    end
end

-----------------------------------------------------------------------------------

function precast(spell)
    -- print_set(spell) --Uncomment for debugging
    if spell.type == 'WeaponSkill' then
        if(sets.ws[spell.name]) then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    elseif spell.type == 'JobAbility' and sets.ja[spell.name] then
        equip(sets.ja[spell.name])
    elseif spell.action_type == 'Magic' then
        if sets.fc[spell.name] then
            equip(sets.fc[spell.name])
        else
            equip(sets.fc)
        end
    end
end

function midcast(spell)
    if spell.action_type == 'Magic' then
        equip(sets.midcast.fastcast)
    end
end

function aftercast(spell)
    -- print(player.status)
    SetGearToState(player.status)
end

function status_change(new,old)
    --print(new)
    SetGearToState(new)
end

-----------------------------------------------------------------------------------

--This function is used to read commands sent to gearswap from the ffix chat window
--i.e. //gs c 

function print_player_status()
    local offensiveSpecMode = OffensiveSpecModes[OffensiveSpecModeIndex]

    add_to_chat(122, ' ')
    add_to_chat(122, '--- Current Mode Status ---')
    add_to_chat(122, 'Offensive Type: ' .. offensiveSpecMode)
    if Kiting then
        add_to_chat(122, 'Kiting: On')
    else
        add_to_chat(122, 'Kiting: Off')
    end
    add_to_chat(122, '--- End ---')
end

function self_command(command)
    if command == 'Cycle OffensiveSpecMode' then
        OffensiveSpecModeIndex = OffensiveSpecModeIndex % #OffensiveSpecModes + 1
        SetGearToState(player.status)

        print_player_status()
    elseif command == 'Toggle Kiting' then
        Kiting = not Kiting

        SetGearToState(player.status)

    elseif command == 'Refresh' then
        SetGearToState(player.status)

        print_player_status()
    elseif command == 'Help' then
        help()
    end
end

print_player_status()


-----------------------------------------------------------------------------------