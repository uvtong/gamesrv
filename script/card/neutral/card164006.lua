--<<card 导表开始>>
local super = require "script.card.init"

ccard164006 = class("ccard164006",super,{
    sid = 164006,
    race = 6,
    name = "风险投资公司雇佣兵",
    type = 201,
    magic_immune = 0,
    assault = 0,
    sneer = 0,
    atkcnt = 1,
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
    atk = 7,
    maxhp = 6,
    crystalcost = 5,
    targettype = 0,
    halo = {addcrystalcost=3},
    desc = "你的随从牌的法力值消耗增加（3）点。",
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

function ccard164006:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard164006:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard164006:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard164006:onputinwar(pos,reason)
	local owner = self:getowner()
	for i,id in ipairs(owner.handcards) do
		local handcard = owner:gettarget(id)
		if is_footman(handcard.type) then
			self:addhaloto(handcard)
		end
	end
end

function ccard164006:after_putinhand(warcard,pos,reason)
	if self.inarea ~= "war" then
		return
	end
	if self.id == warcard.id then
		return
	end
	if not is_footman(warcard.type) then
		return
	end
	local owner = self:getowner()
	if owner:isenemy(warcard) then
		return
	end
	self:addhaloto(warcard)
end

return ccard164006
