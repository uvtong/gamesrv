--<<card 导表开始>>
local super = require "script.card.init"

ccard166016 = class("ccard166016",super,{
    sid = 166016,
    race = 6,
    name = "我是鱼人",
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
    max_amount = 0,
    composechip = 0,
    decomposechip = 0,
    atk = 0,
    hp = 0,
    crystalcost = 4,
    targettype = 0,
    desc = "召唤3只4只或5只1/1的鱼人",
})

function ccard166016:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard166016:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard166016:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard166016
