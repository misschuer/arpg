--帮派管理
local FactionInfo = class('FactionInfo', BinLogObject)

--获取帮派标志位
function FactionInfo:GetFactionFlags(index)
	return self:GetBit(FACTION_INT_FIELD_FLAG,index)
end

--设置帮派标志位
function FactionInfo:SetFactionFlags(index)
	if not self:GetFactionFlags(index) then
		self:SetBit(FACTION_INT_FIELD_FLAG,index)
	end
end

--取消帮派标志位
function FactionInfo:UnSetFactionFlags(index)
	if self:GetFactionFlags(index) then
		self:UnSetBit(FACTION_INT_FIELD_FLAG,index)
	end
end

--获取帮派成员人数
function FactionInfo:GetMemberCount()
	return self:GetUInt32(FACTION_INT_FIELD_PLAYER_NOW_INDEX)
end

--设置帮派成员人数
function FactionInfo:SetMemberCount(val)
	self:SetUInt32(FACTION_INT_FIELD_PLAYER_NOW_INDEX, val)
end

--添加帮派成员人数
function FactionInfo:AddMemberCount(val)
	self:AddUInt32(FACTION_INT_FIELD_PLAYER_NOW_INDEX, val)
end

--减少帮派成员人数
function FactionInfo:SubMemberCount(val)
	self:SubUInt32(FACTION_INT_FIELD_PLAYER_NOW_INDEX, val)
end
--帮派最大成员人数
function FactionInfo:GetMemberMaxCount()
	local lev = self:GetFactionLevel()
	return tb_faction_base[lev].maxnum
end

--获取帮派申请人数
function FactionInfo:GetFactionApplyCount()
	return self:GetUInt32(FACTION_INT_FIELD_APPLY_PLAYER_COUNT_INDEX)
end

--设置帮派申请人数
function FactionInfo:SetFactionApplyCount(val)
	self:SetUInt32(FACTION_INT_FIELD_APPLY_PLAYER_COUNT_INDEX, val)
end

--添加帮派申请人数
function FactionInfo:AddFactionApplyCount(val)
	self:AddUInt32(FACTION_INT_FIELD_APPLY_PLAYER_COUNT_INDEX, val)
end

--减少帮派申请人数
function FactionInfo:SubFactionApplyCount(val)
	self:SubUInt32(FACTION_INT_FIELD_APPLY_PLAYER_COUNT_INDEX, val)
end
---------------------帮派事件相关---------------------
--获取单条事件类型
function FactionInfo:GetFactionEventType(pos)
	return self:GetUInt16(FACTION_INT_FIELD_EVENT+pos*MAX_FACTION_INT_EVENT+FACTION_INT_EVENT_TYPE_VALUE,0)
end
--设置单条事件类型
function FactionInfo:SetFactionEventType(pos,val)
	self:SetUInt16(FACTION_INT_FIELD_EVENT+pos*MAX_FACTION_INT_EVENT+FACTION_INT_EVENT_TYPE_VALUE,0,val)
end

--获取单条事件值
function FactionInfo:GetFactionEventValue(pos)
	return self:GetUInt16(FACTION_INT_FIELD_EVENT+pos*MAX_FACTION_INT_EVENT+FACTION_INT_EVENT_TYPE_VALUE,1)
end
--设置单条事件值
function FactionInfo:SetFactionEventValue(pos,val)
	self:SetUInt16(FACTION_INT_FIELD_EVENT+pos*MAX_FACTION_INT_EVENT+FACTION_INT_EVENT_TYPE_VALUE,1,val)
end

--获取单条事件名称
function FactionInfo:GetFactionEventName(pos)
	return self:GetStr(FACTION_STRING_FIELD_EVENT+pos)
end
--设置单条事件名称
function FactionInfo:SetFactionEventName(pos,val)
	self:SetStr(FACTION_STRING_FIELD_EVENT+pos,val)
end

--设置事件标记
function FactionInfo:SetFactionEventFlag(val)
	self:SetUInt32(FACTION_INT_FIELD_EVENT_FALG,val)
end
--获取事件标记
function FactionInfo:GetFactionEventFlag()
	return self:GetUInt32(FACTION_INT_FIELD_EVENT_FALG)
end



---------------------成员信息相关---------------------
--获取成员战斗力
function FactionInfo:GetFactionMemberForce(pos)
	return self:GetDouble(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FORCE)
end

--设置成员战斗力
function FactionInfo:SetFactionMemberForce(pos,val)
	self:SetDouble(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FORCE,val)
end

--获取成员等级
function FactionInfo:GetFactionMemberLevel(pos)
	return self:GetUInt16(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 0)
end

--设置成员等级
function FactionInfo:SetFactionMemberLevel(pos,val)
	self:SetUInt16(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 0, val)
end

--获取成员今日贡献
function FactionInfo:GetFactionMemberDayGongXian(pos)
	return self:GetUInt16(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 1)
end

--设置成员今日贡献
function FactionInfo:SetFactionMemberDayGongXian(pos,val)
	self:SetUInt16(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 1, val)
end

--增加成员今日贡献
function FactionInfo:AddFactionMemberDayGongXian(pos,val)
	self:AddUInt16(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 1, val)
end

--获取成员今日金币捐献次数
function FactionInfo:GetFactionMemberGoldDonation(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 2)
end

--设置成员今日金币捐献次数
function FactionInfo:SetFactionMemberGoldDonation(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 2, val)
end

--增加成员今日金币捐献次数
function FactionInfo:AddFactionMemberGoldDonation(pos,val)
	self:AddByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 2, val)
end

--获取成员今日元宝捐献次数
function FactionInfo:GetFactionMemberYbDonation(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 3)
end

--设置成员今日元宝捐献次数
function FactionInfo:SetFactionMemberYbDonation(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 3, val)
end

--增加成员今日元宝捐献次数
function FactionInfo:AddFactionMemberYbDonation(pos,val)
	self:AddByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 3, val)
end

--获取成员标志位
function FactionInfo:GetFactionMemberFlags(pos,val)
	return self:GetBit(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FLAGS, val)
end

--设置成员标志位
function FactionInfo:SetFactionMemberFlags(pos,val)
	self:SetBit(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FLAGS, val)
end

--重设成员标志位
function FactionInfo:UnSetFactionMemberFlags(pos,val)
	self:UnSetBit(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FLAGS, val)
end

--获取成员是否在线
function FactionInfo:GetFactionMemberIsOnline(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 0)
end

--设置成员是否在线
function FactionInfo:SetFactionMemberIsOnline(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 0, val)
end

--获取成员身份
function FactionInfo:GetFactionMemberIdentity(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 1)
end

--设置成员身份
function FactionInfo:SetFactionMemberIdentity(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 1, val)
end

--获取VipLevel
function FactionInfo:GetFactionMemberVipLevel(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 2)
end

--设置VipLevel
function FactionInfo:SetFactionMemberVipLevel(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 2, val)
end

--获取今日活跃度
function FactionInfo:GetFactionMemberActive(pos)
	return self:GetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 3)
end

--设置今日活跃度
function FactionInfo:SetFactionMemberActive(pos,val)
	self:SetByte(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 3, val)
end

--获取成员在线时长
function FactionInfo:GetFactionMemberOnlineTime(pos)
	return self:GetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_ONLINE_TIME)
end

--设置成员在线时长
function FactionInfo:SetFactionMemberOnlineTime(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_ONLINE_TIME,val)
end


--获取成员离线时间
function FactionInfo:GetFactionMemberLogoutTime(pos)
	return self:GetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_LOGOUT_TIME)
end

--设置成员离线时间
function FactionInfo:SetFactionMemberLogoutTime(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_LOGOUT_TIME,val)
end

--获取成员历史贡献
function FactionInfo:GetFactionMemberTotalGongXian(pos)
	return self:GetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_TOTAL_CONTRIBUTION)
end

--设置成员历史贡献
function FactionInfo:SetFactionMemberTotalGongXian(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_TOTAL_CONTRIBUTION,val)
end

--增加成员历史贡献
function FactionInfo:AddFactionMemberTotalGongXian(pos,val)
	self:AddUInt32(FACTION_INT_FIELD_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_TOTAL_CONTRIBUTION,val)
end



--获取成员GUID
function FactionInfo:GetFactionMemberGuid(pos)
	return self:GetStr(FACTION_STRING_FIELD_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_GUID)
end

--设置成员GUID
function FactionInfo:SetFactionMemberGuid(pos,val)
	self:SetStr(FACTION_STRING_FIELD_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_GUID,val)
end

--获取成员名字
function FactionInfo:GetFactionMemberName(pos)
	return self:GetStr(FACTION_STRING_FIELD_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_NAME)
end

--设置成员名字
function FactionInfo:SetFactionMemberName(pos,val)
	self:SetStr(FACTION_STRING_FIELD_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_NAME,val)
end

--------------------------------------成员信息end-------------------------------

--获取帮派排名
function FactionInfo:GetFactionRank()
	return self:GetUInt32(FACTION_INT_FIELD_RANK)
end
--设置帮派排名
function FactionInfo:SetFactionRank(val)
	if self:GetFactionRank() ~= val then
		self:SetUInt32(FACTION_INT_FIELD_RANK,val)
	end
end

--获取帮派等级
function FactionInfo:GetFactionLevel()
	return self:GetUInt32(FACTION_INT_FIELD_LEVEL)
end

--设置帮派等级
function FactionInfo:SetFactionLevel(val)
	self:SetUInt32(FACTION_INT_FIELD_LEVEL,val)
end


--获取帮派活跃度
function FactionInfo:GetFactionActive()
	return self:GetUInt32(FACTION_INT_FIELD_ACTIVITY)
end

--设置帮派活跃度
function FactionInfo:SetFactionActive(val)
	self:SetUInt32(FACTION_INT_FIELD_ACTIVITY,val)
end

--获取帮派资产
function FactionInfo:GetFactionMoney()
	return self:GetDouble(FACTION_INT_FIELD_MONEY)
end

--设置帮派资产
function FactionInfo:SetFactionMoney(val)
	self:SetDouble(FACTION_INT_FIELD_MONEY,val)
end
--增加帮派资产
function FactionInfo:AddFactionMoney(val)
	self:AddDouble(FACTION_INT_FIELD_MONEY,val)
end


--获取帮派战斗力
function FactionInfo:GetFactionForce()
	return self:GetDouble(FACTION_INT_FIELD_FORCE)
end

--设置帮派战斗力
function FactionInfo:SetFactionForce(val)
	if self:GetFactionForce() ~= val then
		self:SetDouble(FACTION_INT_FIELD_FORCE,val)
	end
end

--获取帮派当前选择的旗帜ID
function FactionInfo:GetFactionCurFlagId()
	return self:GetByte(FACTION_INT_FIELD_FLAGS_ID,0)
end

--设置帮派当前选择的旗帜ID
function FactionInfo:SetFactionCurFlagId(val)
	self:SetByte(FACTION_INT_FIELD_FLAGS_ID,0,val)
end

--获取帮派神明等级
function FactionInfo:GetFactionGodLevel()
	return self:GetByte(FACTION_INT_FIELD_FLAGS_ID,1)
