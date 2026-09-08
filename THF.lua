-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Wiz-Include.lua')
end

function job_setup()
    state.OffenseMode:options('TP', 'TreasureHunter')
end

function init_gear_sets()

    sets.idle = {
        -- ammo="Yamarang",
        ammo="Barthrum",
        head="Malignance chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A'}},
        waist="Flume Belt +1",
        left_ear="Hearty Earring",
        right_ear="Genmei earring",
        left_ring="Shneddick ring +1",
        right_ring="Defending Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Haste+10','Damage taken-5%'}},
    }

    sets.precast.WS = {
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}},
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat ring",
    }

    sets.precast.WS['Evisceration'] = sets.ws
    sets.precast.WS['Shark Bite'] = sets.ws
    sets.precast.WS['Dancing Edge'] = sets.ws
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.ws, {
        -- legs = 
        --     { name="Herculean Trousers", 
        --        augments={'Potency of "Cure" effect received+4%','STR+1','Weapon skill damage +8%','Accuracy+13 Attack+13','Mag. Acc.+14 "Mag.Atk.Bns."+14'}
        --     }
            legs="Nyame flanchard",
            feet="Nyame sollerets"
        }
    )
    
    -- sets.melee = 

    sets.engaged.TP = {
        -- ammo="Yamarang",
        ammo="Barthrum",
        head="Malignance chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu torque",
        waist="Sailfi belt +1",
        left_ear="Dedition earring",
        right_ear="Skulker's earring +1",
        ring1={name="Moonlight ring", bag="wardrobe5"},
        ring2={name="Moonlight ring", bag="wardrobe6"},
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Haste+10','Damage taken-5%'}},
    }

    sets.engaged['Treasure Hunter'] = set_combine(sets.engaged.TP, {
            body={ name="Herculean Vest", augments={'Accuracy+1','INT+1','"Treasure Hunter"+2','Accuracy+10 Attack+10'}},
            waist="Chaac belt",
            legs={ name="Herculean Trousers", augments={'Attack+19','"Dual Wield"+1','"Treasure Hunter"+2'}},
        })
    
    sets.ja = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.

    sets.kiting = {}

    sets.fc = {}
    sets.fc["Utsusemi: Ichi"] = set_combine(sets.fc, {})
    sets.fc["Utsusemi: Ni"] = sets.fc["Utsusemi: Ichi"]

    sets.midcast = {} --No gear should be defined here. This set will enver be used. Only used to prevent nil references.
    sets.midcast.fastcast = { } --Fast cast gear can go here to reduce recast timers

end
