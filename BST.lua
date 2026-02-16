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
    state.PhysicalDefenseMode:options('PDT', 'Pet')
    state.MagicalDefenseMode:options('MDT')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.OffenseMode:options('TP', 'DT', 'SubtleBlow')
    state.CombatMode:options('SwordShield', 'DualWield')
    state.HybridMode:options('Normal','Pet')
    -- state.IdleMode:options('Normal', 'Pet')
    state.CombatWeapon:set('Spalirisos')
    state.MonsterCorrelation = M(false, 'Monster Correlation')

    state.Spalirisos = {}
    state.Spalirisos.DualWield = M{['description']='Spalirisos Set', 'TP', 'Pet'}
    state.Spalirisos.SwordShield = M{['description']='Spalirisos Set', 'Sacro'}

    state.Pangu = {}
    state.Pangu.DualWield = M{['description']='Pangu Set', 'Spalirisos', 'Ikenga', 'Agwu'}
    state.Pangu.SwordShield = M{['description']='Pangu Set', 'Sacro'}

    state.Naegling = {}
    state.Naegling.DualWield = M{['description']='Naegling Set', 'TP', 'Pet'}
    state.Naegling.SwordShield = M{['description']='Naegling Set', 'Sacro'}

    state.Ikenga = {}
    state.Ikenga.DualWield = M{['description']='Ikenga Set', 'Pet'}
    state.Ikenga.SwordShield = M{['description']='Ikenga Set', 'Sacro'}

    state.Agwu = {}
    state.Agwu.DualWield = M{['description']='Agwu Set', 'Pet'}
    state.Agwu.SwordShield = M{['description']='Agwu Set', 'Sacro'}

    state.Drepanum = {}
    state.Drepanum.DualWield = M{['description']='Drepanum Set', 'Grip'}
    state.Drepanum.SwordShield = M{['description']='Drepanum Set', 'Grip'}

    -- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Epsilon', 'Beta'}
	send_command('bind ^backspace gs c cycle RewardMode')

    state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false
	state.Buff["Unleash"] = buffactive["Unleash"] or false

    -- Additional local binds
    send_command('bind ^` gs c toggle MonsterCorrelation')
    send_command('bind ~f1 gs c set CombatWeapon Spalirisos')
    send_command('bind ~f2 gs c set CombatWeapon Pangu')
    send_command('bind ~f3 gs c set CombatWeapon Naegling')
    send_command('bind ~f4 gs c set CombatWeapon Ikenga')
    send_command('bind ~f5 gs c set CombatWeapon Agwu')    
    send_command('bind ~f6 gs c set CombatWeapon Drepanum')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ^`')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
    send_command('unbind ~f5')
    send_command('unbind ~f6')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	jse.artifact.head = "Totemic Helm +3"
	jse.artifact.body = "Totemic Jackcoat +4"
	jse.artifact.hands = "Totemic Gloves +3"
	jse.artifact.legs = "Totemic Trousers +3"
	jse.artifact.feet = "Totemic Gaiters +3"

	jse.relic.head = "Ankusa Helm +4"
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

    sets.Spalirisos = {}
    sets.Spalirisos.DualWield = {} 
    sets.Spalirisos.DualWield.TP = {main="Spalirisos", sub="Ikenga's axe"}
    sets.Spalirisos.DualWield.Pet = {main="Spalirisos", sub="Agwu's axe"}
    sets.Spalirisos.SwordShield = {}
    sets.Spalirisos.SwordShield.Sacro = {main="Spalirisos", sub="Sacro bulwark"}

    sets.Pangu = {}
    sets.Pangu.DualWield = {main="Pangu", sub="Ikenga's axe"}
    sets.Pangu.DualWield.Spalirisos = {main="Pangu", sub="Spalirisos"}
    sets.Pangu.DualWield.Ikenga = {main="Pangu", sub="Ikenga's Axe"}
    sets.Pangu.DualWield.Agwu = {main="Pangu", sub="Agwu's Axe"}
    sets.Pangu.SwordShield = {main="Pangu", sub="Sacro bulwark"}
    sets.Pangu.SwordShield.Sacro = {main="Pangu", sub="Sacro bulwark"}

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

    sets.Agwu = {}
    sets.Agwu.DualWield = {main="Agwu's axe", sub="Ikenga's axe"}
    sets.Agwu.DualWield.Pet = {main="Agwu's axe", sub="Ikenga's axe"}
    sets.Agwu.SwordShield = {main="Agwu's axe", sub="Sacro bulwark"}
    sets.Agwu.SwordShield.Sacro = {main="Agwu's axe", sub="Sacro bulwark"}

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
        head=jse.empyrean.head,
        body=jse.relic.body,
        hands=jse.empyrean.hands,
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet,
        neck="Null Loop",
        waist="Null Belt",
        ear1="Digni. Earring",
        ear2="Crep. Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Null Shawl"
    }

	sets.precast.JA['Call Beast'] = {hands=jse.relic.hands}
    sets.precast.JA['Bestial Loyalty'] = sets.precast.JA['Call Beast']
    sets.precast.JA['Familiar'] = {legs=jse.relic.legs}
    sets.precast.JA['Tame'] = {head=jse.artifact.head}
    sets.precast.JA['Spur'] = {feet=jse.empyrean.feet, back=ws_cape}
    
    sets.precast.JA.Reward = {
        body=jse.artifact.body,
        ring1="Defending ring",
        back=pet_attack,
        waist="Platinum moogle belt",
        legs=jse.relic.legs,
        feet="Nyame sollerets"
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
        ear1="Eabani Earring",
        ear2="Genmei Earring",
        ring1="Eihwaz Ring",
        ring2="Moonlight Ring",
        back=ws_cape
    }
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",
        body=jse.empyrean.body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Ishvara Earring",
        ear2=jse.earring,
        ring1="Shukuyu Ring",
        ring2="Rufescent Ring",
        back=ws_blitz_mistral_cape
    }

    sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
        ear2="Sherida earring",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        legs="Gleti's breeches",
        waist="Sarissaphoroi belt",
        back=ws_decimation_ruinator_cape
    })

    sets.precast.WS['Blitz'] = set_combine(sets.precast.WS, {
        ammo="Coiste bodhar",
        neck="Beastmaster collar +2",
        ear1="Moonshade earring",
        ring1="Gere ring",
        ring2="Regal ring"
    })
    sets.precast.WS['Blitz'].SubtleBlow = set_combine(sets.precast.WS['Blitz'], sets.precast.WS.SubtleBlow)

    sets.precast.WS["Rampage"] = {
        ammo="Crepuscular pebble",
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet=jse.empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade Earring",
        ear2=jse.earring,
        ring1="Ilabrat Ring",
        ring2="Gere Ring",
        back=ws_rampage_cape
    }
    sets.precast.WS['Rampage'].SubtleBlow = set_combine(sets.precast.WS['Rampage'], sets.precast.WS.SubtleBlow)

    sets.precast.WS["Cloudsplitter"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2=jse.earring,
        ring1="Epaminondas's Ring",
        ring2="Metamor. Ring +1",
        back=ws_cloudsplitter_cape
    }
    sets.precast.WS['Cloudsplitter'].SubtleBlow = set_combine(sets.precast.WS['Cloudsplitter'], sets.precast.WS.SubtleBlow)

    sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Cloudsplitter"], {
        back=ws_primal_rend_cape
    })
    sets.precast.WS['Primal Rend'].SubtleBlow = set_combine(sets.precast.WS['Primal Rend'], sets.precast.WS.SubtleBlow)

    sets.precast.WS["Mistral Axe"] = {
        ammo="Crepuscular pebble",
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet=jse.empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade Earring",
        ear2=jse.earring,
        ring1="Ilabrat Ring",
        ring2="Gere Ring",
        back=ws_blitz_mistral_cape
    }
    sets.precast.WS['Mistral Axe'].SubtleBlow = set_combine(sets.precast.WS['Mistral Axe'], sets.precast.WS.SubtleBlow)

    -- Equipping tp bonus and ready recast
    sets.precast.Monster = {
        legs="Gleti's Breeches"
    }

    sets.midcast.Pet = {
        ammo="Hesperiidae",
        head=jse.empyrean.head,
        body=jse.empyrean.body,
        hands=jse.empyrean.hands,
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet,
        neck="Bst. Collar +2",
        waist="Incarnation Sash",
        ear1="Sroda Earring",
        ear2=jse.earring,
        ring1="Cath Palug ring",
        ring2="Moonlight Ring",
        back=pet_attack
    }
    sets.midcast.Pet.Tp = sets.midcast.Pet
    sets.midcast.Pet.Mab = set_combine(sets.midcast.Pet, {
        body="Udug Jacket",
        back=pet_mag_acc
    })
    sets.midcast.Pet.Macc = set_combine(sets.midcast.Pet, {
        left_ear="Alabaster earring",
        back=pet_mag_acc
    })
    sets.midcast.Pet.Multi = sets.midcast.Pet

    -- Yellow Beetle & Beetle
    sets.midcast.Pet['Power Attack'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['High-Frequency Field'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Rhino Attack'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Rhino Guard'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Spoil'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Rhinowrecker'] = sets.midcast.Pet.Tp

    -- Mosquito
    sets.midcast.Pet['Infected Leech'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Gloom Spray'] = sets.midcast.Pet.Macc
    
    -- Hippogryph
    sets.midcast.Pet['Back Heel'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Jettatura'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Choke Breath'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Fantod'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Hoof Volley'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Nihility Song'] = sets.midcast.Pet.Macc

    -- Crab
    sets.midcast.Pet['Bubble Shower'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Bubble Curtain'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Big Scissors'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Scissor Guard'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Metallic Body'] = sets.midcast.Pet.Tp

    -- Barnacled Crab
    sets.midcast.Pet['Venom Shower'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Mega Scissors'] = sets.midcast.Pet.Tp

    -- Rabbit
    sets.midcast.Pet['Foot Kick'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Dust Cloud'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Whirl Claws'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Wild Carrot'] = sets.midcast.Pet.Tp

    -- Colibri
    sets.midcast.Pet['Pecking Flurry'] = sets.midcast.Pet.Multi

    -- Spider
    sets.midcast.Pet['Sickle Slash'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Acid Spray'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Spider Web'] = sets.midcast.Pet.Macc

    -- Chapuli
    sets.midcast.Pet['Sensilla Blades'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Tegmina Buffet'] = sets.midcast.Pet.Tp

    -- Tulfaire
    sets.midcast.Pet['Molting Plumage'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Swooping Frenzy'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Pentapeck'] = sets.midcast.Pet.Multi

    -- Mandragora & Citrullus
    sets.midcast.Pet['Head Butt'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Dream Flower'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Wild Oats'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Leaf Dagger'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Scream'] = sets.midcast.Pet.Macc

    -- Raptor
    sets.midcast.Pet['Scythe Tail'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Ripper Fang'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Chomp Rush'] = sets.midcast.Pet.Multi

    -- Lucani
    sets.midcast.Pet['Disembowel'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Extirpating Salvo'] = sets.midcast.Pet.Tp

    -- Acuex
    sets.midcast.Pet['Foul Waters'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Pestilent Plume'] = sets.midcast.Pet.Macc

    -- Ladybug
    sets.midcast.Pet['Sudden Lunge'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Spiral Spin'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Noisome Powder'] = sets.midcast.Pet.Macc

    -- Tiger
    sets.midcast.Pet['Roar'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Razor Fang'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Claw Cyclone'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Crossthrash'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Predatory Glare'] = sets.midcast.Pet.Macc

    -- Sheep
    sets.midcast.Pet['Lamb Chop'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Rage'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Sheep Charge'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Sheep Song'] = sets.midcast.Pet.Macc

    -- Hill Lizard
    sets.midcast.Pet['Tail Blow'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Fireball'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Blockhead'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Brain Crush'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Infrasonics'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Secretion'] = sets.midcast.Pet.Tp

    -- Apkallu
    sets.midcast.Pet['Wing Slap'] = sets.midcast.Pet.Multi
    sets.midcast.Pet['Beak Lunge'] = sets.midcast.Pet.Tp

    -- Eft
    sets.midcast.Pet['Nimble Snap'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Cyclotail'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Geist Wall'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Numbing Noise'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Toxic Spit'] = sets.midcast.Pet.Macc

    -- Raaz
    sets.midcast.Pet['Sweeping Gouge'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Zealous Snort'] = sets.midcast.Pet.Tp

    -- Lynx
    sets.midcast.Pet['Chaotic Eye'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Blaster'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Charged Whisker'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Frenzied Rage'] = sets.midcast.Pet.Tp

    -- Snapweed
    sets.midcast.Pet['Tickling Tendrils'] = sets.midcast.Pet.Multi
    sets.midcast.Pet['Stink Bomb'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Nectarous Deluge'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Nepenthic Plunge'] = sets.midcast.Pet.Macc

    -- Slug
    sets.midcast.Pet['Purulent Ooze'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Corrosive Ooze'] = sets.midcast.Pet.Macc

    -- Slime
    sets.midcast.Pet['Fluid Toss'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Fluid Spread'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Digest'] = sets.midcast.Pet.Macc

    -- Funguar
    sets.midcast.Pet['Frogkick'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Spore'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Queasyshroom'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Numbshroom'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Shakeshroom'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Silence Gas'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Dark Spore'] = sets.midcast.Pet.Mab

    -- Antlion
    sets.midcast.Pet['Mandibular Bite'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Sandblast'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Sandpit'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Venom Spray'] = sets.midcast.Pet.Tp

    -- Diremite
    sets.midcast.Pet['Double Claw'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Grapple'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Spinning Top'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Filamented Hold'] = sets.midcast.Pet.Macc

    -- Fly
    sets.midcast.Pet['Cursed Sphere'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Venom'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Somersault'] = sets.midcast.Pet.Tp

    -- Pugil
    sets.midcast.Pet['Intimidate'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Recoil Drive'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Water Wall'] = sets.midcast.Pet.Tp

    -- Adamantoise
    sets.midcast.Pet['Tortoise Stomp'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Harden Shell'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Aqua Breath'] = sets.midcast.Pet.Mab

    -- Leech
    sets.midcast.Pet['Suction'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['Drainkiss'] = sets.midcast.Pet.Mab
    sets.midcast.Pet['Acid Mist'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['TP Drainkiss'] = sets.midcast.Pet.Macc

    -- Cactuar
    sets.midcast.Pet['Needleshot'] = sets.midcast.Pet.Tp
    sets.midcast.Pet['??? Needles'] = sets.midcast.Pet.Tp

    -- Flytrap
    sets.midcast.Pet['Sporific'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Gloeosuccus'] = sets.midcast.Pet.Macc
    sets.midcast.Pet['Palsy Pollen'] = sets.midcast.Pet.Macc   
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        ammo="Staunch tathlum +1",
        head="Nyame Helm",
        body="Udug Jacket",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Null Belt",
        ear1="Eabani Earring",
        ear2="Genmei Earring",
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back="Null Shawl",
    }

    sets.idle.Pet = set_combine(sets.idle, {
    })

    sets.idle.Pet.Engaged = {
        ammo="Hesperiidae",
        head=jse.empyrean.head,
        body=jse.artifact.body,
        hands="Gleti's gauntlets",
        legs=jse.empyrean.legs,
        feet="Gleti's boots",
        neck="Beastmaster collar +2",
        waist="Null Belt",
        ear1="Alabaster Earring",
        ear2="Nukumi earring +1",
        ring1="Cath Palug Ring",
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back=pet_attack
    }
    
    -- Defense sets

    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs=jse.empyrean.legs,
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Null Belt",
        ear1="Alabaster earring",
        ear2="Genmei Earring",
        ring1="Gelatinous Ring +1",
        ring2="Moonlight Ring",
        back="Null Shawl",
    }

    sets.defense.Pet = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body=jse.artifact.body,
        hands="Gleti's Gauntlets",
        legs=jse.empyrean.legs,
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Null Belt",
        ear1="Alabaster earring",
        ear2="Genmei Earring",
        ring1="Gelatinous Ring +1",
        ring2="Moonlight Ring",
        back=pet_attack,
    }

    sets.defense.MDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Null Belt",
        ear1="Eabani Earring",
        ear2="Genmei Earring",
        ring1="Gelatinous Ring +1",
        ring2="Moonlight Ring",
        back="Null Shawl",
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
    sets.engaged.TP = {
        ammo="Coiste bodhar",
        head="Malignance chapeau",
        body="Gleti's cuirass",
        hands="Malignance gloves",
        legs="Gleti's breeches",
        feet=jse.empyrean.feet,
        neck="Anu Torque",
        waist="Sailfi belt +1",
        left_ear="Sroda earring",
        right_ear="Sherida earring",
        ring1="Epona's ring",
        ring2="Gere ring",
        back="Null shawl"
    }

    sets.engaged.TP.Pet = set_combine(sets.engaged.TP, {
        body=jse.artifact.body
    })

    sets.engaged.SubtleBlow = set_combine(sets.engaged.TP, {
        ear2="Sherida earring",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        legs="Gleti's breeches",
        waist="Sarissaphoroi belt",
        back=ws_decimation_ruinator_cape
    })

    sets.engaged.SubtleBlow.Pet = set_combine(sets.engaged.SubtleBlow, {
        body=jse.artifact.body
    })

    sets.engaged.DT = set_combine(sets.engaged.TP, {
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"}
    })

    sets.engaged.DT.Pet = set_combine(sets.engaged.DT, {
        body=jse.artifact.body
    })

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
    -- equip(sets.midcast.Pet.WS)

end

function job_pet_change(pet, gain, eventArgs)

end

function job_pet_status_change(newStatus, oldStatus, eventArgs)

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