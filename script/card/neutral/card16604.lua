--<<card 导表开始>>
local super = require "script.card.init"

ccard16604 = class("ccard16604",super,{
    sid = 16604,
    race = 6,
    name = "损坏的傀儡",
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
    type = 206,
    magic_hurt = 0,
    recoverhp = 0,
    max_amount = 0,
    composechip = 0,
    decomposechip = 0,
    atk = 2,
    hp = 1,
    crystalcost = 2,
    targettype = 0,
    desc = "None",
})

function ccard16604:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard16604:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard16604:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard16604
