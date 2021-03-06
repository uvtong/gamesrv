--<<card 导表开始>>
local super = require "script.card.init"

ccard135001 = class("ccard135001",super,{
    sid = 135001,
    race = 3,
    name = "精神控制",
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
    cure_to_hurt = 0,
    recoverhp_multi = 1,
    magic_hurt_multi = 1,
    max_amount = 2,
    composechip = 100,
    decomposechip = 10,
    atk = 0,
    maxhp = 0,
    crystalcost = 10,
    targettype = 2,
    halo = nil,
    desc = "获得一个敌方随从的控制权。",
    effect = {
        onuse = nil,
        ondie = nil,
        onhurt = nil,
        onrecoverhp = nil,
        onbeginround = nil,
        onendround = nil,
        ondelsecret = nil,
        onputinwar = nil,
        onremovefromwar = nil,
        onaddweapon = nil,
        onputinhand = nil,
        before_die = nil,
        after_die = nil,
        before_hurt = nil,
        after_hurt = nil,
        before_recoverhp = nil,
        after_recoverhp = nil,
        before_beginround = nil,
        after_beginround = nil,
        before_endround = nil,
        after_endround = nil,
        before_attack = nil,
        after_attack = nil,
        before_playcard = nil,
        after_playcard = nil,
        before_putinwar = nil,
        after_putinwar = nil,
        before_removefromwar = nil,
        after_removefromwar = nil,
        before_addsecret = nil,
        after_addsecret = nil,
        before_delsecret = nil,
        after_delsecret = nil,
        before_addweapon = nil,
        after_addweapon = nil,
        before_delweapon = nil,
        after_delweapon = nil,
        before_putinhand = nil,
        after_putinhand = nil,
        before_removefromhand = nil,
        after_removefromhand = nil,
    },
})

function ccard135001:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard135001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard135001:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard135001:onuse(pos,targetid,choice)
	local owner = self:getowner()
	if owner:getfreespace("warcard") <= 0 then
		return
	end
	local target = owner:gettarget(targetid)
	if target:getowner():removefromwar(target) then
		target:setowner(owner)
		owner:putinwar(target)
	end
end

return ccard135001
