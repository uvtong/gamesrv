--<<card 导表开始>>
local super = require "script.card.init"

ccard153004 = class("ccard153004",super,{
    sid = 153004,
    race = 5,
    name = "丛林守卫者",
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
    atk = 2,
    hp = 4,
    crystalcost = 4,
    targettype = 32,
    desc = "抉择：造成2点伤害；或者沉默一个随从。",
})

function ccard153004:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard153004:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard153004:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard153004
