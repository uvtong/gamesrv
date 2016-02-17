--<<card 导表开始>>
local super = require "script.card.init"

ccard162003 = class("ccard162003",super,{
    sid = 162003,
    race = 6,
    name = "鱼人领军",
    type = 203,
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
    atk = 3,
    hp = 3,
    crystalcost = 3,
    targettype = 0,
    desc = "所有其他鱼人获得+2/+1。",
})

function ccard162003:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard162003:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard162003:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard162003
