InstanceMainBase = class("InstanceMainBase", Instance_base)

function InstanceMainBase:ctor(  )
	
end

--初始化脚本函数
function InstanceMainBase:OnInitScript(  )
	Instance_base.OnInitScript(self) --调用基类
end

--当玩家加入后触发
function InstanceMainBase:OnAfterJoinPlayer(player)
	Instance_base.OnAfterJoinPlayer(player)
	
	local playerInfo = UnitInfo:new{ptr = player}
	-- 进城修改模式
	playerInfo:ChangeToPeaceModeAfterTeleport()
end