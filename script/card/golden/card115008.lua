--<<card 导表开始>>
local super = require "script.card.init"

ccard115008 = class("ccard115008",super,{
    sid = 115008,
    race = 1,
    name = "寒冰箭",
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
    magic_hurt = 3,
    recoverhp = 0,
    cure_to_hurt = 0,
    cure_multi = 0,
    magic_hurt_multi = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 0,
    crystalcost = 2,
    targettype = 33,
    desc = "对一个角色造成3点伤害,并使其冻结",
})

function ccard115008:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard115008:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard115008:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard115008