end

--设置帮派神明等级
function FactionInfo:SetFactionGodLevel(val)
	self:SetByte(FACTION_INT_FIELD_FLAGS_ID,1,val)
end

--获取帮派灵气
function FactionInfo:GetFactionLingQi()
	return self:GetUInt16(FACTION_INT_FIELD_FLAGS_ID,1)
end

--设置帮派灵气
function FactionInfo:SetFactionLingQi(val)
	self:SetUInt16(FACTION_INT_FIELD_FLAGS_ID,1,val)
end

--增加帮派灵气
function FactionInfo:AddFactionLingQi(val)
	self:AddUInt16(FACTION_INT_FIELD_FLAGS_ID,1,val)
end
--设置帮派最小等级
function FactionInfo:SetFactionMinLev(val)
	self:SetUInt16(FACTION_INT_FIELD_MINLEV,0,val)
end
--获取帮派最小等级
function FactionInfo:GetFactionMinLev(val)
	return self:GetUInt32(FACTION_INT_FIELD_MINLEV,0)
end

--设置帮派公告
function FactionInfo:SetFactionNotice(notice)
	self:SetStr(FACTION_STRING_FIELD_GONGGAO,notice)
end

--设置帮派招募公告
function FactionInfo:SetFactionZhaoMuNotice(notice)
	self:SetStr(FACTION_STRING_FIELD_ZHAOMU_GONGGAO,notice)
end

--设置帮派公告修改时间
function FactionInfo:SetFactionNoticeTime(val)
	self:SetUInt32(FACTION_STRING_INT_GONGGAO_TIME,val)
end


--------------------------------------红包-------------------------------
--元宝数
function FactionInfo:GetFactionHongBao(index)
	return self:GetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_MONEY)
end
--设置元宝数
function FactionInfo:SetFactionHongBao(index,val)
	self:SetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_MONEY,val)
end
--个数
function FactionInfo:GetFactionHongBaoCount(index)
	return self:GetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_COUNT)
end
--设置个数
function FactionInfo:SetFactionHongBaoCount(index,val)
	self:SetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_COUNT,val)
end
--时间
function FactionInfo:GetFactionHongBaoTime(index)
	return self:GetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_TIME)
end
--设置时间
function FactionInfo:SetFactionHongBaoTime(index,val)
	self:SetUInt32(FACTION_INT_FIELD_HONGBAO+index*MAX_FACTION_INT_HONGBAO+FACTION_INT_HONGBAO_TIME,val)
end
--发红包的GUID
function FactionInfo:GetFactionHongBaoGuid(index)
	return self:GetStr(FACTION_STRING_FIELD_HONGBAO+index*MAX_FACTION_STRING_HONGBAO+FACTION_STRING_HONGBAO_GUID)
end
--设置发红包的GUID
function FactionInfo:SetFactionHongBaoGuid(index,str)
	self:SetStr(FACTION_STRING_FIELD_HONGBAO+index*MAX_FACTION_STRING_HONGBAO+FACTION_STRING_HONGBAO_GUID,str)
end
--发红包的名字
function FactionInfo:GetFactionHongBaoName(index)
	return self:GetStr(FACTION_STRING_FIELD_HONGBAO+index*MAX_FACTION_STRING_HONGBAO+FACTION_STRING_HONGBAO_NAME)
end
--设置发红包的名字
function FactionInfo:SetFactionHongBaoName(index,val)
	self:SetStr(FACTION_STRING_FIELD_HONGBAO+index*MAX_FACTION_STRING_HONGBAO+FACTION_STRING_HONGBAO_NAME,val)
end

--查找红包位置
function FactionInfo:FindFactionHongBaoPos(guid)
	local hongbao_table = {}
	for i = 0,MAX_FACTION_HONGBAO_COUNT - 1 do
		if self:GetFactionHongBaoGuid(i) == guid then
			table.insert(hongbao_table,{i,self:GetFactionHongBaoTime()})
		end
	end
	--没找到
	if #hongbao_table == 0 then
		return
	end
	--如果这个玩家发了>1个红包。优先选择最后面发的红包
	if #hongbao_table > 1 then
		table.sort(hongbao_table,function(a,b) return a[2] > b[2] end)
	end
	
	return hongbao_table[1][1]
end

--获取红包空位置
function FactionInfo:GetFactionHongBaoEmptyPos()
	for i = 0,MAX_FACTION_HONGBAO_COUNT - 1 do
		if self:GetFactionHongBaoCount(i) == 0 then
			return i
		end
	end
	return
end

--删除红包
function FactionInfo:DelFactionHongBao(index)
	self:SetFactionHongBao(index,0)
	self:SetFactionHongBaoCount(index,0)
	self:SetFactionHongBaoTime(index,0)
	self:SetFactionHongBaoGuid(index,"")
	self:SetFactionHongBaoName(index,"")
end

--添加一个红包
function FactionInfo:AddFactionHongBao(money,count,guid,name)
	local index = self:GetFactionHongBaoEmptyPos()
	if index then
		self:SetFactionHongBao(index,money)
		self:SetFactionHongBaoCount(index,count)
		self:SetFactionHongBaoTime(index,os.time())
		self:SetFactionHongBaoGuid(index,guid)
		self:SetFactionHongBaoName(index,name)
	end
end

--------------------------------------红包end-------------------------------


--------------------------------------申请加入帮派成员信息---------------------------------------------
--获取申请成员战斗力
function FactionInfo:GetFactionApplyForce(pos)
	return self:GetDouble(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FORCE)
end

--设置申请成员战斗力
function FactionInfo:SetFactionApplyForce(pos,val)
	self:SetDouble(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_FORCE,val)
end

--获取申请成员等级
function FactionInfo:GetFactionApplyLevel(pos)
	return self:GetUInt16(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 0)
end

--设置申请成员等级
function FactionInfo:SetFactionApplyLevel(pos,val)
	self:SetUInt16(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_UINT16, 0, val)
end

--获取申请成员VipLevel
function FactionInfo:GetFactionApplyVipLevel(pos)
	return self:GetByte(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 2)
end

--设置申请成员VipLevel
function FactionInfo:SetFactionApplyVipLevel(pos,val)
	self:SetByte(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 2, val)
end

--设置成员是否在线
function FactionInfo:SetFactionApplyIsOnline(pos,val)
	self:SetByte(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 0, val)
end

--获取成员身份
function FactionInfo:GetFactionApplyIdentity(pos)
	return self:GetByte(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_BYTE, 1)
end

--获取申请成员在线时长
function FactionInfo:GetFactionApplyOnlineTime(pos)
	return self:GetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_ONLINE_TIME)
end

--设置申请成员在线时长
function FactionInfo:SetFactionApplyOnlineTime(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_ONLINE_TIME,val)
end

--设置申请成员申请结束时间
function FactionInfo:GetFactionApplyEndTime(pos)
	return self:GetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_XIAOHEIWU_END_TIME)
end

--获取申请成员申请结束时间
function FactionInfo:SetFactionApplyEndTime(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_XIAOHEIWU_END_TIME,val)
end

--获取申请成员申请时间
function FactionInfo:GetFactionApplyTime(pos)
	return self:GetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_TOTAL_CONTRIBUTION)
end

--设置申请成员申请时间
function FactionInfo:SetFactionApplyTime(pos,val)
	self:SetUInt32(FACTION_INT_FIELD_APPLY_PLAYER+pos*MAX_FACTION_INT_MEMBER+FACTION_INT_MEMBER_TOTAL_CONTRIBUTION,val)
end

--获取申请成员GUID
function FactionInfo:GetFactionApplyGuid(pos)
	return self:GetStr(FACTION_STRING_FIELD_APPLY_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_GUID)
end

--设置申请成员GUID
function FactionInfo:SetFactionApplyGuid(pos,val)
	self:SetStr(FACTION_STRING_FIELD_APPLY_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_GUID,val)
end

--获取申请成员名字
function FactionInfo:GetFactionApplyName(pos)
	return self:GetStr(FACTION_STRING_FIELD_APPLY_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_NAME)
end

--设置申请成员名字
function FactionInfo:SetFactionApplyName(pos,val)
	self:SetStr(FACTION_STRING_FIELD_APPLY_PLAYER + pos*MAX_FACTION_STRING_MEMBER+FACTION_STRING_MEMBER_NAME,val)
end

--获取申请成员名字
function FactionInfo:GetFactionApplyFlag()
	return self:GetUInt32(FACTION_INT_FIELD_APPLY_FLAG)
end

--设置申请成员名字
function FactionInfo:SetFactionApplyFlag(val)
	self:SetUInt32(FACTION_INT_FIELD_APPLY_FLAG,val)
end

--获得玩家是否在申请列表中
function FactionInfo:IsApplyPlayer(player_guid)
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1
	do
		if self:GetFactionApplyGuid(i) == player_guid then
			return true
		end
	end
	return false
end

--获取申请列表可添加的位置
function FactionInfo:GetApplyEmptyPos()
	local pos
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1 do
		if self:GetFactionApplyGuid(i) == "" then
			pos = i
			break
		end
	end
	return pos
end
--获取申请列表中时间最早的
function FactionInfo:GetApplyMinTimePos()
	local minnum = 4294967295
	local pos
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1 do
		local time = self:GetFactionApplyTime(i)
		--outFmtDebug("time %d",time)
		if minnum > time then
			minnum = time
			pos = i
		end
		
	end
	return pos
end

--获取邀请列表成员所在位置
function FactionInfo:GetApplyPosFromPlayer(guid)
	local pos
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1
	do
		if self:GetFactionApplyGuid(i) == guid then
			pos = i
			break
		end
	end
	return pos
end

--添加申请成员
function FactionInfo:SetApplyPlayer(player)	
	--outFmtDebug("SetApplyPlayer")
	local pos = self:GetApplyEmptyPos()
	if pos == nil then
		pos = self:GetApplyMinTimePos()
		--outFmtDebug("SetApplyPlayer3 %d",pos)
	end
	
	if pos then
		self:SetFactionApplyGuid(pos, player:GetGuid())
		self:SetFactionApplyLevel(pos, player:GetLevel())
		self:SetFactionApplyForce(pos, player:GetForce())
		self:SetFactionApplyName(pos, player:GetName())
		self:SetFactionApplyVipLevel(pos,player:GetVIP())
		self:SetFactionApplyIsOnline(pos,1)
		self:SetFactionApplyTime(pos,os.time())
	end
end

--获取申请成员信息
function FactionInfo:GetApplyPlayer(guid)
	local pos = self:GetApplyPosFromPlayer(guid)
	local force,level,name,is_vip
	if pos ~= nil then
		force = self:GetFactionApplyForce(pos)
		level = self:GetFactionApplyLevel(pos)
		name = self:GetFactionApplyName(pos)
		is_vip = self:GetFactionApplyVipLevel(pos)
		--onlinetime = self:GetFactionApplyOnlineTime(pos)
	end
	return force,level,name,is_vip
end

