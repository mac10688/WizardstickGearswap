function user_state_change(descrip, newVal, oldVal)
    if descrip == 'Combat Weapon' then
        if newVal == oldVal then
            if state[newVal] then
                local currentWeaponState = state[newVal]
                if state.CombatMode.value and currentWeaponState[state.CombatMode.value] then
                    currentWeaponState = currentWeaponState[state.CombatMode.value]
                end
                currentWeaponState:cycle()
            end
        end
        equipWeaponSet()
    elseif descrip == 'Combat Mode' then
        equipWeaponSet()
    end
end

function equipWeaponSet()
    if state.CombatWeapon and sets[state.CombatWeapon.value] then
        local weaponSet = sets[state.CombatWeapon.value]
        local currentWeaponState = state[state.CombatWeapon.value]

        if state.CombatMode and weaponSet[state.CombatMode.value] and currentWeaponState[state.CombatMode.value] then
            weaponSet = weaponSet[state.CombatMode.value]
            currentWeaponState = currentWeaponState[state.CombatMode.value]
        end

        if currentWeaponState and weaponSet[currentWeaponState.value] then
            weaponSet = weaponSet[currentWeaponState.value]
        end
        -- print_set(weaponSet)
        enable('main', 'sub', 'ranged')
        equip(weaponSet)

        if state.WeaponLock.value then
            disable('main', 'sub', 'ranged')
        end        
    end
end

function user_handle_equipping_gear(status, eventArgs)
    equipWeaponSet()
end

-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
end

-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
end

-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)

end

function user_update(cmdParams, eventArgs)
    if lockstyle then
        lockstyle()
    end
end