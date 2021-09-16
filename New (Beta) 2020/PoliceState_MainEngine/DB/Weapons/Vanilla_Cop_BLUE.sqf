//Vanilla_Cop_BLUE.sqf


//*******************************

//**WEAPONS
//Usual weapons %70 		v1
//Unusual weapons %70	 v2
//Rare weapons %70 		v3
//Legendary	weapons			 v4


//**CLASSES SWAT
// Assaulter with SMG					| SWAT_BLUE_SMG_v1 = [];
// Assaulter with shotgun				| SWAT_BLUE_Shotgun_v1 = [];
// Assaulter with Assault Rifle			| SWAT_BLUE_AssaultRifle_v1 = [];
// Assaulter with Less lethal			| SWAT_BLUE_LessLethal_v1 = [];
// Assaulter with Shield				| SWAT_BLUE_Shield_v1 = [];

// Sniper with SD SGM					| Sniper_BLUE_SMG_v1 = [];
// Sniper with SD Assault Rifle			| Sniper_BLUE_AssaultRifle_v1 = [];
// Sniper with sniper rifle (can be SD)	| Sniper_BLUE_SniperRifle = [];

//**CLASSES COP
//Cop with HandGun						| Cop_HandGun_v1 = [];
//Cop with Sotgun						| Cop_Sotgun_v1 = [];
//Cop with SMG							| Cop_SMG_v1 = [];
//Cop with Assault Rifle				| Cop_AssaultRifle_v1 = [];





Cop_BLUE_HandGun_v1 = //Usual weapons
[
	["Colt1911","7Rnd_45ACP_1911"],
	["M9","15Rnd_9x19_M9"],
	["Makarov","8Rnd_9x18_Makarov"] // ??LESS LETHAL??
];
Cop_BLUE_HandGun_v2 = //Unusual weapons
[
	["glock17_EP1","17Rnd_9x19_glock17"]
];
Cop_BLUE_HandGun_v3 = //Rare weapons
[
	["revolver_EP1","6Rnd_45ACP"],
	["CZ_75_D_COMPACT","10Rnd_9x19_Compact"]
];
Cop_BLUE_HandGun_v4 = //Legendary	weapons
[
	["CZ_75_P_07_DUTY","15Rnd_9x19_M9"],
	["CZ_75_SP_01_PHANTOM","18Rnd_9x19_Phantom"]
	//["MakarovSD","8Rnd_9x18_MakarovSD"], // ??LESS LETHAL??
];



Cop_BLUE_Shotgun_v1 = //Usual weapons
[
	["M1014","8Rnd_B_Beneli_74Slug"]//LESS LETHAL!
];
Cop_BLUE_Shotgun_v2 =  //Unusual weapons
[
	["Saiga12K","8Rnd_B_Saiga12_74Slug"]//LESS LETHAL!
];
Cop_BLUE_Shotgun_v3 = Cop_BLUE_Shotgun_v2; //Rare weapons

Cop_BLUE_Shotgun_v4 = Cop_BLUE_Shotgun_v2; //Legendary	weapons




Cop_BLUE_SMG_v1 = //Usual weapons
[
	["MP5A5","30Rnd_9x19_MP5"]
];
Cop_BLUE_SMG_v2 =  //Unusual weapons
[
	["Bizon","64Rnd_9x19_Bizon"]
];
Cop_BLUE_SMG_v3 = //Rare weapons
[
	["Evo_ACR","20Rnd_9x19_EVO"]
];
Cop_BLUE_SMG_v4 = Cop_BLUE_SMG_v3; //Legendary weapons





Cop_BLUE_AssaultRifle_v1 = //Usual weapons
[
	["M4A1","30Rnd_556x45_Stanag"],
	["AKS_74_U","30Rnd_545x39_AK"]
];
Cop_BLUE_AssaultRifle_v2 =  //Unusual weapons
[
	["M16A2","30Rnd_556x45_Stanag"]
];
Cop_BLUE_AssaultRifle_v3 = //Rare weapons
[
	["G36C","30Rnd_556x45_G36"]
];
Cop_BLUE_AssaultRifle_v4 = Cop_BLUE_AssaultRifle_v3; //Legendary	weapons

	
	




SWAT_BLUE_SMG_v1 = //Usual weapons
[
	["MP5A5","30Rnd_9x19_MP5"]
];
SWAT_BLUE_SMG_v2 =  //Unusual weapons
[
	["Bizon","64Rnd_9x19_Bizon"]
	//["MP5SD","30Rnd_9x19_MP5SD"],
];
SWAT_BLUE_SMG_v3 = //Rare weapons
[
	["Evo_ACR","20Rnd_9x19_EVO"]
];
SWAT_BLUE_SMG_v4 = //Legendary	weapons
[
	["Evo_mrad_ACR","20Rnd_9x19_EVO"]
];



	
	
