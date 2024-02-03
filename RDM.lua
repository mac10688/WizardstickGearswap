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
    state.OffenseMode:options('Normal', 'HighAcc')
    state.CombatMode:options('SwordShield', 'DualWield')
    state.HasteMode:options('LowHaste', 'MidHaste', 'MaxHaste')
    state.HybridMode:options('Normal', 'DT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
    
    state.MagicBurst = M(true, 'Magic Burst')
    state.SleepMode = M{['description']='Sleep Mode', 'Normal', 'MaxDuration'}
    state.EnspellMode = M(true, 'Enspell Melee Mode')

    state.HasteMode = M{['description']='Haste Mode', 'LowHaste', 'MidHaste', 'HighHaste'}

    state.CombatWeapon = M{['description']='Combat Weapon', 'Naegling', 'Crocea', 'Club', 'Dagger', 'Zerodmg'}
    state.CombatWeapon.DualWield = {}
    state.CombatWeapon.DualWield.Naegling = M{['description']='Naegling Set', 'TP', 'Acc'}
    state.CombatWeapon.DualWield.Crocea = M{['description']='Crocea Set', 'Daybreak', 'Demersal', 'TP'}
    state.CombatWeapon.DualWield.Club = M{['description']='Club Set', 'Daybreak', 'Gleti', 'TP'}
    state.CombatWeapon.DualWield.Dagger = M{['description']='Dagger Set', 'Malevolence', 'Gleti'}
    state.CombatWeapon.DualWield.Zerodmg = M{['description']="Zero Set", 'Normal'}

    state.CombatWeapon.SwordShield = {}
    state.CombatWeapon.SwordShield.Naegling = M{['description']='Naegling Set', 'Sacro', 'Genmei'}
    state.CombatWeapon.SwordShield.Crocea = M{['description']='Crocea Set', 'Sacro', 'Genmei'}
    state.CombatWeapon.SwordShield.Club = M{['description']='Club Set', 'Sacro', 'Genmei'}
    state.CombatWeapon.SwordShield.Dagger = M{['description']='Dagger Set', 'Sacro', 'Genmei'}
    state.CombatWeapon.SwordShield.Zerodmg = M{['description']='Dagger Set', 'Sacro', 'Genmei'}

    send_command('bind ~f1 gs c set CombatWeapon Naegling')
    send_command('bind ~f2 gs c set CombatWeapon Crocea')
    send_command('bind ~f3 gs c set CombatWeapon Club')
    send_command('bind ~f4 gs c set CombatWeapon Dagger')
    send_command('bind ~f5 gs c set CombatWeapon Zerodmg')
    send_command('bind @e gs c toggle EnspellMode')
    send_command('bind ~` gs c toggle MagicBurst')

    --DW SW
    --Low-Haste, Mid-Haste, Cap-Haste
    --Accuracy
    state.Buff.Composure = buffactive.Composure or false
    state.Buff.Saboteur = buffactive.Saboteur or false
    state.Buff.Stymie = buffactive.Stymie or false

    enfeebling_magic_acc = S{'Bind', 'Break', 'Dispel', 'Distract', 'Distract II', 'Frazzle',
        'Frazzle II',  'Gravity', 'Gravity II', 'Silence'}
    enfeebling_magic_skill = S{'Distract III', 'Frazzle III', 'Poison II'}
    enfeebling_magic_effect = S{'Dia', 'Dia II', 'Dia III', 'Diaga', 'Blind', 'Blind II'}
    enfeebling_magic_sleep = S{'Sleep', 'Sleep II', 'Sleepga'}

    skill_spells = S{
        'Temper', 'Temper II', 'Enfire', 'Enfire II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II',
        'Enstone', 'Enstone II', 'Enthunder', 'Enthunder II', 'Enwater', 'Enwater II'}
end

function job_file_unload()
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
    send_command('unbind ~f5')
    send_command('unbind @e')
    send_command('unbind ~`')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    Cape = {}
    Cape.Fc = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    Cape.Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Mag. Evasion+15'}}
    Cape.Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}}
    Cape.Tp = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    Cape.Dw = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%'}}
    Cape.Str_WS = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Dex_WS = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}
    Cape.Mnd_WS = { name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}

    sets.CombatWeapon = {}
    sets.CombatWeapon.DualWield = {}

    sets.CombatWeapon.DualWield.Naegling = {}
    sets.CombatWeapon.DualWield.Naegling.TP = {main="Naegling", sub="Thibron"}
    sets.CombatWeapon.DualWield.Naegling.Acc = {main="Naegling", sub="Gleti's knife"}

    sets.CombatWeapon.DualWield.Crocea = {}
    sets.CombatWeapon.DualWield.Crocea.Daybreak = {main="Crocea mors", sub="Daybreak"}
    sets.CombatWeapon.DualWield.Crocea.Demersal = {main="Crocea mors", sub="Demersal degen +1"}
    sets.CombatWeapon.DualWield.Crocea.TP = {main="Crocea mors", sub="Thibron"}

    sets.CombatWeapon.DualWield.Club = {}
    sets.CombatWeapon.DualWield.Club.Daybreak = {main="Maxentius", sub="Daybreak"}
    sets.CombatWeapon.DualWield.Club.Gleti = {main="Maxentius", sub="Gleti's knife"}
    sets.CombatWeapon.DualWield.Club.TP = {main="Maxentius", sub="Thibron"}

    sets.CombatWeapon.DualWield.Dagger = {}
    sets.CombatWeapon.DualWield.Dagger.Malevolence = {main='Tauret', sub='Malevolence'}
    sets.CombatWeapon.DualWield.Dagger.Gleti = {main='Tauret', sub="Gleti's knife"}

    sets.CombatWeapon.DualWield.Zerodmg = {}
    sets.CombatWeapon.DualWield.Zerodmg.Normal = {main="Aern Dagger", sub="Qutrub knife"}

    sets.CombatWeapon.SwordShield = {}
    sets.CombatWeapon.SwordShield.Naegling = {}
    sets.CombatWeapon.SwordShield.Naegling.Sacro = {main="Naegling", sub="Sacro bulwark"}
    sets.CombatWeapon.SwordShield.Naegling.Genmei = {main="Naegling", sub="Genmei shield"}

    sets.CombatWeapon.SwordShield.Crocea = {}
    sets.CombatWeapon.SwordShield.Crocea.Sacro = {main="Crocea mors", sub="Sacro bulwark"}
    sets.CombatWeapon.SwordShield.Crocea.Genmei = {main="Crocea mors", sub="Genmei shield"}

    sets.CombatWeapon.SwordShield.Club = {}
    sets.CombatWeapon.SwordShield.Club.Sacro = {main="Maxentius", sub="Sacro bulwark"}
    sets.CombatWeapon.SwordShield.Club.Genmei = {main="Maxentius", sub="Genmei shield"}

    sets.CombatWeapon.SwordShield.Dagger = {}
    sets.CombatWeapon.SwordShield.Dagger.Sacro = {main="Gleti's knife", sub="Sacro bulwark"}
    sets.CombatWeapon.SwordShield.Dagger.Genmei = {main="Gleti's knife", sub="Genmei shield"}

    sets.CombatWeapon.SwordShield.Zerodmg = {}
    sets.CombatWeapon.SwordShield.Zerodmg.Sacro = {main="Aern Dagger", sub="Sacro bulwark"}
    sets.CombatWeapon.SwordShield.Zerodmg.Genmei = {main="Aern Dagger", sub="Genmei shield"}

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
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})

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
    sets.precast.WS["Empyreal Arrow"] = ws_physical
    
    sets.precast.WS["Aeolian Edge"] = ws_magic

    sets.precast.WS["Red Lotus Blade"] = ws_magic

    sets.precast.WS["Seraph Blade"] = set_combine(ws_magic,{
        ring2="Shukuyu ring",
        back=Cape.Mnd_WS
    })
    
    sets.precast.WS["Circle Blade"] = set_combine(ws_physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.precast.WS["Vorpal Blade"] = set_combine(ws_physical, {
        ring2="Shukuyu ring",
        back=Cape.Str_WS
    })

    sets.precast.WS["Savage Blade"] = set_combine(ws_physical, {
        neck="Republican platinum medal",
        ear1="Regal earring",
        ring1="Rufescent ring",
        ring2="Shukuyu ring",
        waist="Sailfi belt +1",
        back=Cape.Str_WS
    })

    sets.precast.WS["Death Blossom"] = set_combine(ws_physical, {
        ring2="Shukuyu ring"
    })

    sets.precast.WS["Sanguine Blade"] = set_combine(ws_magic, {
        ear1="Regal earring",
        neck="Duelist's torque +2",
        head="Pixie Hairpin +1",
        ring1="Medada's ring",
        ring2="Archon ring",
        back=Cape.Mnd_WS
    })

    sets.precast.WS["Chant du Cygne"] = set_combine(ws_physical, {
        back=Cape.Dex_WS
    })
    
    sets.precast.WS["Requiescat"] = {
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

    sets.precast.WS["Evisceration"] = ws_physical
    sets.precast.WS["Aeolian Edge"] = ws_magic
    sets.precast.WS["Exenterator"] = ws_physical
    sets.precast.WS["Black Halo"] = ws_physical

    
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

    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {waist="Gishdubar"})

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        main="Daybreak",
        waist="Hachirin-no-Obi"
    })
    
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = {
        ring1="Haoma's ring",
        ring2="Menelaus's ring"
    }
    sets.midcast.StatusRemoval = {}

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

    sets.midcast.EnhancingSkill = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Incanter's torque"
    })

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

    sets.midcast.Regen = {}
    sets.midcast.Refresh = {
        body="Atrophy tabard +3",
        legs="Lethargy fuseau +3"
    }
    sets.midcast.RefreshSelf = set_combine(sets.midcast.refresh, {waist="Gishdubar"})

    local SIRD  = {
        main={ name="Contemplator +1", augments={'Path: A',}},
        sub="Enki Strap",
        ammo="Staunch Tathlum +1",
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Spell interruption rate down -11%','INT+8','"Mag.Atk.Bns."+5',}},
        legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
        feet="Leth. Houseaux +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Magnetic Earring",
        right_ear="Sanare Earring",
        left_ring="Freke Ring",
        right_ring="Defending Ring",
        back=Cape.Mnd
    }

    sets.midcast.Stoneskin = SIRD
    sets.midcast.Utsusemi = SIRD
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],
    {
        hands="Taeon gloves",
        legs="Taeon tights",
        feet="Taeon boots"
    })
    sets.midcast.Aquaveil = set_combine(SIRD, {
        hands="Regal cuffs"
    })    

    sets.midcast.Storm = sets.midcast.EnhancingDuration
    sets.midcast.GainSpell = set_combine(sets.midcast.EnhancingDuration, {
        hands="Vitiation Gloves +3"
    })
    
    --Int during time of casting adds to base dmg but caps at about 250 int
    sets.midcast.SpikesSpell = set_combine(sets.midcast.enhancing, {
        legs="Vitiation tights +3"
    })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration)
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell
    
    sets.midcast['Enfeebling Magic'] = {
        main="Contemplator +1",
        sub="Enki strap",
        ranged=empty,
        ammo="Regal gem",                
        head="Lethargy chapeau +3",
        neck="Duelist's torque +2",
        ear1="Snotra earring",
        ear2="Lethargy earring +2",
        body="Lethargy sayon +3",
        hands="Regal cuffs",
        ring1="Medada's ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        waist="Obstinate Sash",
        back=Cape.Int,
        legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Cure" potency +7%','INT+12','"Mag.Atk.Bns."+8'}},
        feet="Vitiation Boots +3"
    }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        back=Cape.Mnd
    })

    sets.midcast.MndEnfeeblesAcc = set_combine(sets.midcast.MndEnfeebles, {
        ranged="Ullr",
        ammo=empty,
        head="Atrophy chapeau +3",
        body="Atrophy Tabard +3"
    })

    sets.midcast.MndEnfeeblesEffect = set_combine(sets.midcast.MndEnfeebles, {
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
    })

    sets.midcast.IntEnfeeblesAcc = set_combine(sets.midcast.IntEnfeebles, {
        ranged="Ullr",
        ammo=empty
    })

    sets.midcast.IntEnfeeblesEffect = set_combine(sets.midcast.IntEnfeebles, {
        body="Lethargy sayon +3"
    })

    sets.midcast.SkillEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
    })

    sets.midcast.Sleep = set_combine(sets.midcast.IntEnfeeblesAcc, {

    })

    sets.midcast.SleepMaxDuration = set_combine(sets.midcast.Sleep, {
        head="Leth. Chappel +3",
        body="Lethargy Sayon +3",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
    })
		
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {

    })

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeeblesAcc, {main="Daybreak", sub="Ammurapi Shield"})

    
    sets.midcast['Elemental Magic'] = {
        main="Bunzi's rod",
        sub="Ammurapi shield",
        ammo="Pemphredo tathlum",
        head="Lethargy chappel +3",
        neck="Sibyl scarf",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Lethargy sayon +3",
        hands="Lethargy gantherots +3",
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
--   sets.engaged[state.CombatMode][state.CombatForm][state.CombatWeapon][state.OffenseMode][state.HybridMode][classes.CustomMeleeGroups (any number)]
    sets.engaged.SwordShield = set_combine(sets.engaged, {feet="Atrophy boots +3"})
    sets.engaged.SwordShield.HighAcc = set_combine(sets.engaged.SwordShield, {neck="Combatant's torque", ear1="Dignitary earring"})
    sets.engaged.SwordShield.LowHaste = set_combine(sets.engaged.SwordShield, {back=Cape.Tp, ring2="Hetairoi ring"})
    sets.engaged.SwordShield.MidHaste = set_combine(sets.engaged.SwordShield.LowHaste, {})
    sets.engaged.SwordShield.HighHaste = set_combine(sets.engaged.SwordShield.MidHaste, {})
    sets.engaged.SwordShield.HighAcc.LowHaste = set_combine(sets.engaged.SwordShield.HighAcc, {})
    sets.engaged.SwordShield.HighAcc.MidHaste = set_combine(sets.engaged.SwordShield.HighAcc.MidHaste, {})
    sets.engaged.SwordShield.HighAcc.HighHaste = set_combine(sets.engaged.SwordShield.HighAcc.HighHaste, {})

    sets.engaged.DualWield = set_combine(sets.engaged, {waist="Reiki yotai", ear2="Eabani earring"})
    sets.engaged.DualWield.HighAcc = set_combine(sets.engaged.DualWield, {ear2 = "Lethargy earring +2"})
    sets.engaged.DualWield.LowHaste = set_combine(sets.engaged.DualWield, {})
    sets.engaged.DualWield.MidHaste = set_combine(sets.engaged.DualWield, {})
    sets.engaged.DualWield.HighHaste = set_combine(sets.engaged.DualWield, {})
    sets.engaged.DualWield.HighAcc.LowHaste = set_combine(sets.engaged.DualWield.HighAcc, {})
    sets.engaged.DualWield.HighAcc.MidHaste = set_combine(sets.engaged.DualWield.HighAcc.LowHaste, {})
    sets.engaged.DualWield.HighAcc.HighHaste = set_combine(sets.engaged.DualWield.HighAcc.MidHaste, {})

    sets.engaged.Hybrid = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",							
        neck="Loricate Torque +1",
        ring2="Gelatinous Ring +1",							--"Defending Ring", --10/10
        back="Moonbeam Cape",
    }

    sets.engaged.Enspell = {
        waist="Orpheus's Sash",
    }

    sets.magic_burst = {
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
    if spell.skill == 'Enhancing Magic' then
        if classes.NoSkillSpells:contains(spell.english) then
            equip(sets.midcast.EnhancingDuration)
            if spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)
                if spell.target.type == 'SELF' then
                    equip (sets.midcast.RefreshSelf)
                end
            end
        elseif skill_spells:contains(spell.english) then
            equip(sets.midcast.EnhancingSkill)
        elseif spell.english:startswith('Gain') then
            equip(sets.midcast.GainSpell)
        elseif spell.english:contains('Spikes') then
            equip(sets.midcast.SpikesSpell)
        end
        if (spell.target.type == 'PLAYER' or spell.target.type == 'NPC') and buffactive.Composure then
            equip(sets.buff.ComposureOther)
        end
    elseif spell.skill == 'Healing Magic' then
        if spellMap == 'Cure' and spell.target.type == 'SELF' then
            equip(sets.midcast.CureSelf)
        end
    elseif spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value and spell.english ~= 'Impact' then
            equip(sets.magic_burst)
        end
        local obi_or_orpheus = obi_or_orpheus(spell)
        if obi_or_orpheus then
            equip({waist=obi_or_orpheus})
        end
    elseif spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    end
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if (world.weather_element == 'Light' or world.day_element == 'Light') then
                return 'CureWeather'
            end
        end
        if spell.skill == 'Enfeebling Magic' then
            if enfeebling_magic_skill:contains(spell.english) then
                return "SkillEnfeebles"
            elseif spell.type == "WhiteMagic" then
                if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
                    return "MndEnfeeblesAcc"
                elseif enfeebling_magic_effect:contains(spell.english) then
                    return "MndEnfeeblesEffect"
                else
                    return "MndEnfeebles"
              end
            elseif spell.type == "BlackMagic" then
                if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
                    return "IntEnfeeblesAcc"
                elseif enfeebling_magic_effect:contains(spell.english) then
                    return "IntEnfeeblesEffect"
                elseif enfeebling_magic_sleep:contains(spell.english) and ((buffactive.Stymie and buffactive.Composure) or state.SleepMode.value == 'MaxDuration') then
                    return "SleepMaxDuration"
                elseif enfeebling_magic_sleep:contains(spell.english) then
                    return "Sleep"
                else
                    return "IntEnfeebles"
                end
            else
                return "MndEnfeebles"
            end
        end
    end
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

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

