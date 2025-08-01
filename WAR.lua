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
    state.Dagger = M{['description']='Dagger Set', 'Infiltrator'}
    state.Sword = M{['description']='Sword Set', 'Firetongue'}
    state.GreatSword = M{['description']='Great Sword Set', 'Irradiance'}
    state.Scythe = M{['description']='Scythe Set', 'LostSickle'}
    state.Polearm = M{['description']='Polearm Set', 'Mizukage'}
    state.Katana = M{['description']='Katana Set', 'Yagyu'}
    state.GreatKatana = M{['description']='Katana Set', 'Zanmato'}
    state.Club = M{['description']='Club Set', 'Feline'}
    state.Staff = M{['description']='Staff Set', 'Sophistry'}
    state.HandToHand = M{['description']='Hand-to-hand Set', 'Premium mogti'}
    state.Axe = M{['description']='Hand-to-hand Set', 'Dullahan axe'}
    state.GreatAxe = M{['description']='Great Axe Set', "Autarch's axe"}
    state.Archery = M{['description']='Archery Set', 'Ullr'}
    state.Marksmanship = M{['description']='Marksmanship Set', 'Silver Gun'}

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


    sets.Lycurgos = {main="Lycurgos", sub="Khonsu", range="Ullr", ammo="Chapuli arrow"}
    sets.Dagger = {main="Infiltrator", sub="Qutrub knife"}
    sets.Sword = {main="Firetongue", sub="Fermion sword"}
    sets.GreatSword = {main="Irradiance blade", sub="Khonsu"}
    sets.Scythe = {main="Lost sickle", sub="Khonsu",}
    sets.Polearm = {main="Mizukage-no-naginata", sub="Khonsu"}
    sets.Katana = {main="Yagyu shortblade", sub="Yagyu shortblade"}
    sets.GreatKatana = {main="Zanmato", sub="Khonsu"}
    sets.Club = {main="Feline Hagoita", sub="Sacro bulwark"}
    sets.Staff = {main="Sophistry", sub="Khonsu"}
    sets.HandToHand= {main="Premium mogti", sub=empty}    
    sets.Axe = {main="Dullahan axe", sub="Sacro bulwark"}
    sets.GreatAxe = {main="Autarch's axe", sub="Khonsu"}
    sets.Archery = {range="Ullr", ammo="Chapuli arrow"}
    sets.Marksmanship = {range="Silver Gun", ammo="Bronze bullet"}
    
    sets.precast.WS = {
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
        back="Null shawl",
    }

    sets.Kiting = {ring2="Shneddick ring +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Hjarrandi Helm",
        body="Hjarrandi breastplate",
        hands="Nyame Gauntlets",
        legs="Nyame flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Chaac belt",
        left_ear="Crep. Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring={name="Moonlight ring", bag="wardrobe5"}, --dt: 5
        back="Null shawl",
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
    if (spell.type == "WeaponSkill" and state.CombatWeapon.value ~= "Lycurgos") then
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