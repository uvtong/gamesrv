--<<card 导表开始>>
local super = require "script.card.init"

ccard145004 = class("ccard145004",super,{
    sid = 145004,
    race = 4,
    name = "驯兽师",
    type = 201,
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
    atk = 4,
    hp = 3,
    crystalcost = 4,
    targettype = 12,
    desc = "战吼：使1个友方野兽获得+2/+2和嘲讽。",
})

function ccard145004:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard145004:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard145004:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard145004
