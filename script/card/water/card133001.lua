--<<card 导表开始>>
local super = require "script.card.init"

ccard133001 = class("ccard133001",super,{
    sid = 133001,
    race = 3,
    name = "神圣之火",
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
    crystalcost = 6,
    targettype = 33,
    halo = nil,
    desc = "造成5点伤害。为你的英雄恢复5点生命值。",
    effect = {
        onuse = {magic_hurt=5,recoverhp=5},
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

function ccard133001:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard133001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard133001:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard133001:onuse(pos,targetid,choice)
	local owner = self:getowner()
	local target = owner:gettarget(targetid)
	local magic_hurt = ccard133001.effect.onuse.magic_hurt
	local recoverhp = ccard133001.effect.onuse.recoverhp
	magic_hurt = owner:get_magic_hurt(magic_hurt)
	recoverhp = owner:getrecoverhp(recoverhp)
	target:addhp(-magic_hurt,self.id)
	owner.hero:addhp(recoverhp,self.id)
end

return ccard133001
