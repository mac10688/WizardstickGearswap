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
    state.IdleMode:options('Normal', 'Refresh')
    state.CureMode = M{['description']='Cure Set', 'Pure', 'SIRD'}

    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false

    state.CombatWeapon:set('Daybreak')
    state.CombatMode:options('SwordShield', 'DualWield')

    state.Daybreak = {}
    state.Daybreak.DualWield = M{['description']='Daybreak Set', 'TP', 'Acc'}
    state.Daybreak.SwordShield = M{['description']='Daybreak Set', 'Genmei', 'Ammurapi'}  

    state.Yagrush = {}
    state.Yagrush.DualWield = M{['description']='Yagrush Set', 'TP', 'Acc'}
    state.Yagrush.SwordShield = M{['description']='Yagrush Set', 'Genmei', 'Ammurapi'}

    state.Maxentius = {}
    state.Maxentius.DualWield = M{['description']='Maxentius Set', 'TP', 'Acc'}
    state.Maxentius.SwordShield = M{['description']='Maxentius Set', 'Genmei', 'Ammurapi'}

    state.Raetic = {}
    state.Raetic.DualWield = M{['description']='Raetic Set', 'TP', 'Acc'}
    state.Raetic.SwordShield = M{['description']='Raetic Set', 'Genmei', 'Ammurapi'}

    state.Lorg = {}
    state.Lorg.DualWield = M{['description']='Lorg Mor Set', 'TP', 'Acc'}
    state.Lorg.SwordShield = M{['description']='Lorg Mor Set', 'Genmei', 'Ammurapi'}

    send_command('bind ^` gs c cycle CureMode')
    send_command('bind ~f1 gs c set CombatWeapon Daybreak')
    send_command('bind ~f2 gs c set CombatWeapon Yagrush') 
    send_command('bind ~f3 gs c set CombatWeapon Maxentius')
    send_command('bind ~f4 gs c set CombatWeapon Raetic')
    send_command('bind ~f5 gs c set CombatWeapon Lorg')

    send_command('bind ^Numpad1 input /ws "Mystic Boon" <t>')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
    send_command('unbind ~f5')
    send_command('unbind ^Numpad1')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    local fastcast_cape = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Def+50'}}
    local attack_cape = { name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15'}}
    local physical_mnd_ws_cape = { name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local idle_hybrid_cape = { name="Alaunus's Cape", augments={'VIT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','DEF+50'}}
    local idle_pdt_cape = { name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Fast Cast"+10','DEF+50'}}
    local idle_mdt_cape = { name="Alaunus's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Fast Cast"+10','Mag. Evasion+15'}}
    local enmity_cape = { name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50'}}
    
    sets.Daybreak = {}
    sets.Daybreak.DualWield = {}
    sets.Daybreak.DualWield.TP = {main="Daybreak", sub="Tishtrya"}
    sets.Daybreak.DualWield.Acc = {main="Daybreak", sub="Bunzi's rod"}
    sets.Daybreak.SwordShield = {}
    sets.Daybreak.SwordShield.Genmei = {main="Daybreak", sub="Genmei shield"}
    sets.Daybreak.SwordShield.Ammurapi = {main="Daybreak", sub="Ammurapi shield"}

    sets.Yagrush = {}
    sets.Yagrush.DualWield = {}
    sets.Yagrush.DualWield.TP = {main="Yagrush", sub="Tishtrya"}
    sets.Yagrush.DualWield.Acc = {main="Yagrush", sub="Bunzi's rod"}
    sets.Yagrush.SwordShield = {}
    sets.Yagrush.SwordShield.Genmei = {main="Yagrush", sub="Genmei shield"}
    sets.Yagrush.SwordShield.Ammurapi = {main="Yagrush", sub="Ammurapi shield"}

    sets.Maxentius = {}
    sets.Maxentius.DualWield = {}
    sets.Maxentius.DualWield.TP = {main="Maxentius", sub="Tishtrya"}
    sets.Maxentius.DualWield.Acc = {main="Maxentius", sub="Bunzi's rod"}
    sets.Maxentius.SwordShield = {}
    sets.Maxentius.SwordShield.Genmei = {main="Maxentius", sub="Genmei shield"}
    sets.Maxentius.SwordShield.Ammurapi = {main="Maxentius", sub="Ammurapi shield"}

    sets.Raetic = {}
    sets.Raetic.DualWield = {}
    sets.Raetic.DualWield.TP = {main="Raetic rod +1", sub="Tishtrya"}
    sets.Raetic.DualWield.Acc = {main="Raetic rod +1", sub="Bunzi's rod"}
    sets.Raetic.SwordShield = {}
    sets.Raetic.SwordShield.Genmei = {main="Raetic rod +1", sub="Genmei shield"}
    sets.Raetic.SwordShield.Ammurapi = {main="Raetic rod +1", sub="Ammurapi shield"}
    
    sets.Lorg = {}
    sets.Lorg.DualWield = {}
    sets.Lorg.DualWield.TP = {main="Lorg Mor", sub="Tishtrya"}
    sets.Lorg.DualWield.Acc = {main="Lorg Mor", sub="Bunzi's rod"}
    sets.Lorg.SwordShield = {}
    sets.Lorg.SwordShield.Genmei = {main="Lorg Mor", sub="Genmei shield"}
    sets.Lorg.SwordShield.Ammurapi = {main="Lorg Mor", sub="Ammurapi shield"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Incantor Stone", --2%
        head="Ebers cap +3", --13%
        neck="Cleric's torque +2", --10%
        ear1="Malignance earring", --4%
        -- ear2="Loquacious Earring", --2%
        ear2="Odnowa earring +1",
        body="Pinga tunic +1", --15%
        hands="Nyame gauntlets", --7%
        ring1="Medada's Ring", --10%
        ring2="Defending ring",
        -- ring2="Kishar ring", --4%      
        back=fastcast_cape, --10%
        -- waist="Embla Sash", --5%
        -- legs="Lengo pants", --5%
        legs="Ebers pantaloons +3",
        feet="Nyame sollerets"
    }

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat"})

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

    -- sets.precast.JA.Benediction ={
    --     main="Mafic Cudgel",
    --     sub="Genmei Shield",
    --     ammo="Hydrocera",
    --     head="Ebers Cap +3",
    --     neck="Unmoving Collar +1",
    --     ear1="Cryptic Earring",
    --     ear2="Trux Earring",
    --     body="Inyanga Jubbah +2",
    --     hands="Nyame Gauntlets",
    --     ring1="Eihwaz Ring",
    --     ring2="Supershear Ring",
    --     back=enmity_cape,
    --     waist="Plat. Mog. Belt",
    --     legs="Ebers Pant. +3",
    --     feet="Ebers Duckbills +3"
    -- }

    sets.precast.JA.Devotion = {head="Piety Cap +3"}
    
    local physical_mnd_ws = {
        ammo="Crepuscular pebble",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Fotia Gorget",
        waist="Grunfeld rope",
        ear1="Regal earring",
        ear2="Moonshade earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        back=physical_mnd_ws_cape,
    }

    sets.precast.WS = physical_mnd_ws
    
    sets.precast.WS["Shining Strike"] = physical_mnd_ws
    sets.precast.WS["Seraph Strike"] = physical_mnd_ws
    sets.precast.WS["Brainshaker"] = physical_mnd_ws
    sets.precast.WS["Starlight"] = {neck="Combatant's torque"}
    sets.precast.WS["Moonlight"] = {neck="Combatant's torque"}
    sets.precast.WS["Skullbreaker"] = physical_mnd_ws
    sets.precast.WS["True Strike"] = physical_mnd_ws
    sets.precast.WS["Judgment"] = set_combine(physical_mnd_ws, {neck="Republican platinum medal", waist="Grunfeld rope"})
    sets.precast.WS["Hexa Strike"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.precast.WS["Black Halo"] = physical_mnd_ws
    sets.precast.WS["Flash Nova"] = physical_mnd_ws
    sets.precast.WS["Realmrazer"] = set_combine(physical_mnd_ws, {waist="Fotia belt"})
    sets.precast.WS["Dagan"] = physical_mnd_ws
    sets.precast.WS["Mystic Boon"] = set_combine(physical_mnd_ws, {neck="Republican platinum medal", waist="Grunfeld rope"})
    

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

    sets.midcast.Cure.SIRD = sets.midcast.Cure

    -- 1338 defense
    -- 42 mdb 611 meva
    -- 35 dt
    -- Cure potency I: 55%
    -- Cure potency II: 20%
    -- -
    sets.midcast.Cure.Pure = {
        main="Raetic Rod +1",
        ammo="Staunch Tathlum +1",
        head="Ebers cap +3",  --10 mdb 125 meva
        neck="Cleric's torque +2",
        ear1="Glorious earring",
        ear2="Ebers earring +1",
        body="Theophany bliaut +3", -- 8 mdb 100 meva
        hands="Theophany mitts +3", -- 5 mdb 57 meva
        ring1="Medada's ring",
        ring2="Persis ring",
        back=fastcast_cape, 
        waist="Plat. Mog. Belt", -- 15 meva
        legs="Ebers pantaloons +3", --10 mdb 157 meva
        feet="Ebers duckbills +3" -- 9 mdb 157 meva
    }

    sets.midcast.Cure.Pure.Solace = set_combine(sets.midcast.Cure.Pure, {body="Ebers Bliaut +3"})
    sets.midcast.Cure.SIRD.Solace = set_combine(sets.midcast.Cure.SIRD, {body="Ebers Bliaut +3"})

    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Curaga.Pure = sets.midcast.Cure.Pure
    sets.midcast.Curaga.SIRD = sets.midcast.Cure.SIRD

    sets.midcast.StatusRemoval = {
        main="Yagrush",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1", --11%
        head="Ebers Cap +3", --12%
        neck="Loricate torque +1",
        body="Ebers Bliaut +3",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Spell interruption rate down -11%','INT+8','"Mag.Atk.Bns."+5',}}, --31%
        legs="Ebers Pant. +3",
        feet="Theo. Duckbills +3", --29%        
        waist="Plat. Mog. Belt",
        left_ear="Sanare earring",
        right_ear="Ebers Earring +1",
        ring1="Freke Ring", --10%
        ring2="Defending Ring",        
        back=fastcast_cape
    }

    sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {
        neck="Cleric's torque +2"
    })

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

    local midcast_duration = {
        main="Gada",
        sub="Ammurapi shield",
        head="Telchine cap",
        neck="Loricate torque +1",
        body="Telchine chasuble",
        hands="Telchine gloves",
        legs="Telchine braconi",
        feet="Theophany duckbills +3"
    }

    local midcast_pdt = {
        ammo="Staunch tathlum +1",
        neck="Loricate torque +1",
        ear1="Sanare earring", --3% magic dmg
        ear2="Ebers earring +1",
        ring2="Defending ring", --3% dmg
        ring1="Shadow ring", --10% dmg
        back=dt_cape,
        waist="Platinum moogle belt",
        feet="Ebers duckbills +3"
    }

    local five_hundred_skill_enhancing_max_duration = {
        main="Gada",
        sub="Ammurapi Shield",
        ammo="Staunch Tathlum +1",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        neck="Loricate Torque +1",
        waist="Plat. Mog. Belt",
        ear1="Sanare Earring",
        ear2="Mimir Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=dt_cape
    }

    local no_skill_midcast = set_combine(midcast_pdt, midcast_duration)

    sets.midcast.Stoneskin = no_skill_midcast
    sets.midcast.Haste = no_skill_midcast
    sets.midcast.BoostStat = five_hundred_skill_enhancing_max_duration

    sets.midcast.Auspice = set_combine(midcast_duration, {
        main="Gada",
        sub="Ammurapi shield",
        ammo="Staunch tathlum +1",
        head="Telchine cap",
        neck="Loricate torque +1",
        ear1="Sanare earring", --3% magic dmg
        ear2="Ebers earring +1",
        body="Telchine chasuble",
        hands="Telchine gloves",
        ring2="Defending ring", --3% dmg
        ring1="Shadow ring", --10% dmg
        back=dt_cape,
        waist="Platinum moogle belt",
        legs="Telchine braconi",
        feet="Ebers duckbills +3"
    })

    sets.midcast.BarElement = {
        main="Beneficus",
        sub="Ammurapi shield",
        head="Telchine cap",
        ear1="Sanare earring", --3% magic dmg
        ear2="Ebers earring +1",
        neck="Loricate torque +1",
        body="Ebers Bliaut +3", --Solace
        hands="Telchine gloves",
        ring1="Shadow ring", --10% dmg
        ring2="Ayanmo ring", --3% dmg        
        back=dt_cape,
        waist="Embla sash",
        legs="Piety Pantaloons +3",
        feet="Telchine pigaches"
    }

    -- sets.midcast.BarElement = set_combine(midcast_duration, {
    --     main="Beneficus",
    --     legs="Piety Pantaloons +3"
    -- })

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

    sets.midcast.Protect = no_skill_midcast
    sets.midcast.Protectra = no_skill_midcast
    sets.midcast.Shell = no_skill_midcast
    sets.midcast.Shellra = no_skill_midcast

    sets.midcast.Storm = no_skill_midcast

    sets.midcast['Divine Magic'] = {
        main="Yagrush",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ebers cap +3",
        neck="Incanter's torque",
        ear1="Regal earring",
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Piety mitts +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Theophany pantaloons +3",
        feet="Ebers duckbills +3"
    }

    sets.midcast.Holy = {
        main="Daybreak",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Bunzi's hat",
        neck="Incanter's torque",
        ear1="Malignance earring",
        ear2="Regal earring",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        ring1="Medada's ring",
        ring2="Freke ring",
        back=fastcast_cape,
        waist="Orpheus's sash",
        legs="Bunzi's pants",
        feet="Bunzi's sabots"
    }

    sets.midcast.Banish = {
        main="Daybreak",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ipoca beret",
        neck="Incanter's torque",
        ear1="Malignance earring",
        ear2="Ebers earring +1",
        body="Ebers bliaut +3",
        hands="Piety mitts +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Theophany pantaloons +3",
        feet="Ebers duckbills +3"
    }

    sets.midcast.Banish.Resistant = set_combine(sets.midcast.Banish, {
        head="Ebers cap +3"
    })

    sets.midcast.Banishga = sets.midcast.Banish

    sets.midcast.Banishga.Resistant = sets.midcast.Banish.Resistant

    -- 45 enmity
    sets.midcast.Flash = {
        main="Mafic Cudgel",
        sub="Genmei Shield",
        ammo="Hydrocera",
        head="Ebers Cap +3",
        neck="Unmoving Collar +1",
        ear1="Cryptic Earring",
        ear2="Trux Earring",
        body="Inyanga Jubbah +2",
        hands="Nyame Gauntlets",
        ring1="Eihwaz Ring",
        ring2="Supershear Ring",
        back=enmity_cape,
        waist="Plat. Mog. Belt",
        legs="Ebers Pant. +3",
        feet="Ebers Duckbills +3"
    }

    sets.midcast['Dark Magic'] = {
        main="Daybreak",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
        head="Pixie Hairpin +1",
        neck="Incanter's Torque",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        body="Ebers Bliaut +3",
        hands="Regal Cuffs",
        ring1="Medada's Ring",
        ring2="Archon Ring",
        back=fastcast_cape,
        waist="Austerity Belt +1",
        legs="Ebers Pant. +3",
        feet="Ebers Duckbills +3"
    }

    sets.midcast["Enfeebling Magic"] = {
        main="Yagrush",
        sub="Ammurapi shield",
        ammo="Hydrocera",
        head="Ebers cap +3",
        neck="Erra pendant",
        ear1="Regal earring",
        ear2="Ebers earring +1",
        body="Theophany bliaut +3",
        hands="Regal cuffs",
        ring1="Medada's ring",
        ring2="Kishar ring",
        back="Aurist's cape +1",
        waist="Obstinate sash",
        legs="Ebers pantaloons +3",
        feet="Theophany duckbills +3"
    }
    
    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast["Enfeebling Magic"], {
        main="Contemplator +1",
        sub="Enki strap",
        ear2="Malignance earring",
        body="Ebers bliaut +3",
        hands="Ebers mitts +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"}      
    }) 

    sets.midcast.IntEnfeebles = set_combine(sets.midcast["Enfeebling Magic"], {
        main="Contemplator +1",
        sub="Enki strap",
        ammo="Ghastly tathlum +1",
        body="Ebers bliaut +3",
        waist="Acuity belt +1",
        ring2="Metamorph ring +1"
    })

    sets.midcast.MaccEnfeebles = set_combine(sets.midcast["Enfeebling Magic"], {
        hands="Ebers mitts +3",
    })

    sets.midcast.Dia = sets.midcast["Enfeebling Magic"]
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
    
    -- Sets to return to when not performing an action.    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        ammo="Staunch tathlum +1", --3% dmg
        head="Nyame helm", --7% dmg
        neck="Loricate Torque +1", --6% dmg
        ear1="Ran earring", --3% magic dmg
        ear2="Foresti earring",
        body="Ebers bliaut +3",
        hands="Bunzi's gloves", --7% dmg
        ring2="Ayanmo ring", --3% dmg
        ring1="Shadow ring", --10% dmg
        back=idle_hybrid_cape,
        waist="Platinum moogle belt", --3% magic dmg
        legs="Bunzi's pants", --8% dmg
        feet="Ebers duckbills +3" --7% dmg
    }

    sets.idle.Refresh = set_combine(sets.idle, {
        ammo="Homiliary",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs={ name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}
    })
    
    -- Defense sets

    -- 1659 defense
    -- 29 mdb 716 meva
    -- definitely > 50% dt
    sets.defense.PDT = {
        ammo="Staunch tathlum +1",
        head="Nyame helm", -- 5 mdb 123 meva
        neck="Loricate Torque +1",
        ear1="Ran earring",
        ear2="Foresti earring",
        body="Nyame mail", -- 8 mdb 139 meva
        hands="Nyame gauntlets", -- 4 mdb 112 meva
        ring1="Inyanga ring", -- 12 meva
        ring2="Ayanmo ring",
        back=idle_pdt_cape, -- 30 meva
        waist="Platinum moogle belt",
        legs="Nyame flanchard", -- 7 mdb 150 meva
        feet="Nyame sollerets" -- 5 mdb 150 meva
    }

    -- 1457 defense
    -- 55 mdb 707 meva
    -- 49% dt
    sets.defense.MDT = {
        ammo="Staunch tathlum +1",
        head="Ebers cap +3", --10 mdb 125 meva
        neck="Loricate Torque +1",
        ear1="Sanare earring", --4 mdb 6 meva
        ear2="Foresti earring",
        body="Ebers bliaut +3",  -- 11 mdb 130 meva
        hands="Ebers mitts +3", -- 7 mdb 87 meva
        ring1="Shadow ring", 
        ring2={name="Vexer ring +1", bag="wardrobe6"}, --4 mdb
        back=idle_mdt_cape, -- 30 meva
        waist="Platinum moogle belt", --15 meva
        legs="Ebers pantaloons +3", -- 10 mdb 157 meva
        feet="Ebers duckbills +3" -- 9 mdb 157 meva
    }

    sets.Kiting = {
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
        neck="Combatant's torque",
        waist="Grunfeld Rope",
        ear1="Telos earring",
        ear2="Ebers earring +1",
        ring1={name="Chirich Ring +1", bag="wardrobe5"},
        ring2={name="Chirich Ring +1", bag="wardrobe6"},
        back=attack_cape
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers mitts +3"}
    sets.buff['Afflatus Solace'] = {body="Ebers Bliaut +3"}

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
    if spellMap == 'Cure' or spellMap == "Curaga" then
        equip(sets.midcast[spellMap][state.CureMode.Value])
        if spellMap == 'Cure' and state.Buff['Afflatus Solace'] then
            equip(sets.buff['Afflatus Solace'])
        end
    elseif spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
    -- print_set(spell)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, spell_map)
    -- if spell.action_type == 'Magic' then
    --     if spell.skill == "Enfeebling Magic" then
    --         if spell.type == "WhiteMagic" then
    --             return "MndEnfeebles"
    --         else
    --             return "IntEnfeebles"
    --         end
    --     end
    -- end
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

function display_current_job_state(eventArgs)

end