--删除申请成员信息
function FactionInfo:DelApplyPlayer(guid)
	local pos = self:GetApplyPosFromPlayer(guid)
	if pos then
		self:SetFactionApplyGuid(pos, "")
		self:SetFactionApplyLevel(pos,0)
		self:SetFactionApplyForce(pos, 0)
		self:SetFactionApplyName(pos,"")
		self:SetFactionApplyVipLevel(pos,0)
		--self:SetFactionApplyOnlineTime(pos,0)
		--self:SetFactionApplyEndTime(pos,0)
		self:SetFactionApplyIsOnline(pos,0)
		self:SetFactionApplyTime(pos,0)
		--self:SubFactionApplyCount(1)
	end
end
--------------------------------------申请加入帮派成员信息END---------------------------------------------
--添加帮派动态
function FactionInfo:AddEvent( event_name, event_type, event_val)
	local pos = self:GetFactionEventFlag()
	--outFmtDebug("pos %d %d",pos,event_name)
	self:SetFactionEventType(pos,event_type)
	self:SetFactionEventValue(pos,event_val)
	self:SetFactionEventName(pos,event_name)
	pos = pos + 1
	if pos >= MAX_FACTION_EVENT_COUNT then
		pos = 0
	end
	self:SetFactionEventFlag(pos)
	--local factionEventInfo = self:getFactionEventsInfo()
	--if(factionEventInfo ~= nil)then
	--	factionEventInfo:AddFactionEventInfo(self:GetGuid(), player_id, player_name, os.time(), event_type, pi1, pi2, pi3, ps1)
	--end
end

--获取帮派可添加的位置
function FactionInfo:GetFactionEmptyPos()
	local pos
	for i = 0,MAX_FACTION_MAMBER_COUNT - 1 do
		if self:GetFactionMemberGuid(i) == "" then
			pos = i
			break
		end
	end
	return pos
end

--查找玩家位置
function FactionInfo:FindPlayerIndex(PlayGuid)
	local pos
	for i = 0, MAX_FACTION_MAMBER_COUNT - 1 do
		if self:GetFactionMemberGuid(i) ==  PlayGuid then
			pos = i
			break
		end
	end
	return pos
end
--设置帮主名字
function FactionInfo:SetBangZhuName(name)
	self:SetStr(FACTION_STRING_FIELD_MANGER_NAME,name)
end
--获得帮主名字
function FactionInfo:GetBangZhuName()
	return self:GetStr(FACTION_STRING_FIELD_MANGER_NAME)
end

--设置帮主GUID
function FactionInfo:SetBangZhuGuid(guid)
	self:SetStr(FACTION_STRING_FIELD_MANGER_GUID,guid)
end
--获得帮主GUID
function FactionInfo:GetBangZhuGuid()
	return self:GetStr(FACTION_STRING_FIELD_MANGER_GUID)
end		

--获得帮主guid
function FactionInfo:GetBangZhuGuid()
	for i=0, MAX_FACTION_MAMBER_COUNT - 1 do
		if self:GetFactionMemberGuid(i) ~= '' and self:GetFactionMemberIdentity(i) == FACTION_MEMBER_IDENTITY_BANGZHU then
			return self:GetFactionMemberGuid(i)
		end
	end
		
	return ''
end		

--获得是否管理员
function FactionInfo:IsManager(guid)
	local pos = self:FindPlayerIndex(guid)
	if pos then
		if self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_BANGZHU
			or self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_FU_BANGZHU 
			or self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_TANGZHU then
			return true
		end
	end
	return false
end	
--获得是否核心管理员
function FactionInfo:IsCoreManager(guid)
	local pos = self:FindPlayerIndex(guid)
	if pos then
		if self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_BANGZHU
			or self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_FU_BANGZHU then
			return true
		end
	end
	return false
end	

--获得位置人数
function FactionInfo:GetZhiWeiCount(zhiwei)
	local count = 0
	for i = 0, MAX_FACTION_MAMBER_COUNT - 1 do
		if self:GetFactionMemberIdentity(i) == zhiwei then
			count = count + 1
		end
	end
	return count
end	



--帮派申请
function FactionInfo:FactionApply( player)
	if player:GetFactionId() ~= "" then
		--玩家已有帮派
		--player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_IS_HAVE)
		outFmtDebug("you cannot join other, have faction = %s",faction_guid)
		return 
	end
	--if player:GetLevel() < tb_bangpai[1].need_level then
		--玩家等级不够
	--	player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_LEVEL_LACK)
	--	return 
	--end
	if self:GetMemberCount() >= self:GetMemberMaxCount() then
		--帮派人数已满
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_MEMBER_MAX_COUNT)
		return 
	end
	if self:GetFactionApplyCount() == MAX_FACTION_MAMBER_COUNT then
		--申请列表人数已满
		player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_APPLY_MAX_COUNT)
		return
	end
	
	--否则添加到申请列表中
	if not self:IsApplyPlayer(player:GetGuid()) then-- and player:AddFactionQuest(self:GetGuid()) 
		self:SetApplyPlayer(player)
	else
		outFmtDebug("you cannot join other, have apply")
	end
end

--添加帮派成员
function FactionInfo:MemberAdd( player, isInvited)
	isInvited = isInvited or false
	local player_guid = player:GetGuid()
	if self:FindPlayerIndex(player_guid) ~= nil then
		--玩家已经在帮派了
		return false
	end
	
	if player:GetFactionId() ~= "" then
		--玩家已经有帮派了
		player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_IS_HAVE)
		return false
	end

	if self:GetMemberCount() >= self:GetMemberMaxCount() then
		--帮派人数已满
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_MEMBER_MAX_COUNT)
		return 
	end
	
	local pos = self:GetFactionEmptyPos()
	if pos == nil then
		--没有找到空位,帮派人数已满
		player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_MEMBER_MAX_COUNT)
		return false
	end
	
	local force,level,name,is_vip--,onlinetime
	--创建者 or 不需要审核
	if self:GetMemberCount() == 0 or self:GetFactionFlags(FACTION_FLAGS_AUTO) or isInvited then	
		force = player:GetForce()
		level = player:GetLevel()
		name = player:GetName()
		is_vip = player:GetVIP()
		--onlinetime = player:GetOnlineTime()
	else
		if self:IsApplyPlayer(player_guid) then
			--force,level,name,is_vip = self:GetApplyPlayer(player_guid)
			force = player:GetForce()
			level = player:GetLevel()
			name = player:GetName()
			is_vip = player:GetVIP()
			self:DelApplyPlayer(player_guid)
		else
			return false
		end
	end
	--设置相关数据
	self:SetFactionMemberForce(pos, force)
	self:SetFactionMemberLevel(pos, level)
	if self:GetMemberCount() == 0 then
		self:SetFactionMemberIdentity(pos, FACTION_MEMBER_IDENTITY_BANGZHU)
	else
		self:SetFactionMemberIdentity(pos, FACTION_MEMBER_IDENTITY_QUNZHONG)
		--player:DelFactionQuest()
		--self:AddEvent(player_guid, name, FACTION_EVENT_TYPE_ADD_MEMBER)
	end
	self:SetFactionMemberGuid(pos, player_guid)
	self:SetFactionMemberName(pos, name)
	self:SetFactionMemberVipLevel(pos,is_vip)
	--self:SetFactionMemberOnlineTime(pos,onlinetime)
	self:SetFactionMemberIsOnline(pos,1)
	self:AddMemberCount(1)
	player:SetFactionId(self:GetGuid())
	player:SetFactionName(self:GetName())
	
	-- 添加监听
	app.objMgr:callAddWatch(player:GetSessionId(), self:GetGuid())
	--app.objMgr:callAddWatch(player:GetSessionId(), self:getFactionEventsGuid())

	--rankInsertTask(self:GetGuid(), RANK_TYPE_FACTION)
	local questMgr = player:getQuestMgr()
	questMgr:OnUpdate(QUEST_TARGET_TYPE_FACTION)
	return true
end

function FactionInfo:FactionExit(player)
	local player_guid = player:GetGuid()
	local index = self:FindPlayerIndex(player_guid)
	if index == nil then
		return
	end
	--如果退出是帮主,找到最长在线玩家
	if self:GetFactionMemberIdentity(index) == FACTION_MEMBER_IDENTITY_BANGZHU then	
		self:FactionDissolution()
	else 
		self:FactionQuit(player)
	end
end

--成员退出
function FactionInfo:FactionQuit( player,is_merge)
	local player_guid = player:GetGuid()
	local index = self:FindPlayerIndex(player_guid)
	if index == nil then
		return
	end
	
	player:SetFactionId("")
	player:SetFactionName("")
	--移除监听
	app.objMgr:callDelWatch(player:GetSessionId(),self:GetGuid())

	--app.objMgr:callDelWatch(player:GetSessionId(),self:getFactionEventsGuid())
	--成员离开后的处理
	self:RemoveChallengeBossDamageRankByGuid(player_guid)
	self:RemoveChallengeBossTotalRankByGuid(player_guid)
	self:DoChangeMemberOpt(index)
	if is_merge == nil then
		--self:AddEvent(player:GetGuid(), player:GetName(), FACTION_EVENT_TYPE_SUB_MEMBER)
	end
	player:ClearBuyedFactionShopItem()
	
	-- 成员退出
	-- 如果在帮派场景的强制传送到冒险世界
	if player:GetMapId() == FACTION_MAP_ID then
		local passedSectionId = player:GetUInt32(PLAYER_INT_FIELD_TRIAL_FINISHED_SECTIONID)
		local mapid, x, y, generalId = onGetRiskTeleportInfo(player:GetGuid(), passedSectionId)
		call_appd_teleport(player:GetScenedFD(), player:GetGuid(), x, y, mapid, generalId)
	end
	
end
--离线成员移除
function FactionInfo:FactionOutlineQuit(guid)
	local index = self:FindPlayerIndex(guid)
	if index == nil then
		return
	end
	
	self:RemoveChallengeBossDamageRankByGuid(guid)
	self:RemoveChallengeBossTotalRankByGuid(guid)
	self:DoChangeMemberOpt(index)
end
--帮派解散
function FactionInfo:FactionDissolution()

	for i = 0, MAX_FACTION_MAMBER_COUNT - 1 do
		local pguid = self:GetFactionMemberGuid(i)
		if pguid ~=  "" then
			local member = app.objMgr:getObj(pguid)
			if member then
				self:FactionQuit(member,true)
			else
				self:FactionOutlineQuit(pguid)
			end
		end
	end
	
	app.objMgr:callRemoveObject(self:GetGuid())
end

--成员离开后的处理
function FactionInfo:DoChangeMemberOpt(index)
	--成员人数-1
	self:SubMemberCount(1)
	--如果帮派解散
	if self:GetMemberCount() == 0 then
		--local faction_events_guid = self:getFactionEventsGuid()
		app.objMgr:callRemoveObject(self:GetGuid())
		--app.objMgr:callRemoveObject(faction_events_guid)
		return
	end
	--清理数据
	self:SetFactionMemberForce(index, 0)
	self:SetFactionMemberLevel(index, 0)
	self:SetFactionMemberDayGongXian(index,0)
	self:SetFactionMemberIdentity(index, 0)
	self:SetFactionMemberVipLevel(index,0)
	--self:SetFactionMemberOnlineTime(index,0)
	self:SetFactionMemberLogoutTime(index,0)
	self:SetFactionMemberTotalGongXian(index,0)
	self:SetFactionMemberGuid(index, "")
	self:SetFactionMemberName(index, "")
