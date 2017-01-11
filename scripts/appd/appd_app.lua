require('util.functions')
local protocols = require('share.protocols')

local AppdApp = class('AppdApp',require('util.app_base'))

function AppdApp:ctor( )
	super(self)
	--对象管理器最重要了
	self.objMgr = require('appd.appd_obj_manager').new()

	--应用服开启http监听
	self.http = require('appd.http').new()

	--后台公告
	self.gmNotice = require('appd.gm_notice').new()
	
	--新版数据库接口
	local isPkServer = globalGameConfig:IsPKServer()
	if not isPkServer then
		self.dbAccess = require('appd.appd_mongo_db').new(getCXXGlobalPtr('MongoWrap'),getCXXGlobalPtr('AsyncMongoDB'))
	else
	end

	--1s一次的心跳
	self.cron:every(1,function ( )
		--后台公告心跳
		self.gmNotice:update()
	end)
	
	self:InitCorn()
end

function AppdApp:update( diff )
	if self.http then
		--奔跑吧,http服务
		self.http:update()
	end
	--update函数被子类重写了,只好手工再调用
	self.super.update(self, diff)
end

-- 定时器初始化
function AppdApp:InitCorn()
	--如果是pk服，下面的都不需要了
	if(globalGameConfig:IsPKServer())then
		return
	end
	
	--0点更新活动定时器
	self.cron:addCron("更新限时活动",'0 0 * * *',function() GetTodayLimitActivityVersion() end)
	
	--0点重置
	self.cron:addCron("0点重置",'0 0 * * *',function() 
		self.objMgr:foreachAllPlayer(function(player)	
			player:DoResetDaily()
		end)
	end)
	
	-- 野外boss马上刷新通知
	local fbconfig = tb_map_field_boss_time[ 1 ]
		
	for _, timeInfo in pairs(fbconfig.time) do
		local H = timeInfo[ 1 ]
		local M = timeInfo[ 2 ]
		
		self:InitFieldBossCorn(H, M, fbconfig.noticestarttime, fbconfig.noticebosstime)
	end
	
	-- 世界BOSS
	local wbconfig = tb_worldboss_time[ 1 ]
	self:InitWorldBossCorn(wbconfig.time[ 1 ], wbconfig.time[ 2 ], wbconfig.enrolllast, wbconfig.time_last)
	
	--每隔5s检测下失效物品
	self.cron:every("失效物品检测",5,function()
		self.objMgr:foreachAllPlayer(function(player)	
			local itemMgr = player:getItemMgr()
			if itemMgr then itemMgr:delFailTimeItem() end
		end)		
	end)
	--每隔5min刷新好友信息
	self.cron:every("好友信息刷新",300,function()
		self.objMgr:foreachAllPlayer(function(player)	
			player:RefreshFriendInfo()
		end)
	end)

	--每隔6s检测下失效幻化
	self.cron:every("失效幻化检测", 6,function()
		self.objMgr:foreachAllPlayer(function(player)	
			player:OnRemoveExpireIllusion()
		end)
	end)
	
	--每隔7s检测下失效神兵
	self.cron:every("失效神兵检测", 7,function()
		self.objMgr:foreachAllPlayer(function(player)
			player:OnRemoveExpireDivine()
		end)
	end)

	-- 每个1800秒刷新排行榜信息
	self.cron:every("刷新排行榜信息", 30,function()
		OnUpdateRankList()
	end)
	
end

-- 全服野外BOSS定时器初始化
function AppdApp:InitFieldBossCorn(H, M, startTime, bossTime)
	
	-- 刷新BOSS
	local crontab_str = string.format("%d %d * * *", M, H)
	outFmtInfo("============================born boss crontab_str = %s", crontab_str)
	self.cron:addCron("通知全服野外BOSS刷新", crontab_str, function() 
		-- 通知场景服刷BOSS
		outFmtInfo("Field Boss created===============================")
		
		NoticeScene(APPD_SCENED_REBORN_FIELD_BOSS)
	end)	
				
	-- 即将开始通知
	local TH, TM = self:ModifyTimeMinutes(H, M, -startTime)
	local crontab_str1 = string.format("%d %d * * *", TM, TH)
	outFmtInfo("------------------------------startTime crontab_str = %s", crontab_str1)
	self.cron:addCron("通知全服野外BOSS将要开启", crontab_str1, function() 
		--
		outFmtInfo("------------------------------Field Boss will start at %d minutes", startTime)
		-- 通知场景服 清理前一个BOSS的数据
		NoticeScene(APPD_SCENED_CLEAR_FIELD_BOSS)
		
		--self:CallOptResult(OPERTE_TYPE_FIELD_BOSS, FIELD_BOSS_OPERTE_WILL_START, {startTime})
	end)
	
	-- 即将刷新通知
	TH, TM = self:ModifyTimeMinutes(H, M, -bossTime)
	local crontab_str2 = string.format("%d %d * * *", TM, TH)
	outFmtInfo("+++++++++++++++++++++++++bossTime crontab_str = %s", crontab_str2)
	self.cron:addCron("通知全服野外BOSS将要刷新", crontab_str2, function() 
		--
		outFmtInfo("+++++++++++++++++++++++++Field Boss will reborn after %d minutes", bossTime)
		-- self:CallOptResult(OPERTE_TYPE_FIELD_BOSS, FIELD_BOSS_OPERTE_WILL_START, {bossTime})
	end)
