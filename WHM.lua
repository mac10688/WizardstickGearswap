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
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'Refresh')
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    local fastcast_cape = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Magic dmg. taken-10%'}}
    local attack_cape = { name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15'}}
    local physical_mnd_ws_cape = { name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local dt_cape = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Def+50'}}
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Incantor Stone", --2%
        head="Ebers cap +3", --13%
        neck="Cleric's torque +2", --10%
        ear1="Malignance earring",
        -- ear2="Loquacious Earring", --2%
        ear2="Ebers earring +1",
        body="Pinga tunic +1", --15%
        hands="Fanatic gloves", --7%
        ring1="Medada's Ring", --10%
        ring2="Defending ring",
        -- ring2="Kishar ring", --4%        
        back=fastcast_cape, --10%
        -- waist="Embla Sash", --5%
        -- legs="Lengo pants", --5%
        legs="Ebers pantaloons +3",
    }

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {main="Yagrush", legs="Ebers pantaloons +3"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        -- sub="Sors shield",
        ammo="Incantor stone",
        head="Ebers cap +3",
        ear1="Nourishing earring +1",
        feet="Ebers duckbills +3"
    })
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
    sets.precast.JA.Devotion = {head="Piety Cap +3"}
    
    sets.precast.WS = {
        head="Nyame helm",
        body="Nyame helm",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade earring",
        ear2="Telos earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=physical_mnd_ws_cape
    }
    
    local physical_mnd_ws = {
        head="Piety cap +3",
        body="Nyame helm",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Piety duckbills +3",
        neck="Fotia Gorget",
        waist="Grunfeld rope",
        ear1="Regal earring",
        ear2="Moonshade earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        back=physical_mnd_ws_cape,
    }

    local magical_mnd_ws = {

    }
	
    sets.precast.WS["Shining Strike"] = magical_mnd_ws
    sets.precast.WS["Seraph Strike"] = magical_mnd_ws
    sets.precast.WS["Brainshaker"] = physical_mnd_ws
    sets.precast.WS["Starlight"] = {neck="Combatant's torque"}
    sets.precast.WS["Moonlight"] = {neck="Combatant's torque"}
    sets.precast.WS["Skullbreaker"] = physical_mnd_ws
    sets.precast.WS["True Strike"] = physical_mnd_ws
    sets.precast.WS["Judgment"] = sets.precast.WS
    sets.precast.WS["Hexa Strike"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.precast.WS["Black Halo"] = sets.precast.WS
    sets.precast.WS["Flash Nova"] = magical_mnd_ws
    sets.precast.WS["Realmrazer"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.precast.WS["Dagan"] = physical_mnd_ws
    sets.precast.WS["Mystic Boon"] = physical_mnd_ws
    

    -- Midcast Sets
    
    -- Cure sets

    

    sets.midcast.Cure = {
        main="Raetic Rod +1",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1", --11%
        head="Ebers Cap +3", --12%
        body="Ebers Bliaut +3",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Spell interruption rate down -11%','INT+8','"Mag.Atk.Bns."+5',}}, --31%
        legs="Ebers Pant. +3",
        feet="Theo. Duckbills +3", --29%
        neck="Loricate torque +1",
        waist="Plat. Mog. Belt",
        left_ear="Nourish. Earring +1", --Could be 5% but not necessary
        right_ear="Ebers Earring +1",
        ring1="Freke Ring", --10%
        ring2="Defending Ring",        
        back=fastcast_cape
    }

    sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="Ebers Bliaut +3"})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.StatusRemoval = {
        main="Yagrush",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1", --11%
        head="Ebers Cap +3", --12%
        body="Ebers Bliaut +3",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Spell interruption rate down -11%','INT+8','"Mag.Atk.Bns."+5',}}, --31%
        legs="Ebers Pant. +3",
        feet="Theo. Duckbills +3", --29%
        neck="Loricate torque +1",
        waist="Plat. Mog. Belt",
        left_ear="Sanare earring",
        right_ear="Ebers Earring +1",
        ring1="Freke Ring", --10%
        ring2="Defending Ring",        
        back=fastcast_cape
    }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        neck="Debilis Medallion",
        hands="Fanatic gloves",
        ring1="Haoma's ring",
        ring2="Menelaus's Ring",
        legs="Theophany pantaloons +3",
        feet="Gendewitha Galoshes +1"
    })

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        neck="Incanter's torque",
        body="Telchine chasuble",
        hands="Inyanga dastanas +2",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Fi follet cape +1",
        waist="Embla sash",
        legs="Piety Pantaloons +3",
        feet="Theophany duckbills +3"
    }

    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Dynasty Mitts",
        back="Swith Cape +1",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
        main="Beneficus",
        head="Ebers cap +3",
        body="Ebers Bliaut +3",
        legs="Piety Pantaloons +3",
        feet="Ebers duckbills +3"
    })

    local midcast_duration = set_combine(sets.midcast["Enhancing Magic"], {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        body="Telchine chasuble",
        hands="Telchine gloves",
        legs="Telchine braconi",
    })

    sets.midcast.BarStatus = set_combine(midcast_duration, {
        neck="Sroda necklace"
    })

    sets.midcast.Regen = set_combine(midcast_duration, {
        main="Bolelabunga",
        sub="Ammurapi shield",
        head="Inyanga tiara +2",
        body="Piety bliaut +3",
        hands="Ebers mitts +3",
        legs="Theophany pantaloons +3",
        feet="Theophany duckbills +3"
    })

    sets.midcast['Holy'] = {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Bunzi's hat",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=fastcast_cape,
        waist="Orpheus's sash",
        legs="Bunzi's pants",
        feet="Bunzi's sabots"
    }

    sets.midcast['Banish'] = {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ipoca beret",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Theophany bliaut +3",
        hands="Fanatic gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=fastcast_cape,
        waist="Orpheus's sash",
        legs="Theophany pantaloons +3",
        feet="Medium's Sabots"
    }

    sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    sets.midcast.enfeebling = {
        main="Gada",
        ammo="Hydrocera",
        head="Ebers cap +3",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Theophany bliaut +3",
        hands="Regal cuffs",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Kishar ring",
        back=fastcast_cape,
        waist="Obstinate sash",
        legs="Ebers pantaloons +3",
        feet="Theophany duckbills +3"
    }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = sets.midcast.enfeebling

    sets.midcast.IntEnfeebles = sets.midcast.enfeebling

    
    -- Sets to return to when not performing an action.    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        main="Daybreak", --10% physical
        sub="Genmei shield", --10% physical
        ammo="Staunch tathlum +1", --3% dmg
        head="Nyame helm", --7% dmg
        neck="Loricate Torque +1", --6% dmg
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves", --7% dmg
        ring1="Ayanmo ring", --3% dmg
        ring2="Shadow ring", --10% dmg
        back=dt_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants", --8% dmg
        feet="Ebers duckbills +3" --7% dmg
    }

    sets.idle.PDT = {
        main="Daybreak", --10% physical
        sub="Genmei shield", --10% physical
        ammo="Staunch tathlum +1", --3% dmg
        head="Nyame helm", --7% dmg
        neck="Loricate Torque +1", --6% dmg
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves", --7% dmg
        ring1="Ayanmo ring", --3% dmg
        ring2="Shadow ring", --10% dmg
        back=dt_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants", --8% dmg
        feet="Ebers duckbills +3" --7% dmg
    }

    sets.idle.MDT = {
        main="Daybreak",
        sub="Genmei shield",
        ammo="Staunch tathlum +1",
        head="Nyame helm",
        neck="Loricate Torque +1",
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves",
        ring1="Inyanga ring",
        ring2="Shadow ring",
        back=dt_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants",
        feet="Nyame sollerets"
    }

    sets.idle.Refresh = set_combine(sets.idle.PDT, {
        ammo="Homiliary",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs={ name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}
    })
    
    -- Defense sets

    sets.defense.PDT = {
        main="Daybreak", --10% physical
        sub="Genmei shield", --10% physical
        ammo="Staunch tathlum +1", --3% dmg
        head="Nyame helm", --7% dmg
        neck="Loricate Torque +1", --6% dmg
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves", --7% dmg
        ring1="Ayanmo ring", --3% dmg
        ring2="Shadow ring", --10% dmg
        back=dt_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants", --8% dmg
        feet="Ebers duckbills +3" --7% dmg
    }

    sets.defense.MDT = {
        main="Daybreak",
        sub="Genmei shield",
        ammo="Staunch tathlum +1",
        head="Nyame helm",
        neck="Loricate Torque +1",
        ear1="Genmei earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves",
        ring1="Inyanga ring",
        ring2="Shadow ring",
        back=dt_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants",
        feet="Nyame sollerets"
    }

    sets.kiting = {
        ring2="Shneddick ring +1",
        feet="Hippomenes socks +1"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        ammo="Crepuscular pebble",
        head="Bunzi's hat",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Sanctity Necklace",
        waist="Grunfeld Rope",
        ear1="Telos earring",
        ear2="Ebers earring +1",
        ring1="Petrov Ring",
        ring2="Chirich ring +1",
        back=attack_cape
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers mitts +3"}

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


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end

function lockstyle()
    if player.main_job == 'WHM' then send_command('@input /lockstyleset 7') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end