end


--同意加入帮派
function FactionInfo:FactionAgreeJoin( player, apply_guid)

	local applyer = app.objMgr:getObj(apply_guid)
	if applyer == nil then
		--找不到该玩家
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_PLAYER_OFFLINE)
		return 
	end
	
	if not self:IsManager(player:GetGuid()) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	if not self:IsApplyPlayer(apply_guid) then
		--玩家没有在申请列表
		--player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_NOT_IN_APPLY_LIST)
		outFmtDebug("apply user is not in apply list")
		return
	end
	
	if self:GetMemberCount() >= self:GetMemberMaxCount() then
		--帮派人数已满
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_MEMBER_MAX_COUNT)
		return 
	end
	
	if applyer:GetFactionId() ~= "" then
		--玩家已经有帮派了
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_IS_HAVE)
		--申请列表的数据不是最新的，这里手动清除一下数据
		self:DelApplyPlayer(apply_guid)
		return
	end
	
	if self:MemberAdd(applyer) then
		applyer:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_JOIN_SUCESS)
		--player:CallOptResult(OPERTE_TYPE_FACTION, OPRATE_TYPE_FACTION_JOIN_SUCCESS, {apply_guid,applyer:GetName()})
	end
end

--全部同意加入帮派
function FactionInfo:FactionAgreeJoinAll( player )
	
	if not self:IsManager(player:GetGuid()) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1 do
		local apply_guid = self:GetFactionApplyGuid(i)
		if apply_guid ~= "" then
			self:FactionAgreeJoin( player, apply_guid)
		end
	end

end

--拒绝加入帮派
function FactionInfo:FactionRefuseJoin(player,apply_guid)
	local applyer = app.objMgr:getObj(apply_guid)
	if applyer == nil then
		--找不到该玩家
		self:DelApplyPlayer(apply_guid)
		return 
	end
	
	if not self:IsManager(player:GetGuid()) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	if not self:IsApplyPlayer(apply_guid) then
		--玩家没有在申请列表
		--player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_NOT_IN_APPLY_LIST)
		outFmtDebug("player is not in apply list")
		return
	end
	self:DelApplyPlayer(apply_guid)
	--applyer:DelFactionQuest(self:GetGuid())
	applyer:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_FACTION_REFUSED_JOIN, self:GetName())
end
--拒绝所有人加入帮派
function FactionInfo:FactionRefuseJoinAll(player)
	if not self:IsManager(player:GetGuid()) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT-1 do
		local apply_guid = self:GetFactionApplyGuid(i)
		if apply_guid ~= "" then
			self:FactionRefuseJoin( player, apply_guid)
		end
	end
end
--踢出帮派
function FactionInfo:MemberKicked( player, member_id)
	local player_guid = player:GetGuid()
	
	--local pos = self:FindPlayerIndex(player_guid)
	--if pos == nil then return end
	
	--if self:GetFactionMemberIdentity(pos) ~= FACTION_MEMBER_IDENTITY_BANGZHU
	--	and self:GetFactionMemberIdentity(pos) ~= FACTION_MEMBER_IDENTITY_FU_BANGZHU then
		--不是帮主或者负帮主
	--	player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_NO_MANAGER)
	--	return
	--end
	
	if not self:IsManager(player:GetGuid()) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	if member_id == player_guid then
		--自己不能踢自己
		return
	end
	
	local member_pos = self:FindPlayerIndex(member_id)
	if member_pos == nil then
		--不是本帮派的人
		return
	end
	local member = app.objMgr:getObj(member_id)
	if member then
		--outFmtDebug("on line %s",member_id)
		self:FactionQuit(member,true)
		member:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_KICKED, self:GetName())
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_KICK_SUCCESS, {member_id,member:GetName()})
	else
		--outFmtDebug("not on line %s",member_id)
		self:FactionOutlineQuit(member_id)
	end
end

--职位任免
function FactionInfo:FactionAppoint( player, member_id,zhiwei)
	--print("zhiwei %d",zhiwei)
	if zhiwei < FACTION_MEMBER_IDENTITY_BANGZHU or zhiwei > FACTION_MEMBER_IDENTITY_QUNZHONG then
		--职位错误
		return
	end
	
	local player_guid = player:GetGuid()
	local pos = self:FindPlayerIndex(player_guid)
	if pos == nil then return end
	if not self:IsCoreManager(player_guid) then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	if member_id == player_guid then
		--自己不能任免自己
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_APPOINT_NOSELF)
		return
	end
	
	local member_pos = self:FindPlayerIndex(member_id)
	if member_pos == nil then
		--不是本帮派的人
		return
	end
	
	if self:GetFactionMemberIdentity(member_pos) == zhiwei then
		--职位相同
		return
	end
	--outFmtDebug("zhiwei %d",zhiwei)
	
	local config = tb_faction_zhiwei[zhiwei].num
	if zhiwei ~= FACTION_MEMBER_IDENTITY_BANGZHU and config then
		if self:GetZhiWeiCount(zhiwei) >= config then
		--该职位人数已满
			player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_MAX_ZHIWEI)
			return
		end
	end
	
	
	--如果是替换帮主
	if zhiwei == FACTION_MEMBER_IDENTITY_BANGZHU  then
		if self:GetFactionMemberIdentity(pos) == FACTION_MEMBER_IDENTITY_BANGZHU then--帮主自己才能转让
			self:SetFactionMemberIdentity(pos,FACTION_MEMBER_IDENTITY_QUNZHONG)
			self:SetBangZhuName(self:GetFactionMemberName(member_pos))
			self:SetBangZhuGuid(self:GetFactionMemberGuid(member_pos))
		else
			--print("aaaa")
			return
		end
	end
	
	self:SetFactionMemberIdentity(member_pos,zhiwei)
	
	player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_APPOINT_SUCCESS)
	local member = app.objMgr:getObj(member_id)
	if member then
		member:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_PROMOTED,zhiwei)
		--self:AddEvent(player:GetGuid(), player:GetName(), FACTION_EVENT_TYPE_APPOINT,zhiwei,0,0,member:GetName())
	end
end

--招募设置
function FactionInfo:FactionRecruit(player,reserve_int1,reserve_int2,reserve_str1 )
	--print(reserve_int1,reserve_int2,reserve_str1,FACTION_FLAGS_AUTO)
	if reserve_int2 < 0 then
		outFmtDebug("faction Recruit level error")
		return;
	end
	local player_guid = player:GetGuid()
	--local pos = self:FindPlayerIndex(player_guid)
	--if pos == nil then return end
	if not self:IsManager(player_guid) then
		--不是帮主
		player:CallOptResult(OPRATE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	if reserve_int1 == 1 then
		self:SetFactionFlags(FACTION_FLAGS_AUTO)
	else
		self:UnSetFactionFlags(FACTION_FLAGS_AUTO)
	end

	self:SetFactionMinLev(reserve_int2)
	self:SetFactionZhaoMuNotice(reserve_str1)

	--rankInsertTask(self:GetGuid(), RANK_TYPE_FACTION)
end

--帮派升级
function FactionInfo:FactionLevelUp(player )
	local player_guid = player:GetGuid()
	if not self:IsManager(player_guid) then
		--不是帮主
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	local lv = self:GetFactionLevel()
	local money = self:GetFactionMoney()
	local config = tb_faction_base[lv]
	if config == nil or lv >= #tb_faction_base then 
		return 
	end
	--判断金钱
	if money < config.cost then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPEATE_TYPE_FACTION_MONEY_ERR)
		return
	end
	self:SetFactionMoney(money - config.cost)
	self:SetFactionLevel(lv + 1)
	self:RefreshShop()
	--升级成功
	player:CallOptResult(OPERTE_TYPE_FACTION, OPEATE_TYPE_FACTION_LEVEL_UP)
	
	rankInsertTask(self:GetGuid(), RANK_TYPE_FACTION)
end




--替换帮旗
function FactionInfo:FactionChangeFlags(player ,index)
	local player_guid = player:GetGuid()
	local pos = self:FindPlayerIndex(player_guid)
	if pos == nil then return end
	if self:GetFactionMemberIdentity(pos) ~= FACTION_MEMBER_IDENTITY_BANGZHU then
		--不是帮主
		player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_NO_MANAGER)
		return
	end
	local has_money = player:GetMoney(MONEY_TYPE_GOLD_INGOT)
	local need_money = tb_bangpai[1].cost_qi[1]
	local guid = globalValue:GetFactionFlagsGuid(index)
	if guid == nil then return end
	local is_rank = true
	--默认旗帜
	if index == 0 or guid == self:GetGuid() then
		self:FactionFlags(index)
		return
	--该旗帜有归属	
	elseif guid ~= "" then
		need_money = tb_bangpai[1].cost_qi[2]
		--判断一下排名
		local faction = app.objMgr:getObj(guid)
		if faction then
			if self:GetFactionRank() > faction:GetFactionRank() then
				--排名不够
				is_rank = false
			end
		end
	end
	if not is_rank then
		player:CallOptResult(OPRATE_TYPE_FACTION, OPRATE_TYPE_FACTION_RANK_ERR)
		return
	end
	if money < need_money then
		player:CallOptResult(OPRATE_TYPE_FACTION, OPEATE_TYPE_FACTION_MONEY_ERR)
		return
	end
	--扣钱
	if not player:SubMoney(MONEY_TYPE_GOLD_INGOT, MONEY_CHANGE_FACTION_FLAGS, need_money) then
		player:CallOptResult(OPRATE_TYPE_FACTION, OPEATE_TYPE_FACTION_MONEY_ERR)
		return
	end
	self:FactionFlags(index,guid)
end

function FactionInfo:FactionFlags(index ,guid)
	--默认旗帜
	if guid == nil then
		self:SetFactionCurFlagId(index)
		return
	end
	
	globalValue:SetFactionFlagsGuid(index,self:GetGuid())
	self:SetFactionCurFlagId(index)
	
	if guid and guid ~= "" then
		local faction = app.objMgr:getObj(guid)
		if faction then
			faction:FactionFlags(0)
		end
	end
end
--帮会公告
function FactionInfo:FactionNotice(player,notice)
	
	local player_guid = player:GetGuid()
	local pos = self:FindPlayerIndex(player_guid)
	if pos == nil then return end
	local tab = string.split(notice,"\1")
	if #tab ~= 3 then
		outFmtInfo("faction notice format error");
		return
	end
	--if #tab
	
	if self:GetFactionMemberIdentity(pos) ~= FACTION_MEMBER_IDENTITY_BANGZHU 
		and self:GetFactionMemberIdentity(pos) ~= FACTION_MEMBER_IDENTITY_FU_BANGZHU then
		--不是帮主 or 副帮主
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOT_MANAGER)
		return
	end
	
	--帮派公告不能超过144个中文字符
	if string.len(notice) > 400 then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOTICE_ERR)
		return
	end
	
	--判断是否有屏蔽词
	if fuckPingBi(notice) ~= notice then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_NOTICE_ERR_PB)
		return
	end
	print(notice,56) 
	self:SetFactionNotice(notice)
	--self:SetFactionNoticeTime(os.time())
	
	--local allPlayers = self:GetFactionAllMemberPtr()
	--for _, people in pairs(allPlayers) do
	--	people:call_faction_chat("","公告", notice)
	--end
