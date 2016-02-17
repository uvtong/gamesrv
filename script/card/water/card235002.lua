--<<card 导表开始>>
local super = require "script.card.water.card135002"

ccard235002 = class("ccard235002",super,{
    sid = 235002,
    race = 3,
    name = "神圣新星",
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
    magic_hurt = 2,
    recoverhp = 2,
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
    desc = "对所有敌方角色造成2点伤害,为所有友方角色恢复2点生命值。",
})

function ccard235002:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard235002:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard235002:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard235002
