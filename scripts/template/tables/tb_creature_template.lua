---------------------------------------------------------------------------------
--------------------------以下代码为自动生成，请勿手工改动-----------------------
---------------------------------------------------------------------------------


tb_creature_template = {
	--  id:int	生物ID
	--  name:string	名称
	--  npcflag:int	类型
	--  monster_type:int	怪物类型
	--  level:int	等级
	--  pro:array	基本属性
	--  spell:array	技能组
	--  ainame:string	脚本名称
	--  visionradius:int	视野半径
	--  actionradius:int	活动半径
	--  attack_type:int	攻击类型
	--  lockfaceto:int	锁形象朝向
	--  attack_range:int	怪物攻击距离
	--  exp:int	击杀获得经验
	--  reward_id:array	击杀随机掉落ID组
	--  dialogue:string	冒泡对话内容
	--  money_min:int	铜钱掉落最小值
	--  money_max:int	铜钱掉落最大值
	--  money_percent:int	铜钱掉落百分比
	--  money_num:int	铜钱掉落堆数
	--  drop_belong:int	掉落归属
	[1001] = {id = 1001,name = "风清扬",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "咳！该说的说，不该说的小声说。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1002] = {id = 1002,name = "传送点",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "一把年纪了还可爱的很，我真是个罪人。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1003] = {id = 1003,name = "复活点",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "每次吵完架都觉得自己没有发挥好。 ",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1004] = {id = 1004,name = "NPC4",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "咳！该说的说，不该说的小声说。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1005] = {id = 1005,name = "NPC5",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "如果要飞得高，就应把地平线忘掉。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1006] = {id = 1006,name = "NPC6",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "越来越胖真是让我好担忧噢，看来只有靠吃零食来减压了。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1007] = {id = 1007,name = "NPC7",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "我爱你是真心话，告诉你是大冒险。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1008] = {id = 1008,name = "NPC8",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "太拿自己当根葱的人，往往特别善于装蒜。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1009] = {id = 1009,name = "NPC9",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "咳！该说的说，不该说的小声说。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[1010] = {id = 1010,name = "NPC10",npcflag = 1,monster_type = 0,level = 1,pro = {},spell = {},ainame = "AI_duihua",visionradius = 0,actionradius = 0,attack_type = 0,lockfaceto = -1,attack_range = 0,exp = 0,reward_id = {},dialogue = "我爱你是真心话，告诉你是大冒险。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 0,},
	[2001] = {id = 2001,name = "蜜蜂",npcflag = 0,monster_type = 0,level = 1,pro = {{1,162},{2,16},{3,5},{4,1},{5,1},{6,3.99999999999999},{7,1},{8,-500},{9,202}},spell = {10001,1400,1},ainame = "AI_guaiwu",visionradius = 7,actionradius = 20,attack_type = 0,lockfaceto = -1,attack_range = 4,exp = 10,reward_id = {},dialogue = "你还记得大明湖畔的小青么~",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 3,},
	[2002] = {id = 2002,name = "野猪",npcflag = 0,monster_type = 0,level = 2,pro = {{1,184},{2,18},{3,6},{4,1},{5,1},{6,3.99999999999999},{7,1},{8,-500},{9,203}},spell = {10001,1300,1},ainame = "AI_guaiwu",visionradius = 7,actionradius = 20,attack_type = 0,lockfaceto = -1,attack_range = 4,exp = 11,reward_id = {},dialogue = "我想凤凰涅槃，谁知道一不小心……熟了……",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 3,},
	[2003] = {id = 2003,name = "老鹰",npcflag = 0,monster_type = 0,level = 3,pro = {{1,227},{2,21},{3,7},{4,1},{5,1},{6,4.99999999999999},{7,1},{8,-500},{9,204}},spell = {10002,1200,1},ainame = "AI_guaiwu",visionradius = 20,actionradius = 20,attack_type = 2,lockfaceto = -1,attack_range = 4,exp = 12,reward_id = {},dialogue = "若不是为了将军家的秋香，我才不会到这里当家奴。",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 3,},
	[2004] = {id = 2004,name = "路霸",npcflag = 0,monster_type = 0,level = 4,pro = {{1,3960},{2,36},{3,14},{4,1},{5,1},{6,9.00000000000001},{7,1},{8,-450},{9,207}},spell = {10002,1100,1},ainame = "AI_guaiwu",visionradius = 20,actionradius = 20,attack_type = 2,lockfaceto = -1,attack_range = 4,exp = 13,reward_id = {},dialogue = "如果我做了皇帝，就封你当太子~",money_min = 0,money_max = 0,money_percent = 0,money_num = 0,drop_belong = 3,},
}
