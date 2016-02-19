--<<card 导表开始>>
local super = require "script.card.init"

ccard163013 = class("ccard163013",super,{
    sid = 163013,
    race = 6,
    name = "鱼人招潮者",
    type = 203,
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
    atk = 1,
    hp = 2,
    crystalcost = 1,
    targettype = 0,
    desc = "每当有玩家召唤一个鱼人时,便获得+1攻击力。",
})

function ccard163013:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard163013:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard163013:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard163013
