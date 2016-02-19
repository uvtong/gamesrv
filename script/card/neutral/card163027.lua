--<<card 导表开始>>
local super = require "script.card.init"

ccard163027 = class("ccard163027",super,{
    sid = 163027,
    race = 6,
    name = "血帆海盗",
    type = 204,
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
    atk = 1,
    hp = 2,
    crystalcost = 1,
    targettype = 0,
    desc = "战吼：使对手的武器失去1点耐久度。",
})

function ccard163027:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard163027:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard163027:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard163027
