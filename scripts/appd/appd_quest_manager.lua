--���ܹ�����

local AppQuestMgr = class("AppQuestMgr", BinLogObject)

function AppQuestMgr:ctor()
	
end
---�ɾ�--------------------------------------------------
--��ȡ�ɾͽ���
function AppQuestMgr:getAchieve(id)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_CURRENT
	return self:GetUInt32(idx)
end
--���óɾͽ���
function AppQuestMgr:setAchieve(id,num)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_CURRENT
	self:SetUInt32(idx,num)
end
--�Ƿ���ȡ�ɾͽ���
function AppQuestMgr:getAchieveReward(id)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_REWARD
	return self:GetByte(idx,0)
end
--��ȡ�ɾͽ���
function AppQuestMgr:setAchieveReward(id)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_REWARD
	self:SetByte(idx,0,1)
end
--�Ƿ��ɳɾ�
function AppQuestMgr:getHasAchieve(id)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_REWARD
	return self:GetByte(idx,1)
end
--��ɳɾ�
function AppQuestMgr:setHasAchieve(id)
	local idx = QUEST_FIELD_ACHIEVE_START + (id - 1) * MAX_ACHIEVE_FIELD + ACHIEVE_FIELD_REWARD
	self:SetByte(idx,1,1)
end

--�����ܳɾ͵���
function AppQuestMgr:addAchieveAll(num)
	self:AddUInt32(QUEST_FIELD_ACHIEVE_ALL,num)
end
--��ȡ�ܳɾ͵���
function AppQuestMgr:getAchieveAll()
	return self:GetUInt32(QUEST_FIELD_ACHIEVE_ALL)
end

--�ܳɾͽ���ID
function AppQuestMgr:getAchieveAllReward()
	return self:GetUInt32(QUEST_FIELD_ACHIEVE_REWARD)
end
--�����ܳɾͽ���ID
function AppQuestMgr:addAchieveAllReward()
	self:AddUInt32(QUEST_FIELD_ACHIEVE_REWARD,1)
end

---�ƺ�--------------------------------------------------
--���ӳƺ�ID
function AppQuestMgr:addTitle(id)
	local config = tb_title_base[id]
	if not config then 
		return false
	end
	
	local hast,tid = self:hasTitle(id)
	if hast then
		if config.limtime > 0 then
			self:SetUInt32(tid + TITLE_FIELD_TIME,os.time() + config.limtime * 60)
		else
			self:SetUInt32(tid + TITLE_FIELD_TIME,0)
		end
		return true
	end
	
	for i=QUEST_FIELD_TITLE_START,QUEST_FIELD_TITLE_END-1,MAX_TITLE_FIELD do
		if self:GetUInt16(i,0) == 0 then
			self:SetUInt16(i,0,id)
			self:SetUInt16(i,1,0)
			if config.limtime > 0 then
				self:SetUInt32(i + TITLE_FIELD_TIME,os.time() + config.limtime * 60)
			else
				self:SetUInt32(i + TITLE_FIELD_TIME,0)
			end
			return true
		end
	end
	
	return false
end

--�Ƿ�ӵ��ĳ���ƺ�
function AppQuestMgr:hasTitle(id)
	for i=QUEST_FIELD_TITLE_START,QUEST_FIELD_TITLE_END-1,MAX_TITLE_FIELD do
		if self:GetUInt16(i,0) == id then
			return true,i
		end
	end
	return false,0
end

--��ʼ���ƺ�
function AppQuestMgr:initTitle(idx)
	if self:GetUInt16(idx,1) == 0 then
		self:SetUInt16(idx,1,1)
	end
end

--�ƺ�װ������
function AppQuestMgr:calculTitleAttr(attrs)
	
	local owner = self:getOwner()
	local equtitle = owner:GetTitle()
	if equtitle == 0 then
		return
	end
	
	local config = tb_title_base[equtitle].prop
	
	for i=1,#config do
		attrs[config[i][1]] = attrs[config[i][1]] + config[i][2]
	end

end
--���ʧЧ�ƺ�
function AppQuestMgr:removeExpireTitle()
	local owner = self:getOwner()
	local cur = owner:GetTitle()
	for i=QUEST_FIELD_TITLE_START,QUEST_FIELD_TITLE_END-1,MAX_TITLE_FIELD do
		local id = self:GetUInt16(i,0)
		if id ~= 0 then
			local time  = self:GetUInt32(i + TITLE_FIELD_TIME)
			if time > 0 and time < os.time() then
				self:SetUInt16(i,0,0) 
				self:SetUInt32(i + TITLE_FIELD_TIME,0)
				
				if cur == id then
					owner:SetTitle(0)
				end
			end
		end
	end
