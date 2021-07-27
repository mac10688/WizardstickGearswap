ExtraSongs = false

LullabySetIndex = 1
LullabySet = {"Accuracy", "Duration"}

function get_sets()

    local debuff_cape = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%'}}
    local tp_cape = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
    local mordant_rime_cape = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%'}}
    local fast_cast_cape = { name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%'}}

    sets.engaged = {}
    sets.engaged.tp = {
        ranged="Gjallarhorn",
        head="Ayanmo zucchetto +2",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        ring1="Hetairoi ring",
        ring2="Chirich ring +1",
        back=tp_cape,
        waist="Reiki yotai",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2"
    }

    sets.engaged.tp.nin = {}
    sets.engaged.tp.dnc = {}
    sets.engaged.tp.shield = {}
    sets.engaged.tp.dt = {}

    sets.ws = {

    }
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
        back=tp_cape,
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
        back=fast_cast_cape,
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
        back=fast_cast_cape,
        waist="Flume belt +1",
        legs="Inyanga shalwar +2",
        feet="Brioso slippers +1"
    }

    sets.midcast.song.HonorMarch = set_combine(sets.midcast.song.buff, {ranged="Marsyas"})
    sets.midcast.song.ballad = set_combine(sets.midcast.song.buff, {legs="Fili rhingrave +1"})
    sets.midcast.song.scherzo = set_combine(sets.midcast.song.buff, {feet="Fili cothurnes +1"})
    sets.midcast.song.paeon = set_combine(sets.midcast.song.buff, {head="Brioso roundlet +1"})
    sets.midcast.song.etude = set_combine(sets.midcast.song.buff, {})
    sets.midcast.song.threnody = set_combine(sets.midcast.song.buff, {})
    sets.midcast.song.carol = set_combine(sets.midcast.song.buff, {})
    sets.midcast.song.minne = set_combine(sets.midcast.song.buff, {})
    sets.midcast.song.mambo = set_combine(sets.midcast.song.buff, {})

    sets.midcast.song.debuff = {
        ranged="Gjallarhorn",
        head="Brioso roundlet +1",
        neck="Moonbow Whistle +1",
        ear1="Regal earring",
        ear2="Dignitary earring",
        body="Brioso justaucorps +1",
        hands="Inyanga Dastanas +2",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        back=debuff_cape,
        waist="Luminary sash",
        legs="Brioso cannions +1",
        feet="Brioso slippers +1"
    }

    sets.midcast.song.Lullaby = {}
    sets.midcast.song.Lullaby.Accuracy = sets.midcast.song.debuff
    sets.midcast.song.Lullaby.Duration = set_combine(sets.midcast.song.debuff, {ranged="Marsyas"})

    sets.midcast.song.HordeLullaby = {}
    sets.midcast.song.HordeLullaby.Accuracy = set_combine(sets.midcast.song.debuff, {ranged="Daurdabla"})
    sets.midcast.song.HordeLullaby.Duration = set_combine(sets.midcast.song.debuff, {ranged="Daurdabla"})
    
    sets.midcast.cure = {}
    sets.midcast.curaga = {}
    sets.midcast.cursna = {}

    sets.midcast.enhancing = {}
    sets.midcast.duration = {}
    sets.midcast.StoneSkin = {}
    sets.midcast.Aquaveil = {}

    sets.ExtraSongs = {ranged="Daurdabla"}

end

function precast(spell)
    if spell.action_type == 'Magic' then
        if spell.name == 'Honor March' then
            equip(sets.precast.song.HonorMarch)
        elseif spell.type == 'BardSong' then
            equip(sets.precast.song)
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
        print(spell.targets)
        if spell.name == "Honor March" then
            equip(sets.midcast.song.HonorMarch)
        elseif spell.name:contains("Carol") then
            equip(sets.midcast.song.carol)
        elseif spell.name:contains("Threnody") then
            equip(sets.midcast.song.threnody)
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
        elseif spell.name:contains("Horde") then
            local lullabySet = LullabySet[LullabySetIndex]
            equip(sets.midcast.song.HordeLullaby[lullabySet])
        elseif spell.name:contains("Foe") then
            local lullabySet = LullabySet[LullabySetIndex]
            equip(sets.midcast.song.Lullaby[lullabySet])
        elseif not spell.targets.Enemy  then
            equip(sets.midcast.song.buff)
        else
            equip(sets.midcast.song.debuff)
        end
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
        ExtraSongs = not ExtraSongs
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

    return { precast = sets.precast.song, midcast = sets.midcast.song.Lullaby.Acc }
end

function CalculateHordeLullaby()
    print("Setting hord lullaby set")
    return { precast = sets.precast.song, midcast = sets.midcast.song.HordeLullaby.Duration }
end