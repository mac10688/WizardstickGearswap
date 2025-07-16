-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Wiz-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal')
    state.CastingMode:options('Normal')
    
    state.CombatWeapon:set('Lycurgos')

    -- state.CombatWeapon = M{['description']='Combat Weapon', 'Naegling', 'Crocea', 'Club', 'Dagger', 'Zerodmg'}
    state.Lycurgos = M{['description']='Great Axe Set', 'Lycurgos'}
    state.AbysseaBlueProcs = M{['description']='Proc Sets', 'Infiltrator', 'Firetongue', 'Irradiance', 'LostSickle', 'Mizukage', 'Yagyu', 'Zanmato', 'Feline', 'Sophistry'}, 


    send_command('bind ~f1 gs c set CombatWeapon Lycurgos')
    send_command('bind ~f2 gs c set CombatWeapon AbysseaBlueProcs')

    --DW SW
    --Low-Haste, Mid-Haste, Cap-Haste
    --Accuracy

end

function job_file_unload()
    send_command('unbind ~f1')
    send_command('unbind ~f2')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------


    sets.Lycurgos = {main="Lycurgos", sub="Khonsu"}
    sets.AbysseaBlueProcs = {}
    -- sets.AbysseaBlueProcs.Premium = {main="Premium mogti", sub=empty}
    sets.AbysseaBlueProcs.Infiltrator = {main="Infiltrator", sub="Qutrub knife", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Firetongue = {main="Firetongue", sub="Fermion sword", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Irradiance = {main="Irradiance blade", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}
    -- sets.AbysseaBlueProcs.Dullahan = {main="Dullahan axe", sub="Sacro bulwark"}
    -- sets.AbysseaBlueProcs.Autarch = {main="Autarch's axe", sub="Khonsu"}
    sets.AbysseaBlueProcs.LostSickle = {main="Lost sickle", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Mizukage = {main="Mizukage-no-naginata", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Yagyu = {main="Yagyu shortblade", sub="Yagyu shortblade", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Zanmato = {main="Zanmato", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Feline = {main="Feline Hagoita", sub="Sacro bulwark", range="Ullr", ammo="Chapuli arrow"}
    sets.AbysseaBlueProcs.Sophistry = {main="Sophistry", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}

    -- sets.precast.RangedAttack = 
    
    sets.precast.WS = {
        range="Ullr",
        ammo="Chapuli arrow",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's torque",
        waist="Kentarch Belt +1",
        right_ear="Telos Earring",
        left_ear="Crep. Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back="Mecisto. Mantle",
    }

    sets.precast.WS["Ukko's Fury"] = {
        range="Ullr",
        ammo="Chapuli arrow",
        head="Nyame Helm",
        body="Hjarrandi breastplate",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi belt +1",
        right_ear="Telos Earring",
        left_ear="Crep. Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal ring",
        back="Mecisto. Mantle",
    }
    
    sets.Weak_Weaponskill = {
        range="Ullr",
        ammo="Chapuli arrow",
        head="Halitus helm",
        body="Adamantite armor",
        hands="Leyline gloves",
        legs="Dashing subligar",
        feet="Volte spats",
        neck="Combatant's Torque",
        waist="Flume belt +1",
        right_ear="Telos Earring",
        left_ear="Crep. Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal ring",
        back="Mecisto. Mantle",
    }

    -- Sets to return to when not performing an action.    

    -- Idle sets
    sets.idle = {
        range="Ullr",
        ammo="Chapuli arrow",
        head="Hjarrandi Helm",
        body="Hjarrandi breastplate",
        hands="Nyame Gauntlets",
        legs="Nyame flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Ioskeha Belt +1",
        left_ear="Crep. Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring={name="Moonlight ring", bag="wardrobe5"}, --dt: 5
        back="Mecistopins mantle",
    }

    sets.Kiting = {ring2="Shneddick ring +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        range="Ullr",
        ammo="Chapuli arrow",
        head="Hjarrandi Helm",
        body="Hjarrandi breastplate",
        hands="Nyame Gauntlets",
        legs="Nyame flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Ioskeha Belt +1",
        left_ear="Crep. Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring={name="Moonlight ring", bag="wardrobe5"}, --dt: 5
        back="Mecistopins mantle",
    }

    sets.precast.Item['Holy Water'] = {
        neck="Nicander's necklace",
        ring1={name="Blenmot's ring +1", bag="wardrobe5"},
        ring2={name="Blenmot's ring +1", bag="wardrobe6"} 
    }
    sets.precast.Item['Hallowed Water'] = {
        neck="Nicander's necklace",
        ring1={name="Blenmot's ring +1", bag="wardrobe5"},
        ring2={name="Blenmot's ring +1", bag="wardrobe6"} 
    }

    coroutine.schedule(lockstyle,8)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    -- print_set(spell)
    -- print(action)
    if (spell.type == "WeaponSkill" and state.CombatWeapon.value == "AbysseaBlueProcs") then
        equip(sets.Weak_Weaponskill)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


function lockstyle()
    if player.main_job == 'WAR' then send_command('@input /lockstyleset 10') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end