SWAT_BLUE_Shotgun_v1 = //Usual weapons
[
	["M1014","8Rnd_B_Beneli_74Slug"]//LESS LETHAL!
];
SWAT_BLUE_Shotgun_v2 =  //Unusual weapons
[
	["Saiga12K","8Rnd_B_Saiga12_74Slug"]//LESS LETHAL!
];
SWAT_BLUE_Shotgun_v3 = //Rare weapons
[
	["AA12_PMC","20Rnd_B_AA12_74Slug"]  // LESS LETHAL!
];
SWAT_BLUE_Shotgun_v4 = //Legendary	weapons
[
	["AA12_PMC","20Rnd_B_AA12_Pellets"]
];

	



SWAT_BLUE_AssaultRifle_v1 = //Usual weapons
[
	["M4A1","30Rnd_556x45_Stanag"]
];
SWAT_BLUE_AssaultRifle_v2 =  //Unusual weapons
[
	["G36C","30Rnd_556x45_G36"]
	
	//["M16A2","30Rnd_556x45_Stanag"],
	//["M16A4","30Rnd_556x45_Stanag"],
	//["G36C_camo","30Rnd_556x45_G36"],
	//["SCAR_L_CQC","30Rnd_556x45_Stanag"],

];
SWAT_BLUE_AssaultRifle_v3 = //Rare weapons
[
	["G36K","30Rnd_556x45_G36"],
	["M4A1_Aim","30Rnd_556x45_Stanag"]
	
	//["AK_107_pso","30Rnd_545x39_AK"],
	//["AK_107_kobra","30Rnd_545x39_AK"],
	//["CZ805_A1_ACR","30Rnd_556x45_G36"]
	//["G36a","30Rnd_556x45_G36"],
	//["G36A_camo","30Rnd_556x45_G36"],	
	//["G36K_camo","30Rnd_556x45_G36"],
	//["M16A4_ACG","30Rnd_556x45_Stanag"],	
	//["M4A1_Aim_camo","30Rnd_556x45_Stanag"],
	//["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],
	//["SCAR_L_STD_HOLO","30Rnd_556x45_Stanag"],
	//["SCAR_L_CQC_Holo","30Rnd_556x45_Stanag"],
	//["SCAR_H_CQC_CCO","20Rnd_762x51_B_SCAR"],
	//["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"],
	//["M8_carbine","30Rnd_556x45_G36"],
	//["M8_compact","30Rnd_556x45_G36"],
	//["m8_compact_pmc","30Rnd_556x45_G36"],
	//["m8_carbine_pmc","30Rnd_556x45_G36"],
	//["BAF_L85A2_RIS_ACOG","30Rnd_556x45_Stanag"],
	//["BAF_L85A2_RIS_CWS","30Rnd_556x45_Stanag"],
	//["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"],
	//["BAF_L85A2_RIS_SUSAT","30Rnd_556x45_Stanag"],
	//["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"],
];
SWAT_BLUE_AssaultRifle_v4 = //Legendary	weapons
[
	["G36_C_SD_eotech","30Rnd_556x45_G36SD"]
	
	//["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"],
	//["SCAR_L_CQC_CCO_SD","30Rnd_556x45_StanagSD"],
	//["SCAR_H_CQC_CCO_SD","20Rnd_762x51_SB_SCAR"],
	//["SCAR_H_STD_TWS_SD","20Rnd_762x51_SB_SCAR"],
	//["m8_holo_sd","30Rnd_556x45_G36SD"],
	//["m8_tws","30Rnd_556x45_G36"],
	//["m8_tws_sd","30Rnd_556x45_G36SD"],
];

	

	
	
	


//LessLethal GRENADE LAUNCHERS!
SWAT_BLUE_LessLethal_v1 = //Usual weapons
[
	["M79_EP1","1Rnd_HE_M203"],
	["M79_EP1","1Rnd_Smoke_M203"]

];
SWAT_BLUE_LessLethal_v2 =  //Unusual weapons
[
	["M32_EP1","6Rnd_HE_M203"],
	["M32_EP1","6Rnd_Smoke_M203"]
];
SWAT_BLUE_LessLethal_v3 = SWAT_BLUE_LessLethal_v2; //Rare weapons

SWAT_BLUE_LessLethal_v4 = SWAT_BLUE_LessLethal_v2; //Legendary	weapons






SWAT_BLUE_Shield_v1 = //Usual weapons
[
	//EMPTY
];
SWAT_BLUE_Shield_v2 =  //Unusual weapons
[
	//EMPTY
];
SWAT_BLUE_Shield_v3 = //Rare weapons
[
	//EMPTY
];
SWAT_BLUE_Shield_v4 = //Legendary	weapons
[
	//EMPTY
];



