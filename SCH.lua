NukeTypeIndex = 2
NukeSet = {"Magic Attack Bonus","Magic Burst", "Vagary","Occult Acumen"}

IdleSetIndex = 1
IdleSet = {"Refresh", "PDT", "MDT"}

WeaponSetIndex = 3
WeaponSet = {"Tupsimati", "Musa", "None"}

Kiting = false

EatTp = false


send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleIdleSet')
send_command('bind f11 gs c EatTp')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function self_command(command)
    -- print(command)
    if command == 'CycleNukeSet' then
        NukeTypeIndex = NukeTypeIndex % #NukeSet + 1

        local nuke_set = NukeSet[NukeTypeIndex]
        add_to_chat(122, 'Nuke Set: ' .. nuke_set)
    elseif command == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1
        local weapon_set = WeaponSet[WeaponSetIndex]

        if weapon_set ~= 'None' then
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
            disable('main', 'sub')
        else
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
        end
        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif command == 'CycleIdleSet' then
        IdleSetIndex = IdleSetIndex % #IdleSet + 1

        local idle_set = IdleSet[IdleSetIndex]
        add_to_chat(122, 'Idle Set: ' .. idle_set)
        equip_set(player.status)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeTypeIndex]
        local idle_set = IdleSet[IdleSetIndex]
        local weapon_set = WeaponSet[WeaponSetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' || Idle Set: ' .. idle_set .. ' || Weapon Set: ' .. weapon_set)
        lockstyle()
    elseif string.find(command, 'WeaponSet') then
        local weaponIndex = tonumber(string.match(command, '%d+'))
        WeaponSetIndex = weaponIndex
        local weapon_set = WeaponSet[WeaponSetIndex]

        if weapon_set ~= 'None' then
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
            disable('main', 'sub')
        else
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
        end

        equip_set(player.status)
        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == 'EatTp' then
        EatTp = not EatTp
        if EatTp then
            send_command('@input /echo ----- Eat Tp On -----')
        else
            send_command('@input /echo ----- Eat Tp Off -----')
        end
        equip_set(player.status)
    end
end

