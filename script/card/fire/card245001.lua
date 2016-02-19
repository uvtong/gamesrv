--<<card 导表开始>>
local super = require "script.card.fire.card145001"

ccard245001 = class("ccard245001",super,{
    sid = 245001,
    race = 4,
    name = "追踪术",
    type = 101,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 0,
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
    atk = 0,
    hp = 0,
    crystalcost = 1,
    targettype = 0,
    desc = "查看你卡堆顶部的3张牌,抽取1张,弃掉其它2张。",
})

function ccard245001:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard245001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard245001:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard245001
