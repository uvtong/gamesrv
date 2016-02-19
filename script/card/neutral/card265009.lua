--<<card 导表开始>>
local super = require "script.card.neutral.card165009"

ccard265009 = class("ccard265009",super,{
    sid = 265009,
    race = 6,
    name = "工程师学徒",
    type = 205,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
    shield = 0,
    warcry = 1,
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
    atk = 1,
    hp = 1,
    crystalcost = 2,
    targettype = 0,
    desc = "战吼：抽一张牌。",
})

function ccard265009:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard265009:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard265009:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard265009
