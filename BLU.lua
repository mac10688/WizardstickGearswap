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
    state.OffenseMode:options('Normal', 'MaxHaste', 'SubtleBlow')
    state.CombatMode:options('SwordShield', 'DualWield')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Refresh','Defense','Bumba')
    state.TenebralCrush = M('None','MACC')

    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false

    state.CombatWeapon:set('Naegling')

    state.Naegling = {}
    state.Naegling.SwordShield = M{['description']='Naegling Set', 'Genmei'}
    state.Naegling.DualWield = M{['description']='Naegling Set', 'TP', 'Sakpata'}

    state.Club = {}
    state.Club.SwordShield = M{['description']='Club Set', 'Genmei'}
    state.Club.DualWield = M{['description']='Club Set', 'TP', 'Magic', 'Sakpata'}

    send_command('bind ~f1 gs c set CombatWeapon Naegling')
    send_command('bind ~f2 gs c set CombatWeapon Club')

    blue_magic_maps = {}

    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.

    -- Physical Spells --

    blue_magic_maps.Physical = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Battle Dance','Bludgeon','Body Slam','Cannonball','Claw Cyclone','Death Scissors','Dimensional Death','Disseverment','Empty Thrash',
        'Feather Storm','Footkick','Frenetic Rip','Glutinous Dart','Goblin Rush','Grand Slam','Head Butt','Heavy Strike','Helldive','Hysteric Barrage','Jet Stream','Mandibular Bite',
        'Power Attack','Quad. Continuum','Quadrastrike','Queasyshroom','Paralyzing Triad','Ram Charge','Saurian Slide','Screwdriver','Sickle Slash','Sinker Drill','Smite of Rage',
        'Spinal Cleave','Spiral Spin','Sprout Smack','Sub-zero Smash','Terror Touch','Thrashing Assault','Uppercut','Vanity Dive','Vertical Cleave','Wild Oats',
    }

    blue_magic_maps.PhysicalMacc = S{'Benthic Typhoon','Bilgestorm','Delta Thrust','Frypan','Head Butt','Pinecone Bomb','Seedspray','Sudden Lunge','Sweeping Gouge','Tail Slap','Tourbillion','Whirl of Rage',
    }

    blue_magic_maps.Magical = S{
        'Acrid Stream','Anvil Lightning','Atra. Libations','Blastbomb','Blazing Bound','Blinding Fulgor','Bomb Toss','Charged Whisker','Crashing Thunder','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Entomb','Eyes On Me','Embalming Earth','Evryone. Grudge','Firespit','Foul Waters','Gates of Hades','Ice Break','Leafstorm','Maelstrom','Magic Hammer',
        'Mind Blast','Molting Plumage','Mysterious Light','Nectarous Deluge','Palling Salvo','Polar Roar','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Sandspin','Searing Tempest','Scouring Spate','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval','Tenebral Crush','Thermal Pulse','Uproot',
    }

    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye','Bad Breath',
        'Blank Gaze','Blistering Roar','Blitzstrahl','Blood Drain','Cesspool','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar',
        'Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Reaving Wind',
        'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Tearing Gust','Temporal Shift','Thunderbolt','Venom Shell','Water Bomb','Yawn',
    }

    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath',
    }

    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral',
        'Wild Carrot'
    }

    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBased = S{
        'Blood Drain','Blood Saber','Diamondhide','Digest','Magic Barrier',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Barrier Tusk','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Metallic Body','Mighty Guard','Nat. Meditation','O. Counterstance','Plasma Charge','Pyric Bulwark','Reactor Cool',
        'Refueling','Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promy.',
        'Zephyr Mantle',
    }

    -- Other general buffs
    blue_magic_maps.FastRecast = S{
        'Final Sting','Hydro Shot','Osmosis','Voracious Trunk','Self-Destruct',
    }

    unbridled_spells = S{
        'Thunderbolt','Harden Shell','Absolute Terror','Gates of Hades','Tourbillion','Pyric Bulwark','Bilgestorm','Bloodrake','Droning Whirlwind',
        'Carcharian Verve','Blistering Roar','Uproot','Crashing Thunder','Polar Roar','Mighty Guard','Cruel Joke','Cesspool','Tearing Gust'}
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ~f1')
    send_command('unbind ~f2')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    local fc_cape = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%'}}
    local str_ws_cape = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
    local mab_cape = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%'}}
    local mnd_ws_cape = { name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
    local cure_cape = { name="Rosmerta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Phys. dmg. taken-10%'}}
    local enmity_cape = { name="Rosmerta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%'}}
    local dw_cape = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dual Wield"+10','Phys. dmg. taken-10%'}}

    jse.artifact.head = "Assimilator's Keffiyeh +3"
    jse.artifact.body = "Assimilator's Jubbah +3"
    jse.artifact.hands = "Assimilator's Bazubands +3"
    jse.artifact.legs = "Assimilator's Shalwar +3"
    jse.artifact.feet = "Assimilator's Charuqs +3"

    jse.relic.head = "Luhlaza Keffiyeh +3"
    jse.relic.body = "Luhlaza Jubbah +3"
    jse.relic.hands = "Luhlaza Bazubands +3"
    jse.relic.legs = "Luhlaza Shalwar +3"
    jse.relic.feet = "Luhlaza Charuqs +3"

    jse.empyrean.head = "Hashishin Kavuk +3"
    jse.empyrean.body = "Hashishin Mintan +3"
    jse.empyrean.hands = "Hashishin Bazubands +3"
    jse.empyrean.legs = "Hashishin Tayt +3"
    jse.empyrean.feet = "Hashishin Basmak +3"

    jse.earring = "Hashishin earring +1"


    sets.Naegling = {main="Naegling"}
    sets.Naegling.DualWield = {main="Naegling", sub="Thibron"}
    sets.Naegling.DualWield.TP = {main="Naegling", sub="Thibron"}
    sets.Naegling.DualWield.Sakpata = {main="Naegling", sub="Sakpata's sword"}
    sets.Naegling.SwordShield = {main="Naegling", sub="Genmei shield"}
    sets.Naegling.SwordShield.Genmei = {main="Naegling", sub="Genmei shield"}

    sets.Club = {main="Maxentius"}
    sets.Club.DualWield = {main="Maxentius", sub="Bunzi's rod"}
    sets.Club.DualWield.TP = {main="Maxentius", sub="Thibron"}
    sets.Club.DualWield.Magic = {main="Maxentius", sub="Bunzi's rod"}
    sets.Club.DualWield.Sakpata = {main="Maxentius", sub="Sakpata's sword"}
    sets.Club.SwordShield = {main="Maxentius", sub="Genmei shield"}
    sets.Club.SwordShield.Genmei = {main="Maxentius", sub="Genmei shield"}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs

    sets.buff['Burst Affinity'] = {feet=jse.empyrean.feet}
    sets.buff['Chain Affinity'] = {head=jse.empyrean.head}
    sets.buff.Diffusion = {feet=jse.relic.feet}
    sets.buff.Efflux = {legs=jse.empyrean.legs}

    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo="Staunch Tathlum +1",
        head="Carmine mask +1",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Loquacious Earring",
        body="Adamantite armor",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Medada's ring",
        back=fc_cape,
        waist="Platinum moogle belt",
        legs="Lengo pants",
        feet="Carmine greaves +1"
    }

    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=jse.empyrean.body})

    sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC, {
        head="Umuthi hat"
    })

    sets.enmity = {
        ammo="Sapience Orb",
        head="Nyame Helm",
        neck="Unmoving Collar +1",
        ear1="Cryptic Earring",
        ear2="Trux Earring",
        body="Emet Harness +1",
        hands="Enif Manopolas",
        ring1="Eihwaz Ring",
        ring2="Supershear Ring",
        back=enmity_cape,
        waist="Null Belt",
        legs=jse.empyrean.legs,
        feet="Ahosi Leggings"
    }

    sets.precast.JA['Azure Lore'] = {hands=jse.empyrean.hands}
    sets.precast.JA['Vallation'] = sets.enmity
    sets.precast.JA['Valiance'] = sets.enmity
    sets.precast.JA['Pflug'] = sets.enmity

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

    --------------------------------------
    -- Midcast sets
    --------------------------------------
    sets.midcast['Blue Magic'] = {
        ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",
        neck="Mirage Stole +2",
        ear1="Loquac. Earring",
        ear2="Enchntr. Earring +1",
        body="Adamantite Armor",
        hands=jse.empyrean.hands,
        ring1="Gelatinous Ring +1",
        ring2="Murky Ring",
        back=fc_cape,
        waist="Sailfi Belt +1",
        legs=jse.empyrean.legs,
        feet="Carmine Greaves +1"
    }

    sets.midcast['Blue Magic'].Physical = set_combine(sets.midcast['Blue Magic'], {
        ammo="Crepuscular pebble",
        head=jse.empyrean.head,
        body=jse.empyrean.body,
        hands="Gleti's gauntlets",
        back=str_ws_cape,
        waist="Sailfi belt +1",
        legs=jse.empyrean.legs,
        feet="Gleti's boots"
    })

    sets.midcast['Blue Magic'].PhysicalMacc = set_combine(sets.midcast['Blue Magic'].Physical, {
        ammo="Pemphredo tathlum",
        ear1="Dignitary's earring",
        ear2="Alabaster earring",
        hands=jse.empyrean.hands,
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Null shawl",
        waist="Null belt",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    })

    sets.midcast['Blue Magic'].Magical = set_combine(sets.midcast['Blue Magic'], {
        main="Maxentius",
        sub="Bunzi's rod",
        ammo="Ghastly tathlum +1",
        head=jse.empyrean.head,
        neck="Sibyl scarf",
        ear1="Regal earring",
        ear2="Friomisi earring",
        body=jse.empyrean.body,
        hands=jse.empyrean.hands,
        ring1="Metamorph ring +1",
        ring2="Medada's ring",
        back=mab_cape,
        waist="Orpheus's sash",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    })

    sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {
        ammo="Pemphredo Tathlum",
        neck="Mirage Stole +2",
        waist="Null Belt"
    })

    sets.midcast['Blue Magic'].Healing = set_combine(sets.midcast['Blue Magic'], {
        neck="Hoxne torque",
        head="Carmine mask +1",
        body="Pinga tunic +1",
        hands="Telchine gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=cure_cape,
        waist="Platinum moogle belt",
        legs="Gyve trousers",
        feet="Carmine greaves +1"
    })

    sets.midcast['Blue Magic'].SkillBased = set_combine(sets.midcast['Blue Magic'], {
        ammo="Staunch tathlum +1",
        head=jse.empyrean.head,
        neck="Hoxne torque",
        body=jse.artifact.body,
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Cornflower cape",
        legs=jse.empyrean.legs,
        feet=jse.relic.feet
    })

    sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {ring1="Archon Ring"})
    sets.midcast['White Wind'] = {
        neck="Unmoving collar +1",
        ear1="Odnowa earring +1",
        ear2="Tuisto earring",
        body="Adamantite armor",
        hands="Telchine gloves",
        ring1="Gelatinous Ring +1",
        ring2="Eihwaz Ring",
        back=cure_cape,
        waist="Platinum moogle belt",
        legs="Gyve trousers",
        feet="Medium's sabots"
    }
    sets.midcast['Fantod'] = sets.enmity
    sets.midcast['Actinic Burst'] = sets.midcast['Fantod']
    sets.midcast['Jettatura'] = sets.midcast['Fantod']
    sets.midcast['Flash'] = sets.midcast['Fantod']
    sets.midcast['Foil'] = sets.midcast['Fantod']

    sets.midcast['Occultation'] = {
        ammo="Staunch tathlum +1",
        head="Carmine mask +1",
        neck="Mirage stole +2",
        ear1="Njordr earring",
        ear2="Alabaster earring",
        body="Adamantite armor",
        hands=jse.empyrean.hands,
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=fc_cape,
        legs=jse.empyrean.legs,
        feet="Carmine greaves +1"
    }
    sets.midcast['Dream Flower'] = {}
    sets.midcast['Phalanx'] = {}
    sets.midcast['Stoneskin'] = {}

    sets.midcast['Glutinous Dart'] = {}
    sets.midcast['Rending Deluge'] = {}
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    -- Idle sets
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Malignance chapeau",
        neck="Loricate Torque +1",
        ear1="Alabaster earring",
        ear2="Tuisto earring",
        body=jse.empyrean.body,
        hands="Nyame gauntlets",
        ring1="Ilabrat Ring",
        ring2="Epona's ring",
        back="Null shawl",
        waist="Null belt",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.Kiting = {
        ring1="Shneddick ring +1",
        feet="Hippomenes socks +1"
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
        ammo="Coiste Bodhar",
        head="Malignance chapeau",
        neck="Mirage stole +2",
        ear1="Eabani earring",
        ear2=jse.earring,
        body="Gleti's cuirass",
        hands="Malignance gloves",
        ring1="Ilabrat Ring",
        ring2="Epona's ring",
        back=dw_cape,
        waist="Reiki Yotai",
        legs="Gleti's breeches",
        feet="Malignance boots"
    }

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {
        neck="Null Loop",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        legs="Gleti's breeches"
    })

    sets.engaged.MaxHaste = set_combine(sets.engaged, {
        waist="Windbuffet belt +1"
    })

    sets.engaged.MaxHaste.SubtleBlow = set_combine(sets.engaged.SubtleBlow, {
        ear1="Dignitary's earring",
    })

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
        head=jse.relic.head,
        neck="Loricate torque +1",
        ear1="Lugalbanda earring",
        ear2="Arete del luna +1",
        body="Adamantite armor",
        hands=jse.relic.hands,
        ring1="Shadow ring",
        ring2={name="Vexer ring +1", bag="wardrobe6"},
        back=idle_mdt_cape,
        waist="Null belt",
        legs=jse.relic.legs,
        feet=jse.relic.feet
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
    --print_set(spell)
end

function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

function lockstyle()
    if player.main_job == 'BLU' then send_command('@input /lockstyleset 14') end
end
