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

    state.CombatWeapon:set('MalignancePole')

    state.MalignancePole = M{['description']='Malignance Pole Set', 'Khonsu', 'Irenic'}
    state.Tupsimati = M{['description']='Tupsimati Set', 'Khonsu', 'Enki'}
    state.Musa = M{['description']='Musa Set', 'Khonsu', 'Enki'}
    state.Slaine = M{['description']='Slaine Set', 'Khonsu', 'Enki'}
    

    send_command('bind ^` gs c toggle MagicBurst')
    send_command('bind !` gs c toggle EatTp')
    send_command('bind ~f7 gs c cycle WeakStratMode')

    send_command('bind ~f1 gs c set CombatWeapon MalignancePole')
    send_command('bind ~f2 gs c set CombatWeapon Tupsimati')
    send_command('bind ~f3 gs c set CombatWeapon Musa')
    send_command('bind ~f4 gs c set CombatWeapon Slaine')
    
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
    send_command('unbind ~f7') 
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    local hybrid_cape = { name="Lugh's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Fast Cast"+10','Mag. Evasion+15'}}
    local pdt_cape = { name="Lugh's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Fast Cast"+10','DEF+50',}}
    local mdt_cape =  { name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Fast Cast"+10','Mag. Evasion+15'}}
    local nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local cure_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local mnd_magic_ws = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local int_magic_ws = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%'}}
    local ws_boots = { name="Merlinic Crackows", augments={'Attack+25','Crit.hit rate+3','Weapon skill damage +10%','Mag. Acc.+16 "Mag.Atk.Bns."+16'}}

    local fc_cape = hybrid_cape

    local chironic_refresh_legs = { name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}

    sets.MalignancePole = {main="Malignance pole", sub="Khonsu"}
    sets.MalignancePole.Khonsu = {main="Malignance pole", sub="Khonsu"}
    sets.MalignancePole.Irenic = {main="Malignance pole", sub="Irenic strap +1"}

    sets.Tupsimati = {main="Tupsimati", sub="Khonsu"}
    sets.Tupsimati.Khonsu = {main="Tupsimati", sub="Khonsu"}
    sets.Tupsimati.Enki = {main="Tupsimati", sub="Enki strap"}

    sets.Musa = {main="Musa", sub="Khonsu"}
    sets.Musa.Khonsu = {main="Musa", sub="Khonsu"}
    sets.Musa.Enki = {main="Musa", sub="Enki strap"}

    sets.Slaine = {main="Slaine", sub="Khonsu"}
    sets.Slaine.Khonsu = {main="Slaine", sub="Khonsu"}
    sets.Slaine.Enki = {main="Slaine", sub="Enki strap"}
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
        ear1="Malignance earring", --fast cast 4%
        ear2="Etiolation earring", --fast cast 1%        
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

    local dark_magic_affinity = {head="Pixie hairpin +1", ring2="Archon ring"}
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
        sub="Khonsu",
        -- head="Vanya hood", -- 10% cure | haste: 6%
        ear2="Arbatel earring +1",
        body="Pinga tunic +1", -- 15% cure | 15% fc
        hands="Pedagogy bracers +3", -- 3% cure II | 3% haste
        back=cure_cape, -- 10% fc
        ring1="Persis ring",
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
        ammo="Staunch tathlum +1",
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

    sets.midcast['Enfeebling Magic'] = {
        main="Contemplator +1",
        sub="Enki strap",
        ammo="Hydrocera",
        head="Academic's mortarboard +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Arbatel gown +3",
        hands="Regal cuffs",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Kishar ring",
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Arbatel pants +3",
        feet="Academic's loafers +3"
    }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        hands='Arbatel bracers +3',
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        ammo="Ghastly tathlum +1",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        waist="Acuity belt +1",
    })

    sets.midcast.MaccEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        sub="Khonsu",
        ammo="Pemphredo tathlum",
        hands="Arbatel bracers +3",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        waist="Acuity belt +1",
        feet="Arbatel loafers +3",
    })

    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo tathlum",
        head='Pixie hairpin +1',
        neck="Erra pendant",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Academic's gown +3",
        hands="Arbatel bracers +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Archon ring",
        back=nuke_cape,
        waist="Acuity belt +1",
        legs="Arbatel pants +3",
        feet="Arbatel loafers +3"
    }

    sets.midcast.Dia = sets.midcast.enfeebling
    sets.midcast.Bio = sets.midcast['Dark Magic']
    sets.midcast.Slow = sets.midcast.MndEnfeebles
    sets.midcast.Paralyze = sets.midcast.MndEnfeebles
    sets.midcast.Addle = sets.midcast.MndEnfeebles
    sets.midcast.Distract = sets.midcast.MndEnfeebles
    sets.midcast.Frazzle = sets.midcast.MndEnfeebles
    sets.midcast.Sleep = sets.midcast.IntEnfeebles
    sets.midcast.Blind = sets.midcast.IntEnfeebles
    sets.midcast.Silence = sets.midcast.MaccEnfeebles
    sets.midcast.Inundation = sets.midcast.MaccEnfeebles
    sets.midcast.Dispel = sets.midcast.MaccEnfeebles
    sets.midcast.Gravity = sets.midcast.MaccEnfeebles
    sets.midcast.Break = sets.midcast.MaccEnfeebles
    sets.midcast.Bind = sets.midcast.MaccEnfeebles
    sets.midcast.Poison = sets.midcast.MaccEnfeebles
    sets.midcast.Stun = sets.midcast.MaccEnfeebles

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast.Kaustra = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Arbatel bonnet +3",
        neck="Argute Stole +2",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        back=nuke_cape,
        waist="Sacro cord",
        legs="Agwu's Slops",
        feet="Arbatel Loafers +3"        
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

    sets.midcast.Absorb =  {
        main="Musa",
        sub="Khonsu",
        ammo="Pemphredo Tathlum",
        head="Pixie hairpin +1",
        body="Acad. Gown +3",
        hands="Acad. Bracers +3",
        legs="Acad. Pants +3",
        feet="Acad. Loafers +3",
        neck="Argute Stole +2",
        waist="Sacro cord",
        ear1="Regal Earring",
        ear2="Malignance Earring",        
        ring1="Medada's ring",
        ring2="Archon ring",
        back="Aurist's cape +1"
    }

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

    sets.WeakNuke = {
        main="Malignance pole",
        sub="Khonsu",
        ammo="Incantor Stone",
        head="Pedagogy mortarboard +3",
        neck="Bathy choker +1",
        ear1="Dignitary's earring",
        ear2="Loquac. Earring",
        body="Pinga tunic +1",
        hands="Academic's bracers +3",
        ring1={name="Chirich Ring +1", bag="wardrobe5"},
        ring2={name="Chirich Ring +1", bag="wardrobe6"},
        back=idle_cape,
        waist="Embla sash",
        legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13'}},
        feet="Academic's loafers +3"
    }

    sets.midcast.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        main="Wizard's rod",
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


    sets.midcast['Enfeebling Magic'] = {
        main="Contemplator +1",
        sub="Enki strap",
        ammo="Hydrocera",
        head="Academic's mortarboard +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Arbatel gown +3",
        hands="Regal cuffs",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Kishar ring",
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Arbatel pants +3",
        feet="Academic's loafers +3"
    }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        hands='Arbatel bracers +3',
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        ammo="Ghastly tathlum +1",
        ring1="Medada's ring",
        ring2="Metamorph ring +1",
        waist="Acuity belt +1",
    })

    sets.midcast.Holy = {
        main="Daybreak",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Agwu's cap",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Arbatel earring +1",
        body="Agwu's robe",
        hands="Agwu's gages",
        ring1="Medada's ring",
        ring2="Freke ring",
        back=fast_cast_cape,
        waist="Orpheus's sash",
        legs="Agwu's slops",
        feet="Agwu's pigaches"
    }

    sets.midcast.Banish = {
        main="Daybreak",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ipoca beret",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Arbatel earring +1",
        body="Arbatel gown +3",
        hands="Arbatel bracers +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Arbatel pants +3",
        feet="Academic's loafers +3"
    }

    sets.midcast.Banish.Resistant = set_combine(sets.midcast.Banish, {
        head="Arbatel bonnet +3"
    })

    sets.midcast.Banishga = sets.midcast.Banish

    sets.midcast.Banishga.Resistant = sets.midcast.Banish.Resistant

    sets.midcast.Impact = {
        main="Tupsimati",
        sub="Khonsu",
        ammo="Pemphredo tathlum",
        head=empty,
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body='Crepuscular cloak',
        hands="Arbatel bracers +3",
        ring1="Medada's ring",
        ring2="Archon ring",
        back="Aurist's cape +1",
        waist="Acuity belt +1",
        legs="Arbatel pants +3",
        feet="Academic's loafers +3"
    }

    sets.midcast["Dispelga"] = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak"})

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
    sets.buff['Dark Arts'] = {body="Academic's gown +3"}
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
        ammo="Homiliary",
        head="Arbatel bonnet +3",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Arete del Luna +1",
        body="Arbatel gown +3",
        hands="Agwu's gages",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=hybrid_cape,
        waist="Platinum moogle belt",
        legs="Assiduity pants +1",
        feet="Arbatel loafers +3"
    }

    sets.defense.PDT = {
        ammo="Staunch tathlum +1",
        head="Nyame helm",
        neck="Loricate torque +1",
        ear1="Ran earring",
        ear2="Lugalbanda earring",
        body="Adamantite armor",
        hands="Nyame gauntlets",
        ring1="Mephitas's ring +1",
        ring2="Shadow ring",
        back=pdt_cape,
        waist="Austerity belt +1",
        legs="Agwu's slops",
        feet="Nyame sollerets"
    }

    -- 1348 def
    -- 56 mdb 777 meva
    -- 48 dt
    sets.defense.MDT = {
        ammo="Staunch tathlum +1",
        head="Arbatel bonnet +3", -- 10 mdb 136 meva
        neck="Warder's charm +1",
        ear1="Lugalbanda earring",
        ear2="Sanare earring", -- 4 mdb 6 meva
        body="Adamantite armor",
        hands="Arbatel bracers +3", -- 7 mdb 98 meva
        ring1={name="Vexer ring +1", bag="wardrobe5"}, --4 mdb
        ring2="Shadow ring",
        back=mdt_cape, --30 meva
        waist="Platinum moogle belt", -- 15 meva
        legs="Arbatel pants +3", -- 10 mdb 168 meva
        feet="Arbatel loafers +3" --10 mdb 168 meva
    }

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
                equip(sets.midcast.MagicBurst)
            elseif spellMap == 'Helix' then
                equip(sets.midcast['Elemental Magic'].Helix)
            end
        end
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)        

        local obi_or_orpheus = obi_or_orpheus(spell)
        if obi_or_orpheus then
            equip({waist=obi_or_orpheus})
        end

        if spell.skill == 'Elemental Magic' and state.WeakStratMode.value == 'DuringImmanence' and state.Buff.Immanence then
            equip(sets.WeakNuke)
        elseif spell.skill == 'Elemental Magic' and state.WeakStratMode.value == 'FullTime' then
            equip(sets.WeakNuke)
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
    -- print('buff: ' .. buff .. ' gain: ' .. tostring(gain))
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
    state.Buff['Dark Arts'] = buffactive['Dark Arts'] or false

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

    -- print_set(spell)
    -- print(buffactive['Dark Arts'])
    if spell.type == 'BlackMagic' and spell.skill == 'Enfeebling Magic' and (state.Buff['Dark Arts'] or state.Buff['Addendum: Black']) then
        equip(sets.buff['Dark Arts'])
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

function display_current_job_state(eventArgs)

end