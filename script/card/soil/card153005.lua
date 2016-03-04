--<<card 导表开始>>
local super = require "script.card.init"

ccard153005 = class("ccard153005",super,{
    sid = 153005,
    race = 5,
    name = "撕咬",
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
    desc = "在本回合中,使你的英雄获得+4攻击力和4点护甲值。",
    effect = {
        onuse = {addatk=4,adddef=4},
        ondie = nil,
        onhurt = nil,
        onrecorverhp = nil,
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
        after_playcard = nil,
        before_putinwar = nil,
        after_putinwar = nil,
        before_removefromwar = nil,
        after_removefromwar = nil,
        before_addsecret = nil,
        after_addsecret = nil,
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

function ccard153005:init(pid)
    super.init(self,pid)
    self.data = {}
--<<card 导表结束>>

end --导表生成

function ccard153005:load(data)
    if not data or not next(data) then
        return
    end
    super.load(self,data.data)
    -- todo: load data
end

function ccard153005:save()
    local data = {}
    data.data = super.save(self)
    -- todo: save data
    return data
end

function ccard153005:onuse(pos,targetid,choice)
	local owner = self:getowner()
	local addatk = ccard153005.effect.onuse.addatk
	local adddef = ccard153005.effect.onuse.adddef
	owner.hero:addatk(addatk) -- 给英雄增加的攻击力只会生效一回合
	owner.hero:adddef(adddef)
end

return ccard153005
