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
    state.OffenseMode:options('TP', 'Hybrid', 'Accuracy')
    state.CombatMode:options('SwordShield', 'DualWield')
    state.IdleMode:options('Normal', 'Evasion')
    state.CombatWeapon:set('Ikenga')

    state.Naegling = {}
    state.Naegling.DualWield = M{['description']='Naegling Set', 'TP', 'Pet'}
    state.Naegling.SwordShield = M{['description']='Naegling Set', 'Sacro'}

    state.Ikenga = {}
    state.Ikenga.DualWield = M{['description']='Ikenga Set', 'Pet'}
    state.Ikenga.SwordShield = M{['description']='Ikenga Set', 'Sacro'}

    state.Dolichenus = {}
    state.Dolichenus.DualWield = M{['description']='Dolichenus Set', 'TP', 'Pet'}
    state.Dolichenus.SwordShield = M{['description']='Dolichenus Set', 'Sacro'}

    state.Drepanum = {}
    state.Drepanum.DualWield = M{['description']='Drepanum Set', 'Grip'}
    state.Drepanum.SwordShield = M{['description']='Drepanum Set', 'Grip'}

    -- Additional local binds
    send_command('bind ~f1 gs c set CombatWeapon Naegling')
    send_command('bind ~f2 gs c set CombatWeapon Ikenga')
    send_command('bind ~f3 gs c set CombatWeapon Dolichenus')
    send_command('bind ~f4 gs c set CombatWeapon Drepanum')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.Naegling = {}
    sets.Naegling.DualWield = {}
    sets.Naegling.DualWield.TP = {main="Naegling", sub="Ikenga's axe"}
    sets.Naegling.DualWield.Pet = {main="Naegling", sub="Agwu's axe"}

    sets.Naegling.SwordShield = {}
    sets.Naegling.SwordShield.Sacro = {main="Naegling", sub="Sacro bulwark"}

    sets.Ikenga = {}
    sets.Ikenga.DualWield = {}
    sets.Ikenga.DualWield.Pet = {main="Ikenga's axe", sub="Agwu's axe"}

    sets.Ikenga.SwordShield = {}
    sets.Ikenga.SwordShield.Sacro = {main="Ikenga's axe", sub="Sacro bulwark"}

    sets.Dolichenus = {}
    sets.Dolichenus.DualWield = {} 
    sets.Dolichenus.DualWield.TP = {main="Dolichenus", sub="Ikenga's axe"}
    sets.Dolichenus.DualWield.Pet = {main="Dolichenus", sub="Agwu's axe"}

    sets.Dolichenus.SwordShield = {}
    sets.Dolichenus.SwordShield.Sacro = {main="Dolichenus", sub="Sacro bulwark"}

    sets.Drepanum = {}
    sets.Drepanum.DualWield = {}
    sets.Drepanum.DualWield.Grip = {main="Drepanum", sub="Rigorous grip"}
    sets.Drepanum.SwordShield = {}
    sets.Drepanum.SwordShield.Grip = {main="Drepanum", sub="Rigorous grip"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        neck="Voltsurge torque",
        ring1="Kishar ring",
        ring2="Medada's ring"
    }

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
    sets.precast.JA['Feral Howl'] = {body="Ankusa Jackcoat +1"}
    sets.precast.JA['Call Beast'] = {hands="Ankusa Gloves +1"}
    sets.precast.JA['Familiar'] = {legs="Ankusa Trousers +1"}
    sets.precast.JA['Tame'] = {head="Totemic Helm +3"}
    sets.precast.JA['Spur'] = {feet="Nukumi Ocreae +1"}

    -- -- Waltz set (chr and vit)
    -- sets.precast.Waltz = {range="Gjallarhorn",
    --     head="Nahtirah Hat",
    --     body="Gendewitha Bliaut",hands="Buremte Gloves",
    --     back="Kumbira Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        left_ear="Ishvara Earring",
        right_ear="Nukumi Earring +1",
        left_ring="Shukuyu Ring",
        right_ring="Rufescent Ring",
        back="Null Shawl",
    }
    
    -- Midcast Sets
    
    -- sets.midcast['Magic Finale'] = {neck="Wind Torque",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}

    -- Other general spells and classes.
    sets.midcast.Cure = {}
        
    sets.midcast.Curaga = sets.midcast.Cure
        
    sets.midcast.Stoneskin = {}
        
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",
        ring1="Ephedra Ring"
    }

    
    -- Sets to return to when not performing an action.
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        head="Nyame Helm",
        body="Udug Jacket",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Null Belt",
        left_ear="Eabani Earring",
        right_ear="Genmei Earring",
        left_ring="Eihwaz Ring",
        right_ring="Moonlight Ring",
        back="Null Shawl",
    }

    sets.idle.Evasion = {
    }
    
    -- Defense sets

    sets.defense.PDT = {
    }

    sets.defense.MDT = {
    }

    sets.Kiting = {
        ring1="Shneddick ring +1"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Gleti's Mask",
        body="Udug Jacket",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Anu Torque",
        waist="Sarissapho. Belt",
        left_ear="Telos Earring",
        right_ear="Digni. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl"
    }

    sets.engaged.TP = sets.engaged
    sets.engaged.Hybrid = set_combine(sets.engaged, {
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"}
    })

    sets.engaged.Accuracy = sets.engaged

    sets.precast.JA['Sentinel'] = sets.enmity
    sets.precast.JA['Holy Circle'] = sets.enmity

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

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(descrip, newVal, oldVal)

end

function job_handle_equipping_gear(playerStatus, eventArgs)

end

function lockstyle()
    if player.main_job == 'BST' then send_command('@input /lockstyleset 11') end
end

function job_sub_job_change()
    coroutine.schedule(lockstyle,8)
end

function display_current_job_state(eventArgs)

end