end

function customize_melee_set(meleeSet)
    if state.EnspellMode.value and IsEnspellActive() then
        meleeSet = set_combine(meleeSet, sets.engaged.Enspell)
    end

    return meleeSet
end

function IsEnspellActive()
    return (
        buffactive["Enstone"] or buffactive["Enstone II"]
        or buffactive["Enwater"] or buffactive["Enwater II"]
        or buffactive["Enaero"] or buffactive["Enaero II"]
        or buffactive["Enfire"] or buffactive["Enfire II"]
        or buffactive["Enblizzard"] or buffactive["Enblizzard II"]
        or buffactive["Enthunder"] or buffactive["Enthunder II"])
end

function lockstyle()
    if player.main_job == 'RDM' then send_command('@input /lockstyleset 4') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end

function job_state_change(descrip, newVal, oldVal)
    if descrip == 'Combat Weapon' then
        if newVal == oldVal then
            state.CombatWeapon[state.CombatMode.value][state.CombatWeapon.value]:cycle()
        end
        equipWeapon()
    elseif descrip == 'Combat Mode' then
        equipWeapon()
    end
end

function equipWeapon()
    local combatWeaponSpecify = state.CombatWeapon[state.CombatMode.value][state.CombatWeapon.value].value
    equip(sets.CombatWeapon[state.CombatMode.value][state.CombatWeapon.value][combatWeaponSpecify])
end

function job_handle_equipping_gear(playerStatus, eventArgs)
    --Equip the weapons we want to always have on.
end

function IsDualWield(weaponSet)
    local sub = windower.ffxi.get_items(weaponSet.sub_bag, weaponSet.sub)
    local item = res.items[sub.id]
    return item.category == "Weapon"
end