function get_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    local idle_cape = { name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10'}}
    local nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%'}}
    local cure_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%'}}
    local mnd_magic_ws = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%'}}
    local int_magic_ws = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%'}}
    local ws_boots = { name="Merlinic Crackows", augments={'Attack+25','Crit.hit rate+3','Weapon skill damage +10%','Mag. Acc.+16 "Mag.Atk.Bns."+16'}}

    local fc_cape = idle_cape
    local int_enfeeble_cape = nuke_cape
    local mnd_enfeeble_cape = cure_cape

    local merlinic_legs_mb = { name="Merlinic Shalwar", augments={'Mag. Acc.+22','Magic burst dmg.+10%','MND+2','"Mag.Atk.Bns."+13'}}
    local merlinic_feet_mb = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+5'}}

    local chironic_refresh_legs = { name="Chironic Hose", augments={'STR+9','CHR+4','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14'}}

    sets.WeaponSet = {}
    sets.WeaponSet["None"] = {main="Malignance Pole", sub="Khonsu"}
    sets.WeaponSet["Tupsimati"] = {main="Tupsimati", sub="Enki strap"}
    sets.WeaponSet["Musa"] = {main="Musa", sub="Khonsu"}

    sets.precast = {}

    sets.ja = {}
    sets.ja['Tabula Rasa'] = { legs="Pedagogy Pants +3" }
    sets.ja['Enlightenment'] = {body="Pedagogy gown +3"}
    sets.ja['Sublimation'] = {head="Academic's mortarboard +3", body="Pedagogy gown +3", waist="Embla sash"}
    -- sets.precast.ja['Altruism'] = {}
    sets.ja['Focalization'] = {head="Pedagogy mortarboard +3"}

    sets.engaged = {
        head="Nyame helm",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Pedagogy gown +3",
        hands="Gazu bracelet +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        waist="Grunfeld rope",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        back={ name="Lugh's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15'}}
    }

    ------------
    -- Buff Sets
    ------------	
    -- Gear that needs to be worn to **actively** enhance a current player buff.
    -- Fill up following with your avaible pieces.
    sets.buff = {}
    sets.buff['Rapture'] = {head="Arbatel bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +3"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +3"}
    -- sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {} -- I left it there still if it becomes needed so the SCH.lua file won't need modification should you want to use this set
    sets.buff['Light Arts'] = {legs="Academic's pants +3"}


    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.buff.grimoire = {
		head="Pedagogy Mortarboard +3",
		feet="Academic's loafers +3",
    }
    
    --88% fc
    sets.precast.fc = {
        main="Musa", --fast cast 10%
        ammo="Incantor stone", --fast cast 2%
        head="Academic's mortarboard +3", --fast cast 8%
        neck="Voltsurge torque", --fast cast 4%
        ear1="Etiolation earring", --fast cast 2%
        ear2="Malignance earring", --fast cast 4%
        body="Pinga tunic +1", --fast cast 15%
        hands="Academic's bracers +3", --fast cast 8%
        ring1="Kishar ring", --fast cast 4%
        ring2="Prolix Ring", --fast cast 2%
        back=fc_cape, --fast cast 10%
        waist="Embla sash", --fast cast 5%
        legs="Agwu's slops", --fast cast 6%
        feet="Pedagogy loafers +3" --fast cast 8%
    }

    sets.precast["Stoneskin"] = set_combine(sets.precast.fc, {
        head="Umuthi hat"
    })

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        legs="Mallquis trews +2",
        left_ring="Mallquis Ring",
        left_ear="Barkarole earring"
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.fc, {})
    
    sets.precast.fc.cure = set_combine(sets.precast.fc, {})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        ammo="Pemphredo tathlum",
        head="Vanya hood",
        hands="Academic's bracers +3",
        waist="Austerity belt +1",
        feet="Medium's sabots"
    }

    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = set_combine(sets.precast.fc, {
        main="Tupsimati",
        sub="Enki strap",
        ammo="Pemphredo tathlum",
        head="Pedagogy mortarboard +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Pedagogy gown +3",
        hands="Amalric gages +1",
        ring1="Freke ring",
        ring2="Metamorph ring +1",
        back=nuke_cape,
        waist="Sacro cord",
        legs="Pedagogy pants +3",
        feet="Pedagogy loafers +3"
    })

    --Tier 4 spells for mb without killing
    sets.midcast.elemental["Vagary"] = {
        main="Malignance pole",
        sub="Khonsu",
        ammo="Incantor Stone",
        head="Pedagogy mortarboard +3",
        neck="Voltsurge Torque",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        body="Shango Robe",
        hands="Academic's bracers +3",
        ring1="Kishar Ring",
        ring2="Prolix Ring",
        back=idle_cape,
        waist="Embla sash",
        legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13'}},
        feet="Academic's loafers +3"
    }

    --MB1: 48
    --MB2: 12
    --Total MB: 60
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        main="Tupsimati",
        sub="Enki strap",
        head="Pedagogy Mortarboard +3", --MB2: 4
        neck="Argute stole +2", --MB: 7
        body="Agwu's robe", --MB: 10
        hands="Agwu's gages", --MB2: 5
        legs="Agwu's slops", --MB: 9
        -- feet="Arbatel loafers +1",
        feet="Agwu's pigaches", --MB: 6
        ring2="Mujin band" --MB2: 5
    })

    sets.midcast.elemental["Occult Acumen"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        ammo="Seraphic ampulla",
        head="Mallquis chapeau +2",
        neck="Combatant's torque",
        ear1="Dedition earring",
        ear2="Crepuscular earring",
        hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+23','"Occult Acumen"+10','Mag. Acc.+3'}},
        ring1={name="Chirich Ring +1", bag="wardrobe5"},
        ring2={name="Chirich Ring +1", bag="wardrobe6"},
        back={name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Store TP"+10','Spell interruption rate down-10%'}},
        waist="Oneiros rope",
        legs="Perdition slops",
        feet={ name="Merlinic Crackows", augments={'"Occult Acumen"+11','Mag. Acc.+15'}}
    })

    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.helix = set_combine(sets.midcast.elemental["Magic Burst"], {
        ammo="Ghastly tathlum +1",
        waist="Acuity belt +1"
    })

    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.dark_helix = set_combine(sets.midcast.helix, {
		head="Pixie Hairpin +1",
        ring1="Archon ring"
    })

    sets.midcast["Kaustra"] = sets.midcast.dark_helix
    
    sets.midcast.enfeebling = set_combine(sets.precast.fc, {
        main="Musa",
        ammo="Hydrocera",
        head="Academic's mortarboard +3",
        neck="Argute stole +2",
        ear1="Dignitary's earring",
        ear2="Regal earring",
        body="Academic's gown +3",
        hands="Kaykaus cuffs +1",
        ring1="Kishar ring",
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        back=nuke_cape,
        waist="Luminary sash",
        legs="Chironic hose",
        feet="Academic's loafers +3"
    })

    sets.midcast.int_enfeebling = set_combine(sets.midcast.enfeebling, {
        back = int_enfeeble_cape
    })

    sets.midcast.mnd_enfeebling = set_combine(sets.midcast.enfeebling, {
        back = mnd_enfeeble_cape
    })

    -- Cure: 43% in gear + 25% weapon
    -- FC: 
    sets.midcast.cure = set_combine(sets.precast.fc, {
        main="Musa", -- 25% cure | 10% fc
        -- head="Vanya hood", -- 10% cure | haste: 6%
        body="Pinga tunic +1", -- 15% cure | 15% fc
        hands="Pedagogy bracers +3", -- 3% cure II | 3% haste
        back=cure_cape, -- 10% fc
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        legs="Academic's pants +3", -- 8% cure | 
        -- legs="Pinga pants +1",
        feet="Pedagogy loafers +3"
    })

    sets.midcast.statusRemoval = sets.precast.fc

    ------------
    -- Regen
    ------------

    sets.midcast.enhancement_duration = {
        main="Musa",
        head="Telchine cap",
        body="Telchine chasuble",
        hands="Telchine gloves",
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    }

    sets.midcast["Sneak"] = sets.midcast.enhancement_duration
    sets.midcast["Invisible"] = sets.midcast.enhancement_duration

    sets.precast['Impact'] = set_combine(sets.precast.fc, {
        head=empty,
        body='Twilight cloak'
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head=empty,
        ring2="Archon ring",
        body='Twilight cloak'
    })

    sets.precast['Dispelga'] = set_combine(sets.precast.fc, {
        main="Daybreak",
        sub="Ammurapi shield"
    })

    sets.midcast['Dispelga'] = set_combine(sets.midcast.int_enfeebling, {
        main="Daybreak",
        sub="Ammurapi shield"
    })

    sets.midcast.regen = set_combine(sets.midcast.enhancement_duration, {
        head="Arbatel bonnet +1"
    })

    sets.midcast.drain_aspir = set_combine(sets.precast.fc, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        ring1="Excelsis ring",
        ring2="Archon ring",
        waist="Fucho-no-obi",
        legs="Pedagogy pants +3",
        feet="Merlinic crackows"
    })

    sets.midcast.healing = set_combine(sets.precast.fc, {
    })

    sets.midcast["Cursna"] = set_combine(sets.midcast.healing, {
        neck="Debilis Medallion",
        body="Pedagogy gown +3",
        hands="Pedagogy bracers +3",
        ring1="Haoma's ring",
        ring2="Menelaus's ring",
        feet="Gendewitha Galoshes +1"
    })

    sets.midcast.enhancing = set_combine(sets.midcast.enhancement_duration, {
        head="Arbatel bonnet +1",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Pedagogy gown +3",
        hands="Telchine gloves",
        waist="Embla sash",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"}
    })

    sets.midcast.storm = set_combine(sets.midcast.enhancement_duration,{
		feet="Pedagogy loafers +3",
    })

    sets.midcast.refresh = set_combine(sets.midcast.enhancement_duration,{
		-- head="Amalric Coif +1",
    })

    sets.midcast.aquaveil = sets.midcast.refresh

    sets.ws = {}

    local physical_int_ws = {
        head="Pedagogy mortarboard +3",
        neck="Fotia gorget",
        ear1="Regal earring",
        ear2="Barkarole earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Metamorph ring +1",
        ring2="Persis ring",
        back=int_magic_ws,
        waist="Fotia belt",
        legs="Nyame flanchard",
        feet=ws_boots
    }

    local magical_int_ws = {
        head="Pedagogy mortarboard +3",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1="Metamorph ring +1",
        ring2="Freke ring",
        back=int_magic_ws,
        waist="Orpheus's sash",
        legs="Pedagogy pants +3",
        feet=ws_boots
    }

    local magical_mnd_ws = {
        head="Nyame helm",
        neck="Argute stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Nyame mail",
        hands="Jhakri cuffs +2",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2="Freke ring",
        back=mnd_magic_ws,
        waist="Orpheus's sash",
        legs="Nyame flanchard",
        feet=ws_boots
    }

    local dark_magic_affinity = {head="Pixie hairpin +1", ring1="Archon ring"}
    local dark_magic_int_ws = set_combine(magical_int_ws, dark_magic_affinity)
    local dark_magic_mnd_ws = set_combine(magical_mnd_ws, dark_magic_affinity)

    -- STR 40% | Physical
    sets.ws["Heavy Swing"] = physical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.ws["Rock Crusher"] = magical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.ws["Earth Crusher"] = magical_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.ws["Starburst"] = dark_magic_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.ws["Sunburst"] = dark_magic_int_ws
    
    -- STR 100% | Physical
    sets.ws["Shell Crusher"] = physical_int_ws
    
    -- STR 50% | Physical
    sets.ws["Full Swing"] = physical_int_ws
    
    -- INT 50% MND 50% | Physical
    sets.ws["Spirit Taker"] = physical_int_ws
    
    -- STR 30% MND 50% | Physical
    sets.ws["Retribution"] = physical_int_ws

    -- STR 30% INT 30% | Magical
    sets.ws["Cataclysm"] = dark_magic_int_ws
    
    -- INT 85% | Physical
    sets.ws["Shattersoul"] = physical_int_ws

    -- MND 80% | Magical
    sets.ws["Omniscience"] = dark_magic_mnd_ws

    -- MAX MP
    sets.ws["Myrkr"] = {
        head="Pixie Hairpin +1",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        neck="Sanctity necklace",
        body="Pedagogy gown +3",
        hands="Kaykaus cuffs",
        ring1="Mephitas's ring +1",
        ring2="Persis ring",
        waist="Luminary sash",
        legs="Pedagogy pants +3",
        feet="Kaykaus boots"
    }

    sets.idle = {
        main="Malignance Pole",
        ammo="Staunch tathlum +1",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash robe",
        hands="Agwu's gages",
        left_ring="Defending ring",
        right_ring="Vengeful ring",
        back=idle_cape,
        waist="Slipor sash",
        legs="Assiduity pants +1",
        feet="Academic's loafers +3"
    }

    sets.idle["Refresh"] = set_combine(sets.idle, {
        ammo="Homiliary",
        ring1={name="Stikini Ring +1", bag="wardrobe5"},
        ring2={name="Stikini Ring +1", bag="wardrobe6"},
        body="Shamash robe",
        legs=chironic_refresh_legs
    })

    sets.idle["PDT"] = set_combine(sets.idle, {
        right_ring="Vengeful ring"
    })

    sets.idle["MDT"] = set_combine(sets.idle, {
        right_ring="Vengeful ring"
    })

    sets.kiting = {
        ring2="Shneddick ring"
    }

    coroutine.schedule(lockstyle,8)

