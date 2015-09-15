--<<card 导表开始>>
local super = require "script.card.init"

ccard13403 = class("ccard13403",super,{
    sid = 13403,
    race = 3,
    name = "心灵之火",
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
    type = 101,
    magic_hurt = 0,
    recoverhp = 0,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    hp = 0,
    crystalcost = 1,
    targettype = 32,
    desc = "使一个随从的攻击力等同于其生命值。",
})

function ccard13403:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard13403:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard13403:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end


-- warcard
require "script.war.aux"
require "script.war.warmgr"

function ccard13403:onuse(target)
	local hp = target:gethp()
	target:addbuff({setatk=hp,},self.id,self.sid)
end

return ccard13403
