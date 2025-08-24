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
    state.OffenseMode:options('TP', 'Hybrid', 'Accuracy', 'Malignance')
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

    -- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Epsilon', 'Beta'}
	send_command('bind ^backspace gs c cycle RewardMode')

    state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false
	state.Buff["Unleash"] = buffactive["Unleash"] or false
    
    -- Standard Ready Moves
    Ready_Standard = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
        'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
        'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
        'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
        'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
        'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
        'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
        'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
        'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
        'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
        'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
        'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
        'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
        'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Crossthrash','Predatory Glare',
        'Hoof Volley','Nihility Song','Frenzied Rage','Venom Shower','Mega Scissors','Fluid Toss','Fluid Spread',
        'Digest','Rhinowrecker'}

    -- List of Magic-based Ready moves
    Ready_Magic = S{'Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
        'Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field',
        'Sandpit','Sandblast','Venom Spray','Bubble Shower','Filamented Hold','Queasyshroom','Silence Gas',
        'Numbshroom','Spore','Dark Spore','Shakeshroom','Fireball','Plague Breath','Infrasonics','Chaotic Eye',
        'Blaster','Intimidate','Snow Cloud','Noisome Powder','TP Drainkiss','Jettatura','Charged Whisker',
        'Purulent Ooze','Corrosive Ooze','Aqua Breath','Molting Plumage','Stink Bomb','Nectarous Deluge',
        'Nepenthic Plunge','Pestilent Plume','Foul Waters','Spider Web'}

    -- List of TP based Ready moves
    Ready_TP = S{'Sic','Somersault','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
        'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
        'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Geist Wall','Numbing Noise','Frogkick',
        'Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
        'Mandibular Bite','Metallic Body','Bubble Shower','Bubble Curtain','Scissor Guard','Grapple','Spinning Top',
        'Double Claw','Filamented Hold','Spore','Blockhead','Secretion','Fireball','Tail Blow','Plague Breath',
        'Brain Crush','Infrasonics','Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive',
        'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Noisome Powder','Beak Lunge','Suction',
        'Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker',
        'Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath','Sensilla Blades',
        'Tegmina Buffet','Zealous Snort','Pestilent Plume','Foul Waters','Spider Web'}

    -- Magic ACC Based Ready moves
    Ready_Debuff = S{'Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
        'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast','Filamented Hold',
        'Spore','Fireball','Infrasonics','Chaotic Eye','Blaster','Intimidate','Noisome Powder','TP Drainkiss',
        'Jettatura','Purulent Ooze','Corrosive Ooze','Pestilent Plume','Spider Web','Nihility Song'}

    -- Physical Ready moves that have Multi-Hit
    Ready_Multi = S{'Sweeping Gouge','Tickling Tendrils','Chomp Rush','Pentapeck','Wing Slap','Pecking Flurry'}

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

	jse.artifact.head = "Totemic Helm +3"
	jse.artifact.body = "Totemic Jackcoat +3"
	jse.artifact.hands = "Totemic Gloves +3"
	jse.artifact.legs = "Totemic Trousers +3"
	jse.artifact.feet = "Totemic Gaiters +3"

	jse.relic.head = "Ankusa Helm +3"
	jse.relic.body = "Ankusa Jackcoat +3"
	jse.relic.hands = "Ankusa Gloves +3"
	jse.relic.legs = "Ankusa Trousers +3"
	jse.relic.feet = "Ankusa Gaiters +3"

	jse.empyrean.head = "Nukumi Cabasset +3"
	jse.empyrean.body = "Nukumi Gausape +3"
	jse.empyrean.hands = "Nukumi Manoplas +3"
	jse.empyrean.legs = "Nukumi Quijotes +3"
	jse.empyrean.feet = "Nukumi Ocreae +3"

    jse.earring = "Nukumi earring +1"


    local ws_blitz_mistral_cape = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','DEF+50'}}
    local ws_rampage_cape = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%'}}
    local ws_decimation_ruinator_cape = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%'}}
    local ws_primal_rend_cape = { name="Artio's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%','Damage taken-5%'}}
    local ws_cloudsplitter_cape = { name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local pet_mag_acc = { name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: Haste+10','Damage taken-5%'}}
    local pet_attack = { name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: Damage taken -5%'}}

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
    
    sets.precast.JA['Killer Instinct'] = {head=jse.relic.head}
    sets.precast.JA['Feral Howl'] = {
        ammo="Pemphredo Tathlum",
        head="Nuk. Cabasset +3",
        body="An. Jackcoat +3",
        hands="Nukumi Manoplas +3",
        legs="Nukumi Quijotes +3",
        feet="Nukumi Ocreae +3",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Null Shawl"
    }

	sets.precast.JA['Call Beast'] = {hands=jse.relic.hands, ear2=jse.earring, feet="Gleti's boots"}
    sets.precast.JA['Bestial Loyalty'] = {ear2=jse.earring, feet="Gleti's boots"}
    sets.precast.JA['Familiar'] = {legs=jse.relic.legs}
    sets.precast.JA['Tame'] = {head=jse.artifact.head}
    sets.precast.JA['Spur'] = {feet=jse.empyrean.feet, back=ws_cape}
    
    sets.precast.JA.Reward = {
        body=jse.artifact.body,
        back=ws_cape,
        legs=jse.relic.legs,
        feet=jse.artifact.feet
    }

    sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta biscuit"})
    sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta biscuit"})
    sets.precast.JA.Reward.Epsilon = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Epsilon biscuit"})
    sets.precast.JA.Reward.Beta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Beta biscuit"})

    sets.precast.JA.Charm = {
        head=jse.artifact.head,
        body=jse.relic.body,
        hands=jse.relic.hands,
        legs=jse.relic.legs,
        feet=jse.relic.feet,
        neck="Unmoving Collar +1",
        waist="Null Belt",
        left_ear="Eabani Earring",
        right_ear="Genmei Earring",
        left_ring="Eihwaz Ring",
        right_ring="Moonlight Ring",
        back=ws_cape
    }
       
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
        right_ear=jse.earring,
        left_ring="Shukuyu Ring",
        right_ring="Rufescent Ring",
        back=ws_blitz_mistral_cape
    }

    sets.precast.WS["Rampage"] = {
        ammo="Crepusucular pebble",
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet=jse.empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear=jse.earring,
        left_ring="Ilabrat Ring",
        right_ring="Gere Ring",
        back=ws_rampage_cape
    }

    sets.precast.WS["Cloudsplitter"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Moonshade Earring",
        right_ear="Nukumi Earring +1",
        left_ring="Epaminondas's Ring",
        right_ring="Metamor. Ring +1",
        back=ws_cloudsplitter_cape
    }

    sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Cloudsplitter"], {
        back=ws_primal_rend_cape
    })

    sets.precast.WS["Mistral Axe"] = {
        ammo="Crepusucular pebble",
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet=jse.empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear=jse.earring,
        left_ring="Ilabrat Ring",
        right_ring="Gere Ring",
        back=ws_blitz_mistral_cape
    }

    sets.midcast.Pet = {
        ammo={ name="Hesperiidae", augments={'Path: A',}},
        head="Nuk. Cabasset +3",
        body="Nukumi Gausape +3",
        hands="Nukumi Manoplas +3",
        legs="Nukumi Quijotes +3",
        feet="Nukumi Ocreae +3",
        neck={ name="Bst. Collar +2", augments={'Path: A',}},
        waist="Incarnation Sash",
        left_ear="Sroda Earring",
        right_ear={ name=jse.earring, augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Pet: "Dbl. Atk."+5',}},
        left_ring="Eihwaz Ring",
        right_ring="Moonlight Ring",
        back=pet_attack
    }
    sets.midcast.Pet.TP = sets.midcast.Pet
    sets.midcast.Pet.MAB = sets.midcast.Pet
    sets.midcast.Pet.MACC = sets.midcast.Pet
    sets.midcast.Pet.Multi = sets.midcast.Pet
    
    
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
        ammo="Coiste bodhar",
        head=jse.empyrean.head,
        body=jse.empyrean.body,
        hands=jse.empyrean.hands,
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet,
        neck="Anu Torque",
        waist="Sarissapho. Belt",
        left_ear="Telos Earring",
        right_ear="Digni. Earring",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        back="Null Shawl"
    }

    sets.engaged.Malignance = {
        ammo="Coiste bodhar",
        head="Malignance chapeau",
        body="Malignance tabard",
        hands="Malignance gloves",
        legs="Malignance tights",
        feet="Malignance boots",
        neck="Anu Torque",
        waist="Sarissapho. Belt",
        left_ear="Dedition earring",
        right_ear="Sherida earring",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        back="Null Shawl"
    }

    sets.engaged.TP = sets.engaged
    sets.engaged.Hybrid = set_combine(sets.engaged, {
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"}
    })

    sets.engaged.Accuracy = sets.engaged

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

    -------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	-- sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	-- sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	-- sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	-- sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	-- sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	-- sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	-- sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	-- sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	-- sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	-- sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	-- sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	-- sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	-- sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	-- sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	-- sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	-- sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	-- sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	-- sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	-- sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	-- sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	-- sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	-- sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	-- sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	-- sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	-- sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	-- sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	-- sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	-- sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	-- sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	-- sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	-- sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	-- sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	-- sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	-- sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	-- sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	-- sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	-- sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	-- sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	-- sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	-- sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	-- sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	-- sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	-- sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	-- sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})

    coroutine.schedule(lockstyle,8)
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if Ready_Standard[spell.name] then
        equip(sets.midcast.Pet)
    elseif Ready_TP[spell.name] then
        equip(sets.midcast.Pet.TP)
    elseif Ready_Magic[spell.name] then
        equip(sets.midcast.Pet.MAB)
    elseif Ready_Debuff[spell.name] then
        equip(sets.midcast.Pet.MACC)
    elseif Ready_Multi[spell.name] then
        equip(sets.midcast.Pet.Multi)
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Reward' then
        equip(sets.precast.JA.Reward[state.RewardMode.value])
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)

end

function job_pet_midcast(spell, action, spellMap, eventArgs)
    -- Equip monster correlation gear, as appropriate
    equip(sets.midcast.Pet.WS)

    

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