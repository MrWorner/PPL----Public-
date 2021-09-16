//GunStore_Prices.sqf

GunStore_HandGuns_ALL = 
[
	[100,"glock17_EP1",50,"17Rnd_9x19_glock17"],
	[100,"Colt1911",50,"7Rnd_45ACP_1911"],
	[100,"M9",50,"15Rnd_9x19_M9"],
	[100,"Makarov",50,"8Rnd_9x18_Makarov"]
	//[100,"M9SD",50,"15Rnd_9x19_M9SD"],
	
	//[100,"MakarovSD",50,"8Rnd_9x18_MakarovSD"],
	//[100,"revolver_EP1",50,"6Rnd_45ACP"],
	//[100,"revolver_gold_EP1",50,"6Rnd_45ACP"],
	//[100,"CZ_75_P_07_DUTY",50,"15Rnd_9x19_M9"],
	//[100,"CZ_75_D_COMPACT",50,"10Rnd_9x19_Compact"],
	//[100,"CZ_75_SP_01_PHANTOM",50,"18Rnd_9x19_Phantom"],
	//[100,"CZ_75_SP_01_PHANTOM_SD",50,"18Rnd_9x19_PhantomSD"]
];

GunStore_ShotGuns_ALL = 
[
	[200,"M1014",50,"8Rnd_B_Beneli_74Slug"], //8Rnd_B_Beneli_Pellets
	[200,"Saiga12K",50,"8Rnd_B_Saiga12_74Slug"],//8Rnd_B_Saiga12_Pellets
	[200,"AA12_PMC",50,"20Rnd_B_AA12_74Slug"]//20Rnd_B_AA12_Pellets
	//["",50,""],
];


GunStore_SMGs_ALL = 
[
	//[500,"Bizon_Silenced",50,"64Rnd_9x19_SD_Bizon"],
	[500,"Bizon",50,"64Rnd_9x19_Bizon"],
	[500,"Sa61_EP1",50,"10Rnd_B_765x17_Ball"],
	[500,"UZI_EP1",50,"30Rnd_9x19_UZI"],
	[500,"UZI_SD_EP1",50,"30Rnd_9x19_UZI_SD"],
	[500,"MP5A5",50,"30Rnd_9x19_MP5"]
	//[500,"MP5SD",50,"30Rnd_9x19_MP5SD"],
	//[500,"Evo_ACR",50,"20Rnd_9x19_EVO"],
	//[500,"Evo_mrad_ACR",50,"20Rnd_9x19_EVO"],
	//[500,"evo_sd_ACR",50,"20Rnd_9x19_EVOSD"]
	//["",50,""],

];

//********************************************

GunStore_AssaultRifles_ALL = 
[
	[1000,"AK_74",50,"30Rnd_545x39_AK"],
	[1000,"AK_47_M",50,"30Rnd_762x39_AK47"],
	[1000,"AK_47_S",50,"30Rnd_762x39_AK47"],
	//[1000,"AKS_GOLD",50,"30Rnd_762x39_AK47"],
	[1000,"AKS_74",50,"30Rnd_545x39_AK"],
	[1000,"AKS_74_U",50,"30Rnd_545x39_AK"],
	
	[1000,"FN_FAL",50,"20Rnd_762x51_FNFAL"],
	
	//[1000,"G36C",50,"30Rnd_556x45_G36"],
	//[1000,"G36C_camo",50,"30Rnd_556x45_G36"],
	
	[1000,"M16A2",50,"30Rnd_556x45_Stanag"],
	[1000,"M16A4",50,"30Rnd_556x45_Stanag"],
	[1000,"M4A1",50,"30Rnd_556x45_Stanag"]
	
	//[1000,"SCAR_L_CQC",50,"30Rnd_556x45_Stanag"],
	
	//[1000,"Sa58P_EP1",50,"30Rnd_762x39_SA58"],
	//[1000,"Sa58V_EP1",50,"30Rnd_762x39_SA58"]
];



