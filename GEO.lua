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
    state.CombatMode:options('SwordShield', 'DualWield')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    state.CombatWeapon:set('Idris')
    
    state.Idris = {}
    state.Idris.SwordShield = M{['description']='Idris Set', 'Ammurapi', 'Genmei'}
    state.Idris.DualWield = M{['description']='Idris Set', 'CathPalug', 'Bunzi', 'WizardRod', 'LorgMor'}

    state.MagicBurst = M(false, 'Magic Burst')
    data.petJA = S{"Full Circle","Radial Arcana","Mending Helation","Concentric Pulse"}
    
    send_command('bind ^` gs c toggle MagicBurst')
    send_command('bind ~f1 gs c set CombatWeapon Idris')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ~f1')
    send_command('unbind ^`')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    local fc_Cape = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local tp_Cape = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%'}}
    local mab_Cape = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local pet_Cape = { name="Nantosuelta's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5'}}
    local ws_Cape = { name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local idle_pdt_cape = { name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Pet: "Regen"+10','DEF+50'}}
    local idle_mdt_cape = { name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','Pet: "Regen"+10','Mag. Evasion+15'}}

    
    sets.Idris = {main="Idris"}
    sets.Idris.DualWield = {main="Idris", sub="Bunzi's rod"}
    sets.Idris.DualWield.CathPalug = {main="Idris", sub="Cath Palug hammer"}
    sets.Idris.DualWield.Bunzi = {main="Idris", sub="Bunzi's rod"}
    sets.Idris.DualWield.WizardRod = {main="Idris", sub="Wizard's rod"}
    sets.Idris.DualWield.LorgMor = {main="Idris", sub="Lorg Mor"}

    sets.Idris.SwordShield = {main="Idris", sub="Ammurapi shield"}
    sets.Idris.SwordShield.Ammurapi = {main="Idris", sub="Ammurapi shield"}
    sets.Idris.SwordShield.Genmei = {main="Idris", sub="Genmei shield"}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua tunic +3"}
    sets.precast.JA['Life cycle'] = {body="Geomancy tunic +3", back=pet_Cape}
    sets.precast.JA['Full Circle'] = {
        head="Azimuth hood +3",
        hands="Bagua mitaines +3"
    }
    sets.precast.JA['Concentric Pulse'] = { head="Bagua galero +3" }
    sets.precast.JA['Radial Arcana'] = { feet="Bagua sandals +3" }

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

    sets.precast.FC['Impact'] = set_combine(sets.precast.FC, {
        head=empty,
        body='Crepuscular cloak'
    })

    sets.precast.FC["Dispelga"] = set_combine(sets.precast.FC, {main="Daybreak"})
    
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

    sets.midcast['Elemental Magic'] = {
        sub="Ammurapi shield",
        head="Bagua galero +3",
        neck="Sanctity necklace",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Bagua tunic +3",
        hands="Agwu's gages",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",        
        waist="Acuity belt +1",
        legs="Bagua pants +3",
        feet="Bagua sandals +3",
        back=mab_Cape
    }

    sets.magic_burst = set_combine(sets.midcast['Elemental Magic'], {
        main="Wizard's rod",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1", --MB: 7 MB2:7
        neck="Sibyl scarf", -- MB: 10
        body="Azimuth coat +3", --MB: 9 MB2:9
        hands="Agwu's gages", --MB2: 5
        -- ring1="Mujin band", --MB2: 5
        legs="Azimuth tights +3", --MB: 8 MB2:8
        feet="Agwu's pigaches" --MB: 6
    })

    sets.midcast['Impact'] = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        ring2="Archon ring",
        body='Crepuscular cloak'
    })

    sets.midcast["Dispelga"] = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak"})

    sets.midcast.Geocolure = set_combine(conserve_mp_set, {
        main="Idris", 
        range="Dunna",
        neck="Bagua charm +2",
        body="Bagua tunic +3",
        hands="Geomancy mitaines +3",
        ring1="Medada's ring",
        back=fc_Cape,
    })

    sets.midcast.Indicolure = set_combine(sets.midcast.Geocolure, {
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

    sets.midcast['Dark Magic'] = set_combine(conserve_mp_set, {
        neck="Erra pendant",
        body="Geomancy tunic +3",
        ring1="Evanescence ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
        legs="Azimuth tights +3"
    })

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        ring1="Archon ring",
        ring2="Excelsis ring",
        waist="Fucho-no-obi",
        feet="Merlinic crackows"
    })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast['Enfeebling Magic'] = {
        sub="Ammurapi shield",
        ammo="Dunna",
        head="Befouled crown",
        neck="Incanter's torque",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Geomancy tunic +3",
        hands="Regal cuffs",
        ring1="Medada's ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Aurist's cape +1",
        waist="Luminary sash",
        legs="Geomancy pants +3",
        feet="Bagua sandals +3"
    }

    sets.midcast['Enhancing Magic'] = set_combine(conserve_mp_set, {
        sub="Ammurapi shield",
        head="Befouled crown",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Embla sash"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], { 
        hands="Regal cuffs"
    })

    sets.midcast.Absorb = {
        sub="Ammurapi Shield",
        range="Dunna",
        head="Azimuth Hood +3",
        body="Geomancy Tunic +3",
        hands="Geo. Mitaines +3",
        legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +3",
        neck="Bagua charm +2",
        waist="Null belt",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        ring1="Medada's ring",
        ring2="Archon Ring",
        back=fc_Cape
    }

    -- 42% FC
    sets.midcast["Absorb-TP"] = {
        sub="Ammurapi Shield",
        range="Dunna", -- 3% FC
        head="Azimuth Hood +3",
        body="Geomancy Tunic +3",
        hands="Geo. Mitaines +3",
        legs="Geomancy pants +3", --15% FC
        feet="Azimuth Gaiters +3",
        neck="Erra Pendant",
        waist="Null belt",
        left_ear="Alabaster earring",
        right_ear="Malignance Earring", --4% FC
        ring1="Medada's ring", --10% FC
        ring2="Archon Ring",
        back=fc_Cape -- 10% FC
    }

    sets.midcast.Stun = {
        sub="Ammurapi shield",
        head="Bagua galero +3",
        neck="Erra pendant",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Geomancy tunic +3",
        hands="Geomancy mitaines +3",
        ring1="Medada's ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Luminary sash",
        legs="Geomancy pants +3",
        feet="Geomancy sandals +3",
    }
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------


    -- Idle sets

    sets.idle = {
        range="Dunna",
        head="Azimuth hood +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Arete del luna +1",
        body="Bagua tunic +3",
        hands="Azimuth gloves +3",
        ring1="Defending Ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=pet_Cape,
        waist="Null belt",
        legs="Geomancy pants +3",
        feet="Azimuth gaiters +3"
    }

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        range="Dunna",
        -- head="Azimuth hood +3",
        neck="Bagua charm +2",
        hands="Geomancy mitaines +3",
        back=pet_Cape,
        -- feet="Bagua sandals +3"
    })

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
        neck="Combatant's torque",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame Mail",
        hands="Gazu bracelets +1",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        back=tp_Cape,
        waist="Grunfeld rope",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.defense.PDT = {
        head="Nyame helm", -- 5 mdb 123 meva
        neck="Loricate Torque +1",
        ear1="Ran earring",
        ear2="Foresti earring",
        body="Adamantite armor",
        hands="Nyame gauntlets", -- 4 mdb 112 meva
        ring1="Gelatinous ring +1",
        ring2="Mephitas's ring +1",
        back=idle_pdt_cape,
        waist="Austerity belt +1",
        legs="Nyame flanchard", -- 7 mdb 150 meva
        feet="Nyame sollerets" -- 5 mdb 150 meva
    }

    sets.defense.MDT = {
        head="Bagua galero +3",
        neck="Loricate torque +1",
        ear1="Lugalbanda earring",
        ear2="Arete del luna +1",
        body="Adamantite armor",
        hands="Bagua mitaines +3",
        ring1="Shadow ring",
        ring2={name="Vexer ring +1", bag="wardrobe6"},
        back=idle_mdt_cape,
        waist="Slipor sash",
        legs="Bagua pants +3",
        feet="Bagua sandals +3"
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
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value and spell.english ~= 'Impact' then
            equip(sets.magic_burst)
        end
        local obi_or_orpheus = obi_or_orpheus(spell)
        if obi_or_orpheus then
            equip({waist=obi_or_orpheus})
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- print_set(spell)
    --Wait for the pet to come or go before taking off gear that is based off luopan ja. Not sure if needed for Geocolure but just to be safe.
    if spellMap == "Geocolure" or (spell.type == 'JobAbility' and data.petJA:contains(spell.english)) then
        eventArgs.handled = true
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

function job_state_change(stateField, newValue, oldValue)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)

end

function customize_idle_set(idleSet)
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)

end

function lockstyle()
    if player.main_job == 'GEO' then send_command('@input /lockstyleset 3') end
end

function job_sub_job_change()
    coroutine.schedule(lockstyle,8)
end

function display_current_job_state(eventArgs)

end