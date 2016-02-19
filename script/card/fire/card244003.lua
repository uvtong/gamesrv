--<<card 导表开始>>
local super = require "script.card.fire.card144003"

ccard244003 = class("ccard244003",super,{
    sid = 244003,
    race = 4,
    name = "食腐土狼",
    type = 202,
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
    atk = 2,
    hp = 2,
    crystalcost = 2,
    targettype = 0,
    desc = "每死1头野兽,获得+2/+1。",
})

function ccard244003:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard244003:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard244003:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard244003
