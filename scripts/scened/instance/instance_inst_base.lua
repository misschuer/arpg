InstanceInstBase = class("InstanceInstBase", Instance_base)

function InstanceInstBase:ctor(  )
	
end

--��ʼ���ű�����
function InstanceInstBase:OnInitScript(  )
	Instance_base.OnInitScript(self) --���û���
end

--����Ҽ���󴥷�
function InstanceInstBase:OnAfterJoinPlayer(player)
	Instance_base.OnAfterJoinPlayer(player)
	
	local playerInfo = UnitInfo:new{ptr = player}
	-- �����޸�ģʽ
	playerInfo:ChangeToPeaceModeAfterTeleport()
end