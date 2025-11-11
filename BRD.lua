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
    state.CastingMode:options('Normal', 'Resistant', 'DT')
    state.IdleMode:options('Normal', 'Evasion', 'Regain')
    state.CombatWeapon:set('Carnwenhan')

    state.Naegling = {}
    state.Naegling.DualWield = M{['description']='Naegling Set', 'TP', 'Acc'}
    state.Naegling.SwordShield = M{['description']='Naegling Set', 'Genmei', 'Ammurapi'}

    state.Carnwenhan = {}
    state.Carnwenhan.DualWield = M{['description']='Carnwenhan Set', 'TP', 'Acc'}
    state.Carnwenhan.SwordShield = M{['description']='Carnwenhan Set', 'Genmei', 'Ammurapi'}

    state.Ternion = {}
    state.Ternion.DualWield = M{['description']='Carnwenhan Set', 'Eva'}
    state.Ternion.SwordShield = M{['description']='Carnwenhan Set', 'Genmei'}

    state.Xoanon = {}
    state.Xoanon.SwordShield = M{['description']='Xoanon Set', 'Enki'}
    state.Xoanon.DualWield = M{['description']='Xoanon Set', 'Enki'}
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'

    -- Additional local binds
    send_command('bind ^` gs c toggle ExtraSongsMode')
    send_command('bind !` gs c toggle EnmitySongs')
    send_command('bind ~f1 gs c set CombatWeapon Naegling')
    send_command('bind ~f2 gs c set CombatWeapon Carnwenhan')
    send_command('bind ~f3 gs c set CombatWeapon Ternion')
    send_command('bind ~f4 gs c set CombatWeapon Xoanon')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
    send_command('unbind ~f4')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    local debuff_cape = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    local tp_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    local dw_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%'}}
    local idle_pdt_cape = { name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Store TP"+10','DEF+50'}}
    local idle_mdt_cape = { name="Intarabus's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Store TP"+10','Mag. Evasion+15'}}
    local enmity_cape = { name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Phys. dmg. taken-10%'}}
    
    local atk_linos = { name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3'}}
    local ws_linos = { name="Linos", augments={'Attack+18','Weapon skill damage +3%','STR+6 DEX+6'}}
    local def_linos = { name="Linos", augments={'DEF+15','Phys. dmg. taken -5%','VIT+8'}}
    local fc_linos = { name="Linos", augments={'Mag. Acc.+19','"Fast Cast"+6','INT+6 MND+6'}}
    
    local mordant_rime_cape = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%'}}
    local savage_blade_cape = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%'}}
    local rudra_storm_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}

    local fast_cast_cape = { name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%'}}

	jse.artifact.head = "Brioso Roundlet +3"
	jse.artifact.body = "Brioso Justaucorps +3"
	jse.artifact.hands = "Brioso Cuffs +3"
	jse.artifact.legs = "Brioso Cannions +3"
	jse.artifact.feet = "Brioso Slippers +3"

	jse.relic.head = "Bihu Roudlet +3"
	jse.relic.body = "Bihu Roudlet +3"
	jse.relic.hands = "Bihu Roudlet +3"
	jse.relic.legs = "Bihu Roudlet +3"
	jse.relic.feet = "Bihu Roudlet +3"

	jse.empyrean.head = "Fili Calot +3"
	jse.empyrean.body = "Fili Hongreline +3"
	jse.empyrean.hands = "Fili Manchettes +3"
	jse.empyrean.legs = "Fili Rhingrave +3"
	jse.empyrean.feet = "Fili Cothurnes +3"

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.Naegling = {}
    sets.Naegling.DualWield = {}
    sets.Naegling.DualWield.TP = {main="Naegling", sub="Centovente"}
    sets.Naegling.DualWield.Acc = {main="Naegling", sub="Gleti's knife"}
    sets.Naegling.SwordShield = {}
    sets.Naegling.SwordShield.Genmei = {main="Naegling", sub="Genmei shield"}
    sets.Naegling.SwordShield.Ammurapi = {main="Naegling", sub="Ammurapi shield"}

    sets.Carnwenhan = {}
    sets.Carnwenhan.DualWield = {}
    sets.Carnwenhan.DualWield.TP = {main="Carnwenhan", sub="Centovente"}
    sets.Carnwenhan.DualWield.Acc = {main="Carnwenhan", sub="Gleti's knife"}
    sets.Carnwenhan.SwordShield = {}
    sets.Carnwenhan.SwordShield.Genmei = {main="Carnwenhan", sub="Genmei shield"}
    sets.Carnwenhan.SwordShield.Ammurapi = {main="Carnwenhan", sub="Ammurapi shield"}

    sets.Ternion = {}
    sets.Ternion.DualWield = {}
    sets.Ternion.DualWield.Eva = {main="Ternion dagger +1", sub="Gleti's knife"}
    sets.Ternion.SwordShield = {}
    sets.Ternion.SwordShield.Genmei = {main="Ternion dagger +1", sub="Genmei shield"}

    sets.Xoanon = {}
    sets.Xoanon.SwordShield = {}
    sets.Xoanon.SwordShield.Enki = {main="Xoanon", sub="Enki strap"}
    sets.Xoanon.DualWield = {}
    sets.Xoanon.DualWield.Enki = {main="Xoanon", sub="Enki strap"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        head="Bunzi's hat",
        neck="Voltsurge torque",
        ear1="Enchanter's earring +1",
        ear2="Etiolation earring",        
        body="Inyanga jubbah +2",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Medada's ring",
        back=fast_cast_cape,
        waist="Embla sash",
        legs="Lengo pants",
        feet="Bihu slippers +3"
    }

    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
        head="Fili calot +3",
        legs="Gendewitha spats +1"
    })

    sets.precast.FC.BardSong["Honor March"] = set_combine(sets.precast.FC.BardSong, {ranged="Marsyas"})
    sets.precast.FC.BardSong["Aria of Passion"] = set_combine(sets.precast.FC.BardSong, {ranged="Loughnashade"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {
        ranged=info.ExtraSongInstrument,
        hands="Bewegt cuffs",
        legs="Fili rhingrave +3"
    })

    --["dummy"] = L{"Gold Capriccio", "Puppet's Operetta"},
    sets.precast.FC["Gold Capriccio"] = sets.precast.FC.Daurdabla
    sets.precast.FC["Puppet's Operetta"] = sets.precast.FC.Daurdabla
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu slippers +3"}
    sets.precast.JA.Troubadour = {body="Bihu justaucorps +4"}
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
        ear2="Telos earring",
        body="Bihu justaucorps +4",
        hands="Nyame gauntlets",
        ring1="ILabrat ring",
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
        head="Blistering sallet +1",
        ring1="Hetairoi ring",
        back=rudra_storm_cape,
        legs="Zoar subligar +1"
    })

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {
        neck="Bard's charm +2",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Bihu justaucorps +4",
        ring1="Metamorph ring +1",
        back=mordant_rime_cape,
        waist="Sailfi Belt +1"
        -- legs="Bihu cannions +3"
    })
    
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        ring1="Metamorph ring +1"
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        neck="Republican platinum medal",
        ear2="Regal earring",
        ring1="Rufescent ring",
        ring2="Epaminondas's ring",
        waist="Sailfi belt +1",
        back=savage_blade_cape
    })
    
    -- Midcast Sets       

    sets.midcast.BardSong = {}
    sets.midcast.BardSong.Mazurka = {range=info.ExtraSongInstrument}    

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.BardSong.SongEffect = {
        main="Carnwenhan",
        ranged="Loughnashade",
        head="Fili calot +3",
        neck="Moonbow whistle +1",
        ear1="Genmei earring",
        ear2="Fili earring +1",        
        body="Fili hongreline +3",
        hands="Fili manchettes +3",
        ring1="Moonlight ring",
        ring2="Defending ring",
        back=fast_cast_cape,
        waist="Flume belt +1",
        legs="Inyanga shalwar +2",
        feet="Brioso slippers +3"
    }

    -- For song debuffs (duration primary, accuracy secondary)
    

    sets.midcast.BardSong.ResistantSongDebuff = {
        ranged="Loughnashade",
        head=jse.artifact.head,
        neck="Moonbow Whistle +1",
        ear1="Regal earring",
        ear2="Fili earring +1",
        body="Brioso justaucorps +3",
        hands="Fili Manchettes +3",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=debuff_cape,
        waist="Null belt",
        legs="Brioso cannions +3",
        feet="Brioso slippers +3"
    }

    sets.midcast.BardSong.SongDebuff = set_combine(sets.midcast.BardSong.ResistantSongDebuff, {
        head="Fili calot +3",
        body="Fili hongreline +3",
        legs="Fili rhingrave +3",
        ring2="Defending ring"
    })

        -- Gear to enhance certain classes of songs.  No instruments added here since Loughnashade is being used.
    sets.midcast.BardSong["Honor March"] = set_combine(sets.midcast.BardSong.SongEffect, {ranged="Marsyas"})
    sets.midcast.BardSong["Aria of Passion"] = set_combine(sets.midcast.BardSong.SongEffect, {ranged="Loughnashade"})
    sets.midcast.BardSong.Ballad = set_combine(sets.midcast.BardSong.SongEffect, {legs="Fili rhingrave +3"})
    sets.midcast.BardSong.Lullaby = set_combine(sets.midcast.BardSong.SongDebuff, {ranged="Daurdabla", hands="Brioso cuffs +3"})
    sets.midcast.BardSong.Madrigal = set_combine(sets.midcast.BardSong.SongEffect, {head="Fili calot +3"})
    sets.midcast.BardSong.March = set_combine(sets.midcast.BardSong.SongEffect, {hands="Fili Manchettes +3"})
    sets.midcast.BardSong.Minuet = set_combine(sets.midcast.BardSong.SongEffect, {body="Fili hongreline +3"})
    sets.midcast.BardSong.Minne = set_combine(sets.midcast.BardSong.SongEffect, {legs="Mousai seraweels +1"})
    sets.midcast.BardSong.Paeon = set_combine(sets.midcast.BardSong.SongEffect, {head="Brioso roundlet +3"})
    sets.midcast.BardSong.Carol = set_combine(sets.midcast.BardSong.SongEffect, {hands="Mousai gages +1"})
    sets.midcast.BardSong["Sentinel's Scherzo"] = set_combine(sets.midcast.BardSong.SongEffect, {feet="Fili cothurnes +3"})
    
        -- sets.midcast['Magic Finale'] = {neck="Wind Torque",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}


    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.BardSong.DaurdablaDummy = set_combine(sets.precast.FC.BardSong, {
        ranged="Daurdabla",
        hands="Bewegt cuffs",
        legs="Fili rhingrave +3"
    })

    --["dummy"] = L{"Gold Capriccio", "Puppet's Operetta"},
    sets.midcast["Gold Capriccio"] = sets.midcast.BardSong.DaurdablaDummy
    sets.midcast["Puppet's Operetta"] = sets.midcast.BardSong.DaurdablaDummy

    -- Other general spells and classes.
    sets.midcast.Cure = {
        head="Bunzi's hat",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Cure" potency +7%','INT+12','"Mag.Atk.Bns."+8'}},
        feet="Bunzi's sabots"
    }
        
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
        ranged=def_linos,
        head="Bunzi's hat",
        neck="Loricate torque +1",
        ear1="Genmei earring",
        ear2="Fili earring +1",
        body="Bunzi's robe",
        hands="Bunzi's gloves",
        ring1="Moonlight ring",
        ring2="Defending ring",
        back=idle_pdt_cape,
        waist="Flume belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.idle.Evasion = {
        ranged=def_linos,
        head="Nyame helm", -- 5 mdb 123 meva
        neck="Bathy choker +1",
        ear1="Ran earring",
        ear2="Eabani earring",
        body="Adamantite armor",
        hands="Nyame gauntlets", -- 4 mdb 112 meva
        ring1="Ayanmo ring",
        ring2="Defending ring",
        back=idle_pdt_cape, -- 30 meva
        waist="Null belt",
        legs="Nyame flanchard", -- 7 mdb 150 meva
        feet="Nyame sollerets" -- 5 mdb 150 meva
    }

    sets.idle.Regain = set_combine(sets.idle, {
        neck="Republican platinum medal",
        ear1="Crepuscular earring",
        ear2="Dedition earring",
        body="Ashera harness",
        hands="Regal gloves",
        ring2="Roller's ring",
        waist="Reiki yotai"
    })
    
    -- Defense sets

    sets.defense.PDT = {
        ranged=def_linos,
        head="Nyame helm", -- 5 mdb 123 meva
        neck="Loricate Torque +1",
        ear1="Ran earring",
        ear2="Foresti earring",
        body="Adamantite armor",
        hands="Nyame gauntlets", -- 4 mdb 112 meva
        ring1="Ayanmo ring",
        ring2="Mephitas's ring +1",
        back=idle_pdt_cape, -- 30 meva
        waist="Flume belt +1",
        legs="Nyame flanchard", -- 7 mdb 150 meva
        feet="Nyame sollerets" -- 5 mdb 150 meva
    }

    sets.defense.MDT = {
        ranged=def_linos,
        head="Fili calot +3",
        neck="Loricate torque +1",
        ear1="Sanare earring",
        ear2="Arete del luna +1",
        body="Adamantite armor",
        hands="Fili manchettes +3",
        ring1="Shadow ring",
        ring2={name="Vexer ring +1", bag="wardrobe6"},
        back=idle_mdt_cape,
        waist="Null belt",
        legs="Fili rhingrave +3",
        feet="Fili cothurnes +3"
    }

    sets.Kiting = {
        ring1="Shneddick ring +1",
        feet="Hippomenes socks +1"
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
        ear1="Dignitary's earring",
        ear2="Telos earring",        
        body="Ashera harness",
        hands="Bunzi's gloves",
        ring1={name="Chirich ring +1", bag="wardrobe5"},
        ring2={name="Chirich ring +1", bag="wardrobe6"},
        back=dw_cape,
        waist="Sailfi belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.TP = sets.engaged
    sets.engaged.Hybrid = set_combine(sets.engaged, {
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"}
    })

    sets.engaged.Accuracy = sets.engaged
    
    sets.midcast.Absorb = {
        ranged=fc_linos,
        head="Cath Palug crown",
        neck="Voltsurge torque",
        ear1="Enchanter's earring +1",
        ear2="Fili earring +1",
        body="Fili hongreline +3",
        hands="Fili manchettes +3",
        ring1="Kishar ring",
        ring2="Medada's ring",
        back=debuff_cape,
        waist="Null belt",
        legs="Fili rhingrave +3",
        feet="Fili cothurnes +3"
    }

    sets.enmity = {
        main="Mafic Cudgel",
        sub="Genmei Shield",
        range=def_linos,
        head="Halitus Helm",
        neck="Unmoving Collar +1",
        ear1="Trux Earring",
        ear2="Tuisto Earring",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        ring1="Eihwaz Ring",
        ring2="Supershear Ring",
        back=enmity_cape,
        waist="Flume Belt +1",
        legs="Zoar Subligar +1",
        feet="Nyame Sollerets"
    }

    sets.precast.JA['Sentinel'] = sets.enmity
    sets.precast.JA['Holy Circle'] = sets.enmity

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
                if generalClass == 'DaurdablaDummy' then
                    eventArgs.handled = true
                end
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and spell.targets.Enemy and state.EnmitySongs.value and not spell.name:contains("Lullaby") then
        equip(sets.enmity)
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
    elseif state.ExtraSongsMode.value and spell.name ~= "Honor March" and spell.name ~= "Aria of Passion" then
        return 'DaurdablaDummy'
    else
        return 'SongEffect'
    end
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
    if player.main_job == 'BRD' then send_command('@input /lockstyleset 2') end
end

function job_sub_job_change()
    coroutine.schedule(lockstyle,8)
end

function display_current_job_state(eventArgs)

end