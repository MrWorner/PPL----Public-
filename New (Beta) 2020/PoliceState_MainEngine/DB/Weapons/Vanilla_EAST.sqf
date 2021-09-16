//Vanilla_EAST.sqf


//*******************************

//**WEAPONS
//Usual weapons %70 		v1
//Unusual weapons %70	 v2
//Rare weapons %70 		v3
//Legendary	weapons			 v4


//**CLASSES EAST
// Assaulter with SMG					| EAST_SMG_v1 = [];
// Assaulter with shotgun				| EAST_Shotgun_v1 = [];
// Assaulter with Assault Rifle			| EAST_AssaultRifle_v1 = [];
// Assaulter with Less lethal			| EAST_LessLethal_v1 = [];
// Assaulter with Shield				| EAST_Shield_v1 = [];

// Sniper with SD SGM					| EAST_SMG_v1 = [];
// Sniper with SD Assault Rifle			| EAST_AssaultRifle_v1 = [];
// Sniper with sniper rifle (can be SD)	| EAST_SniperRifle = [];

//**CLASSES EAST
//EAST with HandGun						| EAST_HandGun_v1 = [];
//EAST with Sotgun						| EAST_Sotgun_v1 = [];
//EAST with SMG							| EAST_SMG_v1 = [];
//EAST with Assault Rifle				| EAST_AssaultRifle_v1 = [];





EAST_HandGun_v1 = //Usual weapons
[
	["Colt1911","7Rnd_45ACP_1911"],
	["M9","15Rnd_9x19_M9"],
	["Makarov","8Rnd_9x18_Makarov"] // ??LESS LETHAL??
];
EAST_HandGun_v2 = //Unusual weapons
[
	["glock17_EP1","17Rnd_9x19_glock17"]
];
EAST_HandGun_v3 = //Rare weapons
[
	["revolver_EP1","6Rnd_45ACP"]
];
EAST_HandGun_v4 = //Legendary	weapons
[
	["revolver_gold_EP1","6Rnd_45ACP"]
];



EAST_Shotgun_v1 = //Usual weapons
[
	["M1014","8Rnd_B_Beneli_Pellets"]//LESS LETHAL!
];
EAST_Shotgun_v2 =  //Unusual weapons
[
	["Saiga12K","8Rnd_B_Saiga12_Pellets"]
];
EAST_Shotgun_v3 =  //Rare weapons
[
	["AA12_PMC","20Rnd_B_AA12_Pellets"]
];

EAST_Shotgun_v4 = EAST_Shotgun_v2; //Legendary weapons




EAST_SMG_v1 = //Usual weapons
[
	["Sa61_EP1","10Rnd_B_765x17_Ball"]
];
EAST_SMG_v2 =  //Unusual weapons
[
	["UZI_EP1","30Rnd_9x19_UZI"]
];
EAST_SMG_v3 = //Rare weapons
[
	["MP5A5","30Rnd_9x19_MP5"]
];
EAST_SMG_v4 =  //Legendary weapons
[
	["UZI_SD_EP1","30Rnd_9x19_UZI_SD"]
];




