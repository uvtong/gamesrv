--<<card 导表开始>>
local super = require "script.card.init"

ccard164017 = class("ccard164017",super,{
    sid = 164017,
    race = 6,
    name = "苦痛寺僧",
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
    hp = 3,
    crystalcost = 3,
    targettype = 0,
    desc = "每当该随从受到伤害时,抽一张牌。",
})

function ccard164017:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard164017:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard164017:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard164017
