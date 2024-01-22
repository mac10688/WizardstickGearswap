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
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    Cape = {}
    Cape.Fc = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Mag. Evasion+15'}}
    Cape.Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15'}}
    Cape.Tp = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    Cape.Dw = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%'}}
    Cape.Str_WS = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Dex_WS = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Mnd_WS = { name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitiation tabard +3"}
        
    -- Fast cast sets for spells
    
    --rdm inherit 38
    --50
    --83 total
    sets.precast.FC = {   
        head="Atrophy chapeau +3", --16
        ear1="Malignance earring", --1
        ear2="Lethargy earring +2", --9
        body="Vitiation tabard +3", --15
        hands="Lethargy gantherots +3", --8
        ring1="Medada's ring", --10%
        ring2="Defending ring", --4
        back=Cape.Fc,
        waist="Platinum moogle belt", --5
        legs="Malignance tights",
        feet="Lethargy houseaux +3"
    }

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body='Crepuscular cloak'})

    local ws_magic = {
        ammo="Sroda tathlum",
        head="Lethargy chappel +3",
        neck="Sibyl Scarf",
        ear1="Moonshade earring",
        ear2="Regal earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Freke ring",
        back=Cape.Int,
        waist="Orpheus's sash",
        legs="Nyame flanchard",
        feet="Lethargy houseaux +3"
    }

    local ws_physical = {
        ammo="Coiste bodhar",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Sherida Earring",
        ear2="Lethargy earring +2",        
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Rufescent ring",
        ring2="Ilabrat ring",
        back=Cape.Mnd_WS,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet="Lethargy houseaux +3"
    }
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = ws_physical

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.WS["Empyreal Arrow"] = ws_physical
    
    sets.WS["Aeolian Edge"] = ws_magic

    sets.WS["Red Lotus Blade"] = ws_magic

    sets.WS["Seraph Blade"] = set_combine(ws_magic,{
        ring2="Shukuyu ring",
        back=Cape.Mnd_WS
    })
    
    sets.WS["Circle Blade"] = set_combine(ws_physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.WS["Vorpal Blade"] = set_combine(ws_physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.WS["Savage Blade"] = set_combine(ws_physical, {
        neck="Republican platinum medal",
        ear1="Regal earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        waist="Sailfi belt +1",
        back=Cape.Str_WS
    })

    sets.WS["Death Blossom"] = set_combine(ws_physical, {
        ring2="Shukuyu ring"
    })

    sets.WS["Sanguine Blade"] = set_combine(ws_magic, {
        ear1="Regal earring",
        neck="Duelist's torque +2",
        head="Pixie Hairpin +1",
        ring1="Medada's ring",
        ring2="Archon ring",
        back=Cape.Mnd_WS
    })

    sets.WS["Chant du Cygne"] = set_combine(ws_physical, {
        back=Cape.Dex_WS
    })
    
    sets.WS["Requiescat"] = {
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sanctity Necklace",
        waist="Kentarch Belt +1",
        left_ear="Crep. Earring",
        right_ear="Lethargy Earring +2",
        left_ring="Rufescent Ring",
        right_ring="Chirich Ring +1",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    sets.WS["Evisceration"] = ws_physical
    sets.WS["Aeolian Edge"] = ws_magic
    sets.WS["Exenterator"] = ws_physical
    sets.WS["Black Halo"] = ws_physical

    
    -- Midcast Sets

    sets.midcast.Cure = {
        head="Lethargy chappel +3",
        neck="Loricate torque +1",
        body="Bunzi's robe",
        hands="Lethargy gantherots +3",
        ring1="Defending ring",
        ring2="Menelaus's ring",
        back=Cape.Mnd,
        legs="Atrophy tights +3",
        feet="Kaykaus boots"
    }
        
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head="Befouled Crown",
        neck="Incanter's torque",
        ear1="Mimir earring",
        ear2="Lethargy earring +2",
        body="Vitiation Tabard +3",
        hands="Vitiation gloves +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Embla sash",
        legs="Atrophy Tights +3",
        feet="Lethargy Houseaux +3",
        back="Ghostfyre cape"
    }

    sets.midcast.Refresh = {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +3"
    }
    
    sets.midcast['Enfeebling Magic'] = {
        ranged=empty,
        ammo="Regal gem",
        main="Contemplator +1",
        sub="Enki strap",
        head="Lethargy chapeau +3",
        neck="Duelist's torque +2",
        ear1="Malignance earring",
        ear2="Lethargy earring +2",
        body="Lethargy sayon +3",
        hands="Lethargy gantherots +3",
        ring1="Medada's ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Obstinate Sash",
        back=Cape.Int,
        legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Cure" potency +7%','INT+12','"Mag.Atk.Bns."+8'}},
        feet="Vitiation Boots +3"
    }
    
    sets.midcast['Elemental Magic'] = {
        main="Bunzi's rod",
        sub="Ammurapi shield",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1",
        neck="Duelist's torque +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Ea houppelande +1",
        hands="Bunzi's gloves",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back=Cape.Int,
        waist="Acuity belt +1",
        legs="Lethargy fuseau +3",
        feet="Lethargy houseaux +3"
    }
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body='Crepuscular cloak'})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast['Elemental Magic'], {
        head="Pixie hairpin +1",
        neck="Erra pendant",
        ring1="Evanescence ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
    })

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        ring2="Excelsis ring",
        waist="Fucho-no-obi",
        feet="Merlinic crackows"
    })

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
        main="Colada",
        head="Telchine cap",
        ear2="Lethargy earring +2",
        neck="Duelist's torque +2",
        body="Vitiation tabard +3",
        hands="Atrophy gloves +3",
        waist="Embla sash",
        back="Ghostfyre cape",
        legs="Telchine braconi",
        feet="Lethargy houseaux +3"
    })
        
    sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {
        main="Colada",
        head="Lethargy Chappel +3",
        neck="Duelist's torque +2",
        ear2="Lethargy earring +2",
        hands="Atrophy gloves +3",
        body="Lethargy sayon +3",
        waist="Embla sash",
        back="Ghostfyre cape",
        legs="Lethargy fuseau +3",
        feet="Lethargy houseaux +3"
    })

    sets.buff.Saboteur = {hands="Lethargy gantherots +3"}
    

    -- Sets to return to when not performing an action.    

    -- Idle sets
    sets.idle = {
        ammo="Staunch tathlum +1",
        head="Lethargy chappel +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Lethargy sayon +3",
        hands="Malignance gloves",
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back=Cape.Int,
        waist="Slipor sash",
        legs="Nyame flanchard",
        feet="Malignance boots"
    }

    -- sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
    --     head="Atrophy Chapeau +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}
    
    -- sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
    --     head="Vitivation Chapeau",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    -- sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
    --     head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut +1",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Shadow Mantle",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}

    -- sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
    --     head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Caubeen +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Engulfer Cape",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}
    
    
    -- -- Defense sets
    -- sets.defense.PDT = {
    --     head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Hagondes Coat",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Shadow Mantle",waist="Flume Belt",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

    -- sets.defense.MDT = {ammo="Demonry Stone",
    --     head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Engulfer Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Carmine cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        ranged=empty,
        ammo="Coiste bodhar",
        head="Malignance chapeau",
        neck="Anu Torque",
        ear1="Sherida Earring",
        ear2="Lethargy earring +2",
        body="Malignance tabard",
        hands="Malignance gloves",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2="Hetairoi ring",
        back=Cape.Dw,
        waist="Grunfeld rope",
        legs="Malignance tights",
        feet="Malignance boots"
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

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

end