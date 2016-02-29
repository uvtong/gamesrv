--<<card 导表开始>>
local super = require "script.card.neutral.card163004"

ccard263004 = class("ccard263004",super,{
    sid = 263004,
    race = 6,
    name = "狂野炎术师",
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
    atk = 3,
    hp = 2,
    crystalcost = 2,
    targettype = 0,
    desc = "每当你施放一个法术时,对所有随从造成1点伤害。",
    effect = {
        onuse = nil,
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

function ccard263004:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard263004:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard263004:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard263004