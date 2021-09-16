//DB_PoliceWave_Chernarus_esu.sqf

// _Lv_SAMPLE =
// [
 	 // [
		//	525,6, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		// "ARMED APC",3,[1,2,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		// "lae_chrn_plce1", //Driver gunner commander SKIN
		// "lae_chrn_plce1", //Crew
		// [
				// "SNIPER", 100,"GasMask", ["SWAT_blue", [ [1,2,3] , [50,50,50] ], 1], 6, //1 Spec Crew, Chance to be spawned (if not spawned then DEFAULT SKIN),Identity, WEAPON CLASS, bonus score,
			// "SNIPER", 100,"GasMask",  ["SWAT_blue", [ [1,2,3] , [50,50,50] ], 2], 6, //1 Spec Crew, Chance to be spawned (if not spawned then DEFAULT SKIN),Identity, WEAPON CLASS, bonus score,
			// "BERRET_MAN", 25,"Green_berret",  ["Delta2", [ [4,5] , [50,50] ], 4], 6, //1 Spec Crew, Chance to be spawned (if not spawned then DEFAULT SKIN),Identity, WEAPON CLASS, bonus score,
		// ],
			//[
			//	"lae_chrn_plce1","GasMask"	//Skin for Identity
			//	"BERRET_MAN","GasMask2"	//Skin for Identity
			//]
	 // ],  
// ];




private["_Lv_1", "_Lv_2","_Lv_3","_Lv_4","_Lv_5","_Lv_6","_bonus"];


_Lv_1 =
[
	 //AMERICAN POLICE CAR PACK
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPDSL_Patrol",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPD_Patrol",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ],  
	 
	 
	 //VILAS PACK
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_alfa_ue_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_mondeo_ue_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_kia_policeEU_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_Lanos_pol2_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_octavia_police_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		2, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_passat_ue_cdf",[1,1,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ] 
];

_Lv_2 =
[	
	//AMERICAN POLICE CAR PACK
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPDSL_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPD_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ],  
	 
	 
	 //VILAS PACK
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_alfa_ue_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_mondeo_ue_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_kia_policeEU_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_Lanos_pol2_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_octavia_police_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ], 
	 [
		4, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_passat_ue_cdf",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ],
	 
	 //POLICE VANS
	  
	 [
		6, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_transit_pol_cdf",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ],  
	 [
		6, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_vwt4_pol_cdf",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	 ],
	 [
		6, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"kpfs_uaz451_lm",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	]
	 
];

_Lv_3 =
[
	//AMERICAN POLICE CAR PACK
	 [
		8, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPDSL_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ], 
	 [
		8, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_NYPD_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ],
	 
 
	 //POLICE VANS
	
	
	 [
		12, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_transit_pol_cdf",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ],  
	 [
		12, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"VIL_vwt4_pol_cdf",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ],
	 [
		12, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"kpfs_uaz451_lm",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	],
	 
	 //SWAT APC
	   
	 [
		16, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"BRDM2IMPPolicePatrol",[1,6,0,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ],
	   
	 [
		20, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"caiman",[1,8,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	 ]
];

_Lv_4 =
[
	//AMERICAN POLICE CARS
	 [
		16, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_UnmarkedW_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ], 
	 [
		16, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_UnmarkedG_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ], 
	 [
		16, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"CVPI_UnmarkedB_Patrol",[1,3,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ], 
	 //HRT APC
	 [
		40, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"LGN_HMGDES",[1,8,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ], 
	 [
		24, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"blx_ridgeback_D",[1,4,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ], 
	 [
		12, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"vil_m1117_des",[1,1,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	 ]
];

_Lv_5 =
[
     [
		88, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"ukf_110_des",[1,7,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	 ],
	  [
		32, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"ukf_wmik_des",[1,1,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	 ],
	  [
		24, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"4d_cvrt_Scim_d",[1,0,1,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	 ],
	  [
		48, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"rksl_foxhound_lppv",[1,3,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	 ],
	  [
		40, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"NZX_M1151_PMC5_M2",[1,3,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	 ]
];

_Lv_6 =
[
	  [
		144, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"M2A3_EP1",[1,6,1,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	 ],
	  [
		176, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"BAF_FV510_D",[1,7,1,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	 ],
	  [
		64, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"M1A2_US_TUSK_MG_EP1",[1,0,1,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	 ],
	  [
		160, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"blx_fv432_bulldog_RWS",[1,8,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	 ],
	  [
		64, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"BRDM2IMPM240_TKGUE",[1,1,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	 ]
];

//Unique units for every risk level


_bonusHeli =
[
	//lvl1
	[
	],
	//lvl2
	[
		0, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"usec_bell206_1",[1,0,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"US_Soldier_Pilot_EP1", //Driver gunner commander SKIN
		"US_Soldier_Pilot_EP1", //Crew
		[
		],
		[
		]
	],
	//lvl3
	[
		0, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"yup_MH60J",[1,7,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"US_Soldier_Pilot_EP1", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	],
	//lvl4
	[
		0, 3, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"gac_USAF_HH53E_DG",[1,19,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"US_Soldier_Pilot_EP1", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	],
	//lvl5
	[
		0, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"AH1Z",[1,0,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"US_Soldier_Pilot_EP1", //Driver gunner commander SKIN
		"US_Soldier_Pilot_EP1", //Crew
		[
		],
		[
		]
	],
	//lvl6
	[
		0, 5, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"AH64D_EP1",[1,0,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"US_Soldier_Pilot_EP1", //Driver gunner commander SKIN
		"US_Soldier_Pilot_EP1", //Crew
		[
		],
		[
		]
	]
];

_bonusGroundForces =
[
	//lvl1
	[
	],
	//lvl2
	[
		0, 0, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"kpfs_uaz451_lm",[1,5,0,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"lae_chrn_plce1", //Driver gunner commander SKIN
		"lae_chrn_plce1", //Crew
		[
		],
		[
		]
	],
	//lvl3
	[
		0, 2, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"ExA_RG31_M2",[1,5,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"FDF_SJ_M05", //Driver gunner commander SKIN
		"FDF_SJ_M05", //Crew
		[
		],
		[
		]
	],
	//lvl4
	[
		40, 4, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"LGN_HMGDES",[1,8,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Dictat5", //Driver gunner commander SKIN
		"Dictat5", //Crew
		[
		],
		[
		]
	],
	//lvl5
	[
		48, 8, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"rksl_foxhound_lppv_wd",[1,3,1,0], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"SBE_SOTG_MD", //Driver gunner commander SKIN
		"SBE_SOTG_GL", //Crew
		[
		],
		[
		]
	],
	//lvl6
	[
		176, 16, //COST of current pack, SetVar Police_RiskLevel_BonusScore
		"BAF_FV510_D",[1,7,1,1], //CAR type, [driver,crew size (only with DEFAULT SKIN! NOT TOTAL NUMBER),x Gunners,Commander]	
		"Navy_SEAL_diver", //Driver gunner commander SKIN
		"BritCom37", //Crew
		[
		],
		[
			"BritCom37","gasmask_red",
			"Navy_SEAL_diver","gasmask"
		]
	]
];


_bonus =[_bonusHeli, _bonusGroundForces];


//COMPLETE BUNDLE
PoliceWaveArray_Chernarus_esu = [_bonus, _Lv_1,_Lv_2,_Lv_3,_Lv_4,_Lv_5,_Lv_6];