GunStore_AssaultRifles_SCOPE_ALL = 
[

	[2000,"AK_107_pso",50,"30Rnd_545x39_AK"],
	[2000,"AK_107_kobra",50,"30Rnd_545x39_AK"],
	[2000,"AKS_74_GOSHAWK",50,"30Rnd_545x39_AK"],
	[2000,"AKS_74_kobra",50,"30Rnd_545x39_AK"],
	[2000,"AKS_74_NSPU",50,"30Rnd_545x39_AK"],
	[2000,"AKS_74_pso",50,"30Rnd_545x39_AK"],
	[2000,"AKS_74_UN_kobra",50,"30Rnd_545x39_AKSD"],
	
	[2000,"FN_FAL_ANPVS4",50,"20Rnd_762x51_FNFAL"],
	
	[2000,"G36a",50,"30Rnd_556x45_G36"],
	[2000,"G36A_camo",50,"30Rnd_556x45_G36"],
	[2000,"G36_C_SD_eotech",50,"30Rnd_556x45_G36SD"],
	[2000,"G36K",50,"30Rnd_556x45_G36"],
	[2000,"G36K_camo",50,"30Rnd_556x45_G36"],

	[2000,"M16A4_ACG",50,"30Rnd_556x45_Stanag"],
	[2000,"M4A1_Aim",50,"30Rnd_556x45_Stanag"],
	[2000,"M4A1_Aim_camo",50,"30Rnd_556x45_Stanag"],
	[2000,"M4A1_AIM_SD_camo",50,"30Rnd_556x45_StanagSD"],
	[2000,"M4A3_CCO_EP1",50,"30Rnd_556x45_Stanag"],
	
	[2000,"SCAR_L_CQC_CCO_SD",50,"30Rnd_556x45_StanagSD"],
	[2000,"SCAR_L_CQC_Holo",50,"30Rnd_556x45_Stanag"],
	[2000,"SCAR_L_STD_HOLO",50,"30Rnd_556x45_Stanag"],
	[2000,"SCAR_L_STD_Mk4CQT",50,"30Rnd_556x45_Stanag"],
	[2000,"SCAR_H_CQC_CCO",50,"20Rnd_762x51_B_SCAR"],
	[2000,"SCAR_H_CQC_CCO_SD",50,"20Rnd_762x51_SB_SCAR"],
	[2000,"SCAR_H_STD_TWS_SD",50,"20Rnd_762x51_SB_SCAR"],
	
	[2000,"Sa58V_RCO_EP1",50,"30Rnd_762x39_SA58"],
	[2000,"Sa58V_CCO_EP1",50,"30Rnd_762x39_SA58"],
	[2000,"CZ805_A1_ACR",50,"30Rnd_556x45_G36"],
	
	[2000,"M8_carbine",50,"30Rnd_556x45_G36"],
	[2000,"M8_compact",50,"30Rnd_556x45_G36"],
	[2000,"m8_compact_pmc",50,"30Rnd_556x45_G36"],
	[2000,"m8_carbine_pmc",50,"30Rnd_556x45_G36"],
	[2000,"m8_holo_sd",50,"30Rnd_556x45_G36SD"],
	[2000,"m8_tws",50,"30Rnd_556x45_G36"],
	[2000,"m8_tws_sd",50,"30Rnd_556x45_G36SD"],
	
	[2000,"BAF_L85A2_RIS_ACOG",50,"30Rnd_556x45_Stanag"],
	[2000,"BAF_L85A2_RIS_CWS",50,"30Rnd_556x45_Stanag"],
	[2000,"BAF_L85A2_RIS_Holo",50,"30Rnd_556x45_Stanag"],
	[2000,"BAF_L85A2_RIS_SUSAT",50,"30Rnd_556x45_Stanag"],
	[2000,"BAF_L86A2_ACOG",50,"30Rnd_556x45_Stanag"],
	
	[2000,"CZ805_A2_ACR",50,"30Rnd_556x45_G36"],
	[2000,"CZ805_A2_SD_ACR",50,"30Rnd_556x45_G36SD"]
];


