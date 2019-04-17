modes = {"player_melee", "hybrid_dd", "pet_dd", "pet_tank", "pet_nuke", "pet_heal"}
mode_index = 1

function user_setup()
    send_command('bind f11 gs c CycleMode')
end

user_setup()

function cycle_index(tbl, index)
    return 
end

function self_command(command)
    -- print(command)
    if command == 'CycleMode' then
        mode_index = mode_index % table.getn(modes) + 1
        SetModeGear()

        local mode = modes[mode_index]
        add_to_chat(122, 'Mode: ' .. mode)
    end
end

function get_sets()
    sets.mode = {}
    sets.mode["player_melee"] = {head="Rao kabuto", neck="Shulmanu collar", ear1="Mache earring", ear2="Mache earring",range="Animator P",
                                body="Tali'ah manteel +1", hands="Tali'ah gages +2", ring1="Petrov ring", ring2="Epona's ring",
                                back="Visucius's mantle", belt="Klouskap sash", legs="Tali'ah seraweels +2", feet="Tali'ah crackows +1"}

    sets.mode["hybrid_dd"] = {head="Tali'ah turban +2", neck="Shulmanu collar", ear1="Mache earring", ear2="Mache earring",range="Animator P",
                            body="Pitre tobe +1", hands="Tali'ah gages +2", ring1="Varar ring", ring2="Varar ring",
                            back="Visucius's mantle", belt="Klouskap sash", legs="Karagoz pantaloni +1", feet="Tali'ah crackows +1"}

    sets.mode["pet_dd"] = {ear1="Burana earring"}

    sets.mode["pet_tank"] = {head="Rao Kabuto", body="Rao togi", hands="Rao kote", legs="Rao haidate",
                             neck="Empath necklace", feet="Rao sune-ate", ear1="Handler's earring", ear2="Handler's earring +1",
                             ring1="Varar ring", ring2="Varar ring"}

    sets.mode["pet_nuke"] = {head="Tali'ah turban +2",neck="Adad amulet", belt="Ukko sash", legs="Pitre churidars +1", hands="Pitre babouches +1", range="Animator P", ear1="Burana earring"}

    sets.mode["pet_heal"] = {legs="Foire churidars +1"}

    sets.pet_tp_bonus = {head="Karagoz capello +1"}

    sets.job_abilities = {}
    sets.job_abilities["Overdrive"] = {body="Pitre tobe +1"}

    sets.job_abilities["Repair"] = {feet="Foire babouches +1"}

    sets.maneuvers = {neck="Buffoon's collar", hands="Foire dastanas +1", body="Karagoz farsetto +1", ear1="Burana earring"}

    sets.ws = {}
    sets.ws["Victory Smite"] = {legs="Hizamaru hizayoroi +2"}
    sets.ws["Stringing Pummel"] = {legs="Hizamaru hizayoroi +2"}
    sets.ws["Shijin Spiral"] = {legs="Hizamaru hizayoroi +2"}
end

function precast(spell,position)
    -- print_set(spell)
    if(spell.type == "JobAbility") then
        local set = sets.job_abilities[spell.name]
        if(set) then
            equip(set)
        end
    elseif(string.find(spell.name, "Maneuver")) then
        equip(sets.maneuvers)
    elseif(spell.type == "WeaponSkill") then
        local set = sets.ws[spell.name]
        if(set) then
            equip(set)
        end
    end
end

function SetModeGear()
    local mode = modes[mode_index]
    equip(sets.mode[mode])
end

function aftercast(spell)
    --This function performs after the action has taken place
	SetModeGear()
end

function pet_status_change(new,old)
    -- print(new)
end

function file_unload()
    send_command('unbind f11')
end