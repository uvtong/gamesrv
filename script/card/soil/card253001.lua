--<<card 导表开始>>
local super = require "script.card.soil.card153001"

ccard253001 = class("ccard253001",super,{
    sid = 253001,
    race = 5,
    name = "星辰坠落",
    type = 101,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 0,
    shield = 0,
    warcry = 0,
    dieeffect = 0,
    secret = 0,
    sneak = 0,
    magic_hurt_adden = 0,
    magic_hurt = 5,
    recoverhp = 0,
    cure_to_hurt = 0,
    cure_multi = 0,
    magic_hurt_multi = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 0,
    crystalcost = 5,
    targettype = 0,
    desc = "抉择：对一个随从造成5点伤害；或者对所有敌方随从造成2点伤害。",
})

function ccard253001:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard253001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard253001:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard253001
