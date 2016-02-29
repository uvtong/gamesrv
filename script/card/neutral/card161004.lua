--<<card 导表开始>>
local super = require "script.card.init"

ccard161004 = class("ccard161004",super,{
    sid = 161004,
    race = 6,
    name = "比斯巨兽",
    type = 201,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
    shield = 0,
    warcry = 0,
    dieeffect = 1,
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
    atk = 10,
    hp = 6,
    crystalcost = 6,
    targettype = 0,
    desc = "亡语：为你的对手召唤1个3/3的芬克·恩霍尔。",
    effect = {
        onuse = nil,
        ondie = {addfootman={sid=166015,num=1}},
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

function ccard161004:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard161004:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard161004:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard161004