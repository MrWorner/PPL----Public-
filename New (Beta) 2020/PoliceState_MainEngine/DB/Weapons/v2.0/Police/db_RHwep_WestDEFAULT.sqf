//db_RHwep_Cops.sqf
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
		["RH_m9","15Rnd_9x19_M9"]
	],
	[//v2 Unusual weapons
		["RH_g17","RH_17Rnd_9x19_g17"]
	],
	[//v3 Rare weapons
		["RH_m1911","RH_8Rnd_45cal_m1911"]	
	],
	[//v4 Legendary weapons
		["RH_usp","RH_15Rnd_9x19_usp"]
	]
];

_db_Shotgun = 
[
	[//v1 Usual weapons
		["M1014","8Rnd_B_Beneli_74Slug"]//LESS LETHAL!
	],
	[//v2 Unusual weapons
		["Saiga12K","8Rnd_B_Saiga12_74Slug"]//LESS LETHAL!
	],
	[//v3 Rare weapons
		["Saiga12K","8Rnd_B_Saiga12_74Slug"]//LESS LETHAL!
	],
	[//v4 Legendary weapons
		["Saiga12K","8Rnd_B_Saiga12_74Slug"]//LESS LETHAL!
	]
];

_db_SMG = 
[
	[//v1 Usual weapons
		["RH_mp5a5","30Rnd_9x19_MP5"]
	],
	[//v2 Unusual weapons
		["RH_tmp","30Rnd_9x19_MP5"]
	],
	[//v3 Rare weapons
		["RH_bizon","64Rnd_9x19_Bizon"]
	],
	[//v4 Legendary weapons	
		["RH_pp2000","30Rnd_9x19_MP5"]
	]
];

_db_Assault_rifle = 
[
	[//v1 Usual weapons
		["RH_m4a1","30Rnd_556x45_Stanag"]
	],
	[//v2 Unusual weapons
		["RH_aks74u","RH_30Rnd_545x39_AKSU_mag"]
	
	],
	[//v3 Rare weapons
		["RH_aks74","30Rnd_545x39_AK"]
	],
	[//v4 Legendary weapons	
		["RH_m16a2","30Rnd_556x45_Stanag"]
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
	
	
	],
	[//v2 Unusual weapons
	
	
	],
	[//v3 Rare weapons
	
	
	],
	[//v4 Legendary weapons
	
	
	]
];

_db_Shield = 
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
	"WEST DEFAULT",
	[
		""
	],
	[
		//class wep
		0,70,1,50,2,40,3,100
	],
	_wep_array //weps for current men class names
];

GLOBAL_WepPack_RH = GLOBAL_WepPack_RH + [_FINAL_WEP_PACK]; //<--------------