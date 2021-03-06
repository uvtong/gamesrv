--<<card 导表开始>>
local super = require "script.card.init"

ccard154001 = class("ccard154001",super,{
    sid = 154001,
    race = 5,
    name = "丛林之魂",
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
    crystalcost = 4,
    targettype = 0,
    halo = nil,
    desc = "使你的随从获得“亡语：召唤一个2/2的树人。”",
    effect = {
        onuse = {addfootman={sid=156021,num=1}},
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

function ccard154001:init(conf)
    super.init(self,conf)
--<<card 导表结束>>

end --导表生成

function ccard154001:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data)
    -- todo: load data
end

function ccard154001:save()
    local data = super.save(self)
    -- todo: save data
    return data
end

function ccard154001:onuse(pos,targetid,choice)
	local owner = self:getowner()
	for i,id in ipairs(owner.warcards) do
		local warcard = owner:gettarget(id)
		warcard:addeffect({
			name = "ondie",
			srcid = self.id,
			sid = self.sid,
			callback = function (self)
				local owner = self:getowner()
				local pos = self.pos
				local sid = ccard154001.effect.onuse.addfootman.sid
				local num = ccard154001.effect.onuse.addfootman.num
				num = math.min(num,owner:getfreespace("warcard"))
				for j=1,num do
					local footman = owner:newwarcard(sid)
					owner:putinwar(footman,pos)
				end
			end
		})
	end
end

return ccard154001