end

-------------------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description that each of sets of related
-- spells all fall under.
-------------------------------------------------------------------------------------------------------------------

spell_maps = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Full Cure']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',    
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',['Refresh II']='Refresh',['Refresh III']='Refresh',
    ['Burn']='ElementalEnfeeble',['Frost']='ElementalEnfeeble',['Choke']='ElementalEnfeeble',['Rasp']='ElementalEnfeeble',['Shock']='ElementalEnfeeble',['Drown']='ElementalEnfeeble',
    ['Pyrohelix']='Helix',['Cryohelix']='Helix',['Anemohelix']='Helix',['Geohelix']='Helix',['Ionohelix']='Helix',['Hydrohelix']='Helix',['Luminohelix']='Helix',['Noctohelix']='DarkHelix',
    ['Pyrohelix II']='Helix',['Cryohelix II']='Helix',['Anemohelix II']='Helix',['Geohelix II']='Helix',['Ionohelix II']='Helix',['Hydrohelix II']='Helix',['Luminohelix II']='Helix',['Noctohelix II']='DarkHelix',
    ['Firestorm']='Storm',['Hailstorm']='Storm',['Windstorm']='Storm',['Sandstorm']='Storm',['Thunderstorm']='Storm',['Rainstorm']='Storm',['Aurorastorm']='Storm',['Voidstorm']='Storm',
    ['Firestorm II']='Storm',['Hailstorm II']='Storm',['Windstorm II']='Storm',['Sandstorm II']='Storm',['Thunderstorm II']='Storm',['Rainstorm II']='Storm',['Aurorastorm II']='Storm',['Voidstorm II']='Storm',
}

