--<<card 导表开始>>
local super = require "script.card.water.card133005"

ccard233005 = class("ccard233005",super,{
    sid = 233005,
    race = 3,
    name = "光明之泉",
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
    recoverhp = 3,
    cure_to_hurt = 0,
    cure_multi = 0,
    magic_hurt_multi = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 5,
    crystalcost = 2,
    targettype = 0,
    desc = "在你的回合开始时,随机为一个受到伤害的友方角色恢复3点生命值。",
})

function ccard233005:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard233005:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard233005:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard233005