EAST_AssaultRifle_v1 = //Usual weapons
[
	["AK_74","30Rnd_545x39_AK"],
	["AK_47_M","30Rnd_762x39_AK47"],
	["AK_47_S","30Rnd_762x39_AK47"],
	["AKS_74","30Rnd_545x39_AK"]
];
EAST_AssaultRifle_v2 =  //Unusual weapons
[
	["AKS_74_U","30Rnd_545x39_AK"],
	["M16A2","30Rnd_556x45_Stanag"],
	["FN_FAL","20Rnd_762x51_FNFAL"]
	
];
EAST_AssaultRifle_v3 = //Rare weapons
[
	["Sa58P_EP1","30Rnd_762x39_SA58"],
	["Sa58V_EP1","30Rnd_762x39_SA58"],
	["M16A4","30Rnd_556x45_Stanag"],
	["M4A1","30Rnd_556x45_Stanag"],
	
	["AK_74_GL","30Rnd_545x39_AK","1Rnd_Smoke_GP25"],
	["M16A2GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M16A4_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"]
	
	
];
EAST_AssaultRifle_v4 =  //Legendary weapons
[
	["AKS_GOLD","30Rnd_762x39_AK47"],
	
	["AK_107_pso","30Rnd_545x39_AK"],
	["AK_107_kobra","30Rnd_545x39_AK"],
	["AKS_74_GOSHAWK","30Rnd_545x39_AK"],
	["AKS_74_kobra","30Rnd_545x39_AK"],
	["AKS_74_NSPU","30Rnd_545x39_AK"],
	["AKS_74_pso","30Rnd_545x39_AK"],
	["AKS_74_UN_kobra","30Rnd_545x39_AKSD"],
	
	["FN_FAL_ANPVS4","20Rnd_762x51_FNFAL"],
	
	["G36a","30Rnd_556x45_G36"],
	["G36A_camo","30Rnd_556x45_G36"],
	["G36_C_SD_eotech","30Rnd_556x45_G36SD"],
	["G36K","30Rnd_556x45_G36"],
	["G36K_camo","30Rnd_556x45_G36"],

	["M16A4_ACG","30Rnd_556x45_Stanag"],
	["M4A1_Aim","30Rnd_556x45_Stanag"],
	["M4A1_Aim_camo","30Rnd_556x45_Stanag"],
	["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"],
	["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],
	
	["SCAR_L_CQC_CCO_SD","30Rnd_556x45_StanagSD"],
	["SCAR_L_CQC_Holo","30Rnd_556x45_Stanag"],
	["SCAR_L_STD_HOLO","30Rnd_556x45_Stanag"],
	["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"],
	["SCAR_H_CQC_CCO","20Rnd_762x51_B_SCAR"],
	["SCAR_H_CQC_CCO_SD","20Rnd_762x51_SB_SCAR"],
	["SCAR_H_STD_TWS_SD","20Rnd_762x51_SB_SCAR"],
	
	["Sa58V_RCO_EP1","30Rnd_762x39_SA58"],
	["Sa58V_CCO_EP1","30Rnd_762x39_SA58"],
	["CZ805_A1_ACR","30Rnd_556x45_G36"],
	
	["M8_carbine","30Rnd_556x45_G36"],
	["M8_compact","30Rnd_556x45_G36"],
	["m8_compact_pmc","30Rnd_556x45_G36"],
	["m8_carbine_pmc","30Rnd_556x45_G36"],
	["m8_holo_sd","30Rnd_556x45_G36SD"],
	["m8_tws","30Rnd_556x45_G36"],
	["m8_tws_sd","30Rnd_556x45_G36SD"],
	
	["BAF_L85A2_RIS_ACOG","30Rnd_556x45_Stanag"],
	["BAF_L85A2_RIS_CWS","30Rnd_556x45_Stanag"],
	["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"],
	["BAF_L85A2_RIS_SUSAT","30Rnd_556x45_Stanag"],
	["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"],
	
	["CZ805_A2_ACR","30Rnd_556x45_G36"],
	["CZ805_A2_SD_ACR","30Rnd_556x45_G36SD"],
	
	["AK_107_GL_kobra","30Rnd_545x39_AK","1Rnd_Smoke_GP25"],
	["AK_107_GL_pso","30Rnd_545x39_AK","1Rnd_Smoke_GP25"],
	["AK_74_GL_kobra","30Rnd_545x39_AK","1Rnd_Smoke_GP25"],	
	
	["M16A4_ACG_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A1_HWS_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A1_HWS_GL_camo","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A1_HWS_GL_SD_Camo","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A1_RCO_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A1_RCO_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M4A3_RCO_GL_EP1","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	
	["SCAR_L_CQC_EGLM_Holo","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["SCAR_L_STD_EGLM_RCO","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["SCAR_L_STD_EGLM_TWS","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["SCAR_H_STD_EGLM_Spect","20Rnd_762x51_B_SCAR","1Rnd_Smoke_M203"],
	
	["M8_carbineGL","30Rnd_556x45_G36","1Rnd_Smoke_M203"],
	
	["BAF_L85A2_UGL_ACOG","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["BAF_L85A2_UGL_Holo","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["BAF_L85A2_UGL_SUSAT","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	
	["CZ805_A1_GL_ACR","30Rnd_556x45_G36","1Rnd_Smoke_M203"],
	["CZ805_B_GL_ACR","20Rnd_762x51_B_SCAR","1Rnd_Smoke_M203"]
	
	
]; //Legendary	weapons

	

//LessLethal GRENADE LAUNCHERS!
EAST_LessLethal_v1 = //Usual weapons
[
	
];
EAST_LessLethal_v2 =  //Unusual weapons
[
	
];
EAST_LessLethal_v3 = EAST_LessLethal_v2; //Rare weapons

EAST_LessLethal_v4 = EAST_LessLethal_v2; //Legendary weapons



EAST_SniperRifle_v1 = //Usual weapons
[
	["huntingrifle","5x_22_LR_17_HMR"],
	["LeeEnfield","10x_303"]
];
EAST_SniperRifle_v2 =  //Unusual weapons
[
	["SVD","10Rnd_762x54_SVD"],
	["SVD_CAMO","10Rnd_762x54_SVD"],
	["SVD_des_EP1","10Rnd_762x54_SVD"]
];
EAST_SniperRifle_v3 = //Rare weapons
[
	["M8_sharpshooter","30Rnd_556x45_G36"],
	["VSS_vintorez","10Rnd_9x39_SP5_VSS"],
	["M24","5Rnd_762x51_M24"],
	["M24_des_EP1","5Rnd_762x51_M24"]
	
];
EAST_SniperRifle_v4 = //Legendary weapons
[
	["SVD_NSPU_EP1","10Rnd_762x54_SVD"],
	["KSVK","5Rnd_127x108_KSVK"],
	["M4SPR","20Rnd_556x45_Stanag"]
	
];



EAST_MachineGun_v1 = //Usual weapons
[
	["RPK_74","45Rnd_545x39_RPK"]
];
EAST_MachineGun_v2 = //Unusual weapons
[
	["PK","100Rnd_762x54_PK"]
];
EAST_MachineGun_v3 = //Rare weapons
[
	["M60A4_EP1","100Rnd_762x51_M240"]
];
EAST_MachineGun_v4 = //Legendary weapons
[
	["Pecheneg","100Rnd_762x54_PK"],
	["M249_EP1","200Rnd_556x45_M249"],
	["m240_scoped_EP1","100Rnd_762x51_M240"],
	["M249_m145_EP1","200Rnd_556x45_M249"],
	["M249_TWS_EP1","200Rnd_556x45_M249"],
	["MG36","100Rnd_556x45_BetaCMag"],
	["MG36_camo","100Rnd_556x45_BetaCMag"],
	["Mk_48","100Rnd_762x51_M240"],
	["Mk_48_DES_EP1","100Rnd_762x51_M240"],
	["M8_SAW","30Rnd_556x45_G36"],
	["BAF_L110A1_Aim","200Rnd_556x45_L110A1"],
	["BAF_L7A2_GPMG","100Rnd_762x51_M240"],
	["UK59_ACR","100Rnd_762x54_PK"]
];









EAST_HandGuns = [EAST_HandGun_v1, EAST_HandGun_v2, EAST_HandGun_v3, EAST_HandGun_v4];
EAST_SMGs = [EAST_SMG_v1, EAST_SMG_v2, EAST_SMG_v3, EAST_SMG_v4];
EAST_Shotguns = [EAST_Shotgun_v1, EAST_Shotgun_v2, EAST_Shotgun_v3, EAST_Shotgun_v4];
EAST_AssaultRifles = [EAST_AssaultRifle_v1, EAST_AssaultRifle_v2, EAST_AssaultRifle_v3, EAST_AssaultRifle_v4];	
EAST_LessLethals = [EAST_LessLethal_v1, EAST_LessLethal_v2, EAST_LessLethal_v3, EAST_LessLethal_v4];	
EAST_SniperRifles = [EAST_SniperRifle_v1, EAST_SniperRifle_v2, EAST_SniperRifle_v3, EAST_SniperRifle_v4];
EAST_MachineGuns =[EAST_MachineGun_v1,EAST_MachineGun_v2,EAST_MachineGun_v3,EAST_MachineGun_v4];

