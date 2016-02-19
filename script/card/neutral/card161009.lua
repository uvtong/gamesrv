--<<card 导表开始>>
local super = require "script.card.init"

ccard161009 = class("ccard161009",super,{
    sid = 161009,
    race = 6,
    name = "老瞎眼",
    type = 203,
    magic_immune = 0,
    assault = 1,
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
    atk = 2,
    hp = 4,
    crystalcost = 4,
    targettype = 0,
    desc = "冲锋,在战场上每有一个其他鱼人便获得+1攻击力。",
})

function ccard161009:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard161009:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard161009:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard161009
