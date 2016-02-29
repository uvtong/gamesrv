--<<card 导表开始>>
local super = require "script.card.soil.card151001"

ccard251001 = class("ccard251001",super,{
    sid = 251001,
    race = 5,
    name = "塞纳留斯",
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
    max_amount = 1,
    composechip = 100,
    decomposechip = 10,
    atk = 5,
    hp = 8,
    crystalcost = 9,
    targettype = 0,
    desc = "抉择：使你的所有其他随从获得+2/+2；或者召唤2个2/2并具有嘲讽的树人。",
    effect = {
        onuse = {choice1={addbuff={addatk=2,addmaxhp=2,addhp=2}},choice2={addfootman={sid=156004,num=2}}},
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

function ccard251001:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard251001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard251001:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard251001