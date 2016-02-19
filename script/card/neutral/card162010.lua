--<<card 导表开始>>
local super = require "script.card.init"

ccard162010 = class("ccard162010",super,{
    sid = 162010,
    race = 6,
    name = "血骑士",
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
    atk = 3,
    hp = 3,
    crystalcost = 3,
    targettype = 0,
    desc = "战吼：所有随从失去圣盾。每有一个随从失去圣盾,便获得+3/+3。",
})

function ccard162010:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard162010:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard162010:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard162010
