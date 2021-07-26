ExtraSongs = false

function get_sets()
 
    sets.engaged = {}
    sets.engaged.tp = {
        ranged="Gjallarhorn",
        head="Ayanmo zucchetto +2",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Tuisto earring",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        ring1="Hetairoi ring",
        ring2="Chirich ring +1",
        back="Solemnity cape",
        waist="Reiki yotai",
        legs="Ayanmo cosciales +2",
        feet="Hippomenes socks +1"
    }

    sets.engaged.tp.nin = {}
    sets.engaged.tp.dnc = {}
    sets.engaged.tp.shield = {}
    sets.engaged.tp.dt = {}

    sets.ws = {}
    sets.ws['Mordant Rime'] = {}
    sets.ws['Rudras Storm'] = {}
    sets.ws['Evisceration'] = {}
    sets.ws['Extenterator'] = {}
    sets.ws['Aeolian Edge'] = {}
    
    sets.ws['Savage Blade'] = {}
    sets.ws['Circle Blade'] = {}

    sets.idle = {
        head="Ayanmo zucchetto +2",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Tuisto earring",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        ring1="Hetairoi ring",
        ring2="Chirich ring +1",
        back="Solemnity cape",
        waist="Reiki yotai",
        legs="Ayanmo cosciales +2",
        feet="Hippomenes socks +1"
    }

    sets.precast = {}
    sets.precast.song = {
        head="Fili calot +1",
        neck="Voltsurge torque",
        ear1="Etiolation earring",
        ear2="Loquacious earring",
        body="Inyanga jubbah +2",
        hands="Leyline gloves",
        ring1="Kishar ring",
        ring2="Defending ring",
        back="Solemnity cape",
        waist="Embla sash",
        legs="Gendewitha spats +1",
        feet="Bihu slippers +1"
    }

    sets.precast.song.HonorMarch = set_combine(sets.precast.song, {ranged="Marsyas"})

    sets.midcast = {}
    sets.midcast.song = {}
    sets.midcast.song.buff = {
        head="Fili calot +1",
        neck="Moonbow whistle +1",
        ear1="Etiolation earring",
        ear2="Tuisto earring",
        body="Fili hongreline +1",
        hands="Fili manchettes +1",
        ring1="Moonbeam ring",
        ring2="Defending ring",
        back="Solemnity cape",
        waist="Flume belt +1",
        legs="Inyanga shalwar +2",
        feet="Brioso slippers +1"
    }

    sets.midcast.song.HonorMarch = set_combine(sets.midcast.song.buff, {ranged="Marsyas"})
    sets.midcast.song.ballad = {}
    sets.midcast.song.scherzo = {}
    sets.midcast.song.paeon = {}
    sets.midcast.song.etude = {}
    sets.midcast.song.threnody = {}
    sets.midcast.song.carol = {}
    sets.midcast.song.minne = {}
    sets.midcast.song.mambo = {}
    sets.midcast.song.debuff = {}

    sets.midcast.song.Lullaby = {}
    sets.midcast.song.Lullaby.Acc = {}
    sets.midcast.song.Lullaby.Duration = {}

    sets.midcast.song.HordeLullaby = {}
    sets.midcast.song.HordeLullaby.Acc = {}
    sets.midcast.song.HordeLullaby.Duration = {}
    
    sets.midcast.cure = {}
    sets.midcast.curaga = {}
    sets.midcast.cursna = {}

    sets.midcast.enhancing = {}
    sets.midcast.duration = {}
    sets.midcast.StoneSkin = {}
    sets.midcast.Aquaveil = {}

    sets.ExtraSongs = {ranged="Duardabla"}

    songs_map = {

        ["Army's Paeon"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Army's Paeon II"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Army's Paeon III"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Army's Paeon IV"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Army's Paeon V"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Army's Paeon VI"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Knight's Minne"] = { precast = sets.precast.song, midcast = sets.midcast.song.minne },
        ["Knight's Minne II"] = { precast = sets.precast.song, midcast = sets.midcast.song.minne },
        ["Knight's Minne III"] = { precast = sets.precast.song, midcast = sets.midcast.song.minne },
        ["Knight's Minne IV"] = { precast = sets.precast.song, midcast = sets.midcast.song.minne },
        ["Knight's Minne V"] = { precast = sets.precast.song, midcast = sets.midcast.song.minne },
    
        ["Valor Minuet"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Valor Minuet II"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Valor Minuet III"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Valor Minuet IV"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Valor Minuet V"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Sword Madrigal"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Blade Madrigal"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        
        ["Sheepfoe Mambo"] = { precast = sets.precast.song, midcast = sets.midcast.song.mambo },
        ["Dragonfoe Mambo"] = { precast = sets.precast.song, midcast = sets.midcast.song.mambo },
    
        ["Mage's Ballad"] = { precast = sets.precast.song, midcast = sets.midcast.song.ballad },
        ["Mage's Ballad II"] = { precast = sets.precast.song, midcast = sets.midcast.song.ballad },
        ["Mage's Ballad III"] = { precast = sets.precast.song, midcast = sets.midcast.song.ballad },
    
        ["Advancing March"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Victory March"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Honor March"] = { precast = sets.precast.song.HonorMarch, midcast = sets.midcast.song.HonorMarch },
    
        ["Enchanting Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Spirited Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Learned Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Quick Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Vivacious Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Dextrous Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Fowl Aubade"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Sinewy Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Bewitching Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Vital Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Uncanny Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Herculean Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Logical Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Sage Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
        ["Swift Etude"] = { precast = sets.precast.song, midcast = sets.midcast.song.etude },
    
        ["Hunter's Prelude"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Archer's Prelude"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Light Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Earth Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Water Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Wind Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Fire Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Ice Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Lightning Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Dark Carol"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Earth Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Water Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Wind Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Fire Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Ice Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Lightning Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Light Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
        ["Dark Carol II"] = { precast = sets.precast.song, midcast = sets.midcast.song.carol },
    
        ["Herb Pastoral"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Goblin Gavotte"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Gold Capriccio"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Shining Fantasia"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Scop's Operetta"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Puppet's Operetta"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Warding Round"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Raptor Mazurka"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Chocobo Mazurka"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Sentinel's Scherzo"] = { precast = sets.precast.song, midcast = sets.midcast.song.scherzo },
        ["Goddess' Hymnus"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
    
        ["Adventurer's Dirge"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        ["Foe Sirvente"] = { precast = sets.precast.song, midcast = sets.midcast.song.buff },
        
        ["Foe Requiem"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem II"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem III"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem IV"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem V"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem VI"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Foe Requiem VII"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
    
        ["Light Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Dark Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Earth Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Water Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Wind Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Fire Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Ice Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Lightning Threnody"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
    
        ["Light Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Dark Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Earth Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Water Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Wind Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Fire Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Ice Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        ["Lightning Threnody II"] = { precast = sets.precast.song, midcast = sets.midcast.song.threnody },
        
        ["Foe Lullaby"] = CalculateLullaby(),
        ["Foe Lullaby II"] = CalculateLullaby(),
    
        ["Horde Lullaby"] = CalculateHordeLullaby(),
        ["Horde Lullaby II"] = CalculateHordeLullaby(),
    
        ["Magic Finale"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        
        ["Battlefield Elegy"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        ["Carnage Elegy"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
        
        ["Maiden's Virelai"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
    
        ["Pining Nocturne"] = { precast = sets.precast.song, midcast = sets.midcast.song.debuff },
    }

end

function precast(spell)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            equip(songs_map[spell.name].precast)
        else
            equip(sets.precast)
        end
    elseif spell.action_type == 'WeaponSkill' then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    end
end

function midcast(spell)
    if spell.skill == 'Healing Magic' then
        equip_heal()
    elseif spell.skill == 'Enfeebling Magic' then
        equip_enfeebling()
    elseif spell.skill == 'Enhancing Magic' then
        equip_enhancing(spell)
    elseif spell.type == 'BardSong' then
        equip(songs_map[spell.name].midcast)
        if ExtraSongs then
            equip(sets.ExtraSongs)
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
       equip_yellow()
   end
end

function equip_set(status)
    if status == "Engaged" then
        equip(sets.engaged.tp)
    else
        equip(sets.idle)
    end
end

-- send_command('wait 1;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')




function CalculateLullaby()
    return { precast = sets.precast.song, midcast = sets.midcast.song.debuff }
end

function CalculateHordeLullaby()
    return { precast = sets.precast.song, midcast = sets.midcast.song.debuff }
end