end
-------------------------------����-------------------------------
--�Ƿ���ȡ�׳影��
function AppQuestMgr:getWelfareShouchong()
	return self:GetUInt32(QUEST_FIELD_WELFARE_SHOUCHONG)
end
--��ȡ�׳影�����
function AppQuestMgr:setWelfareShouchong()
	self:SetUInt32(QUEST_FIELD_WELFARE_SHOUCHONG,1)
end

--ÿ��ǩ�������Ƿ�����ȡ
function AppQuestMgr:getWelfareCheckIn(day)
	return self:GetBit(QUEST_FIELD_WELFARE_CHECKIN,day-1)
end
--��ȡÿ��ǩ������
function AppQuestMgr:setWelfareCheckIn(day)
	return self:SetBit(QUEST_FIELD_WELFARE_CHECKIN,day-1)
end
--�����ۻ�ǩ������
function AppQuestMgr:getWelfareCheckInDayNum()
	local num = 0
	for i = 0,31 do
		if self:GetBit(QUEST_FIELD_WELFARE_CHECKIN,i) then
			num = num + 1
		end
	end
	return num
end

--�ۻ�ÿ��ǩ�������Ƿ�����ȡ
function AppQuestMgr:getWelfareCheckInAll(id)
	return self:GetBit(QUEST_FIELD_WELFARE_CHECKIN_ALL,id)
end

--��ȡ�ۻ�ÿ��ǩ������
function AppQuestMgr:setWelfareCheckInAll(id)
	return self:SetBit(QUEST_FIELD_WELFARE_CHECKIN_ALL,id)
end

--�ȼ��Ƿ�����ȡ
function AppQuestMgr:getWelfareLev(id)
	return self:GetBit(QUEST_FIELD_WELFARE_LEVEL,id-1)
end
--��ȡ�ȼ�����
function AppQuestMgr:setWelfareLev(id)
	return self:SetBit(QUEST_FIELD_WELFARE_LEVEL,id-1)
end

--type�������п����һصĴ���
function AppQuestMgr:setWelfareBackAllNum(type,allnum)
	local idx = QUEST_FIELD_WELFARE_BACK_START + (type-1) * MAX_WELFA_BACK_ITEM + WELFA_BACK_ITEM_NUM
	self:SetUInt32(idx,allnum)
end
function AppQuestMgr:getWelfareBackAllNum(type)
	local idx = QUEST_FIELD_WELFARE_BACK_START + (type-1) * MAX_WELFA_BACK_ITEM + WELFA_BACK_ITEM_NUM
	return self:GetUInt32(idx)
end
--type������ָ��ʱ�����ʹ�ô���
function AppQuestMgr:getWelfareBackNum(type,time)
	local startIdx = QUEST_FIELD_WELFARE_BACK_START + (type-1) * MAX_WELFA_BACK_ITEM
	
	for i=WELFA_BACK_ITEM,WELFA_BACK_ITEM_END,2 do
		local idx = startIdx + i
		local dtime = self:GetUInt32(idx)
		if time == dtime then
			return self:GetUInt32(idx+1)
		end
	end
	
	return 0
end

--����type������ָ��ʱ�����ʹ�ô���
function AppQuestMgr:addWelfareBackNum(type,time,num)
	
	local targetIdx,outTimeIdx = self:getWelfareTimeIdx(type,time)

	if targetIdx ~= 0 then
		local curnum = self:GetUInt32(targetIdx+1)
		curnum = curnum + num
		self:SetUInt32(targetIdx+1,curnum)
	elseif outTimeIdx ~=0 then
		self:SetUInt32(outTimeIdx,time)
		self:SetUInt32(outTimeIdx+1,num)
	end
	
end

function AppQuestMgr:setWelfareBackNum(type,time,num)
	
	local targetIdx,outTimeIdx = self:getWelfareTimeIdx(type,time)

	if targetIdx ~= 0 then
		self:SetUInt32(targetIdx+1,num)
	elseif outTimeIdx ~=0 then
		self:SetUInt32(outTimeIdx,time)
		self:SetUInt32(outTimeIdx+1,num)
	end
	
end


