--<<card 导表开始>>
local super = require "script.card.water.card132002"

ccard232002 = class("ccard232002",super,{
    sid = 232002,
    race = 3,
    name = "控心术",
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
    crystalcost = 4,
    targettype = 0,
    desc = "随机复制对手的牌库中的一张随从牌,并将其置入战场。",
})

function ccard232002:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard232002:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard232002:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard232002
