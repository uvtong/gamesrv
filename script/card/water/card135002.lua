--<<card 导表开始>>
local super = require "script.card.init"

ccard135002 = class("ccard135002",super,{
    sid = 135002,
    race = 3,
    name = "神圣新星",
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
    crystalcost = 5,
    targettype = 0,
    halo = nil,
    desc = "对所有敌方角色造成2点伤害,为所有友方角色恢复2点生命值。",
    effect = {
        onuse = {magic_hurt=2,recoverhp=2},
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

function ccard135002:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard135002:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard135002:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard135002:onuse(pos,targetid,choice)
	local owner = self:getowner()
	local magic_hurt = ccard135002.effect.onuse.magic_hurt
	local recoverhp = ccard135002.effect.onuse.recoverhp
	magic_hurt = self:get_magic_hurt(magic_hurt)
	recoverhp = self:getrecoverhp(recoverhp)
	local ids = deepcopy(owner.warcards)
	local ids2 = deepcopy(owner.enemy.warcards)
	for i,id in ipairs(ids2) do
		local warcard = owner:gettarget(id)
		warcard:addhp(-magic_hurt,self.id)
	end
	owner.enemy.hero:addhp(-magic_hurt,self.id)
	for i,id in ipairs(ids) do
		local warcard = owner:gettarget(id)
		warcard:addhp(recoverhp,self.id)
	end
	owner.hero:addhp(recoverhp,self.id)
end

return ccard135002