---- .::Precast Functions::. ---->
function precast(spell)
    -- print_set(spell)
    local spellType = spell_maps[spell.name]
    if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.action_type == 'Magic' then
        if spellType == "Cure" or spellType == "Curaga" then
            equip(sets.precast.fc.cure)
        -- Enhancing Magic --  
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.fc.enhancing)
        -- Elemental Magic --  
        elseif spell.skill == 'Elemental Magic' then
            equip(sets.precast.fc.elemental)
        else
            equip(sets.precast.fc)
        end

        -- extends Fast cast set with Grimoire recast aligned 
        if buffactive['addendum: black'] or buffactive['dark arts'] then
            if spell.type == 'BlackMagic' then
                equip(sets.buff.grimoire)
            end
        elseif buffactive['addendum: white'] or buffactive['light arts'] then
            if spell.type == 'WhiteMagic' then
                equip(sets.buff.grimoire)
            end
        end

    -- Job Abilities --
    elseif spell.type == 'JobAbility' then
        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])  
        end
    -- Weaponskills --
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        else
            equip(sets.ws)
        end
    end
end

---- .::Midcast Functions::. ---->
function midcast(spell)
    -- print_set(spell)

    local spellType = spell_maps[spell.name]
    if spell.action_type == 'Magic' then   
        -- Healing Magic --
        if sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        elseif spellType == "Cure" or spellType == "Curaga" then
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
            else
                equip(sets.midcast.cure)
            end
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if spellType == "Regen" then
                equip(sets.midcast.regen)
            elseif spellType == "Storm" then
                equip(sets.midcast.storm)
            elseif spellType == "Refresh" then
                equip(sets.midcast.refresh)
            elseif spellType == "StatusRemoval" then
                equip(sets.midcast.statusRemoval)
            elseif spell.name == "Aquaveil" then
                equip(sets.midcast.aquaveil)
            
            else
                equip(sets.midcast.enhancing)   
            end
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'BlackMagic' then -- to do: better rule for this.
            equip(sets.midcast.int_enfeebling)
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'WhiteMagic' then -- to do: better rule for this.
            equip(sets.midcast.mnd_enfeebling)
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast.enfeebling)
        elseif string.find(spell.english, 'Aspir') or string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain_aspir)
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            if spellType == 'DarkHelix' then
                equip(sets.midcast.dark_helix)
            elseif spellType == 'Helix' then
                equip(sets.midcast.helix)
                local distance = windower.ffxi.get_mob_by_index(spell.target.index).distance:sqrt()
                if distance < 5 then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Orpheus's sash"}))
                end
            else
                local nuke_set = NukeSet[NukeTypeIndex]
                local distance = windower.ffxi.get_mob_by_index(spell.target.index).distance:sqrt()
                if distance < 5 then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Orpheus's sash"}))
                elseif (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
                else
                    equip(sets.midcast.elemental[nuke_set])
                end
            end
        elseif sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        end

        if buffactive['Perpetuance'] and (spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic') then
            equip(sets.buff['Perpetuance'])
        end
        if buffactive['Rapture'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Rapture'])
        end
        if spell.skill == 'Elemental Magic' and spellType ~= 'ElementalEnfeeble' then
            if buffactive['Ebullience'] and spell.english ~= 'Impact' then
                equip(sets.buff['Ebullience'])
            end
            if buffactive['Immanence'] then
                equip(sets.buff['Immanence'])
            end
            -- if buffactive['Klimaform'] and spell.element == world.weather_element then
            --     equip(sets.buff['Klimaform'])
            -- end
        end
    
        if buffactive['Penury'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Penury']) 
        end
        if buffactive['Parsimony'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Parsimony'])
        end
        if buffactive['Celerity'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Celerity'])
        end
        if buffactive['Alacrity'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Alacrity'])
        end
        if buffactive['Light Arts'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Light Arts'])
        end

    end
end

function equip_set(status)
    if status == "Engaged" then
        equip(sets.engaged)
    else
        local idleSet = IdleSet[IdleSetIndex]
    -- print(idleSet)
        equip(sets.idle[idleSet])
    end
        
    local weapon_set = WeaponSet[WeaponSetIndex]
    equip(sets.WeaponSet[weapon_set])

    if Kiting then
        equip(set_combine(set_to_equip, sets.kiting))
    end

    if EatTp then
        equip({neck='Chrysopoeia torque'})
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    equip_set(new)
end

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

function lockstyle()
    if player.main_job == 'SCH' then send_command('@input /lockstyleset 4') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end