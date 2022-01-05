ExtraSongs = false

LullabySetIndex = 1
LullabySet = {"Accuracy", "Duration"}

WeaponSetIndex = 3
WeaponSet = {"Savage", "Savage II", "Mordent", "Mage", "Mage II", "Mage III"}

Kiting = false


send_command('bind f9 gs c CycleWeaponSet')
send_command('bind f10 gs c LullabyMode')
send_command('bind f11 gs c ExtraSongs')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function get_sets()

    local debuff_cape = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    local tp_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    
    local atk_linos = { name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3'}}
    local ws_linos = { name="Linos", augments={'Attack+18','Weapon skill damage +3%','STR+6 DEX+6'}}
    
    local mordant_rime_cape = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%'}}
    local savage_blade_cape = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%'}}
    local rudra_storm_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}

    local fast_cast_cape = { name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%'}}

    sets.WeaponSet = {}
    sets.WeaponSet["Savage"] = {main="Naegling", sub="Centovente"}
    sets.WeaponSet["Savage II"] = {main="Naegling", sub="Genmei shield"}
    sets.WeaponSet["Mordent"] = {main="Carnwenhan", sub="Centovente"}
    sets.WeaponSet["Mage"] = {main="Carnwenhan", sub="Ammurapi shield"}
    sets.WeaponSet["Mage II"] = {main="Carnwenhan", sub="Genmei shield"}

    sets.engaged = {}
    sets.engaged.tp = {
        ranged=atk_linos,
        head="Bihu roundlet +3",
        neck="Bard's charm +2",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Bihu justaucorps +3",
        hands="Gazu Bracelet +1",
        ring1="Hetairoi ring",
        ring2="Chirich ring +1",
        back=tp_cape,
        waist="Reiki yotai",
        legs="Bihu cannions +3",
        feet="Bihu slippers +3"
    }

    sets.engaged.tp.nin = {}
    sets.engaged.tp.dnc = {}
    sets.engaged.tp.shield = {}
    sets.engaged.tp.dt = {}

    sets.ja = {}
    sets.ja["Troubadour"] = {body="Bihu justaucorps +3"}
    sets.ja["Soul Voice"] = {legs="Bihu cannions +3"}
    sets.ja["Nightingale"] = {feet="Bihu slippers +3"}

    sets.ws = {
        ranged=ws_linos,
        head="Nyame helm",
        neck="Fotia gorget",
        ear1="Moonshade earring",
        ear2="Ishvara earring",
        body="Bihu Justaucorps +3",
        hands="Nyame gauntlets",
        waist="Fotia belt",
        feet="Nyame sollerets",
        legs="Nyame flanchard",
        back=mordant_rime_cape
    }

    sets.ws['Mordant Rime'] = set_combine(sets.ws, {
        neck="Bard's charm +2",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Bihu justaucorps +3",
        back=mordant_rime_cape,
        -- legs="Bihu cannions +3"
    })

    sets.ws["Rudra's Storm"] = set_combine(sets.ws, {
        neck="Bard's charm +2",
        ring1="ILabrat ring",
        back=rudra_storm_cape,
        -- legs="Lustratio subligar +1",
        -- feet="Lustratio leggings +1"
    })

    sets.ws['Evisceration'] = set_combine(sets.ws, {
        neck="Bard's charm +2",
        ring1="Hetairoi ring",
        legs="Lustratio subligar +1",
        feet="Lustratio leggings +1"
    })

    sets.ws['Extenterator'] = set_combine(sets.ws, {})
    sets.ws['Aeolian Edge'] = set_combine(sets.ws, {
        ring1="Metamorph ring +1",
        ring2="Shiva ring +1"
    })
    
    sets.ws['Savage Blade'] = set_combine(sets.ws, {
        ring1="Rufescent ring",
        back=savage_blade_cape
    })
    sets.ws['Circle Blade'] = set_combine(sets.ws, {})

    sets.idle = {
        ranged="Gjallarhorn",
        head="Bihu roundlet +3",
        neck="Bard's charm +2",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Inyanga jubbah +2",
        hands="Bihu cuffs +3",
        ring1="Moonbeam ring",
        ring2="Defending ring",
        back=tp_cape,
        waist="Flume belt +1",
        legs="Brioso cannions +3",
        feet="Bihu slippers +3"
    }

    sets.precast = {
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Enchanter's earring +1",
        body="Inyanga jubbah +2",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Prolix ring",
        back=fast_cast_cape,
        waist="Embla sash",
        legs="Gendewitha spats +1",
        feet="Bihu slippers +3"
    }

    sets.precast.song = {
        head="Fili calot +1",
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

    sets.precast.song.HonorMarch = set_combine(sets.precast.song, {ranged="Marsyas"})

    sets.midcast = {}
    sets.midcast.song = {}
    sets.midcast.song.buff = {
        ranged="Gjallarhorn",
        head="Fili calot +1",
        neck="Moonbow whistle +1",
        ear1="Etiolation earring",
        ear2="Genmei earring",
        body="Fili hongreline +1",
        hands="Fili manchettes +1",
        ring1="Moonbeam ring",
        ring2="Defending ring",
        back=fast_cast_cape,
        waist="Flume belt +1",
        legs="Inyanga shalwar +2",
        feet="Brioso slippers +3"
    }

    sets.midcast.song.debuff = {
        ranged="Gjallarhorn",
        head="Brioso roundlet +3",
        neck="Moonbow Whistle +1",
        ear1="Regal earring",
        ear2="Enchanter's earring +1",
        body="Brioso justaucorps +3",
        hands="Inyanga Dastanas +2",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back=debuff_cape,
        waist="Luminary sash",
        legs="Brioso cannions +3",
        feet="Brioso slippers +3"
    }

    sets.midcast.song.march = set_combine(sets.midcast.song.buff, {hands="Fili manchettes +1"})
    sets.midcast.song.HonorMarch = set_combine(sets.midcast.song.march, {ranged="Marsyas"})
    sets.midcast.song.ballad = set_combine(sets.midcast.song.buff, {legs="Fili rhingrave +1"})
    sets.midcast.song.scherzo = set_combine(sets.midcast.song.buff, {feet="Fili cothurnes +1"})
    sets.midcast.song.paeon = set_combine(sets.midcast.song.buff, {head="Brioso roundlet +3"})
    
    sets.midcast.song.etude = set_combine(sets.midcast.song.buff, {head="Mousai turban +1"})
    sets.midcast.song.threnody = set_combine(sets.midcast.song.debuff, {body="Mousai manteel +1"})
    sets.midcast.song.carol = set_combine(sets.midcast.song.buff, {hands="Mousai gages +1"})
    sets.midcast.song.minne = set_combine(sets.midcast.song.buff, {legs="Mousai seraweels +1"})
    sets.midcast.song.mambo = set_combine(sets.midcast.song.buff, {feet="Mousai crackows +1"})



    sets.midcast.song.Lullaby = {}
    sets.midcast.song.Lullaby.Accuracy = set_combine(sets.midcast.song.debuff, {hands="Brioso cuffs +3"})
    sets.midcast.song.Lullaby.Duration = set_combine(sets.midcast.song.debuff, {ranged="Marsyas", hands="Brioso cuffs +3"})

    sets.midcast.song.HordeLullaby = {}
    sets.midcast.song.HordeLullaby.Accuracy = set_combine(sets.midcast.song.debuff, {ranged="Daurdabla", hands="Brioso cuffs +3"})
    sets.midcast.song.HordeLullaby.Duration = set_combine(sets.midcast.song.debuff, {ranged="Daurdabla", hands="Brioso cuffs +3"})
    
    sets.midcast.cure = {
        head="Vanya hood",
        body="Vrikodara jupon",
        hands="Telchine gloves",
        ring1="Haoma's ring",
        ring2="Menelaus's ring",
        waist="Embla sash",
        legs="Chironic hose",
        feet="Kaykaus boots"
    }
    sets.midcast.curaga = {}
    sets.midcast.cursna = {}

    sets.midcast.enhancing = {}
    sets.midcast.duration = {}
    sets.midcast.StoneSkin = {}
    sets.midcast.Aquaveil = {}

    sets.ExtraSongs = set_combine(sets.precast.song, {ranged="Daurdabla"})

    sets.kiting = {
        feet='Fili cothurnes +1'
    }

    coroutine.schedule(lockstyle,8)

end

function precast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then
        if spell.name == 'Honor March' then
            equip(sets.precast.song.HonorMarch)
        elseif spell.type == 'BardSong' then
            equip(sets.precast.song)
        else
            equip(sets.precast)
        end
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    elseif spell.type == "JobAbility" then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    end
end

function midcast(spell)
    if spell.skill == 'Healing Magic' then
        equip(sets.midcast.cure)
    elseif spell.skill == 'Enfeebling Magic' then
    elseif spell.skill == 'Enhancing Magic' then
    elseif spell.type == 'BardSong' then
        if spell.targets.Enemy then
            if spell.name:contains("Horde") then
                local lullabySet = LullabySet[LullabySetIndex]
                equip(sets.midcast.song.HordeLullaby[lullabySet])
            elseif spell.name:contains("Foe") then
                local lullabySet = LullabySet[LullabySetIndex]
                equip(sets.midcast.song.Lullaby[lullabySet])
            elseif spell.name:contains("Threnody") then
                equip(sets.midcast.song.threnody)
            else
                equip(sets.midcast.song.debuff)    
            end
        else
            if spell.name == "Honor March" then
                equip(sets.midcast.song.HonorMarch)
            elseif spell.name:contains("Carol") then
                equip(sets.midcast.song.carol)
            elseif spell.name:contains("Ballad") then
                equip(sets.midcast.song.ballad)
            elseif spell.name:contains("Scherzo") then
                equip(sets.midcast.song.scherzo)
            elseif spell.name:contains("Paeon") then
                equip(sets.midcast.song.paeon)
            elseif spell.name:contains("Etude") then
                equip(sets.midcast.song.etude)
            elseif spell.name:contains("Minne") then
                equip(sets.midcast.song.minne)
            elseif spell.name:contains("Mambo") then
                equip(sets.midcast.song.mambo)
            else
                equip(sets.midcast.song.buff)
            end
            if ExtraSongs and spell.name ~= "Honor March" then
                equip(sets.ExtraSongs)
            end
        end
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

function self_command(m)
    if m == "ExtraSongs" then
        ExtraSongs = not ExtraSongs
        if ExtraSongs then
            add_to_chat(122, 'EXTRA SONGS ON')
        else
            add_to_chat(122, 'EXTRA SONGS OFF')
        end
    elseif m == "LullabyMode" then
        LullabySetIndex = LullabySetIndex % #LullabySet + 1

        local lullabySet = LullabySet[LullabySetIndex]
        add_to_chat(122, 'Lullaby Set: ' .. lullabySet)
    elseif m == 'RefreshSet' then

        local lullabySet = LullabySet[LullabySetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Lullaby Set: ' .. lullabySet)
        lockstyle()
    elseif m == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1
        local weapon_set = WeaponSet[WeaponSetIndex]

        equip(sets.WeaponSet[weapon_set])

        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif m == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
   end
end

function equip_set(status)
    local weapon_set = WeaponSet[WeaponSetIndex]
    equip(sets.WeaponSet[weapon_set])
    if status == "Engaged" then
        equip(sets.engaged.tp)
    else
        equip(sets.idle)
        if Kiting then
            equip(sets.kiting)
        end
    end
end

function lockstyle()
    if player.main_job == 'BRD' then send_command('@input /lockstyleset 8') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,6)
end