//db_RHwep_EastDEFAULT.sqf
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
		["RH_tt33","RH_8Rnd_762_tt33"],
		["RH_pm","8Rnd_9x18_Makarov"]
	],
	[//v2 Unusual weapons
		["RH_m1911","RH_8Rnd_45cal_m1911"],
		["RH_m1911old","RH_8Rnd_45cal_m1911"],
		["RH_m9","15Rnd_9x19_M9"],
		["RH_g17","RH_17Rnd_9x19_g17"]
	],
	[//v3 Rare weapons
		["RH_aps","RH_20Rnd_9x18_aps"],  
		["RH_tec9","RH_30Rnd_9x19_tec"],
		["RH_m93r","RH_20Rnd_9x19_M93"],
		["RH_g18","RH_19Rnd_9x19_g18"],
		["RH_g18","RH_33Rnd_9x19_g18"],
		["RH_vz61","RH_20Rnd_32cal_vz61"],
		["RH_muzi","RH_32Rnd_9x19_Muzi"],
		["RH_ppk","RH_7Rnd_32cal_ppk"],
		["RH_mp5kp","30Rnd_9x19_MP5p"],
		["RH_mac10p","RH_9mm_32RND_pMag"],
		["RH_pp2000p","30Rnd_9x19_MP5p"],
		["RH_mp7p","RH_46x30mm_40RND_pMag"]
	],
	[//v4 Legendary weapons
		["RH_apssd","RH_20Rnd_9x18_apssd"], 
		["RH_pmsd","8Rnd_9x18_MakarovSD"],  
		["RH_Deagles","RH_7Rnd_50_AE"]
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
		["RH_mp5a5","30Rnd_9x19_MP5"],
		["RH_mp5k","30Rnd_9x19_MP5"],
		["RH_mp5kpdw","30Rnd_9x19_MP5"]
		
	],
	[//v2 Unusual weapons
		["RH_uzi","RH_9mm_32RND_Mag"],
		["RH_mac10","RH_9mm_32RND_Mag"],
		["RH_fmg9","RH_9mm_32RND_Mag"]
	],
	[//v3 Rare weapons
		["RH_p90","RH_57x28mm_50RND_Mag"],
		["RH_kriss","RH_45ACP_30RND_Mag"],
		["RH_tmp","30Rnd_9x19_MP5"],
		["RH_pp2000","30Rnd_9x19_MP5"]
	],
	[//v4 Legendary weapons	
		["RH_P90sd","RH_57x28mm_50RND_SD_Mag"],
		["RH_mp5sd6","30Rnd_9x19_MP5SD"],
		["RH_krisssd","RH_45ACP_30RND_SD_Mag"],
		["RH_tmpsd","30Rnd_9x19_MP5SD"]
	]
];

_db_Assault_rifle = 
[
	[//v1 Usual weapons
		["RH_ak47","30Rnd_762x39_AK47"],
		["RH_aks47","30Rnd_762x39_AK47"],	
		["RH_ak74","30Rnd_545x39_AK"],
		["RH_aks74","30Rnd_545x39_AK"],
		
		["RH_m16a1","30Rnd_556x45_Stanag"]
	],
	[//v2 Unusual weapons
		["RH_aks74u","RH_30Rnd_545x39_AKSU_mag"],
		["RH_akm","30Rnd_762x39_AK47"],  
		["RH_akms","30Rnd_762x39_AK47"],
		["RH_ak74m","30Rnd_545x39_AK"],
		["RH_aks74m","30Rnd_545x39_AK"],  
		
		["RH_m4","30Rnd_556x45_Stanag"]
	
	],
	[//v3 Rare weapons
		["RH_ak102","RH_30Rnd_556x45_AK"],
		["RH_ak103","30Rnd_762x39_AK47"], 
		["RH_ak104","30Rnd_762x39_AK47"],
		["RH_ak105","30Rnd_545x39_AK"],
		["RH_ak107","30Rnd_545x39_AK"],
		["RH_an94","RH_30Rnd_545x39_mag"], 
		["RH_rpk47","RH_75Rnd_762x39_mag"],
		["RH_rpk74","RH_45Rnd_545x39_mag"],
		["RH_rpk74m","RH_45Rnd_545x39_mag"], 
		
		["RH_ar10","RH_20Rnd_762x51_ar10"], 
		["RH_ar10s","RH_20Rnd_762x51_ar10"],
		["RH_m16a2","30Rnd_556x45_Stanag"]
	],
	[//v4 Legendary weapons	
		["RH_an94gl","RH_30Rnd_545x39_mag","1Rnd_HE_GP25"],
		["RH_aks74usd","30Rnd_545x39_AKSD"], 
		["RH_ak47gl","30Rnd_762x39_AK47","1Rnd_HE_GP25"],
		["RH_akmssd","RH_30Rnd_762x39_SDmag"], 
		["RH_ak74gl","30Rnd_545x39_AK","1Rnd_HE_GP25"], 
		["RH_aks74gl","30Rnd_545x39_AK","1Rnd_HE_GP25"],
		["RH_ak74mgl","30Rnd_545x39_AK","1Rnd_HE_GP25"],
		["RH_ak103gl","30Rnd_762x39_AK47","1Rnd_HE_GP25"], 
		["RH_ak104gl","30Rnd_762x39_AK47","1Rnd_HE_GP25"],
		["RH_ak105gl","30Rnd_545x39_AK","1Rnd_HE_GP25"],
		["RH_ak107gl","30Rnd_545x39_AK","1Rnd_HE_GP25"],
		["RH_asval","RH_20Rnd_9x39_val_mag"],
		["RH_m16a1gl","30Rnd_556x45_Stanag","1Rnd_HE_M203"],
		["RH_m16a2gl","30Rnd_556x45_Stanag","1Rnd_HE_M203"], 
		["RH_ak102gl","RH_30Rnd_556x45_AK","1Rnd_HE_GP25"]
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
		["RH_m60e4","100Rnd_762x51_M240"]
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
	"EAST DEFAULT",
	[
		""
	],
	[
		//class wep
		0,60,2,70,3,100
	],
	//NEEED TO ADD ARRAY WITH 100% AddWEapon like RPG 7 for terrorists
	_wep_array //weps for current men class names
];

GLOBAL_WepPack_RH = GLOBAL_WepPack_RH + [_FINAL_WEP_PACK]; //<--------------