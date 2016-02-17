--<<card 导表开始>>
local super = require "script.card.init"

ccard164018 = class("ccard164018",super,{
    sid = 164018,
    race = 6,
    name = "血色十字军战士",
    type = 201,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
    shield = 1,
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
    atk = 3,
    hp = 1,
    crystalcost = 3,
    targettype = 0,
    desc = "圣盾",
})

function ccard164018:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard164018:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard164018:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard164018
