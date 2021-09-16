//db_RHwep_SheriffSWAT.sqf
private ["_db_HandGun","_db_Shotgun","_db_SMG", "_db_Assault_rifle", "_db_Sniper_rifle","_db_Machine_gun","_db_Less_lethal","_db_Extra_equipment","_db_Rocket_launcher","_FINAL_WEP_PACK"];

//**CLASSES SWAT
//HandGun	0
//Shotgun	1
//SMG	2
//Assault_rifle	3
//Sniper_rifle	4
//Machine_gun	5
//Rocket_launcher 6
//Less_lethal	7
//Shield	8
//Extra_equipment 9

//**WEAPON CHANCE
//Usual weapons	0
//Unusual weapons 1
//Rare weapons	2
//Legendary	weapons	3

_wep_array = [];


_db_HandGun = 
[
	[//v1 Usual weapons

	],
	[//v2 Unusual weapons

	],
	[//v3 Rare weapons

	],
	[//v4 Legendary weapons

	]
];

_db_Shotgun = 
[
	[//v1 Usual weapons
	
	],
	[//v2 Unusual weapons

	],
	[//v3 Rare weapons

	],
	[//v4 Legendary weapons

	]
];

_db_SMG = 
[
	[//v1 Usual weapons
		["RH_ump","RH_45ACP_25RND_Mag"]
	],
	[//v2 Unusual weapons
		["RH_mp5a5riseot","30Rnd_9x19_MP5"]
	],
	[//v3 Rare weapons
		["RH_mp7","RH_46x30mm_40RND_Mag"]
	],
	[//v4 Legendary weapons	
		["RH_umpeot","RH_45ACP_25RND_Mag"],
		["RH_mp7eot","RH_46x30mm_40RND_Mag"]
	]
];

_db_Assault_rifle = 
[
	[//v1 Usual weapons
		["RH_HK53","30Rnd_556x45_Stanag"]
	],
	[//v2 Unusual weapons
		["RH_m16a2","30Rnd_556x45_Stanag"]
	],
	[//v3 Rare weapons
		["RH_HK53aim","30Rnd_556x45_Stanag"],
		["RH_m16a2aim","30Rnd_556x45_Stanag"]
	],
	[//v4 Legendary weapons	
		["RH_m14","20Rnd_762x51_DMR"],
		["RH_scarLb_aim","30Rnd_556x45_Stanag"]
	]
];

_db_Sniper_rifle = 
[
	[//v1 Usual weapons
	
	
	],
	[//v2 Unusual weapons
	
	
	],
	[//v3 Rare weapons
	
	
	],
	[//v4 Legendary weapons
	
	
	]
];

_db_Machine_gun = 
[
	[//v1 Usual weapons
	
	
	],
	[//v2 Unusual weapons
	
	
	],
	[//v3 Rare weapons
	
	
	],
	[//v4 Legendary weapons
	
	
	]
];

_db_Rocket_launcher = 
[
	[//v1 Usual weapons
	
	
	],
	[//v2 Unusual weapons
	
	
	],
	[//v3 Rare weapons
	
	
	],
	[//v4 Legendary weapons
	
	
	]
];

_db_Less_lethal = 
[
	[//v1 Usual weapons
		["M1014","8Rnd_B_Beneli_74Slug"],//LESS LETHAL!
		["cal68_egosl","cal68_50FP"]
	],
	[//v2 Unusual weapons
		["Saiga12K","8Rnd_B_Saiga12_74Slug"],//LESS LETHAL!
		["cal68_egosl","cal68_50FP"],
		["M32_EP1","6Rnd_HE_M203"],
		["M79_EP1","1Rnd_HE_M203"],		
		["M32_EP1","6Rnd_Smoke_M203"],
		["M79_EP1","1Rnd_Smoke_M203"]
	],
	[//v3 Rare weapons
		["M32_EP1","6Rnd_HE_M203"],
		["M79_EP1","1Rnd_HE_M203"],		
		["M32_EP1","6Rnd_Smoke_M203"],
		["M79_EP1","1Rnd_Smoke_M203"]
	],
	[//v4 Legendary weapons
		["M32_EP1","6Rnd_HE_M203"],	
		["M32_EP1","6Rnd_Smoke_M203"]
	]
];

_db_Shield = 
[
	[//v1 Usual weapons
		["swat","15Rnd_9x19_M9"]
	],
	[//v2 Unusual weapons
		["swat","15Rnd_9x19_M9"]
	],
	[//v3 Rare weapons
		["swat","15Rnd_9x19_M9"]	
	],
	[//v4 Legendary weapons
		["swat","15Rnd_9x19_M9"]
	]
];

_db_Extra_equipment = 
[
	[//v1 Usual weapons
	
	
	],
	[//v2 Unusual weapons
	
	
	],
	[//v3 Rare weapons
	
	
	],
	[//v4 Legendary weapons
	
	
	]
];



_wep_array = [_db_HandGun] + [_db_Shotgun] + [_db_SMG] + [_db_Assault_rifle] + [_db_Sniper_rifle] + [_db_Machine_gun] + [_db_Rocket_launcher] + [_db_Less_lethal]  + [_db_Shield] + [_db_Extra_equipment];


/////////////////////////////////////
_FINAL_WEP_PACK = 
[
	"SHERIFF SWAT",
	[
		"FDF_SJ_M05_2"
	],
	[
		//class wep
		8,5,7,20,2,35,3,100
	],
	_wep_array //weps for current men class names
];

GLOBAL_WepPack_RH = GLOBAL_WepPack_RH + [_FINAL_WEP_PACK]; //<--------------