end







--帮派成员心跳
function FactionInfo:Update( player)
	--玩家在帮派位置
	local Faction_Pos = self:FindPlayerIndex(player:GetGuid())
	if Faction_Pos == nil then
		return
	end		
	
	--玩家战斗力	
	if player:GetForce() ~= self:GetFactionMemberForce(Faction_Pos) then
		self:SetFactionMemberForce(Faction_Pos,player:GetForce())
	end
	
	--玩家等级
	if player:GetLevel() ~= self:GetFactionMemberLevel(Faction_Pos) then
		self:SetFactionMemberLevel(Faction_Pos, player:GetLevel())
	end
	
	
	--玩家VIP等级
	if player:GetVIP() ~= self:GetFactionMemberVipLevel(Faction_Pos) then
		self:SetFactionMemberVipLevel(Faction_Pos, player:GetVIP())
	end
	
	--玩家在线时长
	if player:GetOnlineTime() ~= self:GetFactionMemberOnlineTime(Faction_Pos) then
		self:SetFactionMemberOnlineTime(Faction_Pos, player:GetOnlineTime())
	end
	
	-- 更新玩家名字
	if player:GetName() ~= self:GetFactionMemberName(Faction_Pos) then
		self:SetFactionMemberName(Faction_Pos, player:GetName())
	end
	
	--更新地位
	if self:GetFactionMemberIdentity(Faction_Pos) == FACTION_MEMBER_IDENTITY_QUNZHONG then
		if self:GetFactionMemberTotalGongXian(Faction_Pos) > tb_bangpai[1].zhiwei[1] then
			self:SetFactionMemberIdentity(Faction_Pos,FACTION_MEMBER_IDENTITY_GAOSHOU)
		end
	end
	if self:GetFactionMemberIdentity(Faction_Pos) == FACTION_MEMBER_IDENTITY_GAOSHOU then
		if self:GetFactionMemberTotalGongXian(Faction_Pos) > tb_bangpai[1].zhiwei[2] then
			self:SetFactionMemberIdentity(Faction_Pos,FACTION_MEMBER_IDENTITY_JINGYING)
		end
	end
	
	--打boss加成
	if self:GetFactionFlags(FACTION_FLAGS_IS_BOSS_ADD) then
		player:GetFlags(PLAYER_APPD_INT_FIELD_FLAGS_FACTION_BOSS_ADD)
	else
		player:UnSetFlags(PLAYER_APPD_INT_FIELD_FLAGS_FACTION_BOSS_ADD)
	end
	
end
--获取商品index 和 num
function FactionInfo:GetShopItem(item)
	for i=FACTION_INT_FIELD_SHOP,FACTION_INT_FIELD_SHOP_END-1 do
		local id = self:GetUInt16(i,0)
		if id == item then
			return i,self:GetUInt16(i,1)
		end
	end
	return -1,0
end
--设置商品数量
function FactionInfo:SetShopItemNum(idx,num)
	self:SetUInt16(idx,1,num)
end
--商店购买
function FactionInfo:ShopItem(player,item,num)
	if num <= 0 then
		return
	end
	local idx,curNum = self:GetShopItem(item)
	local buyedIndex, buyedNum = player:GetBuyedFactionShopItem(item)
	if idx ~= -1 then
		if num > curNum - buyedNum then
			player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_SHOP_NUMLOW)
			return
		end
		local config = tb_faction_shop[item]
		if not config then
			return
		end
		
		if not player:checkMoneyEnoughs(config.costResource,num) then
			player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_DEVOTE)
			return
		end
	
		if player:costMoneys(MONEY_CHANGE_FACTION_SHOP,config.costResource,num) then
			curNum = curNum - num
			--self:SetShopItemNum(idx,curNum)
			player:AddBuyedFactionShopItem(item,num)
			player:AddItemByEntry(config.itemId, num, nil, 9, true)--FIXME
		end
	end
end
--商店刷新
function FactionInfo:RefreshShop()
	local lev = self:GetFactionLevel()
	print(lev)
	local config = tb_faction_base[lev]
	if not config then
		return
	end
	local num = config.shop
	
	local list = tb_faction_shop_list[lev]
	if num > #list then
		num = #list
	end
	local idxTab = GetRandomIndexTable(#list,num)
	--for k,v in ipairs(idxTab) do
	--	print(k,v)
	--end
	for i=FACTION_INT_FIELD_SHOP,FACTION_INT_FIELD_SHOP_END-1 do
		local idx = i - FACTION_INT_FIELD_SHOP + 1
		
		if idxTab[idx] then
			local item = list[idxTab[idx]]
			if item then
				self:SetUInt16(i,0,item.id)
				self:SetUInt16(i,1,item.num)
			else 
				self:SetUInt16(i,0,0)
				self:SetUInt16(i,1,0)
			end
		else 
			self:SetUInt16(i,0,0)
			self:SetUInt16(i,1,0)
		end
	end
end
--帮派自身心跳
function FactionInfo:SelfUpdate()

	--local faction_force = 0
	--local is_boss_add = false
	--for iNum = 0, MAX_FACTION_MAMBER_COUNT - 1 do
		--更新战斗力
		--faction_force = faction_force + self:GetFactionMemberForce(iNum)
		--更新是否打帮派boss有加成
		--local player = app.objMgr:getObj(self:GetFactionMemberGuid(iNum))
		--if player and player:GetFactionFbCount() > 0 then
		--	is_boss_add = true
		--end
	--end	
	--self:SetFactionForce(faction_force)
	--if is_boss_add then
	--	self:SetFactionFlags(FACTION_FLAGS_IS_BOSS_ADD)
	--else
	--	self:UnSetFactionFlags(FACTION_FLAGS_IS_BOSS_ADD)
	--end
	
	--看下帮主是否已经离线超过3天
	local manager_guid = self:GetBangZhuGuid()
	local pos = self:FindPlayerIndex(manager_guid)
	--帮派成员大于1个才有必要换
	if pos ~= nil and self:GetMemberCount() > 1 then
		local logout_time = self:GetFactionMemberLogoutTime(pos)
		if logout_time > 0 and logout_time < os.time() - tb_bangpai[1].leave_time*3600 then
			local index_ass = -1
			local zhiwei = FACTION_MEMBER_IDENTITY_QUNZHONG
			for i = 0, MAX_FACTION_MAMBER_COUNT - 1 do		
				local guid = self:GetFactionMemberGuid(i)
				if guid ~= "" and guid ~= player_guid then
					if zhiwei > self:GetFactionMemberIdentity(i) then
						zhiwei = self:GetFactionMemberIdentity(i)
						index_ass = i
					end
				end
			end
			if index_ass ~= -1 then
				self:SetFactionMemberIdentity(pos,self:GetFactionMemberIdentity(index_ass))
				self:SetFactionMemberIdentity(index_ass, FACTION_MEMBER_IDENTITY_BANGZHU)
			end
		end
	end
	
	--更新申请列表
	for i = 0,MAX_FACTION_APLLY_MAMBER_COUNT - 1 do
		local apply_guid = self:GetFactionApplyGuid(i)
		if apply_guid ~= "" then
			local applyer = app.objMgr:getObj(apply_guid)
			if applyer then
				--如果玩家已经加入其它帮派，则清理一下该位置的申请数据
				if applyer:GetFactionId() ~= "" then
					self:DelApplyPlayer(apply_guid)
				end
			end
		end
	end
end

--玩家离线 
function FactionInfo:PlayerLogout(player_guid)
	local FactionId = self:FindPlayerIndex(player_guid)
	if FactionId == nil then
		return false
	end
	self:SetFactionMemberIsOnline(FactionId,0)
	self:SetFactionMemberLogoutTime(FactionId,os.time())
	return true
end
	
--玩家上线
function FactionInfo:PlayerLogin( player)
	local FactionId = self:FindPlayerIndex(player:GetGuid())
	if FactionId == nil then
		return false
	end
	self:SetFactionMemberIsOnline(FactionId,1)
	self:SetFactionMemberLogoutTime(FactionId,0)
	return true
end


--获取所有团员的GUID
function FactionInfo:DoGetFactionAllMember()
	local result = {}
	for i=0, MAX_FACTION_MAMBER_COUNT - 1 do
		local Guid = self:GetFactionMemberGuid(i)
		if Guid ~= "" and Guid ~= nil then
			table.insert(result,Guid)
		end
	end
	return result
end


--获取所有团员的对象
function FactionInfo:GetFactionAllMemberPtr()
	local result = {}
	local player
	for i=0, MAX_FACTION_MAMBER_COUNT - 1 do
		local Guid = self:GetFactionMemberGuid(i)
		if Guid ~= "" and Guid~= nil then
			player = app.objMgr:getObj(Guid)
			if player then	-- 在线帮派成员
				table.insert(result, player)
			end
		end
	end
	return result
end

--帮派解散
function FactionInfo:AllFactionPlayerQuit()	
	for i=MAX_FACTION_MAMBER_COUNT-1, 0, -1 do
		local Guid = self:GetFactionMemberGuid(i)
		if Guid ~= "" and Guid~= nil then
			local player = app.objMgr:getObj(Guid)
			if player then	-- 在线则退出
				self:FactionQuit(player,true)
			end
		end
	end
end

-- 检测下玩家是否是军团成员
function FactionInfo:CheckFactionMember(player)
	if self:FindPlayerIndex(player:GetGuid()) ~= nil then
		player:SetFactionId(self:GetGuid())
		player:SetFactionName(self:GetName())
		self:PlayerLogin(player)
		--下发binlog给客户端
		app.objMgr:callAddWatch(player:GetSessionId(), self:GetGuid())
		app.objMgr:callAddWatch(player:GetSessionId(), self:getFactionEventsGuid())
	end
end

--根据帮派查找帮派动态
function FactionInfo:getFactionEventsInfo( )
	if not self.guid_FactionEventsInfo then
		self.guid_FactionEventsInfo = guidMgr.replace(self:GetGuid(), guidMgr.ObjectTypeFactionEvents)
	end
	return app.objMgr:getObj(self.guid_FactionEventsInfo)
end

--根据帮派查找帮派动态guid
function FactionInfo:getFactionEventsGuid( )
	if not self.faction_events_guid then
		self.faction_events_guid = guidMgr.replace(self:GetGuid(), guidMgr.ObjectTypeFactionEvents)
	end
	return self.faction_events_guid
end

--捐献
function FactionInfo:FactionJuanXian(player,pos,money_type,money_sum)
	local baseconfig = tb_faction_donation[money_type]
	if baseconfig == nil then
		return
	end
	if money_type ~= 1 and money_type ~= 2 then
		return
	end
	if money_sum <= 0 then
		return
	end
	--获取最大捐献次数
	local maxNum = 0
	local config = tb_faction_base[self:GetFactionLevel()]
	if config then
		if money_type == 1 then
			maxNum = config.golddonation
		elseif money_type == 2 then
			maxNum = config.ybdonation
		end
	else
		return
	end
	--outFmtDebug("maxNum %d",maxNum)

	local vip = player:GetVIP()
	--outFmtDebug("vip %d",vip)
	if vip > 0 then
		local vipConfig = tb_vip_base[vip]
		if money_type == 1 then
			maxNum = maxNum + vipConfig.factiondonation
		elseif money_type == 2 then
			maxNum = maxNum + vipConfig.factionybdonation
		end
	end
	--当前次数
	local currentNum
	if money_type == 1 then
		currentNum = self:GetFactionMemberGoldDonation(pos)
	elseif money_type == 2 then
		currentNum = self:GetFactionMemberYbDonation(pos)
	end
	--outFmtDebug("curNum %d",currentNum)
	
	--outFmtDebug("currentNum %d,%d",currentNum,money_sum)

	local targetNum = currentNum + money_sum
	if targetNum > maxNum then
		player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_DONATIONMAX)
		return
	end
	
	--print(baseconfig.cost)
	if not player:checkMoneyEnoughs(baseconfig.cost,money_sum) then
		if money_type == 1 then
			player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_DONATION_GOLD)
		elseif money_type == 2 then
			player:CallOptResult(OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_DONATION_YB)
		end

		return
	end
	
	if player:costMoneys(MONEY_CHANGE_FACTION_DONATION,baseconfig.cost,money_sum) then
		local devote = baseconfig.devote * money_sum
		local zijin = baseconfig.money * money_sum
		self:AddFactionMoney(zijin)
		self:AddFactionMemberTotalGongXian(pos,devote)
		player:AddMoney(MONEY_TYPE_FACTION, MONEY_CHANGE_FACTION_DONATION, devote)
		self:AddEvent(player:GetName(),money_type,money_sum)
		if money_type == 1 then
			self:AddFactionMemberGoldDonation(pos,money_sum)
		elseif money_type == 2 then
			self:AddFactionMemberYbDonation(pos,money_sum)
		end
		
		-- 加任务
		local questMgr = player:getQuestMgr()
		questMgr:OnUpdate(QUEST_TARGET_TYPE_FACTION_DONATION, {money_type, money_sum})
	end
	

	
	
	--local cost_table = {}
	--table.insert(cost_table,money_type)
	--table.insert(cost_table,money_sum)
	--if not player:SubItemByConfig(cost_table,MONEY_CHANGE_FACTION_JUANXIAN,OPRATE_TYPE_FACTION,OPEATE_TYPE_FACTION_MONEY_ERR) then
	--	return
	--end
	
	--local gongxian = (money_sum - 2) * 6 + 10
	--local zijin = (money_sum - 2) * 10 + 15
	--if money_type == 1 then	--铜钱
	--	gongxian = (money_sum - 50000) / 10000 * 2.5 + 10
	--	zijin = (money_sum - 50000) / 10000 * 2.5 + 10
	--end
	
	--self:AddFactionMemberDayGongXian(pos,gongxian)
	--self:AddFactionMemberTotalGongXian(pos,gongxian)
	--self:AddFactionMoney(pos,zijin)

	--self:AddEvent(player:GetGuid(), player:GetName(), FACTION_EVENT_TYPE_JUANXIAN,money_type,money_sum,gongxian)
