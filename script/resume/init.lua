
cresume = class("cresume",cdatabaseable)

function cresume:init(pid)
	self.flag = "cresume"
	cdatabaseable.init(self,{
		pid = pid,
		flag = self.flag,
	})
	self.pid_ref = {}
	self.srvname_ref = {}
	self.data = {}
	if not cserver.isdatacenter() then
		self.nosavetodatabase = true
	end

	
end

function cresume:load(data)
	if not data or not next(data) then
		return
	end
	self.data = data
end

function cresume:save()
	return self.data
end

function cresume:loadfromdatabase()
	local data
	if not self.loadstate or self.loadstate == "unload" then
		self.loadstate = "loading"
		if cserver.isdatacenter() then
			local db = dbmgr.getdb()
			data = db:get(db:key("resume",self.pid))
		else
			data = cluster.call("datacenter","resumemgr","query",self.pid,"*")
		end
		if not data or not next(data) then
			self:onloadnull()
		else
			self:load(data)
		end
		self.loadstate = "loaded"
	end
end

function cresume:savetodatabase()
	if self.nosavetodatabase then
		return
	end
	if self.loadnull then
		return
	end
	if self.loadstate == "loaded" then
		if self:isdirty() then
			local data = self:save()
			local db = dbmgr.getdb()
			db:set(db:key("resume",self.pid),data)
		end
	end
end

function cresume:deletefromdatabase()
	if cserver.isdatacenter() then
		print("delresume",self.pid)
		local db = dbmgr.getdb()
		db:del(db:key("resume",self.pid))
	end
end

function cresume:onloadnull()
	self.loadnull = true
	if cserver.isgamesrv() then
		print("resume:create",route.getsrvname(self.pid),skynet.getenv("srvname"),self.pid)
		if route.getsrvname(self.pid) ~= skynet.getenv("srvname") then
			logger.log("error","error",string.format("[from datacenter loadnull] srvname=%s pid=%s",route.getsrvname(self.pid),self.pid))
			return
		end
		local player = playermgr.getplayer(self.pid)
		if player then
		else
			player = playermgr.loadofflineplayer(self.pid)
		end
		self:create(player:packresume())
	elseif cserver.isdatacenter() then
	end
end

function cresume:create(resume)
	assert(resume)
	logger.log("info","resume",format("[create] pid=%d resume=%s",self.pid,resume))
	self.loadstate = "loaded"
	self.loadnull = nil
	self.data = resume
	if cserver.isgamesrv() then
		cluster.call("datacenter","resumemgr","create",self.pid,self:save())
	elseif cserver.isdatacenter() then
		self:savetodatabase()
	end
end

function cresume:addref(pid)
	if type(pid) == "number" then
		self.pid_ref[pid] = (self.pid_ref[pid] or 0) + 1
	else
		local srvname = pid
		self.srvname_ref[srvname] = 1
	end
end

function cresume:delref(pid)
	if type(pid) == "number" then
		self.pid_ref[pid] = (self.pid_ref[pid] or 0) - 1
		if self.pid_ref[pid] <= 0 then
			self.pid_ref[pid] = nil
		end
	else
		local srvname = pid
		self.srvname_ref[srvname] = nil
	end
	if not next(self.pid_ref) and not next(self.srvname_ref) then
		resumemgr.delresume(self.pid)
	end
end


function cresume:set(key,val,notsync)
	cdatabaseable.set(self,key,val)
	if not notsync then
		self:sync({[key] = val,})
	end
end

function cresume:sync(data)
	data.srvname = cserver.getsrvname()
	for pid,_ in pairs(self.pid_ref) do
		if pid ~= self.pid then
			sendpackage(pid,"friend","sync",data)
		end
	end
	cluster.call("datacenter","resumemgr","sync",self.pid,data)
end

return cresume
