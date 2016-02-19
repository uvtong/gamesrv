--<<card 导表开始>>
local super = require "script.card.neutral.card161002"

ccard261002 = class("ccard261002",super,{
    sid = 261002,
    race = 6,
    name = "工匠大师欧沃斯巴克",
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
    max_amount = 1,
    composechip = 100,
    decomposechip = 10,
    atk = 2,
    hp = 2,
    crystalcost = 3,
    targettype = 32,
    desc = "战吼：使另一个随机随从变形成为一个5/5的恐龙或一个1/1的松鼠。",
})

function ccard261002:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard261002:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard261002:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

return ccard261002