end

--帮派每日重置
function FactionInfo:ResetFaction()
	--for i = 0, MAX_FACTION_MAMBER_COUNT - 1 do
	--	if self:GetFactionMemberGuid(i) ~= "" then
	--		self:SetFactionMemberGoldDonation(i,0)
	--		self:SetFactionMemberYbDonation(i,0)
	--	end
	--end
	
	self:RefreshShop()
	
	self:SetTokenBuyCount(0)
	self:SetTokenPointsCount(0)
end
--帮派重置成员每日信息
function FactionInfo:ResetMember(player)
	local pos = self:FindPlayerIndex(player:GetGuid())
	if pos then
		self:SetFactionMemberGoldDonation(pos,0)
		self:SetFactionMemberYbDonation(pos,0)
	end
end
--领取福利
function FactionInfo:FactionFuLi(player,pos)
	
	if player:IsLingQuFactionFuLi() then
		--领取过了
		return
	end
	local lv = self:GetFactionLevel()
	local zhiwei = self:GetFactionMemberIdentity(pos)
	if tb_bangpai_level[lv] == nil then return end
	local free_table = tb_bangpai_level[lv].free[zhiwei]
	if free_table == nil then return end
	
	for i = 1,#free_table,2 do
		player:AddItemByEntry(free_table[i], free_table[i+1], MONEY_CHANGE_BOX_OPEN,LOG_ITEM_OPER_TYPE_FACTION_FULI, ITEM_BIND_GET)
	end
	--设置领取
	player:SetLingQuFactionFuLi(1)
end

--发红包
function FactionInfo:FactionFaHongBao(player,hongbao,hongbao_count)
	--判断元宝
	if player:GetMoney(MONEY_TYPE_GOLD_INGOT) < hongbao then
		player:CallOptResult(OPRATE_TYPE_FACTION, OPEATE_TYPE_FACTION_MONEY_ERR)
		return
	end
	--红包元宝数小于红包个数 （1个红包最低是1元宝）
	if hongbao < hongbao_count then
		return
	end
	
	--扣钱
	if not player:SubMoney(MONEY_TYPE_GOLD_INGOT, MONEY_CHANGE_FACTION_HONGBAO, hongbao) then
		player:CallOptResult(OPRATE_TYPE_FACTION, OPEATE_TYPE_FACTION_MONEY_ERR)
		return
	end
	
	self:AddFactionHongBao(hongbao,hongbao_count,player:GetGuid(), player:GetName())
	self:AddEvent(player:GetGuid(), player:GetName(), FACTION_EVENT_TYPE_HONGBAO,hongbao,hongbao_count)
end

--领取红包
function FactionInfo:FactionLqHongBao(player,guid)
	local index = self:FindFactionHongBaoPos(guid)
	if index == nil then
		return
	end
	local money = self:GetFactionHongBao(index)
	local count = self:GetFactionHongBaoCount(index)
	local get_money = 0
	if count == 1 then
		get_money = money
		self:DelFactionHongBao(index)
	else
		get_money = randIntD(1,money - count)
		self:SetFactionHongBaoCount(index,count-1)
		self:SetFactionHongBao(index,money-get_money)
	end
	--给元宝
	player:AddMoney(MONEY_TYPE_GOLD_INGOT, MONEY_CHANGE_FACTION_HONGBAO, get_money)
	
end

--上香
function FactionInfo:FactionShangXiang(player,pos,type)
	local config = tb_bangpai_jiu[type]
	if config == nil then return end
	--金钱不足
	if not player:SubItemByConfig(config.cost,MONEY_CHANGE_FACTION_SHANGXIANG,OPRATE_TYPE_FACTION,OPEATE_TYPE_FACTION_MONEY_ERR) then
		return
	end
	--加buff
	local lv = self:GetFactionGodLevel()
	player:CallScenedDoSomething(APPD_SCENED_FACTION_SHANGXIANG,type,tostring(lv))
	--获得基础绑元
	if config.yuanbao > 0 then
		local yuanbao = config.yuanbao * randIntD(2,4)
		player:AddMoney(MONEY_TYPE_BIND_GOLD, MONEY_CHANGE_FACTION_SHANGXIANG, yuanbao)
	end
	--增加帮贡
	local banggong = config.banggong * randIntD( math.floor((lv-1)/3+1) ,5)
	self:AddFactionMemberDayGongXian(pos,banggong)
	self:AddFactionMemberTotalGongXian(pos,banggong)
	--增加灵气
	self:AddFactionLingQi(config.add_lingqi)
	--增加事件
	self:AddEvent(player:GetGuid(), player:GetName(), FACTION_EVENT_TYPE_SHANGXIANG,type,banggong)
	--升级帮派神灵
	self:DoShenMingLevelUp(lv)
end

--升级帮派神灵
function FactionInfo:DoShenMingLevelUp(lv)
	local config = tb_bangpai_god[lv]
	if config == nil or lv >= #tb_bangpai_god then
		return
	end
	local lingqi = self:GetFactionLingQi()
	if lingqi >= config.num_lingqi then
		self:SetFactionGodLevel(lv + 1)
		self:SetFactionLingQi(0)
	end
end





---------------------------------------------------------帮派动态信息-------------------------------------------------------
--帮派动态信息个数加1
function FactionInfo:Next()
	local cur_num = self:GetAttackStrutCount()
	if(cur_num >= MAX_FACTION_EVENT_INFO_COUNT-1)then		--动态信息最多保留MAX_FACTION_EVENT_INFO_COUNT
		self:SetAttackStrutCount(0)	
	else
		self:AddUInt32(MAX_FACTION_EVENT_INFO_INT_NOW_INDEX, 1)
	end
end	

--帮派留言个数加1
function FactionInfo:NextNOtice()
	local cur_num = self:GetNoticeCount()
	if(cur_num >= MAX_FACTION_EVENT_NOTICE_COUNT-1)then		--动态信息最多保留MAX_FACTION_EVENT_INFO_COUNT
		self:SetNoticeCount(0)	
	else
		self:AddUInt32(MAX_FACTION_EVENT_INFO_INT_NOTICE_INDEX, 1)
	end
end	

--帮派动态信息int开始下标
function FactionInfo:Start()
	return FACTION_EVENT_INFO_INT_FIELD_START + self:GetAttackStrutCount() * MAX_FACTION_EVENT_INFO_INT
end

--帮派动态信息string开始下标
function FactionInfo:StringStart()
	return FACTION_EVENT_INFO_STR_FIELD_START + self:GetAttackStrutCount() * MAX_FACTION_EVENT_INFO_STRING 
end

--帮派留言int开始下标
function FactionInfo:StartNotice()
	return FACTION_EVENT_INFO_INT_NOTICE_START + self:GetNoticeCount() * MAX_FACTION_EVENT_INFO_INT
end

--帮派留言string开始下标
function FactionInfo:StringStartNotice()
	return FACTION_EVENT_INFO_STR_NOTICE_START + self:GetNoticeCount() * MAX_FACTION_EVENT_INFO_STRING 
end

--获得帮派动态信息当前索引
function FactionInfo:GetAttackStrutCount()
	return self:GetUInt32(MAX_FACTION_EVENT_INFO_INT_NOW_INDEX)
end

--设置帮派动态信息当前索引
function FactionInfo:SetAttackStrutCount (val)
	self:SetUInt32(MAX_FACTION_EVENT_INFO_INT_NOW_INDEX, val)
end

--获得帮派留言当前索引
function FactionInfo:GetNoticeCount()
	return self:GetUInt32(MAX_FACTION_EVENT_INFO_INT_NOTICE_INDEX)
end

--设置帮派留言当前索引
function FactionInfo:SetNoticeCount (val)
	self:SetUInt32(MAX_FACTION_EVENT_INFO_INT_NOTICE_INDEX, val)
end