function AppQuestMgr:getWelfareTimeIdx(type,time)
	local startIdx = QUEST_FIELD_WELFARE_BACK_START + (type-1) * MAX_WELFA_BACK_ITEM
	local targetIdx = 0
	local outTimeIdx = 0
	local curTime = GetTodayStartTimestamp(0)
	for i=WELFA_BACK_ITEM,WELFA_BACK_ITEM_END-1,2 do
		--outFmtDebug("welf %d",i)
		local idx = startIdx + i
		local dtime = self:GetUInt32(idx)
		if time == dtime then
			targetIdx = idx
			break
		elseif dtime == 0 then
			outTimeIdx = idx
		elseif self:testOutTime(curTime,dtime) then
			outTimeIdx = idx
		end
	end
	return targetIdx,outTimeIdx
end

function AppQuestMgr:testOutTime(curTime,targetTime)
	local num = curTime - targetTime
	--outFmtDebug("chazhi %d",num)
	if num >= 345600 then
		return true
	end
	return false
end


-------------------------------����������-------------------------------
--[[
// ������ȡ�������
#define MAX_QUEST_COUNT 10
// �������Ŀ��
#define MAX_QUEST_TARGET_COUNT 5
QUEST_TARGET_INFO_SHORT0	= 0,	//0:״̬, 1:Ŀ��ֵ
QUEST_TARGET_INFO_PROCESS	= 1,	//����
MAX_QUEST_TARGET_INFO_COUNT		

QUEST_INFO_ID				= 0,					//����id
QUEST_INFO_STEP_START		= QUEST_INFO_ID + 1,	//����ֲ��迪ʼ
QUEST_INFO_STEP_END			= QUEST_INFO_STEP_START + MAX_QUEST_STEP_COUNT,	//����ֲ������
MAX_QUEST_INFO_COUNT		= QUEST_INFO_STEP_END,

QUEST_FIELD_QUEST_START			//����ʼ
QUEST_FIELD_QUEST_END			//�������
--]]

-- ÿ���һ��ÿ�������ж��Ƿ���Ҫ�콱
function AppQuestMgr:OnGetDailyQuestRewards()
	local playerInfo = self:getOwner()
	local finished = playerInfo:GetDailyQuestFinished()
	local config = tb_quest_daily[finished]
	if config then
		local rewards = config.rewards
		-- �жϱ��������Ƿ��㹻
		local itemMgr = playerInfo:getItemMgr()
		local emptys  = itemMgr:getEmptyCount(BAG_TYPE_MAIN_BAG)
		if emptys < #rewards then
			playerInfo:CallOptResult(OPRATE_TYPE_BAG, BAG_RESULT_BAG_FULL)
			return
		end
		playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST, 1, 0, ITEM_SHOW_TYPE_MINI_QUEST_BAR)
	end
end

