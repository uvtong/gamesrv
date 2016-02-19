--<<card 导表开始>>
local super = require "script.card.neutral.card163029"

ccard263029 = class("ccard263029",super,{
    sid = 263029,
    race = 6,
    name = "银色指挥官",
    type = 201,
    magic_immune = 0,
    assault = 1,
    sneer = 0,
    atkcnt = 1,
    shield = 1,
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
    atk = 4,
    hp = 2,
    crystalcost = 6,
    targettype = 0,
    desc = "冲锋,圣盾。",
})

function ccard263029:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard263029:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard263029:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard263029
