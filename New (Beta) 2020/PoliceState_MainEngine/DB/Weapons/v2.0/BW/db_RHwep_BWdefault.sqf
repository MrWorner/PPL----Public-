//db_RHwep_BWdefault.sqf
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
		["RH_mp5a5","30Rnd_9x19_MP5"]
	],
	[//v2 Unusual weapons
		["RH_mp5a5rfx","30Rnd_9x19_MP5"]
	],
	[//v3 Rare weapons
		["RH_pdr","30Rnd_556x45_Stanag"],
		["RH_fmg9","RH_9mm_32RND_Mag"],
		["RH_mp7","RH_46x30mm_40RND_Mag"],
		["RH_pp2000","30Rnd_9x19_MP5"],
		["RH_kriss","RH_45ACP_30RND_Mag"],
		["RH_ump","RH_45ACP_25RND_Mag"],
		["RH_mp5k","30Rnd_9x19_MP5"],
		["RH_mp5kpdw","30Rnd_9x19_MP5"]
	],
	[//v4 Legendary weapons	
		["RH_pdraim","30Rnd_556x45_Stanag"],
		["RH_mp5a5aim","30Rnd_9x19_MP5"],
		["RH_mp5kpdwaim","30Rnd_9x19_MP5"]
		
	]
];

_db_Assault_rifle = 
[
	[//v1 Usual weapons
		["RH_hk416","30Rnd_556x45_Stanag"]
	],
	[//v2 Unusual weapons
		["RH_ctar21","30Rnd_556x45_Stanag"]
		
	],
	[//v3 Rare weapons
		["RH_mk14t","20Rnd_762x51_DMR"], 
		["RH_ak105","30Rnd_545x39_AK"],
		["RH_ak104","30Rnd_762x39_AK47"],   
		["RH_ScarAk","30Rnd_762x39_AK47"], 
		["RH_m16a2","30Rnd_556x45_Stanag"],
		["RH_ctar21m","30Rnd_556x45_Stanag"],
		["RH_hk417","RH_20Rnd_762x51_hk417"]
	],
	[//v4 Legendary weapons	
		["RH_ScarAkacog","30Rnd_762x39_AK47"],
		["RH_star21","30Rnd_556x45_Stanag"]
		
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
	"BW DEFAULT",
	[
		""
	],
	[
		//class wep
		7,10,2,25,3,100
	],
	_wep_array //weps for current men class names
];

GLOBAL_WepPack_RH = GLOBAL_WepPack_RH + [_FINAL_WEP_PACK]; //<--------------