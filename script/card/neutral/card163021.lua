--<<card 导表开始>>
local super = require "script.card.init"

ccard163021 = class("ccard163021",super,{
    sid = 163021,
    race = 6,
    name = "小鬼召唤师",
    type = 201,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
    shield = 0,
    warcry = 0,
    dieeffect = 0,
    secret = 0,
    sneak = 0,
    magic_hurt_adden = 0,
    magic_hurt = 0,
    recoverhp = 0,
    cure_to_hurt = 0,
    cure_multi = 0,
    magic_hurt_multi = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 1,
    hp = 5,
    crystalcost = 3,
    targettype = 0,
    desc = "在你的回合结束时,对该随从造成1点伤害,并召唤一个1/1的小鬼。",
})

function ccard163021:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard163021:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard163021:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard163021
