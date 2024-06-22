-- NOTE: I do not play run, so this will not be maintained for 'active' use. 
-- It is added to the repository to allow people to have a baseline to build from,
-- and make sure it is up-to-date with the library API.


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Wiz-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
    state.OffenseMode:options('MultiHit', 'Acc', 'ParryDefense', 'ParryOffense')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT', 'ResistStatus', 'KnockBack')
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
        head="Erilaz Galea +3",
        neck="Futhark Torque +2",
        ear1="Sanare Earring",
        ear2="Erilaz Earring +1",
        body="Adamantite armor",
        hands="Erilaz Gauntlets +3",
        ring1="Shadow Ring",
        ring2="Moonlight Ring",
        back=mdt_cape,
        waist="Platinum moogle belt",
        legs="Erilaz Leg Guards +3",
        feet="Erilaz Greaves +3"
    }

    sets.defense.ResistStatus = set_combine(sets.defense.MDT, {
        ear1="Arete del luna +1",
        back=status_ailment_cape,
        hands="Erilaz gauntlets +3"
    })

    sets.defense.KnockBack = set_combine(sets.defense.MDT, {
        back="Repulse mantle",
        -- ring2="Vocane ring +1",
        legs="Dashing subligar"
    })

    -- 81 enmity
    sets.enmity = set_combine(sets.defense.PDT, {
        ammo="Aqreqaq bomblet", -- 2 enmity
        head="Halitus helm", -- 8 enmity
        neck="Futhark torque +2", --10 enmity
        ear1="Cryptic earring", --4 enmity
        body="Emet Harness +1", --10 enmity
        hands="Futhark mitons +3", -- 6 enmity
        -- ear2="Friomisi earring",
        ring1="Eihwaz ring", -- 5 enmity
        ring2="Supershear ring", -- 5 enmity        
        back=pdt_cape, -- 10 enmity
        waist="Platinum moogle belt",
        legs="Erilaz leg guards +3", --13 enmity
        feet="Erilaz greaves +3" --8 enmity
    })

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {
        body="Runeist coat +3",
        legs="Futhark trousers +3",
        back=pdt_cape
    })
    sets.precast.JA['Valiance'] = set_combine(sets.enmity, sets.precast.JA['Vallation'])
    sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist bottes +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head="Futhark bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Lunge'] = set_combine(sets.enmity, {
        ammo="Yamarang",
        head="Agwu's cap",
        neck="Sanctity necklace",
        -- ear1="Novio Earring",
        -- ear2="Friomisi Earring",
        body="Agwu's robe",
        hands="Agwu's gages",
        ring1="Metamorph ring +1",
        ring2="Shiva ring +1",
        back="Evasionist's Cape",
        waist="Orpheus's sash",
        legs="Agwu's slops",
        feet="Agwu's pigaches"
    })
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = set_combine(sets.enmity, {hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.enmity, {feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.enmity, {hands="Futhark Mitons +3"})
    sets.precast.JA['Embolden'] = {}
    sets.buff.Embolden = {back="Evasionist's cape"}
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.enmity, {head="Erilaz galea +3"})
    sets.precast.JA['One For All'] = set_combine(sets.enmity, {})

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
        head="Runeist bandeau +3", --fc 12%
        neck="Voltsurge torque", --fc 4%
        ear1="Etiolation earring",
        body="Erilaz surcoat +3", --fc 13%
        hands="Leyline gloves", --fc 8%
        ring1="Kishar ring",
        -- legs="Ayanmo cosciales +2", --fc 6%
        back=fast_cast_cape,
        feet="Carmine greaves +1"
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})

    local enmity_midcast = set_combine(sets.defense.PDT, {
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
        legs="Erilaz leg guards +3",
        feet="Erilaz greaves +3"
    })

    --SIRD
    local SIRD = set_combine(sets.defense.PDT, {
        ammo="Staunch tathlum +1", --11%
        head="Erilaz galea +3", --20%
        neck="Moonlight necklace", --15%
        ear1="Magnetic earring", --8%
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        hands="Regal Gauntlets", --15%
        back=fast_cast_cape, --10%
        waist="Audumbla sash", --10%
        legs="Carmine cuisses +1", --20%
    })

    local SIRD_enmity = set_combine(SIRD, {
        -- head="Halitus helm",
        body="Emet harness +1",
        ring1="Eihwaz ring"
    })

    --blu sub
    sets.midcast["Sheep Song"] = SIRD
    sets.midcast["Blank Gaze"] = SIRD
    sets.midcast["Jettatura"] = SIRD
    sets.midcast["Soporific"] = SIRD
    sets.midcast["Cursed Sphere"] = SIRD
    sets.midcast["Geist Wall"] = SIRD
    sets.midcast["Healing Breeze"] = SIRD

    --drk sub
    sets.midcast["Stun"] = enmity_midcast

    --Enhancing magic duration: 45%
    sets.midcast['Enhancing Magic'] = set_combine(SIRD, {
        head="Erilaz galea +3", --Enhancing magic effect duration +25%
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        waist="Audumbla sash",
        legs="Futhark trousers +3" --Enhancing magic duration +20%
    })

    sets.midcast["Cocoon"] = SIRD
    sets.midcast["Flash"] = enmity_midcast
    sets.midcast["Foil"] = enmity_midcast

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        head="Futhark bandeau +3",
        body={ name="Herculean Vest", augments={'STR+2','AGI+2','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10'}},
        hands="Herculean gloves",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs="Taeon tights",
        feet="Taeon boots"
    })
    
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
        head="Runeist bandeau +3"
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
        ring1="Petrov ring",
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
        legs="Lustratio subligar +1",
        feet="Lustratio leggings +1"
    }
    sets.precast.WS['Herculean Slash'] = sets.WS


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
        hands="Erilaz gauntlets +3",
        ring1={name="Moonlight ring", bag="wardrobe5"}, --dt: 5
        ring2="Gelatinous ring +1", --dt: 10        
        back= pdt_cape,--dt: 5
        waist="Flume belt +1",
        legs="Erilaz leg guards +3",  --dt: 13
        feet="Erilaz greaves +3"
    }

	sets.Kiting = {
        legs="Carmine cuisses +1",
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

    sets.engaged.Acc = {
        ammo="Yamarang",
        head="Runeist bandeau +3",
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
        head="Futhark Bandeau +3",
        neck="Futhark Torque +2",
        ear1="Sanare Earring",
        ear2="Erilaz Earring +1",
        body="Nyame Mail",
        hands="Turms Mittens +1",
        ring1="Shadow Ring",
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back=parry_cape,
        waist="Flume Belt +1",
        legs="Eri. Leg Guards +3",
        feet="Futhark Boots +3"        
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