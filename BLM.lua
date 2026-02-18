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
    state.CastingMode:options('Normal', 'Occult Acumen', 'DT', 'MB Low Int', 'MB High Int')
    state.IdleMode:options('Normal', "Death")
    
    state.MagicBurst = M(false, 'Magic Burst')
    state.EatTp = M(false, 'Eat TP')
    state.UseObi = M(true, 'Use Obi')
    state.LockMpReturn = M(false, 'Lock MP Return')
    state.CombatWeapon:set('Laevateinn')
    
    state.Laevateinn = M{['description']='Laevateinn Set', 'Khonsu', 'Enki'}
    state.Kaumodaki = M{['description']='Kaumodaki Set', 'Khonsu', 'Enki'}
    state.WizardRod = M{['description']='Wizard Rod Set', 'Ammurapi', 'Genmei'}
    state.Khatvanga = M{['description']='Khatvanga Set', 'Khonsu', 'Enki'}
    state.Drepanum = M{['description']='Drepanum Set', 'Khonsu', 'Enki'}
    state.Bunzi = M{['description']='Bunzi rod Set', 'Ammurapi', 'Genmei'}
    state.Opashoro = M{['description']='Drepanum Set', 'Khonsu', 'Enki'}
    state.Marin = M{['description']='Marin staff Set', 'Khonsu', 'Enki'}

    -- Additional local binds
    send_command('bind ^` gs c toggle MagicBurst')
    send_command('bind !` gs c toggle EatTp')
    send_command('bind @` gs c toggle UseObi')
    send_command('bind ^f8 gs c toggle LockMpReturn')
    send_command('bind ~f1 gs c set CombatWeapon Laevateinn')
    send_command('bind ~f2 gs c set CombatWeapon Kaumodaki')
    send_command('bind ~f3 gs c set CombatWeapon WizardRod')
    send_command('bind ~f4 gs c set CombatWeapon Khatvanga')
    send_command('bind ~f5 gs c set CombatWeapon Drepanum')
    send_command('bind ~f6 gs c set CombatWeapon Bunzi')
    send_command('bind ~f7 gs c set CombatWeapon Opashoro')
    send_command('bind ~f8 gs c set CombatWeapon Marin')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
    send_command('unbind ^f8')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
    send_command('unbind ~f5')
    send_command('unbind ~f6')
    send_command('unbind ~f7')
    send_command('unbind ~f8')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.Laevateinn = {}
    sets.Laevateinn.Khonsu = {main="Laevateinn", sub="Khonsu"}
    sets.Laevateinn.Enki = {main="Laevateinn", sub="Enki strap"}

    sets.Kaumodaki = {}
    sets.Kaumodaki.Khonsu = {main="Kaumodaki", sub="Khonsu"}
    sets.Kaumodaki.Enki = {main="Kaumodaki", sub="Enki strap"}

    sets.WizardRod = {}
    sets.WizardRod.Ammurapi = {main="Wizard's rod", sub="Ammurapi shield"}
    sets.WizardRod.Genmei = {main="Wizard's rod", sub="Genmei shield"}

    sets.Khatvanga = {}
    sets.Khatvanga.Khonsu = {main="Khatvanga", sub="Khonsu"}
    sets.Khatvanga.Enki = {main="Khatvanga", sub="Enki strap"}

    sets.Drepanum = {}
    sets.Drepanum.Khonsu = {main="Drepanum", sub="Khonsu"}
    sets.Drepanum.Enki = {main="Drepanum", sub="Enki strap"}

    sets.Bunzi = {}
    sets.Bunzi.Ammurapi = {main="Bunzi's rod", sub="Ammurapi shield"}
    sets.Bunzi.Genmei = {main="Bunzi's rod", sub="Genmei shield"}

    sets.Opashoro = {}
    sets.Opashoro.Khonsu = {main="Opashoro", sub="Khonsu"}
    sets.Opashoro.Enki = {main="Opashoro", sub="Enki strap"}

    sets.Marin = {}
    sets.Marin.Khonsu = {main="Marin staff +1", sub="Khonsu"}
    sets.Marin.Enki = {main="Marin staff +1", sub="Enki strap"}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    local magic_atk_cape = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local idle_cape = { name="Taranus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Phys. dmg. taken-10%'}}
    local idle_mdt_cape = { name="Taranus's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Fast Cast"+10','Mag. Evasion+15'}}
    local magic_int_ws = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%'}}
    local death_cape = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local ws_boots = { name="Merlinic Crackows", augments={'Attack+25','Crit.hit rate+3','Weapon skill damage +10%','Mag. Acc.+16 "Mag.Atk.Bns."+16'}}
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = { feet = "Wicce sabots +3" }

    sets.precast.JA.Manafont = { body = "Archmage's coat +3"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
        head="Merlinic hood", --fast cast 8%
        neck="Unmoving collar +1",
        body="Agwu's robe", --fast cast 8%
        hands="Agwu's gages", --fast cast 6%
        legs="Lengo pants",
        feet="Merlinic crackows", --fast cast 5%
        waist="Embla sash", --fast cast 5%
        ear1="Malignance earring", --fast cast 4%
        ear2="Loquacious Earring", --fast cast 2%
        ring1="Medada's Ring", --fast cast 10%
        ring2="Kishar ring" --fast cast 4%
    } 

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        head="Wicce petasos +3",
        ear2="Barkarole earring",
        ring1="Mallquis Ring",
        legs="Mallquis trews +2",
        feet="Spaekona's sabots +3"
    })

    sets.precast.FC['Impact'] = set_combine(sets.precast.FC, {
        head=empty,
        body='Crepuscular cloak'
    })

    sets.precast.FC["Dispelga"] = set_combine(sets.precast.FC, {main="Daybreak"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC)

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    local physical_int_ws = {
        head="Archmage's petasos +3",
        neck="Sorcerer's stole +2",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Archmage's coat +3",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",  
        back=magic_int_ws,
        waist="Fotia belt",
        legs="Archmage's tonban +3",
        feet=ws_boots
    }

    local magical_int_ws = {
        head="Archmage's petasos +3",
        neck="Sorcerer's stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Archmage's coat +3",
        hands="Jhakri cuffs +2",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",        
        back=magic_int_ws,
        waist="Orpheus's sash",
        legs="Archmage's tonban +3",
        feet=ws_boots
    }

    local dark_magic_affinity = {head="Pixie hairpin +1", ring2="Archon ring"}
    local dark_magic_int_ws = set_combine(magical_int_ws, dark_magic_affinity)

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = magical_int_ws

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- STR 40% | Physical
    sets.precast.WS["Heavy Swing"] = physical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.precast.WS["Rock Crusher"] = set_combine(magical_int_ws, {
        neck="Quanpur necklace"
    })
    
    -- STR 40% INT 40% | Magical
    sets.precast.WS["Earth Crusher"] = set_combine(magical_int_ws, {
        neck="Quanpur necklace"
    })
    
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
    
    -- INT 85% | Physical
    sets.precast.WS["Shattersoul"] = physical_int_ws

    -- STR 30% INT 30% | Magical
    sets.precast.WS["Cataclysm"] = set_combine(dark_magic_int_ws, {
        -- legs="Jhakri slops +2",
        -- feet="Jhakri pigaches +2"
        -- hands="Archmage's gloves +3"
        -- head="Archmage's petasos +3",
        -- ring1="Metamorph ring +1"
        -- neck="Fotia gorget"
        -- belt="Fotia belt"
    })

    -- INT 80%  | Magical
    sets.precast.WS["Vidohunir"] = dark_magic_int_ws

    -- MAX MP
    sets.precast.WS["Myrkr"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        neck="Sanctity necklace",
        body="Spaekona's coat +4",
        hands="Spaekona's gloves +3",
        ring1="Mephitas's ring +1",
        ring2="Metamorph ring +1",
        back=death_cape,
        waist="Luminary sash",
        legs="Spaekona's tonban +3",
        feet="Spaekona's sabots +3"
    }
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
        head = "Vanya hood",
        neck="Incanter's torque",
        body = "Vrikodara jupon",
        hands = "Telchine gloves",
        ring1 = "Haoma's ring",
        ring2 = "Menelaus's ring",
        back = "Solemnity cape",
        waist = "Embla sash",
        legs = "Gyve trousers",
        feet = "Medium's sabots"
    })

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head="Telchine cap",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Telchine chasuble",
        hands="Telchine gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    }
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])

    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo tathlum",
        head = "Spaekona's petasos +3",
        neck = "Sorcerer's stole +2",
        left_ear = "Regal earring",
        right_ear="Malignance earring",
        body = "Spaekona's coat +4",
        hands= "Regal cuffs",
        ring1="Medada's ring",
        ring2="Kishar Ring",
        back="Aurist's cape +1",
        waist="Luminary Sash",
        legs="Spaekona's tonban +3",
        feet="Spaekona's sabots +3"
    }
        
    sets.midcast.ElementalEnfeeble = {
        ammo="Pemphredo tathlum",
        head="Wicce petasos +3",
        body="Spaekona's coat +4",
        hands="Spae. Gloves +3",
        legs="Arch. Tonban +3",
        feet="Archmage's sabots +3",
        neck="Src. Stole +2",
        waist="Acuity belt +1",
        ear1="Regal Earring",
        ear2="Malignance earring",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back="Aurist's cape +1"
    }

    sets.midcast['Dark Magic'] = {
        main="Laevateinn",
        sub="Khonsu",
        ammo="Pemphredo Tathlum",
        head="Wicce petasos +3",
        body="Wicce coat +3",
        hands="Archmage's gloves +3",
        legs="Spaekona's tonban +3",
        feet="Wicce sabots +3",
        neck="Erra Pendant",
        waist="Acuity belt +1",
        ear1="Regal Earring",
        ear2="Malignance earring",
        ring1="Archon ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=magic_atk_cape,
    }

    sets.midcast.Absorb = sets.midcast['Dark Magic']

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        legs="Spaekona's tonban +3",
        feet="Agwu's pigaches"
    })
    
    sets.midcast.Aspir = set_combine(sets.midcast.Drain, {
        feet="Archmage's sabots +3"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], { 
        hands="Regal cuffs"
    })

    -- sets.midcast.Stun = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
    --     head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo tathlum",
        head="Wicce petasos +3",
        body="Wicce coat +3",
        hands="Wicce gloves +3",
        legs="Wicce chausses +3",
        feet="Archmage's sabots +3",
        neck="Sorcerer's stole +2",
        waist="Acuity belt +1",
        ear1="Malignance earring",
        ear2="Regal earring",
        left_ring="Medada's ring",
        right_ring="Freke ring",
        back=magic_atk_cape,
    }

    sets.midcast['Elemental Magic'].JaSpell = set_combine(sets.midcast['Elemental Magic'], {
        legs="Wicce chausses +3"
    })

    sets.midcast['Elemental Magic'].AncientMagic = set_combine(sets.midcast['Elemental Magic'], {
        head = "Archmage's petasos +3"
   })

   local deathSet = set_combine(sets.midcast['Elemental Magic'], {
        head="Pixie hairpin +1",
        ring2="Archon ring",
        back=death_cape,
        feet="Wicce sabots +3"
    })

    sets.precast['Death'] = deathSet
    sets.midcast['Death'] = deathSet

    sets.midcast.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        main="Wizard's rod",
        sub="Ammurapi shield",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1", --MB: 7 MB2: 7
        neck="Sorcerer's stole +2", --MB: 10
        body="Wicce coat +3", --MB2: 5
        hands="Agwu's gages", --MB: 8 MB2: 5
        legs="Ea slops +1", --MB: 8 MB2: 8
        feet="Agwu's pigaches", --MB: 6
        right_ring="Metamorph ring +1",
        back=magic_atk_cape --MB 5
    })

    sets.midcast['Elemental Magic']['MB Low Int'] = set_combine(sets.midcast['Elemental Magic'], {
        main="Wizard's rod",
        sub="Ammurapi shield",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1", --MB: 7 MB2: 7
        neck="Sorcerer's stole +2", --MB: 10
        body="Wicce coat +3", --MB2: 5
        hands="Agwu's gages", --MB: 8 MB2: 5
        waist="Sacro cord",
        legs="Ea slops +1", --MB: 8 MB2: 8
        feet="Agwu's pigaches", --MB: 6
        right_ring="Freke ring",
        back=magic_atk_cape --MB 5
    })

    sets.midcast['Elemental Magic']['MB High Int'] = set_combine(sets.midcast['Elemental Magic'], {
        main="Wizard's rod",
        sub="Ammurapi shield",
        ammo="Ghastly tathlum +1",
        head="Ea hat +1", --MB: 7 MB2: 7
        neck="Sorcerer's stole +2", --MB: 10
        body="Wicce coat +3", --MB2: 5
        hands="Agwu's gages", --MB: 8 MB2: 5
        legs="Ea slops +1", --MB: 8 MB2: 8
        feet="Agwu's pigaches", --MB: 6
        right_ring="Metamorph ring +1",
        back=magic_atk_cape --MB 5
    })

    sets.midcast['Elemental Magic']['DT'] = set_combine(sets.midcast['Elemental Magic'], {
        head="Wicce petasos +3", --MB: 7 MB2: 7
        neck="Sorcerer's stole +2", --MB: 10
        body="Wicce coat +3", --MB2: 5
        hands="Wicce gloves +3", --MB: 8 MB2: 5
        legs="Wicce chausses +3", --MB: 8 MB2: 8
        feet="Wicce sabots +3", --MB: 6
        back=magic_atk_cape --MB 5
    })

    sets.midcast['Elemental Magic']['Occult Acumen'] = set_combine(sets.midcast['Elemental Magic'], {
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

    sets.midcast['Comet'] = set_combine(sets.midcast['Elemental Magic'], {
        head="Pixie hairpin +1",
        ring2="Archon ring",
    })

    sets.midcast['Meteor'] = sets.midcast['Comet']

    sets.midcast['Impact'] = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        neck="Null loop",
        ear1="Crepuscular earring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        body="Crepuscular cloak",
        back="Null shawl",
        waist="Null belt",
        feet="wicce sabots +3"
    })

    sets.midcast["Dispelga"] = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak"})
    
    -- Idle sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Ran Earring",
        ear2="Lugalbanda earring",
        body="Adamantite armor",
        hands="Nyame Gauntlets",
        ring1="Shadow Ring",
        ring2="Shneddick Ring +1",        
        back=idle_cape,
        waist="Acuity belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.defense.MDT = {
        ammo="Staunch Tathlum +1",
        head="Wicce Petasos +3",
        neck="Loricate Torque +1",
        ear1="Sanare Earring",
        ear2="Lugalbanda Earring",
        body="Adamantite armor",
        hands="Wicce Gloves +3",
        ring1="Shadow ring",
        ring2={name="Vexer ring +1", bag="wardrobe6"}, --4 mdb  
        back=idle_mdt_cape,
        waist="Acuity belt +1",
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3"
    }

    -- Normal refresh idle set
    sets.idle = set_combine(sets.defense.PDT, {
        ammo="Staunch tathlum +1",
        head="Befouled crown",
        ear2="Lugalbanda earring",
        body="Shamash robe",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs="Assiduity pants +1"
    })

    sets.idle["Death"] = deathSet

    sets.Kiting = {
        ring2="Shneddick ring +1",
        feet="Hippomenes socks +1"
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = { feet = "Wicce sabots +3" }

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
        body="Nyame mail",
        hands="Gazu bracelets +1",
        ring1={name="Chirich Ring +1", bag="wardrobe5"},
        ring2={name="Chirich Ring +1", bag="wardrobe6"},
        waist="Grunfeld rope",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15'}},
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

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- if spellMap == 'Cure' or spellMap == 'Curaga' then
    --     gear.default.obi_waist = "Goading Belt"
    -- elseif spell.skill == 'Elemental Magic' then
    --     gear.default.obi_waist = "Sekhmet Corset"
    --     if state.CastingMode.value == 'Proc' then
    --         classes.CustomClass = 'Proc'
    --     end
    -- end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
        if state.MagicBurst.value then
            equip(sets.midcast.MagicBurst)
        end
        if player.mp < 400 or state.LockMpReturn.value then
            equip({body="Spaekona's coat +4"})
        end
        if state.UseObi.value then
            local obi_or_orpheus = obi_or_orpheus(spell)
            if obi_or_orpheus then
                equip({waist=obi_or_orpheus})
            end
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
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
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

function customize_idle_set(idleSet)
    if state.EatTp.value then
        idleSet = set_combine(idleSet, {neck='Chrysopoeia torque'})
    end

    return idleSet
end

-- Handle notifications of general user state change.
function job_state_change(descrip, newVal, oldVal)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)

end

function lockstyle()
    if player.main_job == 'BLM' then send_command('@input /lockstyleset 1') end
end

function job_sub_job_change(newSubjob, oldSubjob)
    coroutine.schedule(lockstyle,8)
end

function display_current_job_state(eventArgs)

end