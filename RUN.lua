-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Wiz-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
    state.OffenseMode:options('ParryDefense', 'ParryOffense', 'MultiHit', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT', 'ResistStatus', 'KnockBack', 'Meva', 'IceMagic')
    state.CastingMode:options('Normal', 'Defensive')
    state.IdleMode:options('Regen', 'Refresh')
    state.CombatWeapon:set('Epeolatry')

    state.Epeolatry = M{['description']='Epeolatry Set', 'Utu', 'Khonsu', 'Mensch', 'Irenic'}
    state.Lionheart = M{['description']='Lionheart Set', 'Utu', 'Khonsu', 'Mensch', 'Irenic'}
    state.Lycurgos = M{['description']='Lycurgos Set', 'Utu', 'Khonsu', 'Mensch', 'Irenic'}

    send_command('bind ~f1 gs c set CombatWeapon Epeolatry')
    send_command('bind ~f2 gs c set CombatWeapon Lionheart')
    send_command('bind ~f3 gs c set CombatWeapon Lycurgos')
end

function job_file_unload()
    send_command('unbind ~f1')
    send_command('unbind ~f2')
    send_command('unbind ~f3')
end

function init_gear_sets()
    local status_ailment_cape = { name="Ogma's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Occ. inc. resist. to stat. ailments+10'}}
    local fast_cast_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local pdt_cape = { name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50'}}
    local mdt_cape = { name="Ogma's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','INT+10','"Fast Cast"+10','Mag. Evasion+15'}}
    local atk_cape = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    local dimi_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}
    local parry_cape = { name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Dbl.Atk."+10','Parrying rate+5%'}}

    jse.artifact.head = "Runeist Bandeau +3"
	jse.artifact.body = "Runeist Coat +3"
	jse.artifact.hands = "Runeist Mitons +3"
	jse.artifact.legs = "Runeist Trousers +3"
	jse.artifact.feet = "Runeist Bottes +3"

	jse.relic.head = "Futhark Bandeau +4"
	jse.relic.body = "Futhark Coat +3"
	jse.relic.hands = "Futhark Mitons +4"
	jse.relic.legs = "Futhark Trousers +3"
	jse.relic.feet = "Futhark Boots +3"

	jse.empyrean.head = "Erilaz Galea +3"
	jse.empyrean.body = "Erilaz Surcoat +3"
	jse.empyrean.hands = "Erilaz Gauntlets +3"
	jse.empyrean.legs = "Erilaz Leg Guards +3"
	jse.empyrean.feet = "Erilaz Greaves +3"

    jse.earring = "Erilaz earring +1"

    sets.Epeolatry = {main="Epeolatry", sub="Utu grip"}
    sets.Epeolatry.Utu = {main="Epeolatry", sub="Utu grip"}
    sets.Epeolatry.Khonsu = {main="Epeolatry", sub="Khonsu"}
    sets.Epeolatry.Mensch = {main="Epeolatry", sub="Mensch strap +1"}
    sets.Epeolatry.Irenic = {main="Epeolatry", sub="Irenic strap +1"}

    sets.Lionheart = {main="Lionheart", sub="Utu grip"}
    sets.Lionheart.Utu = {main="Lionheart", sub="Utu grip"}
    sets.Lionheart.Khonsu = {main="Lionheart", sub="Khonsu"}
    sets.Lionheart.Mensch = {main="Lionheart", sub="Mensch strap +1"}
    sets.Lionheart.Irenic = {main="Lionheart", sub="Irenic strap +1"}

    sets.Lycurgos = {main="Lycurgos", sub="Utu grip"}
    sets.Lycurgos.Utu = {main="Lycurgos", sub="Utu grip"}
    sets.Lycurgos.Khonsu = {main="Lycurgos", sub="Khonsu"}
    sets.Lycurgos.Mensch = {main="Lycurgos", sub="Mensch strap +1"}
    sets.Lycurgos.Irenic = {main="Lycurgos", sub="Irenic strap +1"}

    --DT: 52
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Unmoving Collar +1",
        ear1="Ran Earring",
        ear2="Tuisto Earring",
        body="Adamantite armor",
        hands="Nyame Gauntlets",
        ring1="Shadow Ring",
        ring2="Gelatinous Ring +1",
        back=pdt_cape,
        waist="Flume Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    --dt: 50
    --mdb: 49
    --meva: 438
    --resist elements: 55
    --resist status: 19
    sets.defense.MDT = {
        ammo="Yamarang",
        head=jse.empyrean.head,
        neck="Warder's charm +1",
        ear1="Sanare earring",
        ear2="Alabaster earring",
        body=jse.empyrean.body,
        hands=jse.empyrean.hands,
        ring1="Shadow ring",
        ring2="Defending ring",
        back=mdt_cape,
        waist="Platinum moogle belt",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    }

    sets.defense.ResistStatus = set_combine(sets.defense.MDT, {
        ear1="Arete del luna +1",
        back=status_ailment_cape,
        hands=jse.empyrean.hands
    })

    sets.defense.Meva = set_combine(sets.defense.MDT, {
        ear1="Arete del luna +1",
        back=status_ailment_cape,
        hands=jse.empyrean.hands
    })

    sets.defense.KnockBack = set_combine(sets.defense.MDT, {
        back="Repulse mantle",
        -- ring2="Vocane ring +1",
        legs="Dashing subligar"
    })

    -- 48% DT
    -- 5% MDT
    -- 25% PDT II
    -- 21 enmity
    -- 3230 HP
    -- 1322 DEF
    -- 49 MDB
    -- 741 MEVA
    -- Boosts enmity retention when taking damage +14
    -- 5% chance of converting damage taken to HP restored. Good for fetters.
    -- 8% chance to absorb magic
    -- 12% chance to annul magic damage
    sets.defense.IceMagic = {
        ammo="Snow sachet",
        head=jse.empyrean.head,
        neck="Warder's charm +1",
        ear1="Sanare earring",
        ear2="Alabaster earring",
        body=jse.empyrean.body,
        hands=jse.empyrean.hands,
        ring1="Shadow ring",
        ring2="Defending ring",
        back=mdt_cape,
        waist="Platinum moogle belt",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    }

    -- 81 enmity
    sets.enmity = set_combine(sets.defense.PDT, {
        ammo="Aqreqaq bomblet", -- 2 enmity
        head="Halitus helm", -- 8 enmity
        neck="Futhark torque +2", --10 enmity
        ear1="Cryptic earring", --4 enmity
        body="Emet Harness +1", --10 enmity
        hands=jse.relic.hands, -- 6 enmity
        -- ear2="Friomisi earring",
        ring1="Eihwaz ring", -- 5 enmity
        ring2="Supershear ring", -- 5 enmity        
        back=pdt_cape, -- 10 enmity
        waist="Platinum moogle belt",
        legs=jse.empyrean.legs, --13 enmity
        feet=jse.empyrean.feet --8 enmity
    })

    -- 51% DT
    -- 76 enmity (+23 from epeo + 5 from merits = 104 total)
    -- 3433 HP
    -- 1469 DEF
    -- 50 MDB
    -- 611 MEVA
    -- With 5/5 merits sleight of hand, 35 subtle blow
    -- 2% chance of converting damage taken to HP restored. Good for fetters.
    sets.enmity.Hybrid = {
        ammo="Aqreqaq bomblet",
        head="Halitus helm",
        neck="Moonlight necklace",
        ear1="Cryptic earring",
        ear2="Alabaster earring",
        body={name="Adamantite armor", priority=20},
        hands=jse.relic.hands,
        ring1="Eihwaz ring",
        ring2="Supershear ring",
        back=pdt_cape,
        waist="Platinum moogle belt",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    }

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {
        body=jse.artifact.body,
        legs=jse.relic.legs,
        back=pdt_cape
    })
    sets.precast.JA['Vallation'].Hybrid = set_combine(sets.enmity.Hybrid, {
        body=jse.artifact.body
    })

    sets.precast.JA['Valiance'] = set_combine(sets.enmity, sets.precast.JA['Vallation'])
    sets.precast.JA['Valiance'].Hybrid = set_combine( sets.enmity.Hybrid, {
        body=jse.artifact.body
    })

    sets.precast.JA['Pflug'] = set_combine(sets.enmity)
    sets.precast.JA['Pflug'].Hybrid = sets.enmity.Hybrid

    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head=jse.relic.head})
    sets.precast.JA['Battuta'].Hybrid = sets.enmity.Hybrid

    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body=jse.relic.body})
    sets.precast.JA['Liement'].Hybrid = set_combine(sets.enmity.Hybrid, {body=jse.relic.body})

    sets.precast.JA['Lunge'] = set_combine(sets.enmity, {
        ammo="Yamarang",
        head="Agwu's cap",
        neck="Sanctity necklace",
        -- ear1="Novio Earring",
        -- ear2="Friomisi Earring",
        body="Agwu's robe",
        hands="Agwu's gages",
        ring1="Metamorph ring +1",
        ring2="Medada's ring",
        back="Evasionist's Cape",
        waist="Orpheus's sash",
        legs="Agwu's slops",
        feet="Agwu's pigaches"
    })
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = set_combine(sets.enmity, {hands=jse.artifact.hands})
    sets.precast.JA['Rayke'] = set_combine(sets.enmity, {feet=jse.relic.feet})

    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity, {body=jse.relic.body})
    sets.precast.JA['Elemental Sforzo'].Hybrid = set_combine(sets.enmity.Hybrid, {head="Halitus helm", body=jse.relic.body})

    sets.precast.JA['Odyllic Subterfuge'] = set_combine(sets.enmity, {})
    sets.precast.JA['Odyllic Subterfuge'].Hybrid = set_combine(sets.enmity.Hybrid, {})

    sets.precast.JA['Swordplay'] = set_combine(sets.enmity, {hands=jse.relic.hands})
    sets.precast.JA['Swordplay'].Hybrid = set_combine(sets.enmity.Hybrid, {hands=jse.relic.hands})

    sets.precast.JA['Embolden'] = {}
    sets.buff.Embolden = {back="Evasionist's cape"}

    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.enmity, {head=jse.empyrean.head})
    sets.precast.JA['Vivacious Pulse'].Hybrid = set_combine(sets.enmity.Hybrid, {head=jse.empyrean.head})

    sets.precast.JA['One for All'] = set_combine(sets.enmity, {})
    sets.precast.JA['One for All'].Hybrid = set_combine(sets.enmity.Hybrid, {head="Halitus helm", body=""})

    sets.precast.JA['Provoke'] = sets.enmity
    sets.precast.JA['Warcry'] = sets.enmity
    sets.precast.JA['Defender'] = sets.enmity
    sets.precast.JA['Aggressor'] = sets.enmity

    sets.precast.JA['Weapon Bash'] = sets.enmity
    sets.precast.JA['Souleater'] = sets.enmity
    sets.precast.JA['Last Resort'] = sets.enmity

    sets.precast.JA['Sentinel'] = sets.enmity
	-- Fast cast sets for spells
    --Fast cast: 28%
    sets.precast.FC = {
        head=jse.artifact.head, --fc 12%
        neck="Voltsurge torque", --fc 4%
        ear1="Etiolation earring",
        body=jse.empyrean.body, --fc 13%
        hands="Leyline gloves", --fc 8%
        ring1="Kishar ring",
        -- legs="Ayanmo cosciales +2", --fc 6%
        back=fast_cast_cape,
        feet="Carmine greaves +1"
    }

    sets.precast.FC.Defensive = {
        head=jse.artifact.head, --fc 12%
        body=jse.empyrean.body, --fc 13%
        back=fast_cast_cape
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs=jse.empyrean.legs})
    sets.precast.FC['Enhancing Magic'].Defensive = set_combine(sets.precast.FC.Defensive, {legs=jse.empyrean.legs})

    sets.enmity_midcast = set_combine(sets.defense.PDT, {
        ammo="Staunch tathlum +1",
        head="Halitus helm",
        body="Emet harness +1",
        ear1="Cryptic earring",
        ear2="Tuisto earring",
        hands="Kurys gloves",
        ring1="Eihwaz ring",
        ring2="Gelatinous ring +1",
        back=pdt_cape,
        waist="Audumbla sash",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    })

    --SIRD
    sets.SIRD = set_combine(sets.defense.PDT, {
        ammo="Staunch tathlum +1", --11%
        head=jse.empyrean.head, --20%
        neck="Moonlight necklace", --15%
        ear1="Magnetic earring", --8%
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        hands="Regal Gauntlets", --15%
        back=fast_cast_cape, --10%
        waist="Audumbla sash", --10%
        legs="Carmine cuisses +1", --20%
    })

    sets.SIRD_enmity = set_combine(sets.SIRD, {
        -- head="Halitus helm",
        body="Emet harness +1",
        ring1="Eihwaz ring"
    })

    --blu sub
    sets.midcast["Sheep Song"] = sets.SIRD
    sets.midcast["Blank Gaze"] = sets.SIRD
    sets.midcast["Jettatura"] = sets.SIRD
    sets.midcast["Soporific"] = sets.SIRD
    sets.midcast["Cursed Sphere"] = sets.SIRD
    sets.midcast["Geist Wall"] = sets.SIRD
    sets.midcast["Healing Breeze"] = sets.SIRD

    --drk sub
    sets.midcast["Stun"] = sets.enmity_midcast

    --Enhancing magic duration: 45%
    sets.midcast['Enhancing Magic'] = set_combine(sets.SIRD, {
        head=jse.empyrean.head, --Enhancing magic effect duration +25%
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        waist="Audumbla sash",
        legs=jse.relic.legs --Enhancing magic duration +20%
    })

    sets.midcast['Enhancing Magic'].Defensive = set_combine(sets.defense.IceMagic, {
        head=jse.empyrean.head, --Enhancing magic effect duration +25%
        legs=jse.relic.legs, --Enhancing magic duration +20%
        back=fast_cast_cape
    })

    sets.midcast["Cocoon"] = sets.SIRD
    sets.midcast["Flash"] = sets.enmity_midcast
    sets.midcast["Flash"].Defensive = sets.enmity.Hybrid
    sets.midcast["Foil"] = sets.enmity_midcast
    sets.midcast["Foil"].Defensive = sets.enmity.Hybrid

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        head=jse.relic.head,
        body={ name="Herculean Vest", augments={'STR+2','AGI+2','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10'}},
        hands="Herculean gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs="Taeon tights",
        feet="Taeon boots"
    })

    sets.midcast.Phalanx.Defensive = set_combine(sets.defense.IceMagic, {
        head=jse.relic.head,
        back=fast_cast_cape
    })
        
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
        head=jse.artifact.head
    })

	-- Weaponskill sets
    sets.precast.WS = { 
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2="Regal ring",
        back=atk_cape,
        waist="Fotia belt",        
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }
    
    sets.precast.WS['Resolution'] = { 
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2="Regal ring",
        back=atk_cape,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.precast.WS['Dimidiation'] = {
        ammo="Knobkierrie",
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Sherida earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Niqmaddu ring",
        ring2="Ilabrat ring",
        back=dimi_cape,
        waist="Fotia belt", 
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }
    
    sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS['Resolution'],
    {
        neck="Republican platinum medal",
        waist="Kentarch belt +1"
    })


	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {
        ammo="Staunch tathlum +1", --dt: 3
        head="Nyame helm", --dt: 7
        neck="Futhark torque +2",--dt: 7
        ear1="Odnowa earring +1",--dt: 3
        ear2="Tuisto earring",
        body="Nyame mail", --dt: 9
        hands=jse.empyrean.hands,
        ring1={name="Moonlight ring", bag="wardrobe5"}, --dt: 5
        ring2="Gelatinous ring +1", --dt: 10        
        back= pdt_cape,--dt: 5
        waist="Flume belt +1",
        legs=jse.empyrean.legs,  --dt: 13
        feet=jse.empyrean.feet
    }

	sets.Kiting = {
        ring1="Shneddick ring +1",
        feet="Hippomenes socks +1"
    }
	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
        ammo="Yamarang",
        head="Dampening tam",
        neck="Anu torque",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ear1="Telos earring",
        ear2="Sherida earring",
        ring1="Niqmaddu ring",
        ring2="Epona's ring",
        back=atk_cape,
        waist="Sarissaphoroi belt",
        legs="Samnuha tights",
        feet="Nyame sollerets"
    }

    sets.engaged.MultiHit = {
        ammo="Coiste Bodhar",
        head="Nyame helm",
        neck="Anu torque",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ear1="Telos earring",
        ear2="Sherida earring",
        ring1="Niqmaddu ring",
        ring2="Epona's ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.Acc = {
        ammo="Yamarang",
        head=jse.artifact.head,
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame mail",
        hands="Nyame gauntlets",
        ring1="Chirich ring +1",
        ring2="Regal ring",
        back=atk_cape,
        waist="Ioskeha belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    sets.engaged.ParryOffense = {
        ammo="Yamarang",
        head=jse.relic.head,
        neck="Futhark Torque +2",
        ear1="Alabaster earring",
        ear2="Sherida earring",
        body="Nyame Mail",
        hands="Turms Mittens +1",
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back=parry_cape,
        waist="Ioskeha belt +1",
        legs=jse.empyrean.legs,
        feet=jse.relic.feet        
    }

    sets.engaged.ParryDefense = set_combine(sets.engaged.ParryOffense, {
        feet="Turms leggings +1"        
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

------------------------------------------------------------------
-- Action events
------------------------------------------------------------------

function job_precast(spell)
    if state.DefenseMode.value == 'Magical' then
        classes.JAMode = 'Hybrid'
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- if spell.english == 'Lunge' or spell.english == 'Swipe' then
    --     local obi = get_obi(get_rune_obi_element())
    --     if obi then
    --         equip({waist=obi})
    --     end
    -- end
end

function job_buff_change(buff, gain)
    if buff == 'Embolden' and gain then
        enable('back')
        equip(sets.buff.Embolden)
        disable('back')
    elseif buff == 'Embolden' and not gain then
        enable('back')
    end
end

function job_aftercast(spell)

end

function job_state_change(descrip, newVal, oldVal)

end

function lockstyle()
    if player.main_job == 'RUN' then send_command('@input /lockstyleset 5') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end

function display_current_job_state(eventArgs)

end