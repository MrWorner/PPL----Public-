//Vanilla_BW.sqf


//*******************************

//**WEAPONS
//Usual weapons %70 		v1
//Unusual weapons %70	 v2
//Rare weapons %70 		v3
//Legendary	weapons			 v4


//**CLASSES BlackWater
// Assaulter with SMG					| BW_SMG_v1 = [];
// Assaulter with shotgun				| BW_Shotgun_v1 = [];
// Assaulter with Assault Rifle			| BW_AssaultRifle_v1 = [];
// Assaulter with Less lethal			| BW_LessLethal_v1 = [];
// Assaulter with Shield				| BW_Shield_v1 = [];

// Sniper with SD SGM					| BW_SMG_v1 = [];
// Sniper with SD Assault Rifle			| BW_AssaultRifle_v1 = [];
// Sniper with sniper rifle (can be SD)	| BW_SniperRifle = [];

//**CLASSES BlackWater
//BlackWater with HandGun						| BW_HandGun_v1 = [];
//BlackWater with Sotgun						| BW_Sotgun_v1 = [];
//BlackWater with SMG							| BW_SMG_v1 = [];
//BlackWater with Assault Rifle				| BW_AssaultRifle_v1 = [];





BW_HandGun_v1 = //Usual weapons
[
	["Colt1911","7Rnd_45ACP_1911"],
	["M9","15Rnd_9x19_M9"],
	["Makarov","8Rnd_9x18_Makarov"], // ??LESS LETHAL??
	["revolver_EP1","6Rnd_45ACP"],
	["CZ_75_P_07_DUTY","15Rnd_9x19_M9"],
	["CZ_75_D_COMPACT","10Rnd_9x19_Compact"],
	["CZ_75_SP_01_PHANTOM","18Rnd_9x19_Phantom"],
	["glock17_EP1","17Rnd_9x19_glock17"]
];
BW_HandGun_v2 = BW_HandGun_v1;//Unusual weapons

BW_HandGun_v3 = //Rare weapons
[
	["CZ_75_SP_01_PHANTOM_SD","18Rnd_9x19_PhantomSD"],
	["MakarovSD","8Rnd_9x18_MakarovSD"],
	["M9SD","15Rnd_9x19_M9SD"]
];


BW_HandGun_v4 = BW_HandGun_v3;//Legendary	weapons


	
	





BW_Shotgun_v1 = //Usual weapons
[
	["M1014","8Rnd_B_Beneli_74Slug"], 
	["Saiga12K","8Rnd_B_Saiga12_74Slug"]
	//["M1014","8Rnd_B_Beneli_Pellets"],
	//["Saiga12K","8Rnd_B_Saiga12_Pellets"]
];
BW_Shotgun_v2 =  BW_Shotgun_v1;//Unusual weapons

BW_Shotgun_v3 =  //Rare weapons
[
	["AA12_PMC","20Rnd_B_AA12_Pellets"],
	["AA12_PMC","20Rnd_B_AA12_74Slug"]
];

BW_Shotgun_v4 = BW_Shotgun_v3; //Legendary weapons




BW_SMG_v1 = //Usual weapons
[
	["Bizon_Silenced","64Rnd_9x19_SD_Bizon"],
	["Bizon","64Rnd_9x19_Bizon"],
	["Sa61_EP1","10Rnd_B_765x17_Ball"],
	["UZI_EP1","30Rnd_9x19_UZI"],
	["UZI_SD_EP1","30Rnd_9x19_UZI_SD"],
	["MP5A5","30Rnd_9x19_MP5"],
	["MP5SD","30Rnd_9x19_MP5SD"],
	["Evo_ACR","20Rnd_9x19_EVO"]
];
BW_SMG_v2 =  BW_SMG_v1;//Unusual weapons

BW_SMG_v3 = //Rare weapons
[
	["Evo_mrad_ACR","20Rnd_9x19_EVO"],
	["evo_sd_ACR","20Rnd_9x19_EVOSD"]
];
BW_SMG_v4 =  BW_SMG_v3;//Legendary weapons








BW_AssaultRifle_v1 = //Usual weapons
[
	["AK_74","30Rnd_545x39_AK"],
	["AK_47_M","30Rnd_762x39_AK47"],
	["AK_47_S","30Rnd_762x39_AK47"],
	["AKS_GOLD","30Rnd_762x39_AK47"],
	["AKS_74","30Rnd_545x39_AK"],
	["AKS_74_U","30Rnd_545x39_AK"],	
	["FN_FAL","20Rnd_762x51_FNFAL"],
	["G36C","30Rnd_556x45_G36"],
	["G36C_camo","30Rnd_556x45_G36"],
	["M16A2","30Rnd_556x45_Stanag"],
	["M16A4","30Rnd_556x45_Stanag"],
	["M4A1","30Rnd_556x45_Stanag"],
	["SCAR_L_CQC","30Rnd_556x45_Stanag"],
	["Sa58P_EP1","30Rnd_762x39_SA58"],
	["Sa58V_EP1","30Rnd_762x39_SA58"],
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
	["AK_74_GL","30Rnd_545x39_AK","1Rnd_Smoke_GP25"],
	["M16A2GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"],
	["M16A4_GL","30Rnd_556x45_Stanag","1Rnd_Smoke_M203"]
];
BW_AssaultRifle_v2 =  BW_AssaultRifle_v1;//Unusual weapons
BW_AssaultRifle_v3 = //Rare weapons
[
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
];
BW_AssaultRifle_v4 =  BW_AssaultRifle_v3;//Legendary weapons


	

