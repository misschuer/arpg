--先载入一些常量
require("const")

outString('load share.global_manager')
require('share.global_manager')

outString('load template')
require("template/scened_init")
require("template/conditions")

outString('load share.tick_name script')
require("share/tick_name")
require 'scened.scened_internal_pack'
-------------------------------------------------------------------
--初始化一些东西，例如BUFF对游戏操作的限制 用数字的说明是一些特殊的东西
config = {
	--以下来自原来的配置文件
	max_player_level = 200					,--最大等级
	nomal_attack_time =  1300				,--默认攻击时间
	nomal_move_speed = 180					,--默认移动速度
	nomal_attack_distance	= 4				,--默认攻击距离
	update_ownership_time = 1500			,--更新怪物所有者的间隔
	left_fighting_time = 6000				,--脱离战斗时间
	left_cast_time = 3000					,--脱离施法战斗（即备战）时间
	heathy_auto_recovery_cycle = 3000		,--自动回血蓝时间
	heathy_auto_recovery_percent = 1		,--自动回血蓝比例
	energy_auto_recovery_cycle = 1000		,--自动回体时间
	energy_auto_recovery_values = 5			,--自动回体力值
	endurance_auto_recovery_cycle = 60000	,--回精力时间
	endurance_auto_recovery_values = 1 		,--回精力值
	error_distance = 7						,--服务端允许客户端距离误差
	jump_cd = 3000							,--跳cd
	jump_max_distance = 16					,--最大跳跃距离
	jump_need_energy = 20					,--跳跃消耗体力
	notice_distance = 6						,--地图触发点通知距离
	zodiac = 12								,--生肖数量
	full_awaken = 1200						,--最大生肖唤醒值
	mount_spell1 = 61						,--坐骑一级技能
	mount_spell2 = 62						,--坐骑二级技能
	mount_spell3 = 63						,--坐骑三级技能
	mount_spell_evolve = 20					,--坐骑技能每20级变一次
	loot_area = 2							,--战利品占地面积的边长--
	loot_exist_timer = 20000				,--战利品存在时间
	loot_change_owner = 10000				,--战利品改变所有者时间
	loot_money_entry = 50					,--战利品钱的模板
	loot_caishenbaoxiang_entry = 368		,--战利品财神宝箱的模板
	respawn_max_level = 15					,--小于该等级可以原地复活
	sub_weapon_durability = 6				,--每攻击一次武器扣的耐久
	sub_other_durability = 1				,--每次扣除的装备(除了武器和无限耐久装备)耐久的基本单位
	new_bird_protect_lv = 50				,--新手保护等级
	monster_random_radius_percent = 0.16	,--怪物随机移动半径与怪物视野关径的比率,目前是 13*0.166
	red_name_time = 60						,--主动砍人后红名时间
	safe_distance = 6						,--复活点安全半径
	use_gameobject_diff = 0					,--使用需要读条的GO允许的时间差
	max_npc_distance = 20					,--允许与NPC的最长距离

	can_move_dis_map				= {57},--允许坐标不同步的地图
	cant_attack						= {BUFF_YUNXUAN,BUFF_CHENMO,BUFF_ZHIKONG,BUFF_SHIHUA,BUFF_YINCHANG},	--限制攻击的BUFF
	cant_cast						= {BUFF_YUNXUAN,BUFF_CHENMO,BUFF_ZHIKONG,BUFF_SHIHUA,BUFF_YINCHANG},	--限制施法的BUFF
	cant_move						= {BUFF_YUNXUAN,BUFF_DINGSHEN,BUFF_ZHIKONG,BUFF_SHIHUA,BUFF_YINCHANG,BUFF_HDQS_NET},--限制主动移动的BUFF
	cant_recovery					= {},	--被限制恢复体力，内力

	can_remove_buff					= {},	--属性重算的时候能移除的buff
	cant_jump						= {BUFF_YUNXUAN,BUFF_DINGSHEN,BUFF_ZHIKONG,BUFF_HDQS_NET},--限制跳跃的BUFF
	cant_teleport					= {},							--限制传送的BUFF
	cant_use_item					= {},							--限制使用物品的BUFF
	--注：羊羊无敌不可见仅用于怪物。客户端无视
	cant_see						= {},							--隐身的BUFF
	invincible						= {},							--无敌的BUFF
	cant_fight_with_player	 		= {},							--不能与玩家战斗的BUFF
	cant_attack_be_player			= {},							--不会被玩家攻击
	ignore_the_obstacles			= {},				--无视状态
	--战利品配置
	loot_possibility_range			= {0,9999},				--物品掉落配置,机率范围
	--游戏服命令表
	external_router_map = {
		MSG_UNIT_MOVE,
		MSG_TELEPORT,
		MSG_MOVE_STOP,
		MSG_SPELL_START,
		MSG_SPELL_STOP,
		MSG_SELECT_TARGET,
		CMSG_SET_ATTACK_MODE,
		MSG_CHAT_NEAR,
		CMSG_USE_GAMEOBJECT,
		CMSG_GOSSIP_HELLO,
		CMSG_GOSSIP_SELECT_OPTION,
		CMSG_TAXI_HELLO,
		CMSG_TAXI_SELECT_STATION,
		CMSG_QUESTGIVER_STATUS_QUERY,
		CMSG_QUESTHELP_GET_CANACCEPT_LIST,
		CMSG_QUESTLOG_REMOVE_QUEST,
		CMSG_QUESTGIVER_ACCEPT_QUEST,
		CMSG_QUESTGIVER_COMPLETE_QUEST,
		CMSG_QUESTUPDATE_USE_ITEM,
		CMSG_QUESTHELP_COMPLETE,
		CMSG_QUESTHELP_UPDATE_STATUS,
		CMSG_QUESTHELP_TALK_OPTION,
		CMSG_RESURRECTION,
		CMSG_INSTANCE_EXIT,
		CMSG_QUESTHELP_QUERY_BOOK,
		CMSG_INSTANCE_NEXT_STATE,
		MSG_QUERY_QUEST_STATUS,
		CMSG_INSTANCE_ENTER,
		--[[
		CMSG_START_HUNG_UP,--开始挂机*/
		CMSG_STOP_HUNG_UP,--停止挂机*/
		MSG_SYNC_MSTIME,--同步时间 29
		MSG_TEST_NETD_SCENED,
		MSG_JUMP_START	,-- /*跳跃开始*/
		MSG_JUMP_END	,-- /*跳跃结束*/
		CMSG_CLIENT_UPDATE_SCENED,	--/*客户端热更场景模块后获取uint*/
		CMSG_LOOT_SELECT,
		MSG_CLIENTSUBSCRIPTION,		--/*查询头像的buffer信息*/
		CMSG_ZHUAN_SHENG,	--转生
		CMSG_FUBEN_HUNG_UP,-- 副本挂机操作
		CMSG_ENTER_FEISHENGZHILU,	--进入飞升之路		
		CMSG_ENTER_QIYU,			--进入奇遇副本
		CMSG_QUERY_FUBEN_INFO,		-- /*查询副本信息*/
		SMSG_QUERY_FUBEN_INFO_RESULT,	-- /*查询副本信息结果*/
        CMSG_ENTER_PANTAOYUAN,  	-- /*进入蟠桃园*/
        CMSG_USE_GAMEOBJECT_START,		-- 使用有效对象开始
		CMSG_RECEIVE_OTHER_QUEST,	--接受其他任务(江湖密令、悬赏等)
		CMSG_COMPLETE_OTHER_QUEST,	--完成其他任务(江湖密令、悬赏等)
		CMSG_INSTANCE_ALL_KILL_OPT,	--全屏秒杀操作
		CMSG_MOUNT_RIDING,			--坐骑骑乘
		MSG_MAP_JUMP,				--地形跳跃
		CMSG_ENTER_WULIN,			--进入武林秘境
		CMSG_DABOSS_TELEPORT,		--打boss传送
		CMSG_BOSS_DROP_EVENT_QUERY,				--boss掉落动态查询
		MSG_QUERY_KILL_BOSS_PLAYERNAME,			--上轮被击杀BOSS查询
		CMSG_ENTER_WUSHEN_LEITAI,				--进入武神擂台
		CMSG_ASK_FOR_BUFF,						--请求BUFF处理
		CMSG_ENTER_DAILY_INSTANCE,				--进入日常副本
		CMSG_ENTER_SWFJ_INSTANCE,				--进入塞外伏击
		CMSG_GET_SWFJ_INSTANCE_REWARD,			--塞外伏击领取经验
		CMSG_SWFJ_INSTANCE_JIANZAO,				--塞外伏击建造
		CMSG_ENTER_FACTION_FUBEN,				--进入帮派副本
		]]
		CMSG_FORCEINTO,							--强制进入
	},
	--pk服命令表
	pk_external_router_map = {
		MSG_UNIT_MOVE,
		MSG_MOVE_STOP,
		MSG_SPELL_START,
		MSG_SPELL_STOP,
		MSG_SELECT_TARGET,
		MSG_CHAT_NEAR,
		CMSG_USE_GAMEOBJECT,
		--MSG_INSTANCE_READY,
		CMSG_INSTANCE_NEXT_STATE,
		MSG_SYNC_MSTIME,--同步时间
		MSG_TEST_NETD_SCENED,
		MSG_JUMP_START	,-- /*跳跃开始*/
		MSG_JUMP_END	,-- /*跳跃结束*/
		CMSG_CLIENT_UPDATE_SCENED,	--/*客户端热更场景模块后获取uint*/
		CMSG_LOOT_SELECT,
		MSG_CLIENTSUBSCRIPTION,		--/*查询头像的buffer信息*/
        CMSG_USE_GAMEOBJECT_START,		-- 使用有效对象开始
        CMSG_FLZ_ENTER_FENGLIUZHEN_PUB,	--进入风流镇酒馆
		CMSG_INSTANCE_EXIT,			--退出副本
		CMSG_MOUNT_RIDING,			--坐骑骑乘
		CMSG_FLZ_SHWJ_KEJI_LEVELUP,	--生化危机升级科技
		CMSG_FLZ_SHWJ_HUANZIDAN,	--生化危机换子弹
		CMSG_FLZ_HDQS_OPT,			--荒岛求生玩家操作
	},
}