end


-- 世界BOSS
function AppdApp:InitWorldBossCorn(sh, sm, enrollLast, time_last)
	--[[
	
	tb_worldboss_time = {
	--  id:int	序号
	--  time:array	开始的时间
	--  enrolllast:int	世界BOSS报名持续分钟
	--  time_last:int	世界BOSS持续分钟
	--]]
	
	local M, H
	H, M = sh, sm
	-- BOSS报名时间
	local crontab_str = string.format("%d %d * * *", M, H)
	outFmtInfo("WWWWWWWWWWWWWWWWWWWWWWWWWWorld boss enroll crontab_str = %s", crontab_str)
	self.cron:addCron("通知全服世界BOSS开始报名", crontab_str, function()		
		OnEnrollWorldBoss()
		-- 通知全服世界BOSS开始报名
		outFmtInfo("InitWorldBossCorn enroll ===============================")
	end)

	-- BOSS挑战时间
	H, M = self:ModifyTimeMinutes(sh, sm, enrollLast)
	crontab_str = string.format("%d %d * * *", M, H)
	outFmtInfo("WWWWWWWWWWWWWWWWWWWWWWWWWWorld boss fight crontab_str = %s", crontab_str)
	self.cron:addCron("通知全服世界BOSS挑战", crontab_str, function() 
		-- 分配
		local playerDict, roomInfo = ArrangeWorldBossRoom()
		-- 通知场景服 进行初始化
		NoticeScene(APPD_SCENED_FIGHT_WORLD_BOSS, #playerDict)
		-- 进行传送
		DoWorldBossTeleport(playerDict, roomInfo)
		
		-- 通知全服世界BOSS挑战 分好房间, 把所有报名的人传送进去
		outFmtInfo("InitWorldBossCorn fight===============================")
	end)
	
	-- BOSS结束时间
	H, M = self:ModifyTimeMinutes(sh, sm, time_last)
	crontab_str = string.format("%d %d * * *", M, H)
	outFmtInfo("WWWWWWWWWWWWWWWWWWWWWWWWWWorld boss endddddddddddddddd crontab_str = %s", crontab_str)
	self.cron:addCron("通知全服世界BOSS结束", crontab_str, function() 
		-- 通知场景服 BOSS结束
		NoticeScene(APPD_SCENED_WORLD_BOSS_END)
		-- 通知全服世界BOSS挑战 分好房间, 把所有报名的人传送进去
		outFmtInfo("InitWorldBossCorn end*****************************===============================")
	end)
	
end

-- 分钟数改变后的实际时间
function AppdApp:ModifyTimeMinutes(H, M, addM)
	if(addM > 60 or addM < -60) then
		return H, M
	end
	M = M + addM
	if M < 0 then
		M = M + 60
		H = H - 1
		if H < 0 then
			H = 23
		end
	elseif M > 60 then
		M = M - 60
		H = H + 1
		if H > 23 then
			H = 0
		end
	end
	
	return H, M
end


-- 通知场景服做某些事
function NoticeScene(typ, data, str)
	data = data or 0
	str = str or ""
	
	serverConnList:forEachScenedFD(function (fd)
		call_scened_appd_to_send_do_something(fd, "", typ, data, str)
	end)
	
end


--全服发送通知包
function AppdApp:CallOptResult(typ, reason, data)
	if type(data) == 'table' then
		data = string.join(',', data)
	else
		data = tostring(data) or ''
	end	
	local pkt = protocols.pack_operation_failed(typ, reason, data)
	self:Broadcast(pkt)
	pkt:delete()
end

--发公告
function AppdApp:SendNotice( id, content, data )
	local data = data or ""
	local content = content or ""
	local pkt = protocols.pack_chat_notice(id, content, data)
	self:Broadcast(pkt)
	pkt:delete()
end

--广播包
function AppdApp:Broadcast(pkt)
	self.objMgr:foreachAllPlayer(function(player)
		player:SendPacket(pkt)
	end)
end

return AppdApp
