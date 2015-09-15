--<<card 导表开始>>
local super = require "script.card.init"

ccard13402 = class("ccard13402",super,{
    sid = 13402,
    race = 3,
    name = "光耀之子",
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
    type = 201,
    magic_hurt = 0,
    recoverhp = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 5,
    crystalcost = 4,
    targettype = 0,
    desc = "该随从的攻击力等同于其生命值。",
})

function ccard13402:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard13402:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard13402:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end




return ccard13402