--校验协议注册是否有效
CheckRouterMap(config.external_router_map)
CheckRouterMap(config.pk_external_router_map)

app = require('scened.ScenedApp'):new()

--------------------------
outString('load Unit script')
require 'scened.unit.init'

-------------------------------------------------------------------
--载入其他脚本
function load_lua_scripts()
	local tbl = {
		{'战斗信息脚本'		,'scened/fighting_info'},
		{'公式脚本'			,'scened/formula'},
		{'buffer脚本'		,'scened/buffer'},
		{'技能脚本脚本'		,'scened/spell'},
		{'技能范围脚本'		,'scened/hit'},
		{'使用物品脚本'		,'scened/item'},
		{'伤害计算脚本'		,'scened/meleeattack'},
		{'闲聊及任务脚本'	,'scened/gossip'},
		{'怪物智能脚本'		,'scened/script_ai'},
		{'NPC智能脚本'		,'scened/npc_ai'},
		{"战利品脚本"		,'scened/loot_manager'},
		{'副本脚本'			,'scened/instance/instance_base'},
		{'九重天脚本1'		,'scened/instance/instanceTower1'},
		{'九重天脚本2'		,'scened/instance/instanceTower2'},
		{'桃花迷阵脚本'		,'scened/instance/instanceTaoHua'},
		{'LUA之GM命令'		,'scened/gm_command'},
	}
	local i = 0
	repeat
		i = i + 1
		require(tbl[i][2])
	until #tbl == i

end
load_lua_scripts()

-- 映射mapid和脚本关系
INSTANCE_SCRIPT_TABLE = {
	[101] = InstanceTower1,
	[102] = InstanceTower2,
	[103] = InstanceTaoHua,
}

-- 复活点坐标
function GetRespawnPos()
	return {108, 77}
end

-- 获取地图模板名称
function GetMapTemplateName(mapid)
	if tb_map_info[mapid] == nil then
		return ""
	end
	return tb_map_info[mapid].name
end

-- 获取地图模板副本类型（2：单人，1：多人）
function GetMapFubenType(mapid)
	if tb_map_info[mapid] == nil then
		return 0
	end
	return tb_map_info[mapid].instance_type
end

-- 获取是否是副本地图
function IsFubenMap(mapid)
	if tb_map_info[mapid] == nil then
		return false
	end
	return tb_map_info[mapid].is_instance
end

require 'scened.context.init'
