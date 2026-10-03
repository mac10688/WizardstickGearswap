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

    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}

    magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}

    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false

    state.Opashoro = M{['description']='Opashoro Set', 'Elan'}
    state.CombatWeapon:set('Opashoro')

end

function file_unload()

end

function init_gear_sets()
    gear.PetMabHands = { name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+26','Blood Pact Dmg.+10','Pet: STR+8','Pet: Mag. Acc.+6'}}
    gear.PetPhysHands = { name="Merlinic Dastanas", augments={'Pet: Attack+15 Pet: Rng.Atk.+15','Blood Pact Dmg.+10','Pet: STR+8','Pet: Mag. Acc.+11'}}

    sets.Opashoro = {}
    sets.Opashoro.Elan = {main="Opashoro", sub="Elan Strap +1"}

    local PetPhysCape = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%'}}
    local PetMABCape = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10','Pet: Damage taken -5%'}}
    local CureCape = { name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Pet: Phys. dmg. taken-10%'}}
    local MndWsdCape = { name="Campestres's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}

    jse.artifact.head = "Convoker's Horn +3"
    jse.artifact.body = "Convoker's Doublet +3"
    jse.artifact.hands = "Convoker's Bracers +3"
    jse.artifact.legs = "Convoker's Spats +3"
    jse.artifact.feet = "Convoker's Pigaches +3"

    jse.relic.head = "Glyphic Horn +3"
    jse.relic.body = "Glyphic Doublet +3"
    jse.relic.hands = "Glyphic Bracers +3"
    jse.relic.legs = "Glyphic Spats +3"
    jse.relic.feet = "Glyphic Pigaches +3"

    jse.empyrean.head = "Beckoner's Horn +3"
    jse.empyrean.body = "Beckoner's Doublet +3"
    jse.empyrean.hands = "Beckoner's Bracers +3"
    jse.empyrean.legs = "Beckoner's Spats +3"
    jse.empyrean.feet = "Beckoner's Pigaches +3"

    jse.earring = "Beckoner's earring +1"

    sets.precast.JA['Astral Flow'] = {head=jse.relic.head}
    sets.precast.JA['Mana Cede'] = {hands=jse.empyrean.hands}

    local summoning_skill_set = {
        head=jse.empyrean.head,
        neck="Hoxne Torque",
        ear1="Andoaa earring",
        ear2="Lodurr Earring",
        body=jse.empyrean.body,
        hands=jse.relic.hands,
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Conveyance Cape",
        waist="Lucidity sash",
        legs=jse.empyrean.legs,
        feet="Baayami sabots"
    }

    sets.precast.JA['Elemental Siphon'] = set_combine( summoning_skill_set, {
        feet=jse.empyrean.feet
    })

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
        body=jse.artifact.body,
        feet=jse.relic.feet
    }

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    sets.precast.FC = {
        head="Cath Palug crown",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Malignance earring",
        body="Shango robe",
        ring1="Kishar ring",
        ring2="Medada's ring",
        waist="Embla sash",
        legs="Lengo pants",
        feet="Merlinic crackows"
    }

    sets.precast.WS = {
        head="Nyame Helm",
        neck="Sibyl Scarf",
        ear1="Moonshade Earring",
        ear2="Hoxne Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Ephramad's Ring",
        ring2="Metamor. Ring +1",
        back=MndWsdCape,
        waist="Acuity Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.precast.WS['Oshala'] = {
        head="Nyame Helm",
        neck="Sibyl Scarf",
        ear1="Moonshade Earring",
        ear2="Hoxne Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Ephramad's Ring",
        ring2="Metamor. Ring +1",
        back=MndWsdCape,
        waist="Acuity Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    -- Avatar pact sets.  All pacts are Ability type.

    sets.midcast.Pet.BuffBloodPactWard = set_combine(summoning_skill_set, {})
    sets.midcast.Pet.DebuffBloodPactWard = set_combine(summoning_skill_set, {
        hands=jse.empyrean.hands,
        back=PetMABCape,
        feet=jse.empyrean.feet
    })

    sets.midcast.Pet.PhysicalBloodPactRage = {
        head=jse.relic.head,
        neck="Smn. Collar +2",
        ear1="Lugalbanda Earring",
        ear2="Sroda earring",
        body=jse.artifact.body,
        hands=gear.PetPhysHands,
        ring1={ name="Varar Ring +1",bag="Wardrobe7"},
        ring2={ name="Varar Ring +1",bag="Wardrobe8"},
        back=PetPhysCape,
        waist="Incarnation Sash",
        legs=jse.empyrean.legs,
        feet="Apogee pumps +1"
    }

    sets.midcast.Pet.MagicalBloodPactRage = set_combine( sets.midcast.Pet.PhysicalBloodPactRage, {
        ear2="Gelos earring",
        ear1="Lugalbanda earring",
        hands=gear.PetMabHands,
        ring2="Speaker's Ring",
        back=PetMABCape,
        --waist="Regal Belt",
        legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8'}},
        feet="Apogee pumps +1"
    })

    sets.midcast.Pet["Wind's Blessing"] = set_combine( summoning_skill_set, {
        neck="Smn. Collar +2",
        body="Shomonjijoe +1",
        hands="Lamassu Mitts +1",
        legs="Assid. Pants +1",
        feet="Bunzi's Sabots"
    })

    sets.midcast.Pet.WhiteMagic = sets.midcast.Pet.BuffBloodPactWard

    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})

    sets.midcast.Cure = {
        head="Vanya Hood",
        body="Bunzi's Robe",
        hands="Telchine Gloves",
        legs="Gyve Trousers",
        feet="Medium's Sabots",
        back=CureCape
    }

    -- Idle sets
    sets.idle = {
        head=jse.empyrean.head,
        neck="Summoner's collar +2",
        ear2="Lodurr earring",
        ear1="Lugalbanda earring",
        body=jse.empyrean.body,
        hands=jse.artifact.hands,
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back="Null shawl",
        waist="Incarnation sash",
        legs=jse.artifact.legs,
        feet=jse.empyrean.feet
    }

    sets.idle.Refresh = set_combine(sets.idle, {})

    sets.idle.Defense = set_combine(sets.idle, {})

    -- Need -14 perp --
    sets.idle.Refresh.Avatar = set_combine(sets.idle, {})

    sets.idle.Defense.Avatar = set_combine(sets.idle, {})

    sets.idle.Refresh.Spirit = set_combine(sets.idle, {})

    sets.idle.Refresh.Spirit = set_combine(sets.idle, {})

    sets.perp = {}
    sets.perp['Cait Sith'] = {
        hands="Lamassu mitts +1"
    }

    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}

    -- Normal melee group
    sets.engaged = {
        head=jse.empyrean.head,
        neck="Null Loop",
        ear1="Alabaster Earring",
        ear2="Crep. Earring",
        body=jse.empyrean.body,
        hands="Bunzi's Gloves",
        ring1={ name="Varar Ring +1",bag="Wardrobe7"},
        ring2={ name="Varar Ring +1",bag="Wardrobe8"},
        back="Null Shawl",
        waist="Null Belt",
        legs=jse.empyrean.legs,
        feet=jse.empyrean.feet
    }

    sets.Kiting = {ring1="Shneddick ring +1"}

    coroutine.schedule(lockstyle,8)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if pet.isvalid and sets.perp[pet.name] then
        idleSet = set_combine(idleSet, sets.perp[pet.name])
    end

    return idleSet
end

-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if type(spell.type) == 'string' and spell.type:startswith("BloodPact") and not spell.interrupted then
        if sets.midcast.Pet[spell.name] then
            equip(sets.midcast.Pet[spell.name])
            eventArgs.handled = true
        elseif sets.midcast.Pet[spellMap] then
            equip(sets.midcast.Pet[spellMap])
            eventArgs.handled = true
        end
    end
end

-- Custom spell mapping.
function job_get_spell_map(spell)
    if spell.type == 'BloodPactRage' then
        if magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
        else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
        return 'DebuffBloodPactWard'
    elseif spell.type == 'BloodPactWard' then
        return 'BuffBloodPactWard'
    end
end

function lockstyle()
    if player.main_job == 'SMN' then send_command('@input /lockstyleset 13') end
end
