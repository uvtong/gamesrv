--<<card 导表开始>>
local super = require "script.card.golden.card112003"

ccard212003 = class("ccard212003",super,{
    sid = 212003,
    race = 1,
    name = "扰咒术",
    type = 101,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 0,
    shield = 0,
    warcry = 0,
    dieeffect = 0,
    secret = 1,
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
    crystalcost = 3,
    targettype = 0,
    desc = "奥秘：当一个敌方法术以一个随从作为目标时,召唤一个1/3的随从并使其成为新目标",
})

function ccard212003:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard212003:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard212003:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard212003
