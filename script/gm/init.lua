require "script.skynet"

local AUTH_SUPERADMIN = 100
local AUTH_ADMIN = 90
local AUTH_PROGRAMER = 80
local AUTH_DESIGNER = 70
local AUTH_NORMAL = 10

gm = gm or {}
master = nil

local function getcmd(cmds,cmd)
	if cmds[cmd] then
		return cmd
	end
	cmd = string.lower(cmd)
	for k,v in pairs(cmds) do
		if string.lower(k) == cmd then
			return k
		end
	end
end

local function getfunc(cmds,cmd)
	if cmds[cmd] and type(cmds[cmd]) == "function" then
		return cmds[cmd]
	end
	cmd = string.lower(cmd)
	for k,v in pairs(cmds) do
		if type(v) == "function" and string.lower(k) == cmd then
			return v
		end
	end
end

local function docmd(player,cmdline)
	local cmd,leftcmd = string.match(cmdline,"([%w_]+)%s*(.*)")
	local authority
	if type(player) == "number" then
		authority = AUTH_SUPERADMIN
	else
		authority = player:authority()
	end
	if cmd then
		local func,need_auth
		if authority == AUTH_SUPERADMIN or authority == AUTH_ADMIN then
			func = getfunc(gm,cmd)
			need_auth = 0
		else
			for auth,cmds in pairs(gm.CMD) do
				cmd = getcmd(cmds,cmd)
				if cmd then
					func = getfunc(gm,cmd)
					if func then
						need_auth = auth
						break
					end
				end
			end
		end
		master = player
		if func then
			if authority >= need_auth then
				local args = {}
				if leftcmd then
					for arg in string.gmatch(leftcmd,"[^%s]+") do
						table.insert(args,arg)
					end
				end
				func(args)
			else
				return string.format("authority not enough(%d < %d)",authority,need_auth)
			end
		else
			if authority >= AUTH_ADMIN then
				func = load(cmdline)
				func()
			else
				return "unknow cmd:" .. tostring(cmdline)
			end
		end
		master = nil
		return "success"
	else
		return "cann't parse cmdline:" .. tostring(cmdline)
	end
end

function gm.docmd(pid,cmdline)
	local authority
	local player
	if pid ~= 0 then
		player = playermgr.getplayer(pid)
		authority = player:authority()
	else
		player = 0
	end
	local isok,result = pcall(docmd,player,cmdline)
	logger.log("info","gm",string.format("#%d(authority=%s) docmd='%s' isok=%s result=%s",pid,authority,cmdline,isok,result))
	net.msg.notify(pid,string.format("执行结果:%s",result))
end

--- usage: setauthority pid authority
--- e.g. : setauthority 10001 80 # 将玩家10001权限设置成80(权限范围:[1,100])
function gm.setauthority(args)
	local ok,result = pcall(checkargs,args,"int:[10000,]","int:[1,100]")
	if not ok then
		net.msg.notify(master.pid,"usage: setauthority pid authorit")
		error(result)
	end
	local pid,authority = table.unpack(result)	
	local player = playermgr.getplayer(pid)
	if not player then
		net.msg.notify(master.pid,string.format("玩家(%d)不在线,无法对其进行此项操作",pid))
		return
	end
	if master.pid == player.pid then
		net.msg.notify(master.pid,"无法给自己设置权限")
		return
	end
	local auth = master:authority()
	local target_auth = player:authority()
	if authority > auth then
		net.msg.notify(matster,string.format("权限不足,设定的权限大于自己拥有的权限(%d>%d)",authority,auth))
	end
	if auth <= target_auth then
		net.msg.notify(master.pid,"权限不足,自身权限没有目标权限高")
		return
	end
	if target_auth == AUTH_SUPERADMIN then
		net.msg.notify(master.pid,"警告:你无法对超级管理员设定权限")
		return
	end
	if authority == AUTH_SUPERADMIN then
		net.msg.notify(master.pid,"警告:你无法将他人设置成超级管理员")
		return
	end
	logger.log("info","authority",string.format("#%d(authority=%d) setauthority,pid=%d authority(%d->%d)",auth,pid,target_auth,authority))
	player:setauthority(authority)
end

gm.CMD = {
	[AUTH_SUPERADMIN] = {
	},
	[AUTH_ADMIN] = {
	},
	[AUTH_PROGRAMER] = {
	},
	[AUTH_DESIGNER] = {
	},
	[AUTH_NORMAL] = {
		setauthority = true,
		buildgmdoc = true,
	},
}

function gm.init()
	require "script.gm.sys"
	require "script.gm.helper"
	require "script.gm.card"
	require "script.gm.test"
	require "script.gm.other"
end


return gm