Sniper_BLUE_SMG_v1 = //Usual weapons
[
	["MP5SD","30Rnd_9x19_MP5SD"]
];
Sniper_BLUE_SMG_v2 =  //Unusual weapons
[
	["Bizon_Silenced","64Rnd_9x19_SD_Bizon"]
	//["Evo_ACR","20Rnd_9x19_EVO"],
];
Sniper_BLUE_SMG_v3 = //Rare weapons
[
	["Evo_mrad_ACR","20Rnd_9x19_EVO"]
];
Sniper_BLUE_SMG_v4 = //Legendary	weapons
[
	["evo_sd_ACR","20Rnd_9x19_EVOSD"]
];




Sniper_BLUE_AssaultRifle_v1 = //Usual weapons
[
	["M16A4_ACG","30Rnd_556x45_Stanag"]
];
Sniper_BLUE_AssaultRifle_v2 =  //Unusual weapons
[
	["G36a","30Rnd_556x45_G36"]
];
Sniper_BLUE_AssaultRifle_v3 = //Rare weapons
[
	["BAF_L85A2_RIS_ACOG","30Rnd_556x45_Stanag"]
];
Sniper_BLUE_AssaultRifle_v4 = //Legendary	weapons
[
	["m8_tws_sd","30Rnd_556x45_G36SD"]
];




Sniper_BLUE_SniperRifle_v1 = //Usual weapons
[
	["M24","5Rnd_762x51_M24"]
];
Sniper_BLUE_SniperRifle_v2 =  //Unusual weapons
[
	["M4SPR","20Rnd_556x45_Stanag"]
];
Sniper_BLUE_SniperRifle_v3 = //Rare weapons
[
	["DMR","20Rnd_762x51_DMR"]
];
Sniper_BLUE_SniperRifle_v4 = //Legendary	weapons
[
	["BAF_LRR_scoped","5Rnd_86x70_L115A1"]
];





Cop_BLUE_HandGuns = [Cop_BLUE_HandGun_v1, Cop_BLUE_HandGun_v2, Cop_BLUE_HandGun_v3, Cop_BLUE_HandGun_v4];
Cop_BLUE_Shotguns = [Cop_BLUE_Shotgun_v1, Cop_BLUE_Shotgun_v2, Cop_BLUE_Shotgun_v3, Cop_BLUE_Shotgun_v4];
Cop_BLUE_SMGs = [Cop_BLUE_SMG_v1, Cop_BLUE_SMG_v2, Cop_BLUE_SMG_v3, Cop_BLUE_SMG_v4];
Cop_BLUE_AssaultRifles = [Cop_BLUE_AssaultRifle_v1, Cop_BLUE_AssaultRifle_v2, Cop_BLUE_AssaultRifle_v3, Cop_BLUE_AssaultRifle_v4];

SWAT_BLUE_SMGs = [SWAT_BLUE_SMG_v1, SWAT_BLUE_SMG_v2, SWAT_BLUE_SMG_v3, SWAT_BLUE_SMG_v4];
SWAT_BLUE_Shotguns = [SWAT_BLUE_Shotgun_v1, SWAT_BLUE_Shotgun_v2, SWAT_BLUE_Shotgun_v3, SWAT_BLUE_Shotgun_v4];
SWAT_BLUE_AssaultRifles = [SWAT_BLUE_AssaultRifle_v1, SWAT_BLUE_AssaultRifle_v2, SWAT_BLUE_AssaultRifle_v3, SWAT_BLUE_AssaultRifle_v4];	
SWAT_BLUE_LessLethals = [SWAT_BLUE_LessLethal_v1, SWAT_BLUE_LessLethal_v2, SWAT_BLUE_LessLethal_v3, SWAT_BLUE_LessLethal_v4];	
SWAT_BLUE_Shields = [SWAT_BLUE_Shield_v1, SWAT_BLUE_Shield_v2, SWAT_BLUE_Shield_v3, SWAT_BLUE_Shield_v4];

Sniper_BLUE_SMGs = [Sniper_BLUE_SMG_v1, Sniper_BLUE_SMG_v2, Sniper_BLUE_SMG_v3, Sniper_BLUE_SMG_v4];
Sniper_BLUE_AssaultRifles = [Sniper_BLUE_AssaultRifle_v1, Sniper_BLUE_AssaultRifle_v2, Sniper_BLUE_AssaultRifle_v3, Sniper_BLUE_AssaultRifle_v4];
Sniper_BLUE_SniperRifles = [Sniper_BLUE_SniperRifle_v1, Sniper_BLUE_SniperRifle_v2, Sniper_BLUE_SniperRifle_v3, Sniper_BLUE_SniperRifle_v4];
