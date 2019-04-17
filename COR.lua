-- Idle Mode: Pdt, Mdt, Regen
-- Offensive Mode: Shield (Ranged?), Dual Wield
-- Offensive Spec: Hybrid, Tp, Acc 

IdleModes = { "pdt", "mdt", "regen"}
IdleModeIndex = 1

OffensiveModes = {"melee", "ranged"}
OffensiveModeIndex = 1

OffensiveSpecModes = {"acc", "tp", "hybrid"}
OffensiveSpecModeIndex = 1

Kiting = false

function help()
    add_to_chat(122, 'gs available commands:')
    add_to_chat(122, '//gs c Cycle IdleMode: pdt, mdt, regen')
    add_to_chat(122, '//gs c Cycle OffensiveMode: ranged, melee')
    add_to_chat(122, '//gs c Cycle OffensiveSpecMode: Acc, tp, hybrid')
    add_to_chat(122, '//gs c Toggle Kiting')
    add_to_chat(122, '//gs c Refresh: Refresh gear set to current state')
    add_to_chat(122, '//gs c Help: To see this information again')
end

help()

function get_sets()

    sets.idle = {}--No gear should be defined here
    sets.idle['pdt'] = {}
    sets.idle['mdt'] = {}
    sets.idle['regen'] = {}

    sets.ws = {} --Only used if weaponskill is not defined in the following ws set
    sets.ws['Last Stand'] = {}
    sets.ws['Leaden Salute'] = {}
    sets.ws['Wildfire'] = {}

    
    sets.offensive = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    -- These two sets should only list your main and/or sub
    sets.offensive['melee'] = {} 
    sets.offensive['ranged'] = {}
    --

    sets.ranged = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    sets.ranged['acc'] = {}
    sets.ranged['tp'] = {}
    sets.ranged['hybrid'] = {}
    
    sets.melee = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    sets.melee['acc'] = {}
    sets.melee['tp'] = {}
    sets.melee['hybrid'] = {}

    sets.rolls = {}
    sets.rolls['Chaos Roll'] = set_combine(sets.rolls, --Define gear for specific rolls if you have gear to enhance those rolls
        {}
    ) 
    
    sets.quick_draw = {}
    
    sets.ja = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    
    --Follow this pattern to define all job abilities you have gear for
    sets.ja['Fold'] = { }
    sets.ja['Wild Card'] = { }
    sets.ja['Random Deal'] = { }
    sets.ja['Triple Shot'] = { }
    sets.ja['Snake Eye'] = {}
    sets.ja['Double-Up'] = {}

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
    
    local offensiveMode = OffensiveModes[OffensiveModeIndex]
    local result = sets.offensive[offensiveMode]

    if player.in_combat then
        local offensiveSpecMode = OffensiveSpecModes[OffensiveSpecModeIndex]
        result = set_combine(result, sets.melee[offensiveSpecMode])
    else
        local idleMode = IdleModes[IdleModeIndex]
        result = set_combine(result, sets.idle[idleMode])
    end
    
    if Kiting then
        result = set_combine(result, sets.kiting)
    end

    equip(result)

end

-----------------------------------------------------------------------------------

function precast(spell)
    -- print_set(spell) --Uncomment for debugging
    if spell.type == 'WeaponSkill' then
        if(sets.ws[spell.name]) then
            equip(sets.ws[spell.name])
        end
    elseif spell.type == 'CorsairRoll' then
        if sets.rolls[spell.name] then
            equip(sets.rolls[spell.name])
        else
            equip(sets.rolls)
        end
    elseif spell.action_type == 'Ranged Attack' then
        local rangedAttackSpec = OffensiveSpecModes[OffensiveSpecModeIndex]
        equip(sets.ranged[rangedAttackSpec])
    elseif spell.type == 'CorsairShot' then
        equip(sets.quick_draw)
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
    equip(sets.midcast.fastcast)
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
    local idleMode = IdleModes[IdleModeIndex]
    local offensiveMode = OffensiveModes[OffensiveModeIndex]
    local offensiveSpecMode = OffensiveSpecModes[OffensiveSpecModeIndex]

    add_to_chat(122, ' ')
    add_to_chat(122, '--- Current Mode Status ---')
    add_to_chat(122, 'Idle: ' .. idleMode)
    add_to_chat(122, 'Offensive: ' .. offensiveMode)
    add_to_chat(122, 'Offensive Type: ' .. offensiveSpecMode)
    if Kiting then
        add_to_chat(122, 'Kiting: On')
    else
        add_to_chat(122, 'Kiting: Off')
    end
    add_to_chat(122, '--- End ---')
end

function self_command(command)
    if command == 'Cycle IdleMode' then
        IdleModeIndex = IdleModeIndex % #IdleModes + 1
        SetGearToState(player.status)

        print_player_status()

    elseif command == 'Cycle OffensiveMode' then
        OffensiveModeIndex = OffensiveModeIndex % #OffensiveModes + 1
        SetGearToState(player.status)

        print_player_status()
    elseif command == 'Cycle OffensiveSpecMode' then
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