-- �������ÿ������
function AppQuestMgr:RandomGenerateDailyQuest()
	local playerInfo = self:getOwner()
	-- ����Ѿ������˾Ͳ�����
	local finished = playerInfo:GetDailyQuestFinished()
	if finished >= tb_quest_daily_base[ 1 ].dailyLimit then
		return
	end
	
	-- ����һ������
	local level = playerInfo:GetLevel()
	local questList = tb_quest_daily_list[level]
	if questList then
		local indx = randInt(1, #questList)
		local questId = questList[indx]
		self:OnAddQuest(questId)
	else
		outFmtError("designer not set daily quest in tb_char_level or programer not init")
	end
end

function AppQuestMgr:OnDailyQuestReset()
	local playerInfo = self:getOwner()
	playerInfo:ClearDailyQuestFinished()
	
	-- ɾ��ԭ��������
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

		if questId > 0 and (tb_quest[questId].type == QUEST_TYPE_DAILY or tb_quest[questId].type == QUEST_TYPE_DAILY2) then
			self:OnRemoveQuest(start)
		end
	end
	-- ��ÿ������ĵ�һ������
	self:OnAddQuest(tb_quest_daily_base[ 1 ].npcQuest)
	
	-- �ճ�����
	self:OnAddQuest(tb_quest_daily2_base[ 1 ].npcQuest)
	
end

-- ��������ճ�����
function AppQuestMgr:RandomGenerateDaily2Quest()
	local indx = self:GetDaily2QuestIndx()
	if indx > 0 then
		local config = tb_quest_daily2[indx]
		for i, questSetId in ipairs(config.questSet) do
			local num = config.questSelectNum[ i ]
			if num then
				local questSet = tb_quest_daily2_set[questSetId].questSet
				local rdDict = GetRandomIndexTable(#questSet, num)
				
				for _, indx in ipairs(rdDict) do
					local questId = questSet[indx]
					self:OnAddQuest(questId)
				end
			end
		end
	end
end

-- ��������ճ�����
function AppQuestMgr:GetDaily2QuestIndx()
	local playerInfo = self:getOwner()
	local level = playerInfo:GetLevel()
	
	for indx, info in ipairs(tb_quest_daily2) do
		local levelrange = info.levelrange
		if levelrange[ 1 ] <= level and level <= levelrange[ 2 ] then
			return indx
		end
	end
	
	return 0
end

-- ������һ������������
function AppQuestMgr:ActiveFlowingQuests(questId)
	local config = tb_quest[questId]
	local playerInfo = self:getOwner()
	
	-- ÿ������
	if config.type == QUEST_TYPE_DAILY then
		if config.start == 0 then
			-- �����+1
			playerInfo:AddDailyQuestFinished()
		end
		self:OnGetDailyQuestRewards()
		self:RandomGenerateDailyQuest()
		return
	end
	
	-- �ճ�����
	if config.type == QUEST_TYPE_DAILY2 then
		if config.start == 1 then
			self:RandomGenerateDaily2Quest()
		end
		return
	end
	
	-- �Ƿ�����һ������
	if config.nextid > 0 then
		if tb_quest[config.nextid] then
			self:OnAddQuest(config.nextid)
		end
	end
	
	-- ֧������
	if #config.acitveIds then
		for _, id in pairs(config.acitveIds) do
			if tb_quest[id] then
				self:OnAddQuest(id)
			end
		end
	end
end

-- ��ȡ�½ڽ���
function AppQuestMgr:OnPickQuestChapterReward(indx)
	local rewards = tb_quest_chapter[indx].items
	local playerInfo = self:getOwner()
	playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST)
	--playerInfo:SetQuestChapterPicked(indx)
end

-- ��ȡ����
function AppQuestMgr:OnPickQuest(indx)
	local start = QUEST_FIELD_QUEST_START + indx * MAX_QUEST_INFO_COUNT
	
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
	local state   = self:GetUInt16(start + QUEST_INFO_ID, 1)
	if questId > 0 and state == QUEST_STATUS_COMPLETE then
		self:OnInnerPickQuest(start)
	end
end

-- �ύ�ճ�����
function AppQuestMgr:OnSubmitQuestDaily2()
	local playerInfo = self:getOwner()
	local finished = 0

	local indice = self:GetQuestDaily2Indice()
	-- ��ʼ�������ύ
	if #indice == 1 then
		return
	end
	
	local all = #indice
	local belongLvRangeId = 0
	for _, start in ipairs(indice) do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
		local state = self:GetUInt16(start + QUEST_INFO_ID, 1)
		
		if state == QUEST_STATUS_COMPLETE then
			self:OnInnerPickQuest(start)
		end
		state = self:GetUInt16(start + QUEST_INFO_ID, 1)
		if state == QUEST_STATUS_END then
			finished = finished + 1
		end
		
		-- ������ʾģʽ
		self:SetUInt16(start + QUEST_INFO_ID, 1, state + 10)
		-- �����ȼ���
		belongLvRangeId = tb_quest[questId].belongLvRangeId
	end

	if tb_quest_daily2[belongLvRangeId] then
		-- ����ɽ���
		local config = tb_quest_daily2[belongLvRangeId]
		if config.rewardsSelect[finished] then
			local rewards = tb_quest_daily2_finish_reward[config.rewardsSelect[finished]].rewards
			playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST, 1, 0, ITEM_SHOW_TYPE_MINI_QUEST_DAILY2)
		end
		
		-- ��ȫ����ɽ���
		if finished >= all then
			local rewards = config.allFinishrewards
			playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST, 1, 0, ITEM_SHOW_TYPE_MINI_QUEST_DAILY2)
		end
	end
end

function AppQuestMgr:GetQuestDaily2Indice()
	local indice = {}
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

		if questId > 0 and tb_quest[questId].type == QUEST_TYPE_DAILY2 then
			table.insert(indice, start)
		end
	end
	
	return indice
end