//LessLethal GRENADE LAUNCHERS!
BW_LessLethal_v1 = //Usual weapons
[
	
];
BW_LessLethal_v2 =  //Unusual weapons
[
	
];
BW_LessLethal_v3 = BW_LessLethal_v2; //Rare weapons

BW_LessLethal_v4 = BW_LessLethal_v2; //Legendary weapons



BW_SniperRifle_v1 = //Usual weapons
[
	["LeeEnfield","10x_303"],
	["huntingrifle","5x_22_LR_17_HMR"],
	["M14_EP1","20Rnd_762x51_DMR"],
	["SCAR_H_LNG_Sniper","20Rnd_762x51_B_SCAR"],
	["SCAR_H_LNG_Sniper_SD","20Rnd_762x51_SB_SCAR"],
	["VSS_vintorez","10Rnd_9x39_SP5_VSS"],
	["DMR","20Rnd_762x51_DMR"],
	["KSVK","5Rnd_127x108_KSVK"],
	["m107","10Rnd_127x99_m107"],
	["m107_TWS_EP1","10Rnd_127x99_m107"],
	["M110_NVG_EP1","20Rnd_762x51_B_SCAR"],
	["M110_TWS_EP1","20Rnd_762x51_B_SCAR"],
	["M24","5Rnd_762x51_M24"],
	["M24_des_EP1","5Rnd_762x51_M24"],	
	["M40A3","5Rnd_762x51_M24"],
	["M4SPR","20Rnd_556x45_Stanag"],
	["SVD","10Rnd_762x54_SVD"],
	["SVD_CAMO","10Rnd_762x54_SVD"],
	["SVD_des_EP1","10Rnd_762x54_SVD"],
	["SVD_NSPU_EP1","10Rnd_762x54_SVD"],
	["M8_sharpshooter","30Rnd_556x45_G36"],
	["BAF_AS50_scoped","5Rnd_127x99_as50"],
	["BAF_AS50_TWS","5Rnd_127x99_as50"],
	["BAF_LRR_scoped","5Rnd_86x70_L115A1"],
	["BAF_LRR_scoped_W","5Rnd_86x70_L115A1"],
	["CZ_750_S1_ACR","10Rnd_762x51_CZ750"]
];
BW_SniperRifle_v2 = BW_SniperRifle_v1; //Unusual weapons

BW_SniperRifle_v3 = BW_SniperRifle_v1;//Rare weapons

BW_SniperRifle_v4 = BW_SniperRifle_v1;//Legendary weapons



BW_MachineGun_v1 = //Usual weapons
[
	["m240_scoped_EP1","100Rnd_762x51_M240"],
	["M249_m145_EP1","200Rnd_556x45_M249"],
	["M249_EP1","200Rnd_556x45_M249"],
	["M249_TWS_EP1","200Rnd_556x45_M249"],
	["M60A4_EP1","100Rnd_762x51_M240"],
	["MG36","100Rnd_556x45_BetaCMag"],
	["MG36_camo","100Rnd_556x45_BetaCMag"],
	["Mk_48","100Rnd_762x51_M240"],
	["Mk_48_DES_EP1","100Rnd_762x51_M240"],
	["Pecheneg","100Rnd_762x54_PK"],
	["PK","100Rnd_762x54_PK"],
	["RPK_74","45Rnd_545x39_RPK"],
	["M8_SAW","30Rnd_556x45_G36"],
	["BAF_L110A1_Aim","200Rnd_556x45_L110A1"],
	["BAF_L7A2_GPMG","100Rnd_762x51_M240"],
	["UK59_ACR","100Rnd_762x54_PK"]
];
BW_MachineGun_v2 = BW_MachineGun_v1;//Unusual weapons

BW_MachineGun_v3 =  BW_MachineGun_v1;//Rare weapons

BW_MachineGun_v4 =  BW_MachineGun_v1;//Legendary weapons










BW_HandGuns = [BW_HandGun_v1, BW_HandGun_v2, BW_HandGun_v3, BW_HandGun_v4];
BW_SMGs = [BW_SMG_v1, BW_SMG_v2, BW_SMG_v3, BW_SMG_v4];
BW_Shotguns = [BW_Shotgun_v1, BW_Shotgun_v2, BW_Shotgun_v3, BW_Shotgun_v4];
BW_AssaultRifles = [BW_AssaultRifle_v1, BW_AssaultRifle_v2, BW_AssaultRifle_v3, BW_AssaultRifle_v4];	
BW_LessLethals = [BW_LessLethal_v1, BW_LessLethal_v2, BW_LessLethal_v3, BW_LessLethal_v4];	
BW_SniperRifles = [BW_SniperRifle_v1, BW_SniperRifle_v2, BW_SniperRifle_v3, BW_SniperRifle_v4];
BW_MachineGuns =[BW_MachineGun_v1,BW_MachineGun_v2,BW_MachineGun_v3,BW_MachineGun_v4];

