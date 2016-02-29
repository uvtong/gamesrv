--<<card 导表开始>>
local super = require "script.card.soil.card152002"

ccard252002 = class("ccard252002",super,{
    sid = 252002,
    race = 5,
    name = "战争古树",
    type = 201,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
    shield = 0,
    warcry = 0,
    dieeffect = 0,
    sneak = 0,
    magic_hurt_adden = 0,
    magic_hurt = 0,
    recoverhp = 0,
    cure_to_hurt = 0,
    recoverhp_multi = 1,
    magic_hurt_multi = 1,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 5,
    hp = 5,
    crystalcost = 7,
    targettype = 0,
    desc = "抉择：+5生命值并具有嘲讽；或者+5攻击力。",
    effect = {
        onuse = {choice1={addbuff={addmaxhp=5,addhp=5,sneer=60}},choice={addatk=5}},
        ondie = nil,
        onhurt = nil,
        onrecorverhp = nil,
        onbeginround = nil,
        onendround = nil,
        before_die = nil,
        after_die = nil,
        before_hurt = nil,
        after_hurt = nil,
        before_recoverhp = nil,
        after_recoverhp = nil,
        before_beginround = nil,
        after_beginround = nil,
        before_endround = nil,
        after_endround = nil,
        before_atttack = nil,
        after_attack = nil,
        before_playcard = nil,
        after_playcard = nil,
    },
}

function ccard252002:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard252002:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard252002:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard252002
