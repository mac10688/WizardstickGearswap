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
    state.ExtraSongsMode = M(false, 'Use daurdabla for extra songs')
    state.EnmitySongs = M(false, 'Use enmity set for songs')
    state.OffenseMode:options('TP', 'Hybrid', 'Accuracy')
    state.CombatMode:options('SwordShield', 'DualWield')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal')

    state.CombatWeapon = M{['description']='Combat Weapon', 'Naegling', 'Carnwenhan'}
    state.CombatWeapon.DualWield = {}
    state.CombatWeapon.DualWield.Naegling = M{['description']='Naegling Set', 'TP', 'Acc'}
    state.CombatWeapon.DualWield.Carnwenhan = M{['description']='Carnwenhan Set', 'TP', 'Acc'}

    state.CombatWeapon.SwordShield = {}
    state.CombatWeapon.SwordShield.Naegling = M{['description']='Naegling Set', 'Genmei', 'Ammurapi'}
    state.CombatWeapon.SwordShield.Carnwenhan = M{['description']='Carnwenhan Set', 'Genmei', 'Ammurapi'}

    send_command('bind ~f1 gs c set CombatWeapon Naegling')
    send_command('bind ~f2 gs c set CombatWeapon Carnwenhan')

    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'

    -- Additional local binds
    send_command('bind ^` gs c toggle ExtraSongsMode')
    send_command('bind !f11 gs c cycle WeaponSet')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind !f11')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    local debuff_cape = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    local tp_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    local dw_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%'}}
    
    local atk_linos = { name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3'}}
    local ws_linos = { name="Linos", augments={'Attack+18','Weapon skill damage +3%','STR+6 DEX+6'}}
    
    local mordant_rime_cape = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%'}}
    local savage_blade_cape = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%'}}
    local rudra_storm_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}

    local fast_cast_cape = { name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%'}}

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- state.CombatWeapon = M{['description']='Combat Weapon', 'Naegling', 'Carnwenhan'}
    -- state.CombatWeapon.DualWield = {}
    -- state.CombatWeapon.DualWield.Naegling = M{['description']='Naegling Set', 'TP', 'Acc'}
    -- state.CombatWeapon.DualWield.Carnwenhan = M{['description']='Carnwenhan Set', 'TP', 'Acc'}

    -- state.CombatWeapon.SwordShield = {}
    -- state.CombatWeapon.SwordShield.Naegling = M{['description']='Naegling Set', 'Genmei', 'Ammurapi'}
    -- state.CombatWeapon.SwordShield.Carnwenhan = M{['description']='Carnwenhan Set', 'Genmei', 'Ammurapi'}

    sets.CombatWeapon = {}
    sets.CombatWeapon.DualWield = {}
    sets.CombatWeapon.DualWield.Naegling = {}
    sets.CombatWeapon.DualWield.Naegling.TP = {main="Naegling", sub="Centovente"}
    sets.CombatWeapon.DualWield.Naegling.Acc = {main="Naegling", sub="Gleti's knife"}

    sets.CombatWeapon.DualWield.Carnwenhan = {}
    sets.CombatWeapon.DualWield.Carnwenhan.TP = {main="Carnwenhan", sub="Centovente"}
    sets.CombatWeapon.DualWield.Carnwenhan.Acc = {main="Carnwenhan", sub="Gleti's knife"}

    sets.CombatWeapon.SwordShield = {}
    sets.CombatWeapon.SwordShield.Naegling = {}
    sets.CombatWeapon.SwordShield.Naegling.Genmei = {main="Naegling", sub="Genmei"}
    sets.CombatWeapon.SwordShield.Naegling.Ammurapi = {main="Naegling", sub="Ammurapi"}

    sets.CombatWeapon.SwordShield.Carnwenhan = {}
    sets.CombatWeapon.SwordShield.Carnwenhan.Genmei = {main="Carnwenhan", sub="Genmei"}
    sets.CombatWeapon.SwordShield.Carnwenhan.Ammurapi = {main="Carnwenhan", sub="Ammurapi"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        head="Bunzi's hat",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Enchanter's earring +1",
        body="Inyanga jubbah +2",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Prolix ring",
        back=fast_cast_cape,
        waist="Embla sash",
        legs="Lengo pants",
        feet="Bihu slippers +3"
    }

    sets.precast.FC.BardSong = {
        head="Fili calot +3",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Enchanter's earring +1",
        body="Inyanga jubbah +2",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Defending ring",
        back=fast_cast_cape,
        waist="Embla sash",
        legs="Gendewitha spats +1",
        feet="Bihu slippers +3"
    }

    sets.precast.FC.BardSong["Honor March"] = set_combine(sets.precast.FC.BardSong, {ranged="Marsyas"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {
        ranged=info.ExtraSongInstrument,
        hands="Bewegt cuffs",
        legs="Fili rhingrave +3"
    })  
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu slippers +3"}
    sets.precast.JA.Troubadour = {body="Bihu justaucorps +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu cannions +3"}

    -- -- Waltz set (chr and vit)
    -- sets.precast.Waltz = {range="Gjallarhorn",
    --     head="Nahtirah Hat",
    --     body="Gendewitha Bliaut",hands="Buremte Gloves",
    --     back="Kumbira Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ranged=ws_linos,
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Bihu Justaucorps +3",
        hands="Nyame gauntlets",
        ring2="Epaminondas's ring",
        waist="Fotia belt",
        feet="Nyame sollerets",
        legs="Nyame flanchard",
        back=mordant_rime_cape
    }
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
        neck="Bard's charm +2",
        ring1="ILabrat ring",
        back=rudra_storm_cape,
        waist="Kentarch belt +1"
        -- legs="Lustratio subligar +1",
        -- feet="Lustratio leggings +1"
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
        neck="Bard's charm +2",
        ring1="Hetairoi ring",
        legs="Lustratio subligar +1",
        feet="Lustratio leggings +1"
    })

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {
        neck="Bard's charm +2",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Bihu justaucorps +3",
        back=mordant_rime_cape,
        -- legs="Bihu cannions +3"
    })
    
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        ring1="Metamorph ring +1"
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        neck="Bard's charm +2",
        ear2="Regal earring",
        ring1="Rufescent ring",
        ring2="Epaminondas's ring",
        waist="Sailfi belt +1",
        back=savage_blade_cape
    })
    
    -- Midcast Sets

    -- General set for recast times.
    -- sets.midcast.FastRecast = {range="Angel Lyre",
    --     head="Nahtirah Hat",ear2="Loquacious Earring",
    --     body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
    --     back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        

    sets.midcast.BardSong = {}
    sets.midcast.BardSong.Mazurka = {range=info.ExtraSongInstrument}    

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.BardSong.SongEffect = {
        main="Carnwenhan",
        ranged="Gjallarhorn",
        head="Fili calot +3",
        neck="Moonbow whistle +1",
        ear1="Etiolation earring",
        ear2="Genmei earring",
        body="Fili hongreline +3",
        hands="Bewegt cuffs",
        ring1="Moonlight ring",
        ring2="Defending ring",
        back=fast_cast_cape,
        waist="Flume belt +1",
        legs="Inyanga shalwar +2",
        feet="Brioso slippers +3"
    }

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.BardSong.SongDebuff = {
        ranged="Gjallarhorn",
        head="Brioso roundlet +3",
        neck="Moonbow Whistle +1",
        ear1="Regal earring",
        ear2="Fili earring +1",
        body="Brioso justaucorps +3",
        hands="Fili Manchettes +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=debuff_cape,
        waist="Obstinate sash",
        legs="Brioso cannions +3",
        feet="Brioso slippers +3"
    }

    sets.midcast.BardSong.ResistantSongDebuff = sets.midcast.SongDebuff

        -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
    sets.midcast.BardSong["Honor March"] = set_combine(sets.midcast.BardSong.SongEffect, {ranged="Marsyas"})
    sets.midcast.BardSong.Ballad = set_combine(sets.midcast.BardSong.SongEffect, {legs="Fili rhingrave +3"})
    sets.midcast.BardSong.Lullaby = set_combine(sets.midcast.BardSong.SongDebuff, {ranged="Daurdabla", hands="Brioso cuffs +3"})
    sets.midcast.BardSong.Madrigal = set_combine(sets.midcast.BardSong.SongEffect, {head="Fili calot +3"})
    sets.midcast.BardSong.March = set_combine(sets.midcast.BardSong.SongEffect, {hands="Fili Manchettes +3"})
    sets.midcast.BardSong.Minuet = set_combine(sets.midcast.BardSong.SongEffect, {head="Fili hongreline +3"})
    sets.midcast.BardSong.Minne = set_combine(sets.midcast.BardSong.SongEffect, {legs="Mousai seraweels +1"})
    sets.midcast.BardSong.Paeon = set_combine(sets.midcast.BardSong.SongEffect, {head="Brioso roundlet +3"})
    sets.midcast.BardSong.Carol = set_combine(sets.midcast.BardSong.SongEffect, {hands="Mousai gages +1"})
    sets.midcast.BardSong["Sentinel's Scherzo"] = set_combine(sets.midcast.BardSong.SongEffect, {feet="Fili cothurnes +3"})
        -- sets.midcast['Magic Finale'] = {neck="Wind Torque",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}

    -- For song defbuffs (accuracy primary, duration secondary)
    -- sets.midcast.ResistantSongDebuff = {main="Lehbrailg +2",sub="Mephitis Grip",range="Gjallarhorn",
    --     head="Brioso Roundlet +1",neck="Wind Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Brioso Justaucorps +1",hands="Aoidos' Manchettes +2",ring1="Prolix Ring",ring2="Sangoma Ring",
    --     back="Kumbira Cape",waist="Demonry Sash",legs="Brioso Cannions +1",feet="Bokwus Boots"}

    -- -- Song-specific recast reduction
    -- sets.midcast.SongRecast = {ear2="Loquacious Earring",
    --     ring1="Prolix Ring",
    --     back="Harmony Cape",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.BardSong.DaurdablaDummy = set_combine(sets.precast.FC.BardSong, {
        ranged="Daurdabla",
        hands="Bewegt cuffs",
        legs="Fili rhingrave +3"
    })

    -- Other general spells and classes.
    sets.midcast.Cure = {main="Arka IV",sub='Achaq Grip',
        head="Gendewitha Caubeen",
        body="Gendewitha Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Curaga = sets.midcast.Cure
        
    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",
        legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring"
    }

    
    -- Sets to return to when not performing an action.
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        ranged="Gjallarhorn",
        head="Bunzi's hat",
        neck="Bard's charm +2",
        ear1="Etiolation earring",
        ear2="Fili earring +1",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        ring1="Moonlight ring",
        ring2="Defending ring",
        back=tp_cape,
        waist="Flume belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    -- sets.idle.PDT = {main=gear.Staff.PDT, sub="Mephitis Grip",range="Oneiros Harp",
    --     head="Gendewitha Caubeen",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2="Sangoma Ring",
    --     back="Umbra Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Aoidos' Cothurnes +2"}

    -- sets.idle.Town = {main=gear.Staff.PDT, sub="Mephitis Grip",range="Oneiros Harp",
    --     head="Gendewitha Caubeen",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Paguroidea Ring",ring2="Sangoma Ring",
    --     back="Umbra Cape",waist="Flume Belt",legs="Nares Trews",feet="Aoidos' Cothurnes +2"}
    
    -- sets.idle.Weak = {main=gear.Staff.PDT,sub="Mephitis Grip",range="Oneiros Harp",
    --     head="Gendewitha Caubeen",neck="Twilight Torque",ear1="Bloodgem Earring",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2="Sangoma Ring",
    --     back="Umbra Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    
    -- Defense sets

    -- sets.defense.PDT = {main=gear.Staff.PDT,sub="Mephitis Grip",
    --     head="Gendewitha Caubeen",neck="Twilight Torque",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Umbra Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- sets.defense.MDT = {main=gear.Staff.PDT,sub="Mephitis Grip",
    --     head="Nahtirah Hat",neck="Twilight Torque",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Engulfer Cape",waist="Flume Belt",legs="Bihu Cannions",feet="Gendewitha Galoshes"}

    sets.Kiting = {
        feet='Fili cothurnes +3'
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        ranged=atk_linos,
        head="Bunzi's hat",
        neck="Bard's charm +2",
        ear1="Eabani earring",
        ear2="Dignitary's earring",
        body="Ayanmo corazza +2",
        hands="Bunzi's gloves",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        back=tp_cape,
        waist="Reiki yotai",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.TP = sets.engaged
    sets.engaged.Hybrid = sets.engaged
    sets.engaged.Accuracy = sets.engaged
    

    -- Sets with weapons defined.
    -- sets.engaged.Dagger = {range="Angel Lyre",
    --     head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    --     body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
    --     back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions +1",feet="Gendewitha Galoshes"}

    -- -- Set if dual-wielding
    -- sets.engaged.DW = {range="Angel Lyre",
    --     head="Nahtirah Hat",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
    --     body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
    --     back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions +1",feet="Gendewitha Galoshes"}

    sets.enmity = {
        main="Mafic Cudgel",
        sub="Genmei Shield",
        range={ name="Linos", augments={'DEF+15','Phys. dmg. taken -5%','VIT+8'}},
        head="Halitus Helm",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        legs="Zoar Subligar +1",
        feet="Nyame Sollerets",
        neck="Unmoving Collar +1",
        waist="Flume Belt +1",
        left_ear="Trux Earring",
        right_ear="Genmei Earring",
        left_ring="Eihwaz Ring",
        right_ring="Supershear Ring",
        back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Phys. dmg. taken-10%',}},
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
    
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast.BardSong[generalClass] then
                equip(sets.midcast.BardSong[generalClass])
            end
        end
    end
end

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value then
        return 'DaurdablaDummy'
    else
        return 'SongEffect'
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(descrip, newValue, oldValue)
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
    local weaponSet = sets.CombatWeapon[state.CombatMode.value][state.CombatWeapon.value][combatWeaponSpecify]
    equip(weaponSet)
end

function job_handle_equipping_gear(playerStatus, eventArgs)

end

function lockstyle()
    if player.main_job == 'BRD' then send_command('@input /lockstyleset 2') end
end

function job_sub_job_change()
    coroutine.schedule(lockstyle,8)
end