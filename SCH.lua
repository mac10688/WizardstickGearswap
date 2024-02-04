-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Wiz-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    update_sublimation()
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Occult')
    state.IdleMode:options('Normal', 'PDT')

    state.MagicBurst = M(true, 'Magic Burst')

    state.WeakStratMode = M{['description']="Weak Nuke Mode", 'None', 'DuringImmanence', 'FullTime'}
    state.EatTp = M(false, 'Eat TP')

    send_command('bind ~f7 gs c cycle WeakStratMode')
    send_command('bind @` gs c toggle EatTp')
end

function user_unload()
    send_command('unbind ~f7')
    send_command('unbind @`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    local idle_cape = { name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Def+50'}}
    local nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local cure_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local mnd_magic_ws = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local int_magic_ws = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%'}}
    local ws_boots = { name="Merlinic Crackows", augments={'Attack+25','Crit.hit rate+3','Weapon skill damage +10%','Mag. Acc.+16 "Mag.Atk.Bns."+16'}}

    local fc_cape = idle_cape
    local int_enfeeble_cape = nuke_cape
    local mnd_enfeeble_cape = cure_cape

    local merlinic_legs_mb = { name="Merlinic Shalwar", augments={'Mag. Acc.+22','Magic burst dmg.+10%','MND+2','"Mag.Atk.Bns."+13'}}
    local merlinic_feet_mb = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5'}}

    local chironic_refresh_legs = { name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}


    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = { legs="Pedagogy Pants +3" }
    sets.precast.JA['Enlightenment'] = {body="Pedagogy gown +3"}

    -- Fast cast sets for spells
    --10% from arts
    --20% from sub rdm
    --52% from gear
    --82% total
    --54 dt
    sets.precast.FC = {
        ammo="Staunch tathlum +1",
        head="Arbatel bonnet +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring", --fast cast 1%
        ear2="Malignance earring", --fast cast 4%
        body="Pinga tunic +1", --fast cast 15%
        hands="Academic's bracers +3", --fast cast 8%
        ring1="Medada's ring", --fast cast 10%
        ring2="Defending ring",
        back=fc_cape, --fast cast 10%
        waist="Platinum moogle belt",
        legs="Agwu's slops", --fast cast 6%
        feet="Pedagogy loafers +3" --fast cast 8%
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        legs="Mallquis trews +2",
        ring2="Mallquis Ring",
        ear1="Barkarole earring"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC)

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
        head=empty,
        body='Crepuscular cloak'
    })

    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main="Daybreak",
        sub="Ammurapi shield"
    })

    local physical_int_ws = {
        head="Pedagogy mortarboard +3",
        neck="Fotia gorget",
        ear1="Regal earring",
        ear2="Barkarole earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Metamorph ring +1",
        ring2="Persis ring",
        back=int_magic_ws,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet=ws_boots
    }

    local magical_int_ws = {
        head="Pedagogy mortarboard +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back=int_magic_ws,
        waist="Orpheus's sash",
        legs="Pedagogy pants +3",
        feet=ws_boots
    }

    local magical_mnd_ws = {
        head="Nyame helm",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Freke ring",
        back=mnd_magic_ws,
        waist="Orpheus's sash",
        legs="Nyame flanchard",
        feet=ws_boots
    }

    local dark_magic_affinity = {head="Pixie hairpin +1", ring1="Archon ring"}
    local dark_magic_int_ws = set_combine(magical_int_ws, dark_magic_affinity)
    local dark_magic_mnd_ws = set_combine(magical_mnd_ws, dark_magic_affinity)

    sets.precast.WS = physical_int_ws
    -- STR 40% | Physical
    sets.precast.WS["Heavy Swing"] = physical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.precast.WS["Rock Crusher"] = magical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.precast.WS["Earth Crusher"] = magical_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.precast.WS["Starburst"] = dark_magic_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.precast.WS["Sunburst"] = dark_magic_int_ws
    
    -- STR 100% | Physical
    sets.precast.WS["Shell Crusher"] = physical_int_ws
    
    -- STR 50% | Physical
    sets.precast.WS["Full Swing"] = physical_int_ws
    
    -- INT 50% MND 50% | Physical
    sets.precast.WS["Spirit Taker"] = physical_int_ws
    
    -- STR 30% MND 50% | Physical
    sets.precast.WS["Retribution"] = physical_int_ws

    -- STR 30% INT 30% | Magical
    sets.precast.WS["Cataclysm"] = dark_magic_int_ws
    
    -- INT 85% | Physical
    sets.precast.WS["Shattersoul"] = physical_int_ws

    -- MND 80% | Magical
    sets.precast.WS["Omniscience"] = dark_magic_mnd_ws

    -- MAX MP
    sets.precast.WS["Myrkr"] = {
        head="Pixie Hairpin +1",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        neck="Sanctity necklace",
        body="Pedagogy gown +3",
        hands="Kaykaus cuffs",
        ring1="Mephitas's ring +1",
        ring2="Persis ring",
        waist="Luminary sash",
        legs="Pedagogy pants +3",
        feet="Kaykaus boots"
    }

    -- Midcast Sets

    sets.midcast.Cure = set_combine(sets.precast.FC, {
        main="Musa", -- 25% cure | 10% fc
        -- head="Vanya hood", -- 10% cure | haste: 6%
        body="Pinga tunic +1", -- 15% cure | 15% fc
        hands="Pedagogy bracers +3", -- 3% cure II | 3% haste
        back=cure_cape, -- 10% fc
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Defending ring",
        legs="Academic's pants +3", -- 8% cure | 
        -- legs="Pinga pants +1",
        feet="Pedagogy loafers +3"
    })

    sets.midcast.Cursna = {
        neck="Debilis Medallion",
        body="Pedagogy gown +3",
        hands="Pedagogy bracers +3",
        ring1="Haoma's ring",
        ring2="Menelaus's ring",
        feet="Gendewitha Galoshes +1"
    }

    sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {
        waist="Hachirin-no-obi"
    })

    sets.midcast.Curaga = sets.midcast.Cure

    local midcast_enhancing_duration = {
        main="Musa",
        ammo="Staunch tathlum +3",
        head="Telchine cap",
        neck="Loricate torque +1",
        ear2="Magnetic earring",
        ring1="Freke ring",
        ring2="Defending ring",
        body="Telchine chasuble",
        hands="Telchine gloves",
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    }

    sets.midcast.Regen = set_combine(midcast_enhancing_duration, {
        head="Arbatel bonnet +3"
    })

    sets.midcast['Enhancing Magic'] = set_combine(midcast_enhancing_duration, {
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Pedagogy gown +3",
        hands="Telchine gloves",
        waist="Embla sash",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"}
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])

    sets.midcast.Storm = set_combine(midcast_enhancing_duration, {feet="Pedagogy Loafers +3"})

    local enfeebles = {
        main="Musa",
        ammo="Hydrocera",
        head="Academic's mortarboard +3",
        neck="Argute stole +2",
        ear1="Dignitary's earring",
        ear2="Malignance earring",
        body="Academic's gown +3",
        hands="Regal cuffs",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Kishar ring",
        back=nuke_cape,
        waist="Obstinate sash",
        legs="Arbatel pants +3",
        feet="Academic's loafers +3"
    }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(enfeebles, {
        back = mnd_enfeeble_cape
    })

    sets.midcast.IntEnfeebles = set_combine(enfeebles, {
        ring1="Medada's ring",
        back = int_enfeeble_cape
    })

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {
        head='Pixie hairpin +1',
        neck="Erra pendant",
        ear1="Regal earring",
        eart2="Malignance earring",
        body="Academic's gown +3",
        hands="Arbatel bracers +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=nuke_cape,
        waist="Acuity belt +1",
        legs="Arbatel pants +3",
        feet="Arbatel loafers +3"
    }

    sets.midcast.Kaustra = {
        main={ name="Bunzi's Rod", augments={'Path: A'}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Arbatel Bonnet +3",
        body={ name="Agwu's Robe", augments={'Path: A',}},
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Arbatel Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Slipor Sash",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Warp Ring",
        right_ring="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}},
    }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        ring1="Excelsis ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
        legs="Pedagogy pants +3",
        feet="Agwu's pigaches"
    })

    sets.midcast.Aspir = sets.midcast.Drain

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
        main="Tupsimati",
        sub="Enki strap",
        ammo="Pemphredo tathlum",
        head="Arbatel bonnet +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Arbatel gown +3",
        hands="Arbatel bracers +3",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back=nuke_cape,
        waist="Sacro cord",
        legs="Arbatel pants +3",
        feet="Arbatel loafers +3"
    }

    sets.midcast['Elemental Magic'].Occult = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Seraphic ampulla",
        head="Mallquis chapeau +2",
        neck="Combatant's torque",
        ear1="Dedition earring",
        ear2="Crepuscular earring",
        hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+23','"Occult Acumen"+10','Mag. Acc.+3'}},
        ring1={name="Chirich Ring +1", bag="wardrobe5"},
        ring2={name="Chirich Ring +1", bag="wardrobe6"},
        back={name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Store TP"+10','Spell interruption rate down-10%'}},
        waist="Oneiros rope",
        legs="Perdition slops",
        feet={ name="Merlinic Crackows", augments={'"Occult Acumen"+11','Mag. Acc.+15'}}
    })

    sets.WeakImmanence = {
        main="Malignance pole",
        sub="Khonsu",
        ammo="Incantor Stone",
        head="Pedagogy mortarboard +3",
        neck="Voltsurge Torque",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        body="Shango Robe",
        hands="Academic's bracers +3",
        ring1="Medada's ring",
        ring2="Kishar Ring",        
        back=idle_cape,
        waist="Embla sash",
        legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13'}},
        feet="Academic's loafers +3"
    }

    sets.midcast.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        main="Bunzi's rod",
        sub="Ammurapi shield",
        head="Agwu's cap", --MB2: 4
        neck="Argute stole +2", --MB: 7
        body="Agwu's robe", --MB: 10
        hands="Agwu's gages", --MB2: 5
        legs="Agwu's slops", --MB: 9
        feet="Arbatel loafers +3",
        -- feet="Agwu's pigaches", --MB: 6
        ring2="Mujin band" --MB2: 5
    })

    sets.midcast['Elemental Magic'].Helix = set_combine(sets.midcast.MagicBurst, {
        sub="Culminus",
        ammo="Ghastly tathlum +1",
        waist="Acuity belt +1"
    })

    sets.midcast.Impact = set_combine(sets.midcast.IntEnfeebles, {
        head=empty,
        ring2="Archon ring",
        body='Crepuscular cloak'
    })

    sets.Kiting = {
        ring2="Shneddick ring +1",
        feet="Hippomenes socks +1"
    }
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Nyame helm",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Pedagogy gown +3",
        hands="Gazu bracelets +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        waist="Grunfeld rope",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        back={ name="Lugh's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15'}}
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {
        head="Nyame helm",
        body="Nyame mail",
        hands="Arbatel Bracers +3"        
    }
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +3"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +3"}

    sets.buff['Klimaform'] = {feet="Arbatel loafers +3"}
    sets.buff['Focalization'] = {head="Pedagogy mortarboard +3"}

    sets.buff.FullSublimation = {head="Academic's mortarboard +3", body="Pedagogy gown +3", waist="Embla sash"}
    sets.buff.PDTSublimation = {head="Academic's mortarboard +3", body="Pedagogy gown +3", waist="Embla sash"}

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

    sets.idle = {
        main="Malignance Pole",
        ammo="Homiliary",
        head="Arbatel bonnet +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Arbatel gown +3",
        hands="Agwu's gages",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=idle_cape,
        waist="Slipor sash",
        legs="Assiduity pants +1",
        feet="Arbatel loafers +3"
    }

    sets.defense.PDT = set_combine(sets.idle, {
        head="Arbatel bonnet +3",
        body="Arbatel gown +3",
        -- right_ring="Vengeful ring",
        legs="Arbatel pants +3"
    })

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
    coroutine.schedule(lockstyle,8)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if state.MagicBurst.value and spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' and spell.english ~= 'Impact' then
            if spellMap ~= 'Helix' then
                equip(sets.midcast.magic_burst)
            elseif spellMap == 'Helix' then
                equip(sets.midcast['Elemental Magic'].Helix)
            end
        end
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)        

        local obi_or_orpheus = obi_or_orpheus(spell)
        if obi_or_orpheus then
            equip({waist=obi_or_orpheus})
        end

        if state.UseWeakNukes.value then
            if state.WeakStratMode.value == 'DuringImmanence' and state.Buff.Immanence then
                equip(sets.WeakNuke)
            elseif state.WeakStratMode.value == 'FullTime' then
                equip(sets.WeakNuke)
            end
        end

    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    -- print(state.EatTp.value)
    if state.EatTp.value then
        idleSet = set_combine(idleSet, {neck='Chrysopoeia torque'})
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_active_strategems()
    update_sublimation()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end

function lockstyle()
    if player.main_job == 'SCH' then send_command('@input /lockstyleset 6') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end