--添加一个帮派动态信息
function FactionInfo:AddFactionInfo (corpid, playerid, playername, eventTm, eventType, reserve1, reserve2, reserve3, reserve_str)
	--str部分
	self:SetFactionGuid(eventType, corpid)
	self:SetPlayerGuid(eventType, playerid)
	self:SetPlayerName(eventType, playername)
	if(reserve_str == nil)then
		reserve_str = ''
	end
	self:SetStrReserve1(eventType, reserve_str)
	--int部分
	self:SetEventType(eventType)
	if(reserve1 == nil)then
		reserve1 = 0
	end
	self:SetIntReserve1(eventType, reserve1)
	if(reserve2 == nil)then
		reserve2 = 0
	end
	self:SetIntReserve2(eventType, reserve2)
	if(reserve3 == nil)then
		reserve3 = 0
	end
	self:SetIntReserve3(eventType, reserve3)	
	self:SetEventTm(eventType, eventTm)
	self:Next()		--下移索引
end

--设置时间戳
function FactionInfo:SetEventTm (eventtype, val)	
	self:SetUInt32(self:Start() + FACTION_EVENT_INFO_INT_TIME, val)
end

--设置event类型
function FactionInfo:SetEventType (eventtype)
	self:SetUInt32(self:Start() + FACTION_EVENT_INFO_INT_EVENT_TYPE, eventtype)
end

--设置保留1
function FactionInfo:SetIntReserve1 (eventtype, val)
	self:SetUInt32(self:Start() + FACTION_EVENT_INFO_INT_RESERVE1, val)
end

--设置保留2
function FactionInfo:SetIntReserve2 (eventtype, val)
	self:SetUInt32(self:Start() + FACTION_EVENT_INFO_INT_RESERVE2, val)
end

--设置保留3
function FactionInfo:SetIntReserve3 (eventtype, val)
	self:SetUInt32(self:Start() + FACTION_EVENT_INFO_INT_RESERVE3, val)
end

--设置帮派guid
function FactionInfo:SetFactionGuid (eventtype, val)
	self:SetStr(self:StringStart() + FACTION_EVENT_INFO_STRING_FACTION_GUID, val)
end

--设置player guid
function FactionInfo:SetPlayerGuid (eventtype, val)
	self:SetStr(self:StringStart() + FACTION_EVENT_INFO_STRING_PLAYER_GUID, val)
end

--设置玩家名字
function FactionInfo:SetPlayerName (eventtype, val)
	self:SetStr(self:StringStart() + FACTION_EVENT_INFO_STRING_PLAYER_NAME, val)
end

--设置str 保留1
function FactionInfo:SetStrReserve1 (eventtype, val)
	self:SetStr(self:StringStart() + FACTION_EVENT_INFO_STRING_RESERVE1, val)
end

--输出帮派动态信息
function FactionInfo:PrintFactionEvents (eventtype)
	for i = 0, MAX_FACTION_EVENT_INFO_COUNT-1 do
		if(self:GetStr(FACTION_EVENT_INFO_STR_FIELD_START + i * MAX_FACTION_EVENT_INFO_STRING + FACTION_EVENT_INFO_STRING_FACTION_GUID) ~= '')then
			outDebug('event time = '..self:GetUInt32(FACTION_EVENT_INFO_INT_FIELD_START + i * MAX_FACTION_EVENT_INFO_INT + FACTION_EVENT_INFO_INT_TIME))
			outDebug('event type = '..self:GetUInt32(FACTION_EVENT_INFO_INT_FIELD_START + i * MAX_FACTION_EVENT_INFO_INT + FACTION_EVENT_INFO_INT_EVENT_TYPE))
			outDebug('event corps guid = '..self:GetStr(FACTION_EVENT_INFO_STR_FIELD_START + i * MAX_FACTION_EVENT_INFO_STRING + FACTION_EVENT_INFO_STRING_FACTION_GUID))
			outDebug('event corps guid = '..self:GetStr(FACTION_EVENT_INFO_STR_FIELD_START + i * MAX_FACTION_EVENT_INFO_STRING + FACTION_EVENT_INFO_STRING_PLAYER_NAME))
			outDebug('event corps guid = '..self:GetStr(FACTION_EVENT_INFO_STR_FIELD_START + i * MAX_FACTION_EVENT_INFO_STRING + FACTION_EVENT_INFO_STRING_PLAYER_GUID))
		end
	end	
end


--帮派BOSS相关


--获取帮派令牌数
function FactionInfo:GetTokenNum()
	return self:GetUInt32(FACTION_INT_FIELD_TOKEN_NUM)
end

--设置帮派令牌数
function FactionInfo:SetTokenNum(val)
	self:SetUInt32(FACTION_INT_FIELD_TOKEN_NUM, val)
end

--获取帮派令牌积分进度
function FactionInfo:GetTokenPoints()
	return self:GetUInt32(FACTION_INT_FIELD_TOKEN_POINTS)
end

--设置帮派令牌积分进度
function FactionInfo:SetTokenPoints(val)
	self:SetUInt32(FACTION_INT_FIELD_TOKEN_POINTS, val)
end

--获取帮派令牌积分完成次数
function FactionInfo:GetTokenPointsCount()
	return self:GetUInt32(FACTION_INT_FIELD_TOKEN_POINTS_COUNT)
end

--设置帮派令牌积分完成次数
function FactionInfo:SetTokenPointsCount(val)
	self:SetUInt32(FACTION_INT_FIELD_TOKEN_POINTS_COUNT, val)
end


--获取帮派今日令牌购买次数
function FactionInfo:GetTokenBuyCount()
	return self:GetUInt32(FACTION_INT_FIELD_TOKEN_TODAY_BUY_COUNT)
end

--设置帮派今日令牌购买次数
function FactionInfo:SetTokenBuyCount(val)
	self:SetUInt32(FACTION_INT_FIELD_TOKEN_TODAY_BUY_COUNT, val)
end

--获取帮派已挑战最大boss id
function FactionInfo:GetChallengeBossIdMax()
	return self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_ID_MAX)
end

--设置帮派已挑战最大boss id
function FactionInfo:SetChallengeBossIdMax(val)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_ID_MAX, val)
end

--获取帮派当前挑战boss id
function FactionInfo:GetChallengeBossId()
	return self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_ID)
end

--设置帮派当前挑战boss id
function FactionInfo:SetChallengeBossId(val)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_ID, val)
end

--获取帮派当前挑战开始时间
function FactionInfo:GetChallengeBossStartTime()
	return self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_START_TIME)
end

--设置帮派当前挑战开始时间
function FactionInfo:SetChallengeBossStartTime(val)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_START_TIME, val)
end

--获取帮派当前boss血量万分比
function FactionInfo:GetChallengeBossHpRate()
	return self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_HP_RATE)
end

--设置帮派当前boss血量万分比
function FactionInfo:SetChallengeBossHpRate(val)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_HP_RATE, val)
end

--获取帮派当前boss pos
function FactionInfo:GetChallengeBossPos()
	return self:GetUInt16(FACTION_INT_FIELD_CHALLENGE_BOSS_POS,0),self:GetUInt16(FACTION_INT_FIELD_CHALLENGE_BOSS_POS,1)
end

--设置帮派当前boss pos
function FactionInfo:SetChallengeBossPos(x,y)
	self:SetUInt16(FACTION_INT_FIELD_CHALLENGE_BOSS_POS,0, x)
	self:SetUInt16(FACTION_INT_FIELD_CHALLENGE_BOSS_POS,1, y)

end

--获取帮派保护目标血量万分比
function FactionInfo:GetProtectTargetHpRate()
	return self:GetUInt32(FACTION_INT_FIELD_PROTECT_TARGET_HP_RATE)
end

--设置帮派保护目标血量万分比
function FactionInfo:SetProtectTargetHpRate(val)
	self:SetUInt32(FACTION_INT_FIELD_PROTECT_TARGET_HP_RATE, val)
end

--获取帮派当前boss pos
function FactionInfo:GetProtectTargetPos()
	return self:GetUInt16(FACTION_INT_FIELD_PROTECT_TARGET_POS,0),self:GetUInt16(FACTION_INT_FIELD_PROTECT_TARGET_POS,1)
end

--设置帮派当前boss pos
function FactionInfo:SetProtectTargetPos(x,y)
	self:SetUInt16(FACTION_INT_FIELD_PROTECT_TARGET_POS,0, x)
	self:SetUInt16(FACTION_INT_FIELD_PROTECT_TARGET_POS,1, y)

end

--获取当前boss输出榜 index位置 输出值和guid
function FactionInfo:GetChallengeBossDamageRankByIndex(index)
	local damage = self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_DAMAGE_RANK_START + index)
	local guid = self:GetStr(FACTION_STRING_FIELD_CHALLENGE_BOSS_DAMAGE_RANK_START + index)
	
	return damage,guid
end

--设置当前boss输出榜 index位置 输出值和guid
function FactionInfo:SetChallengeBossDamageRankByIndex(index,damage,guid)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_DAMAGE_RANK_START + index,damage)
	self:SetStr(FACTION_STRING_FIELD_CHALLENGE_BOSS_DAMAGE_RANK_START + index,guid)
	
end

--当前boss输出榜 增加guid 对应的输出值,guid不存在则添加记录
function FactionInfo:AddChallengeBossDamageRankDamage(damage,guid)
	local empty_pos = {}
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		local temp_damage,temp_guid = self:GetChallengeBossDamageRankByIndex(i)
		if guid == temp_guid then
			self:SetChallengeBossDamageRankByIndex(i,temp_damage + damage,guid)
			return
		end
		if temp_guid == '' then
			table.insert(empty_pos,i)
		end
	end
	if empty_pos[1] then
		self:SetChallengeBossDamageRankByIndex(empty_pos[1],damage,guid)
	end
end

--当前boss输出榜 根据guid 删除记录
function FactionInfo:RemoveChallengeBossDamageRankByGuid(guid)
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		local temp_damage,temp_guid = self:GetChallengeBossDamageRankByIndex(i)
		if guid == temp_guid then
			self:SetChallengeBossDamageRankByIndex(i,0,'')
			return
		end
	end
end

--清理当前输出榜
function FactionInfo:ClearChallengeBossDamageRank()
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		self:SetChallengeBossDamageRankByIndex(i,0,'')
	end
end


--当前boss输出榜 遍历返回递减的排行
function FactionInfo:GetChallengeBossDamageRankList()
	local list = {}
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		local temp_damage,temp_guid = self:GetChallengeBossDamageRankByIndex(i)
		if temp_guid ~= '' then
			table.insert(list,{guid = temp_guid,damage = temp_damage})
		end
	end
	table.sort(list,function (a,b)
		return a.damage > b.damage
	end)
	return list
end


--获取总输出榜 index位置 输出值和guid
function FactionInfo:GetChallengeBossTotalRankByIndex(index)
	local damage = self:GetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_TOTAL_RANK_START + index)
	local guid = self:GetStr(FACTION_STRING_FIELD_CHALLENGE_BOSS_TOTAL_RANK_START + index)
	
	return damage,guid
end

--设置总输出榜 index位置 输出值和guid
function FactionInfo:SetChallengeBossTotalRankByIndex(index,damage,guid)
	self:SetUInt32(FACTION_INT_FIELD_CHALLENGE_BOSS_TOTAL_RANK_START + index,damage)
	self:SetStr(FACTION_STRING_FIELD_CHALLENGE_BOSS_TOTAL_RANK_START + index,guid)
	
