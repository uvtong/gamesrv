--<<card 导表开始>>
local super = require "script.card.soil.card155005"

ccard255005 = class("ccard255005",super,{
    sid = 255005,
    race = 5,
    name = "爪击",
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
    magic_hurt = 0,
    recoverhp = 0,
    cure_to_hurt = 0,
    cure_multi = 0,
    magic_hurt_multi = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 0,
    crystalcost = 1,
    targettype = 0,
    desc = "使你的英雄获得2点护甲值,并在本回合中获得+2攻击力。",
})

function ccard255005:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard255005:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard255005:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard255005
