--<<card 导表开始>>
local super = require "script.card.init"

ccard163005 = class("ccard163005",super,{
    sid = 163005,
    race = 6,
    name = "紫罗兰教师",
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
    atk = 3,
    maxhp = 5,
    crystalcost = 4,
    targettype = 0,
    halo = nil,
    desc = "每当你施放一个法术时,召唤一个1/1的紫罗兰学徒。",
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
        before_atttack = nil,
        after_attack = nil,
        before_playcard = nil,
        after_playcard = {addfootman={sid=166006,num=1}},
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

function ccard163005:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard163005:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard163005:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard163005:after_playcard(warcard,pos,targetid,choice)
	if self.inarea ~= "war" then
		return
	end
	if self.id == warcard.id then
		return
	end
	if not is_magiccard(warcard.type) then
		return
	end
	local owner = self:getowner()
	if owner:isenemy(warcard) then
		return
	end
	local sid = ccard163005.effect.after_playcard.sid
	local num = ccard163005.effect.after_playcard.num
	sid = togoldsidif(sid,is_goldcard(self.sid))
	num = math.min(num,owner:getfreespace("warcard"))
	for i=1,num do
		local footman = owner:newwarcard(sid)
		owner:putinwar(footman,self.pos+1)
	end
end

return ccard163005