-- ��ȡĳ���ճ�����Ľ���
function AppQuestMgr:OnPickingDaily2Quest(questId)
	local playerInfo = self:getOwner()
	local questSetId = tb_quest[questId].belongSet
	
	if tb_quest_daily2_set[questSetId] then
		local rewards = tb_quest_daily2_set[questSetId].rewards
		playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST, 1, 0, ITEM_SHOW_TYPE_MINI_QUEST_DAILY2)
	end
end

-- �ڲ���ȡ����
function AppQuestMgr:OnInnerPickQuest(start)
	local playerInfo = self:getOwner()
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

	-- ��һ������ȡ״̬
	self:OnQuestPicked(start)
	
	-- �ճ�������ɾ��
	if tb_quest[questId].type == QUEST_TYPE_DAILY2 and tb_quest[questId].start == 0 then
		self:OnPickingDaily2Quest(questId)
	else
		self:OnRemoveQuest(start)
	end
	-- ��ȡ����
	if #tb_quest[questId].rewards > 0 then
		local gender = playerInfo:GetGender()
		if #tb_quest[questId].rewards == 1 then
			gender = 1
		end
		local rewards = tb_quest[questId].rewards[gender]
		-- �жϱ��������Ƿ��㹻
		local itemMgr = playerInfo:getItemMgr()
		local emptys  = itemMgr:getEmptyCount(BAG_TYPE_MAIN_BAG)
		if emptys < #rewards then
			playerInfo:CallOptResult(OPRATE_TYPE_BAG, BAG_RESULT_BAG_FULL)
			return
		end
		playerInfo:AppdAddItems(rewards, MONEY_CHANGE_QUEST, LOG_ITEM_OPER_TYPE_QUEST, 1, 0, ITEM_SHOW_TYPE_MINI_QUEST_BAR)
	end
	
	-- ������������� ��ǰ��������id + 1000000 ��ʾ���
	if tb_quest[questId].type == QUEST_TYPE_MAIN then
		playerInfo:SetMainQuestID(1000000 + questId)
	end
	
	-- ������½����һ������ �Զ���ȡ�½ڽ���
	if tb_quest[questId].chapterLast == 1 then
		local chapterIndex = tb_quest[questId].chapter
		self:OnPickQuestChapterReward(chapterIndex)
	end
	self:ActiveFlowingQuests(questId)
end

-- �����Ҫ��ʼ�����ȵ�
function AppQuestMgr:ProcessInit(start)
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
	local config = tb_quest[questId]
	local targets = config.targets
	local size = math.min(#targets, MAX_QUEST_TARGET_COUNT)
	local playerInfo = self:getOwner()
	
	for i = 1, size do
		local targetInfo = targets[ i ]
		local targetType = targetInfo[ 1 ]
		
		if QUEST_UPDATE_CALLBACK[targetType] then
			local dest = QUEST_UPDATE_CALLBACK[targetType]:GetTargetValue(targetInfo)
			local qtIndx = GetOneQuestTargetStartIndx(start, i-1)
			self:SetUInt16(qtIndx + QUEST_TARGET_INFO_SHORT0, 1, dest)
			
			QUEST_UPDATE_CALLBACK[targetType]:OnInit (playerInfo, start, i-1)
		end
	end
end

-- �������ж����������Ƿ����
function AppQuestMgr:OnCheckMainQuestActive(currLevel)
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
		local state   = self:GetUInt16(start + QUEST_INFO_ID, 1)
		if questId > 0 and state == QUEST_STATUS_UNAVAILABLE then
			if tb_quest[questId].level <= currLevel then
				local state = QUEST_STATUS_INCOMPLETE
				self:SetUInt16(start + QUEST_INFO_ID, 1, state)
				self:ProcessInit(start)
				self:CheckQuestFinish(start)
			end
			return
		end
	end
end

-- ���ӷ���������
function AppQuestMgr:OnAddQuest(addQuestId)
	local playerInfo = self:getOwner()
	
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

		if questId == 0 then
			local state = QUEST_STATUS_INCOMPLETE
			if tb_quest[addQuestId].level > playerInfo:GetLevel() then
				state = QUEST_STATUS_UNAVAILABLE
			end
			self:SetUInt16(start + QUEST_INFO_ID, 0, addQuestId)
			self:SetUInt16(start + QUEST_INFO_ID, 1, state)
			if state == QUEST_STATUS_INCOMPLETE then
				self:ProcessInit(start)
				self:CheckQuestFinish(start)
			end
			if tb_quest[addQuestId].type == QUEST_TYPE_MAIN then
				playerInfo:SetMainQuestID(addQuestId)
			end
			return
		end
	end
	
	outFmtDebug("quest max count excceed for add quest %d", addQuestId)
end

-- ͨ��λ���Ƴ�����
function AppQuestMgr:OnQuestPicked(start)
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
	self:SetUInt16(start + QUEST_INFO_ID, 1, QUEST_STATUS_END)
end

-- ͨ��λ���Ƴ�����
function AppQuestMgr:OnRemoveQuest(start)
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

	for i = 0, MAX_QUEST_INFO_COUNT-1 do
		self:SetUInt32(start + i, 0)
	end
end

-- ͨ������id�Ƴ�����
function AppQuestMgr:OnRemoveQuestByQuestID(removeQuestId)
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

		if questId == removeQuestId then
			for i = 0, MAX_QUEST_INFO_COUNT-1 do
				self:SetUInt32(start + i, 0)
			end
			return
		end
	end
end

-- ѡ����������
function AppQuestMgr:OnSelectMainQuest(id)
	-- ���Ĳ����������� ���û�
	if tb_quest[id].type ~= QUEST_TYPE_MAIN then
		return
	end
	
	-- ɾ��ԭ������������
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)

		if questId > 0 then
			if tb_quest[questId].type == QUEST_TYPE_MAIN then
				self:OnRemoveQuest(start)
				break
			end
		end
	end
	
	-- �����µ���������
	self:OnAddQuest(id)
