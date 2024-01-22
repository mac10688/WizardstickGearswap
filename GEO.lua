-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt"
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua tunic +3"}
    sets.precast.JA['Life cycle'] = {body="Geomancy tunic +3", back="Nantosuelta's cape"}
    sets.precast.JA['Full Circle'] = {
        head="Azimuth hood +3",
        hands="Bagua mitaines +3"
    }
    sets.precast.JA['Concentric Pulse'] = { head="Bagua galero +3" }

    -- Fast cast sets for spells

    sets.precast.FC = {
        head="Merlinic hood",
        neck="Voltsurge torque",
        ear2="Loquacious Earring",
        ear1="Etiolation earring",
        body="Shango robe",
        hands="Agwu's gages",
        ring1="Medada's ring",
        ring2="Kishar ring",
        back=fc_Cape,
        waist="Embla sash",
        legs="Geomancy pants +3",
        feet="Merlinic crackows"
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua mitaines +3"})

    sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC, {
        head="Umuthi hat"
    })

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Fotia Gorget",
        waist="Grunfeld Rope",
        ear1="Moonshade earring",
        ear2="Regal Earring",
        ring1="Rufescent Ring",
        ring2="Shukuyu Ring",
        back=ws_Cape
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    local ws_magic = set_combine(sets.precast.WS, {
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        waist="Orpheus's sash"
    })

    sets.precast.WS['Shining Strike'] = set_combine(ws_magic, {})
    sets.precast.WS['Seraph Strike'] = set_combine(ws_magic, {})
    sets.precast.WS['Brainshaker'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Starlight'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Moonlight'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Skullbreaker'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['True Strike'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Judgment'] = set_combine(sets.precast.WS, {waist="Fotia belt"})
    sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {waist="Fotia belt"})
    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Flash Nova'] = set_combine(ws_magic, {})
    sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {waist="Fotia belt"})
    sets.precast.WS['Exudation'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Earth Crusher'] = set_combine(ws_magic, {neck="Quanpur Necklace"})


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    local conserve_mp_set = {
        head="Vanya hood",
        waist="Austerity belt +1",
        legs="Geomancy pants +3",
        feet="Medium's sabots"
    }

    sets.midcast.Geomancy = set_combine(conserve_mp_set, {
        main="Idris", 
        range="Dunna",
        neck="Bagua charm +2",
        body="Bagua tunic +3",
        hands="Geomancy mitaines +3",
        ring1="Medada's ring",
        back=fc_Cape,
    })

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +3",
        body="Bagua tunic +3",
        hands="Geomancy mitaines +3",
        back="Lifestream cape",
        legs="Bagua pants +3",
        feet="Azimuth gaiters +3"
    })

    sets.midcast.Cure = set_combine(conserve_mp_set, {
        head="Vanya hood", --10%
        body="Vrikodara Jupon", --13%
        hands="Geomancy mitaines +3", --Mnd +43
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Solemnity cape", --7%
        legs="Gyve trousers", --10%
        feet="Medium's sabots" --7%
    })
    
    sets.midcast.Curaga = sets.midcast.Cure

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------


    -- Idle sets

    sets.idle = {
        main="Idris",
        sub="Genmei shield",
        range="Dunna",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Azimuth gloves +3",
        ring1="Defending Ring",
        ring2="Vengeful ring",
        back=pet_Cape,
        waist="Slipor sash",
        legs="Geomancy pants +3",
        feet="Azimuth gaiters +3"
    }

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +3",
        neck="Bagua charm +2",
        hands="Geomancy mitaines +3",
        back=pet_Cape,
        feet="Bagua sandals +3"
    })

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants +3"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants +3"})

    sets.Kiting = {
        feet="Geomancy sandals +3"
    }


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Nyame Helm",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame Mail",
        hands="Gazu bracelets +1",
        ring1="Chirich ring +1",
        ring2="Chirich ring +1",
        back=tp_Cape,
        waist="Grunfeld rope",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.precast.Item = {}
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

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

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

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)

end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end