GunStore_AssaultRifles_GP_ALL = 
[
	[2000,"AK_74_GL",50,"30Rnd_545x39_AK",50,"1Rnd_Smoke_GP25"],
	[2000,"M16A2GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[2000,"M16A4_GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"]
];


GunStore_AssaultRifles_GP_SCOPE_ALL = 
[
	[3000,"AK_107_GL_kobra",50,"30Rnd_545x39_AK",50,"1Rnd_Smoke_GP25"],
	[3000,"AK_107_GL_pso",50,"30Rnd_545x39_AK",50,"1Rnd_Smoke_GP25"],
	[3000,"AK_74_GL_kobra",50,"30Rnd_545x39_AK",50,"1Rnd_Smoke_GP25"],	
	
	[3000,"M16A4_ACG_GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A1_HWS_GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A1_HWS_GL_camo",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A1_HWS_GL_SD_Camo",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A1_RCO_GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A1_RCO_GL",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"M4A3_RCO_GL_EP1",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	
	[3000,"SCAR_L_CQC_EGLM_Holo",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"SCAR_L_STD_EGLM_RCO",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"SCAR_L_STD_EGLM_TWS",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"SCAR_H_STD_EGLM_Spect",50,"20Rnd_762x51_B_SCAR",50,"1Rnd_Smoke_M203"],
	
	[3000,"M8_carbineGL",50,"30Rnd_556x45_G36",50,"1Rnd_Smoke_M203"],
	
	[3000,"BAF_L85A2_UGL_ACOG",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"BAF_L85A2_UGL_Holo",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	[3000,"BAF_L85A2_UGL_SUSAT",50,"30Rnd_556x45_Stanag",50,"1Rnd_Smoke_M203"],
	
	[3000,"CZ805_A1_GL_ACR",50,"30Rnd_556x45_G36",50,"1Rnd_Smoke_M203"],
	[3000,"CZ805_B_GL_ACR",50,"20Rnd_762x51_B_SCAR",50,"1Rnd_Smoke_M203"]
];

//********************************************


GunStore_SniperRifles_ALL = 
[
	[3000,"LeeEnfield",50,"10x_303"],
	[3000,"huntingrifle",50,"5x_22_LR_17_HMR"],
	[3000,"SVD",50,"10Rnd_762x54_SVD"]
	
	
	//[3000,"M14_EP1",50,"20Rnd_762x51_DMR"],
	//[3000,"SCAR_H_LNG_Sniper",50,"20Rnd_762x51_B_SCAR"],
	//[3000,"SCAR_H_LNG_Sniper_SD",50,"20Rnd_762x51_SB_SCAR"],
	//[3000,"VSS_vintorez",50,"10Rnd_9x39_SP5_VSS"],
	//[3000,"DMR",50,"20Rnd_762x51_DMR"],
	//[3000,"KSVK",50,"5Rnd_127x108_KSVK"],
	//[3000,"m107",50,"10Rnd_127x99_m107"],
	//[3000,"m107_TWS_EP1",50,"10Rnd_127x99_m107"],
	//[3000,"M110_NVG_EP1",50,"20Rnd_762x51_B_SCAR"],
	//[3000,"M110_TWS_EP1",50,"20Rnd_762x51_B_SCAR"],
	//[3000,"M24",50,"5Rnd_762x51_M24"],
	//[3000,"M24_des_EP1",50,"5Rnd_762x51_M24"],	
	///[3000,"M40A3",50,"5Rnd_762x51_M24"],
	//[3000,"M4SPR",50,"20Rnd_556x45_Stanag"],
	
	//[3000,"SVD_CAMO",50,"10Rnd_762x54_SVD"],
	//[3000,"SVD_des_EP1",50,"10Rnd_762x54_SVD"],
	//[3000,"SVD_NSPU_EP1",50,"10Rnd_762x54_SVD"],
	//[3000,"M8_sharpshooter",50,"30Rnd_556x45_G36"],
	//[3000,"BAF_AS50_scoped",50,"5Rnd_127x99_as50"],
	//[3000,"BAF_AS50_TWS",50,"5Rnd_127x99_as50"],
	//[3000,"BAF_LRR_scoped",50,"5Rnd_86x70_L115A1"],
	//[3000,"BAF_LRR_scoped_W",50,"5Rnd_86x70_L115A1"],
	//[3000,"CZ_750_S1_ACR",50,"10Rnd_762x51_CZ750"]
];


GunStore_MachineGuns_ALL = 
[
	[3000,"PK",50,"100Rnd_762x54_PK"],
	[3000,"RPK_74",50,"45Rnd_545x39_RPK"]
	
	//[3000,"m240_scoped_EP1",50,"100Rnd_762x51_M240"],
	//[3000,"M249_m145_EP1",50,"200Rnd_556x45_M249"],
	//[3000,"M249_EP1",50,"200Rnd_556x45_M249"],
	//[3000,"M249_TWS_EP1",50,"200Rnd_556x45_M249"],
	//[3000,"M60A4_EP1",50,"100Rnd_762x51_M240"],
	//[3000,"MG36",50,"100Rnd_556x45_BetaCMag"],
	//[3000,"MG36_camo",50,"100Rnd_556x45_BetaCMag"],
	//[3000,"Mk_48",50,"100Rnd_762x51_M240"],
	//[3000,"Mk_48_DES_EP1",50,"100Rnd_762x51_M240"],
	//[3000,"Pecheneg",50,"100Rnd_762x54_PK"],
	
	//[3000,"M8_SAW",50,"30Rnd_556x45_G36"],
	//[3000,"BAF_L110A1_Aim",50,"200Rnd_556x45_L110A1"],
	//[3000,"BAF_L7A2_GPMG",50,"100Rnd_762x51_M240"],
	//[3000,"UK59_ACR",50,"100Rnd_762x54_PK"]
];


GunStore_GrenadeLaunchers_ALL = 
[
	[3000,"M32_EP1",50,"6Rnd_HE_M203"],
	[3000,"M79_EP1",50,"1Rnd_HE_M203"]
];