end

-- ���������Ƿ���Ҫ����
function AppQuestMgr:OnUpdate(questTargetType, params)
	for start = QUEST_FIELD_QUEST_START, QUEST_FIELD_QUEST_END - 1, MAX_QUEST_INFO_COUNT do
		local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
		local state   = self:GetUInt16(start + QUEST_INFO_ID, 1)

		local config = tb_quest[questId]
		if config and QUEST_STATUS_INCOMPLETE == state then
			local updated = self:CheckQuestUpdate(questTargetType, start, params)
			-- ���������Ƿ����
			if updated then
				self:CheckQuestFinish(start)
			end
		end
	end
end

-- ����Ƿ��������
function AppQuestMgr:CheckQuestUpdate(questTargetType, start, params)
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
	local config = tb_quest[questId]
	local targets = config.targets
	local size = math.min(#targets, MAX_QUEST_TARGET_COUNT)
	local playerInfo = self:getOwner()
	
	local updated = false
	for i = 1, size do
		local target = targets[ i ]
		local targetType = target[ 1 ]
		local qtIndx = GetOneQuestTargetStartIndx(start, i-1)
		-- δ��ɵĲ���Ҫ����
		if targetType == questTargetType and self:GetUInt16(qtIndx + QUEST_TARGET_INFO_SHORT0, 0) == 0 then
			if QUEST_UPDATE_CALLBACK[targetType] then
				if QUEST_UPDATE_CALLBACK[targetType]:OnUpdate(playerInfo, start, i-1, params) then
					updated = true
				end
			end
		end
	end
	
	return updated
end

-- ��������Ƿ����
function AppQuestMgr:CheckQuestFinish(start)
	local questId = self:GetUInt16(start + QUEST_INFO_ID, 0)
	local config = tb_quest[questId]
	local targets = config.targets
	local size = math.min(#targets, MAX_QUEST_TARGET_COUNT)
	
	for i = 1, size do
		local qtIndx = GetOneQuestTargetStartIndx(start, i-1)
		if self:GetUInt16(qtIndx + QUEST_TARGET_INFO_SHORT0, 0) == 0 then
			return
		end
	end
	
	-- �����Զ������ĶԻ�����Ҫ����
	if targets[ 1 ][ 1 ] ~= QUEST_TARGET_TYPE_TALK and config.popup ~= 0 then
		self:SetUInt16(start + QUEST_INFO_ID, 1, QUEST_STATUS_COMPLETE)
		return
	end
	
	-- �ǶԻ���ֱ��������һ��
	self:OnInnerPickQuest(start)
end

-------------------------------����������-------------------------------
-- ������guid
function AppQuestMgr:getPlayerGuid()
	--��Ʒ������guidת���guid
	if not self.owner_guid then
		self.owner_guid = guidMgr.replace(self:GetGuid(), guidMgr.ObjectTypePlayer)
	end
	return self.owner_guid
end

--��ü��ܹ�������ӵ����
function AppQuestMgr:getOwner()
	local playerguid = self:getPlayerGuid()
	return app.objMgr:getObj(playerguid)
end


return AppQuestMgr