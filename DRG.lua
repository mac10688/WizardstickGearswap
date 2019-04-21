-- Get Sets: Everything in this section is run as soon as you change jobs.
include('Mote-Utility.lua')

EngagedModes = {"TP", "DT"}
EngagedModeIndex = 1

send_command('bind f9 gs c cycle engaged_mode')

function file_unload()
    send_command('unbind f9')
end

function get_sets()
    sets = {}
    
	-- Regular Sets --
	sets.idle = {
        ammo="Staunch Tathlum",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Dgn. Collar +1",
        waist="Ioskeha Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-3%'}},
    }
              
    sets.engaged = {}
	sets.engaged['TP'] = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'Accuracy+14','"Dbl.Atk."+4','STR+10',}},
        hands="Sulev. Gauntlets +2",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Shulmanu Collar",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Flamma Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-3%'}},
    }

    sets.engaged['DT'] = sets.idle
              
    sets.ws = {}
    sets.ws["Camlann's Torment"] = {
        ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','Accuracy+3','Attack+11',}},
        body={ name="Valorous Mail", augments={'Accuracy+15 Attack+15','Weapon skill damage +4%','STR+13','Attack+2',}},
        hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
        legs="Vishap Brais +3",
        feet="Sulev. Leggings +2",
        neck="Dgn. Collar +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Karieyh Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

    sets.ws["Drakesbane"] = {
        ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','Accuracy+3','Attack+11'}},
        body={ name="Valorous Mail", augments={'Accuracy+15 Attack+15','Weapon skill damage +4%','STR+13','Attack+2'}},
        hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
        legs="Vishap Brais +3",
        feet="Sulev. Leggings +2",
        neck="Dgn. Collar +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Karieyh Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}},
    }

    sets.ws["Geirskogul"] = {
        ammo="Staunch Tathlum",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Dgn. Collar +1",
        waist="Ioskeha Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-3%'}},
    }

    sets.ws["Stardiver"] = {
        ammo="Amar Cluster",
        head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
        body={ name="Valorous Mail", augments={'Accuracy+14','"Dbl.Atk."+4','STR+10',}},
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-3%',}},
    }

    select_default_macro_book(player.sub_job)
end


-- Precast: JA and WS should be defined here, Fast Cast and such for magic. 
function precast(spell)
    if spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
	end
end            

-- Pet Change: Occurs when your Pet is summoned or killed.
function pet_change(pet,gain)
	if gain == false and pet.name then
		-- General announcement for when your Wyvern is killed, Dimissed, or eaten by Spirit Surge
		windower.add_to_chat(50,' *** '..string.upper(pet.name)..' IS DEAD YO ***') 
	end
end
 
-- Aftercast: Occurs following the use of any WS, JA, or Spell
function aftercast(spell)
	equip_current(player.status)
end

-- Status Change: When Engaging, Disengaging, Resting, Standing Up, etc.
function status_change(new, old)
	equip_current(new)
end

-- A custom function that equips a set based on whether you're engaged or not
function equip_current(status)
    if status == 'Engaged' then
        local engagedMode = EngagedModes[EngagedModeIndex]
		equip(sets.engaged[engagedMode])
	else
		equip(sets.idle)
	end
end
 
-- Manual commands sent in-game with //gs c <command>
function self_command(command)
	if command == 'cycle engaged_mode' then
        EngagedModeIndex = EngagedModeIndex % #EngagedModes + 1
        equip_current(player.status)

        local engagedMode = EngagedModes[EngagedModeIndex]
        windower.add_to_chat(122, 'Engaged Mode: '.. engagedMode) 
        
    end
end

function sub_job_change(new,old)
    select_default_macro_book(new)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(subjob)
    -- Default macro set/book
    if subjob == 'WAR' then
        set_macro_page(5, 15)
    elseif subjob == 'SAM' then
        set_macro_page(3, 15)
    elseif subjob == 'BLU' then
        set_macro_page(2, 15)
    else
        set_macro_page(5, 15)
    end
end