end

--总输出榜 增加guid 对应的输出值,guid不存在则添加记录
function FactionInfo:AddChallengeBossTotalRankDamage(damage,guid)
	local empty_pos = {}
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		local temp_damage,temp_guid = self:GetChallengeBossTotalRankByIndex(i)
		if guid == temp_guid then
			self:SetChallengeBossTotalRankByIndex(i,temp_damage + damage,guid)
			return
		end
		if guid == '' then
			table.insert(empty_pos,i)
		end
	end
	if empty_pos[1] then
		self:SetChallengeBossTotalRankByIndex(empty_pos[1],damage,guid)
	end
end

--总输出榜 根据guid 删除记录
function FactionInfo:RemoveChallengeBossTotalRankByGuid(guid)
	for i = 0 ,MAX_FACTION_MAMBER_COUNT -1  do
		local temp_damage,temp_guid = self:GetChallengeBossTotalRankByIndex(i)
		if guid == temp_guid then
			self:SetChallengeBossTotalRankByIndex(i,0,'')
			return
		end
	end
end


--客户端调用接口
--购买令牌
function FactionInfo:BuyToken(player,num)
	local level = self:GetFactionLevel()
	local count = self:GetTokenBuyCount()
	local token_num = self:GetTokenNum()
	
	outFmtDebug('-----------------before buy token nums = %d, count = %d', token_num,count)

	if count >= tb_faction_base[level].token_max_buy or count + num > tb_faction_base[level].token_max_buy or token_num + num > tb_faction_base[level].token_max_keep then
		return  --不能购买次数
	end
	local costTable = {}
	local temp = {}
	for i = count + 1,count + num do
		local price = tb_faction_base[level].token_buy_price[i]
		if price then
			if temp[price[1]] == nil then
				temp[price[1]] = price[2]
			else
				temp[price[1]] = temp[price[1]] + price[2]
			end
		end
		
	end
	for id,price in pairs(temp) do
		table.insert(costTable,{id,price})
	end
	
	if not player:costMoneys(MONEY_CHANGE_TYPE_MALL_BUY, costTable, 1) then
		player:CallOptResult(OPERTE_TYPE_NPCBUY, NPC_BUY_MONEY_NO_ENOUGH)
		return
	end

	self:SetTokenBuyCount(count + num)
	self:SetTokenNum(token_num + num)
	
	outFmtDebug('------------------after buy token nums = %d, count = %d', self:GetTokenNum(),self:GetTokenBuyCount())
end

--进行召唤boss		修改当前bossid  场景服每秒检测
function FactionInfo:ChallengeBoss(player,boss_id)
	if self:GetChallengeBossId() > 0 then
		--已经处于挑战中了 无效包
		return
	end
	local config = tb_faction_boss[boss_id]
	local token_num = self:GetTokenNum()
	local level = self:GetFactionLevel()
	local id_max = self:GetChallengeBossIdMax()
	local pos = self:FindPlayerIndex(player:GetGuid())
	local identity = 0 
	if pos then
		identity = self:GetFactionMemberIdentity(pos)
	end
	local flag = false
	for i,j in pairs(config.faction_zhiwei_limit) do
		if identity == j then
			flag = true
		end
	end
	if not flag then
		--权限不足
		return
	end
	
	if level < config.faction_lv_limit then
		--家族等级不足
		return
	end
	
	if token_num < config.token_cost then
		--令牌不足
		return
	end
	
	if boss_id > id_max + 1 then
		--前置boss未挑战成功
		return
	end
	
	self:SetTokenNum(token_num - config.token_cost)
	self:SetChallengeBossStartTime(os.time())
	self:SetChallengeBossId(boss_id)
	self:SetChallengeBossHpRate(10000)
	self:SetChallengeBossPos(config.born_pos[1],config.born_pos[2])
	--保护目标
	self:SetProtectTargetHpRate(10000)
	self:SetProtectTargetPos(config.target_pos[1],config.target_pos[2])
	
	self:ClearChallengeBossDamageRank()
	
	outFmtDebug('-----------ChallengeBoss:bossid = %d', boss_id)
	
	--广播
	app:SendFactionNotice(self:GetGuid(), OPERTE_TYPE_FACTION, OPERTE_TYPE_FACTION_BOSS_START, {tb_creature_template[config.entry].name})
	--app:SendFactionNotice(self:GetGuid(), 23, 3, {})
end


--					scened_internal_pack 添加 发包
--场景服调用接口 appdInsternalHanlders 添加 消息处理
--击杀野区 积分变化 (playerguid,point)
function FactionInfo:AddTokenPoints(player_guid,points)
	local currPoints = self:GetTokenPoints()
	local currPointsCount = self:GetTokenPointsCount()
	local tokenNum = self:GetTokenNum()
	local config = tb_faction_base[self:GetFactionLevel()]
	if currPoints + points < config.token_points then
		if currPointsCount >= config.token_daily then
			self:SetTokenPoints(0)
		elseif tokenNum >= config.token_max_keep then
			--令牌满了 不再加积分
		else
			self:SetTokenPoints(currPoints + points)
		end
		
	else
		local temp = currPoints + points
		local count = 0
		while( temp >= config.token_points) do
			if currPointsCount < config.token_daily and tokenNum < config.token_max_keep then
				count = count + 1
				temp = temp - config.token_points
			
			elseif currPointsCount + count >= config.token_daily then
				temp = 0
			elseif tokenNum + count >= config.token_max_keep then
				if count == 0 then
					temp = currPoints
				else
					temp = config.token_points - 1
				end
			end
		end

		self:SetTokenPoints(temp)
		self:SetTokenPointsCount(currPointsCount + count)
		self:SetTokenNum(tokenNum + count)
		
	end
	
end

--对boss造成伤害 (playerguid,damage)
function FactionInfo:BossDamaged(player_guid,damage)
	self:AddChallengeBossDamageRankDamage(damage,player_guid)
end
--同步boss hp pos (hp,x,y)
function FactionInfo:UpdateBossInfo(hp_rate,x,y)
	--outFmtDebug('=========================UpdateBossInfo')
	local boss_id = self:GetChallengeBossId()
	if boss_id <= 0 then
		return
	end
	self:SetChallengeBossHpRate(hp_rate)
	self:SetChallengeBossPos(x,y)
end
--同步target hp pos (hp,x,y)
function FactionInfo:UpdateTargetInfo(hp_rate,x,y)
	local boss_id = self:GetChallengeBossId()
	if boss_id <= 0 then
		return
	end
	self:SetProtectTargetHpRate(hp_rate)
	self:SetProtectTargetPos(x,y)
end
--挑战成功 ()
function FactionInfo:ChallengeBossWin()
	local boss_id = self:GetChallengeBossId()
	if boss_id <= 0 then
		return
	end
	local config = tb_faction_boss[boss_id]
	self:AddFactionMoney(config.win_money)
	
	--成员奖励
	local damage_rank = self:GetChallengeBossDamageRankList()
	for index,info in ipairs(damage_rank) do
		local player_guid = info.guid
		local damage = info.damage
		self:AddChallengeBossTotalRankDamage(damage,player_guid)
		local reward = nil
		local mail_name = ''
		local mail_desc = ''
		if tb_faction_boss_reward_list[boss_id] and tb_faction_boss_reward_list[boss_id][index] then
			reward = tb_faction_boss_reward_list[boss_id][index].reward
			mail_name = tb_faction_boss_reward_list[boss_id][index].mail_name
			mail_desc = tb_faction_boss_reward_list[boss_id][index].mail_desc
		else
			reward = nil
		end
		
		local player = app.objMgr:getObj(player_guid)
		
		if reward then
			--player:AppdAddItems(reward,MONEY_CHANGE_FACTION_BOSS,LOG_ITEM_OPER_TYPE_FACTION_BOSS)
			
			local rewardStr = ""
			for s,d in ipairs(reward) do
				if s > 1 then
					rewardStr = rewardStr .. ","
				end
				rewardStr = rewardStr..d[1]..","..d[2]
			end
			
			AddGiftPacksData(player_guid,0,GIFT_PACKS_TYPE_FACTION_BOSS,os.time(),os.time() + 86400*30, mail_name, mail_desc, rewardStr, SYSTEM_NAME)
		end
		
		if player then
			--smsg  胜利消息
			player:call_faction_boss_send_result(1,boss_id,config.win_money)
		end
		
	end
	
	
	local boss_id_max = self:GetChallengeBossIdMax()
	if boss_id > boss_id_max then
		self:SetChallengeBossIdMax(boss_id)
	end
	
	
	
	self:SetChallengeBossId(0)
	
end
--挑战失败 (type:1目标失守 / 2超时)
function FactionInfo:ChallengedBossFail(fail_type)
	--outFmtDebug('=========================ChallengedBossFail %d',fail_type)
	local boss_id = self:GetChallengeBossId()
	if boss_id <= 0 then
		return
	end
	local config = tb_faction_boss[boss_id]
	local lose_money = config.lose_money
	if self:GetFactionMoney() < lose_money then
		lose_money = self:GetFactionMoney()
		self:SetFactionMoney(0)
	else
		self:SetFactionMoney(self:GetFactionMoney() - config.lose_money )
	end
	
	--成员奖励
	local damage_rank = self:GetChallengeBossDamageRankList()
	for index,info in ipairs(damage_rank) do
		local player_guid = info.guid
		local damage = info.damage
		self:AddChallengeBossTotalRankDamage(damage,player_guid)
		local reward = nil
		local mail_name = ''
		local mail_desc = ''
		if tb_faction_boss_reward_list[boss_id] and tb_faction_boss_reward_list[boss_id][index] then
			reward = tb_faction_boss_reward_list[boss_id][index].fail_reward
			mail_name = tb_faction_boss_reward_list[boss_id][index].fail_mail_name
			mail_desc = tb_faction_boss_reward_list[boss_id][index].fail_mail_desc
		else
			reward = nil
		end
		local player = app.objMgr:getObj(player_guid)
		
		if reward then
			--player:AppdAddItems(reward,MONEY_CHANGE_FACTION_BOSS,LOG_ITEM_OPER_TYPE_FACTION_BOSS)
			
			local rewardStr = ""
			for s,d in ipairs(reward) do
				if s > 1 then
					rewardStr = rewardStr .. ","
				end
				rewardStr = rewardStr..d[1]..","..d[2]
			end
			
			AddGiftPacksData(player_guid,0,GIFT_PACKS_TYPE_FACTION_BOSS,os.time(),os.time() + 86400*30, mail_name, mail_desc, rewardStr, SYSTEM_NAME)
		end
		if player then
			--smsg  失败消息 type_fail, boss_id, money
			player:call_faction_boss_send_result(2,boss_id,lose_money)
		end
		
	end
	
	self:SetChallengeBossId(0)
	
end




function encodeSimpleInfo(faction_guid)
	
end

function decodeSimpleInfo(simpleString)
	
end

function encodeFightInfo(faction_guid)
	
end

function decodeFightInfo(fightString)
	
end


return FactionInfo