//-cpuCount=4 -exThreads=7 -world=chernarus -nopause -nosplash  -showScriptErrors -nologs

//player globalchat format [" = %1  ||  || ",];	
//hintc format [" = %1  ||  || ",];


//Color Buff by Dusty Nuttles (thanks to him!) <--------------------------------------------------------------------------COOL
// _hndl = ppEffectCreate ["colorCorrections", 1501];
// _hndl ppEffectEnable true;
// _hndl ppEffectAdjust [ 1, 1, 0, [0, 0, 0, -0.31],[1.9, 2.5, 1.64, 0.7],[0.2, 0.1, -0.5, 1.64]];
// _hndl ppEffectCommit 0;


//Color Buff by Dusty Nuttles (thanks to him!) <--------------------------------------------------------------------------COOL
// _hndl = ppEffectCreate ["colorCorrections", 1501];
// _hndl ppEffectEnable true;
// _hndl ppEffectAdjust [ 1, 1, 0, [0, 0, 0, -0.31],[1.9, 2.5, 1.64, 0.7],[0.2, 0.1, -0.5, 1.64]];
// _hndl ppEffectCommit 0;


// sleep 5;
// hint "1";
// _hndl ppEffectAdjust[1, 1.37, -0.011, [0, 0, 0, -0.53],[0, 0, 0, 1],[0, 0, 0, 0]];
// _hndl ppEffectCommit 2;
// sleep 5;
// hint "2";

// _hndl ppEffectAdjust[1, 1.37, -0.011, [0, 0, 0, -0.53],[0, 0.27, 0.91, 1.32],[0.05, 0.27, -1.6, -0.69]];
// _hndl ppEffectCommit 2;
// sleep 5;
// hint "3";
// _hndl ppEffectAdjust[1, 1.11, -0.011, [0, 0, 0, -0.53],[0, 0.27, 0.91, 1.32],[0.05, 0.27, -1.6, -0.69]];
// _hndl ppEffectCommit 2;
// sleep 5;
// hint "4";
// _hndl ppEffectAdjust[1, 1, 0, [0, 0, 0, -0.32],[0, 0.27, 0.91, 1.32],[0.05, 0.27, -1.6, -0.69]];
// _hndl ppEffectCommit 2;
// sleep 5;
// hint "5";
// _hndl ppEffectAdjust[0.701, 1, 0, [0, 0, 0, -0.32],[0, 0.27, 0.91, 1.32],[0.05, 0.27, -1.6, -0.69]];  //лучшая
// _hndl ppEffectCommit 0;
// sleep 5;
// hint "6";
// _hndl ppEffectAdjust[0.701, 1, 0, [0, 0, 0, -0.32],[0, 0.27, 2.77, 1.32],[0.05, 0.27, -1.6, -0.69]];  //СИНЮШНАЯ
// _hndl ppEffectCommit 2;


player addweapon "nvgoggles";
private ["_TestMessage","_SHOWTestMessage","_SHOWTMessageLVL1", "_x", "_marker","_campSide1","_campSide2","_campSide3","_campSide4"];

//LEVEL 0 SETTINGS
if(isServer)then
{
	WEST setFriend [EAST, 1];
	WEST setFriend [RESISTANCE, 1];
	EAST setFriend [WEST, 0];
	//EAST setFriend [sideEnemy, 1];
	//EAST setFriend [sideFriendly, 0];
	EAST setFriend [RESISTANCE, 0];
	RESISTANCE setFriend [EAST, 1];
	RESISTANCE setFriend [WEST, 1];
	enableSaving [false, false];
	_campSide1 = createCenter west;
	_campSide2 = createCenter east;
	_campSide3 = createCenter resistance;
	_campSide4 = createCenter civilian;
};
//LEVEL 0 SETTINGS END



_TestMessage= "Hello World!";
_SHOWTestMessage = false; 
_SHOWTMessageLVL1 = true;
SHOWTMessageLVL2 = true; 
SHOWTMessageLVL3 = true;
ShowVar = false; // ShowVar.sqf
ShowVar2 = false; // ShowVar2.sqf
ENABLE_COP_AI = true;
ENABLE_BW_AI = true;
if(_SHOWTMessageLVL1)then{player globalchat "QWERTY";};

////////////////!!!!!!!!!!!!!!!!TCG
//q animate ["policeSirens",1]; q animate ["policeLightbar",1];

ServerLogic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [1,1,1], [], 0, "NONE"];

// Variables and Arrays
	Array_CopsSide = []; //BLUE, all police units (AI,players)
	Array_SuspectSide = [];//RED, all citizens that can or not be criminals (AI,players)
	Array_BlackWater = [];//BLACK WATER
	Array_ThirdForce = [];//GREEN. all guards and other groups, can be criminals (AI,players)
	Array_CivilainSide = [];//YELLOW. all citizens that cannot be criminals (AI,players)	
	Array_ArrestedGuys = [];//ARRESTED PEOPLE
	Array_SuspectsInChase = [];//Array of current suspects in a police chase
	Array_BW_SuspectsInChase = [];//Array of current suspects in a BLACK WATER chase
	
	Array_MedicalPersonal = []; //CIVILIAN. Medics
	Array_MedicalPersonalHOSPITAL = []; //CIVILIAN. Medics
	Array_FiremanPersonal = []; //CIVILIAN. Firemen
	
	Count_TotalCops = 0; //STATISTICS
	Count_TotalSuspects = 0; //STATISTICS
	Count_TotalBW = 0;// STATISTICS
	Count_TotalThirdForce = 0; //STATISTICS
	Count_TotalCivs = 0; //STATISTICS	
	Count_TotalArrested = 0; //STATISTICS	
	Count_TotalMedics = 0;  //STATISTICS	
	Count_TotalFirefighters = 0;  //STATISTICS	
	
	Count_KilledCops = 0; //STATISTICS
	Count_KilledSuspects = 0; //STATISTICS
	Count_KilledBW = 0; //STATISTICS
	Count_KilledThirdForce = 0; //STATISTICS
	Count_KilledCivs = 0; //STATISTICS
	Count_KilledMedics = 0; //STATISTICS
	Count_KilledFirefighters = 0; //STATISTICS
	
	Count_FriendlyFireCops = 0; //STATISTICS
	Count_FriendlySuspects = 0; //STATISTICS
	Count_FriendlyRes = 0; //STATISTICS
	Count_FriendlyBW = 0; //STATISTICS
	
	UnitsWIthMarkers = []; //Unts array OLD: [unit, marker]
	RegisteredUnitsWIthMarkers = []; //Registered units for checking AllUnits
	
	NeedToInvestigate = []; // Investigations array  "N1","N2"
	NeedToInvestigateSEARCH = []; // Investigations array (Search) "N2" 
	PatrolLocation = []; //Stores patrol spots  "z1","z2","z3"     //PatrolLocation = [ "z1","z2","z3","z4","z5","z6","z7","z8"];
	PoliceGroups = []; //Stores all police groups
	PoliceDeadGroups = []; //Stores all dead police groups (to use for new spawned cops)
	
	//BW
	BWNeedToInvestigate = []; // Investigations array  "N1","N2"
	BWNeedToInvestigateSEARCH = []; // Investigations array (Search) "N2"
	BWPatrolLocation = []; //Stores patrol spots
	BWGroups = []; //Stores all BW groups
	BWDeadGroups = []; //Stores all dead groups
	BW_SKINS = ["Soldier_Engineer_PMC"];
	BW_SKINS_FROM_ADDONS = ["Ard_PMC_1","Ard_PMC_2","Ard_PMC_3","Ard_PMC_4","Ard_PMC_5","Ard_PMC_6","Ard_PMC_7","Ard_PMC_8","Ard_PMC_9"];
	BW_SKINS = BW_SKINS + BW_SKINS_FROM_ADDONS;
	
	//**MEDIC MODULE
	ENABLE_Medic_AI = true;
	MedicGroups = [];
	MedicDeadGroups = [];//Stores all dead groups (to use for new spawned)
	//MedicCount = 0;//???
	Medic_TOTAL_WorkDoneCount = 0; 
	Count_TOTAL_DEAD_BODIES = 0;
	DeadBodyMARKERS_Array = [];
	Medic_PhoneCalls = [];
	
	//Hospital module
	if(isnil "HospitalArray")then{HospitalArray = [];};
	HospitalArrayCount = 0;
	HospitalAutopark = ["LandRover_Ambulance_Des_ACR","S1203_ambulance_EP1"];
	HospitalAutopark_ADDONS = ["kpfs_uaz451_ambulance","firetruck"];
	HospitalAutopark = HospitalAutopark + HospitalAutopark_ADDONS;
	HospitalParkingLot = [];
	
	//FIREFIGHTER MODULE
	ENABLE_Firefighter_AI = true;
	FirefighterGroups = [];
	FirefighterDeadGroups = [];//Stores all dead groups (to use for new spawned)
	Firefighter_TOTAL_WorkDoneCount = 0; 
	Count_TOTAL_DESTROYED_CARS = 0;
	Firefighter_PhoneCalls = [];
	
	//FireStation module
	if(isnil "FireStationArray")then{FireStationArray = [];};
	FireStationAutopark = ["V3S_Repair_TK_GUE_EP1"];//USMC_LHD_Crew_Red
	FireStationParkingLot = [];
	
	//Vehicle INFO
	AllVehicleCount = 0;
	LogicEffectFireArray = []; //GAME LOGIC
	
	//module_Taxi
	Array_TaxiDrivers = [];
	Var_TaxiOrderFinished = false;
	
	//Freindly fire
	FriendlyFireCIV = false;
	FriendlyFireWEST = false;
	FriendlyFireEAST = false;
	FriendlyFireRES = false;
	
	
	//module_Shop
	CafeArray = [];
	PizzaArray = [];
	EastFastFoodArray = [];
	GasStationArray = [];
	RepairArray = [];
	CarSellerArray = [];
	GunShopArray = [];
	CarShopArray = [];

	
	EastFastFoodCount = 0;
	PizzaCount = 0;
	CafeCount = 0;
	GasStationCount = 0;
	RepairCount = 0;
	CarSellerCount = 0;
	GunShopCount = 0;
	CarShopCount = 0;
	
	
	//GunStore CarShop
	Shop_ArrayItem = [];
	Shop_ArrayPrices = [];
	Shop_ArrayTypeItem = [];
	
	Shop_ArrayItemChosen = [];
	Shop_ArrayPricesChosen = [];
	Shop_ArrayTypeItemChosen = [];
	Shop_ArrayItemAmountChosen = [];
	
	Shop_TotalPriceToPay = 0;
	
	
	
	//module PoliceStation
	//WEST Police
	ALL_PoliceStations = [];

	PoliceStationCycle_Started = false;
	
	POLICE_RISK_LEVEL = 1; //Current Global wanted level
	POLICE_RISK_LEVEL_SCORE = 0; //Score to up POLICE_RISK_LEVEL (for POLICE_REQ_SCORE_ToLevelUP)
	POLICE_AVAILABLE_SCORE = 0; // Score to spawn police units
	POLICE_REQ_SCORE_ToLevelUP = 1; // Required score to up POLICE_RISK_LEVEL
	
	POLICE_BONUS_STAGE_Num = 1; //Bonus stage number to check if bonus was activated on current Risk Level.
	
	Count_Police_NewOfficers = 0; //Just count
	Count_PoliceStation = 0; //Just count
	
	LIMIT_PoliceUnits = 100; //Limit cops on the map. Can be changed by modules
	
	//Hopsital station
	HospitalCycle_Started = false;
	LIMIT_MedicUnits = 20;

	//Firestation
	FirestationCycle_Started = false;
	LIMIT_FirefighterUnits = 10;
	
	//RES BlackWater
	BW_RISK_LEVEL_SCORE = 0;
	
	//WEAPON REARM
	GLOBAL_WepPack_RH = [];
	
	//--DATABASE
	//Weapons	
	INVENTORY_NOT_A_WEAPON_EXCEPTION = ["ItemRadio","ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Binocular",""];//PRIMARY NOT WEAPONS
	INVENTORY_NOT_A_MAGAZINE_EXCEPTION = [];//NOT GRENADES

	
	[] execVM "PoliceState_MainEngine\DB\Weapons\NonLethalArsenal.sqf"; //Less Lethal Arsenal INFO
	//[] execVM "PoliceState_MainEngine\DB\Weapons\VanillaArsenal.sqf"; //Vanilla Arsenal
	//[] execVM "PoliceState_MainEngine\DB\Weapons\VanillaArsenalALL.sqf"; //Vanilla Arsenal
	//[] execVM "PoliceState_MainEngine\DB\Weapons\VanillaArsenalALL_SORTED.sqf"; //Vanilla Arsenal
	
	
	
	[] execVM "PoliceState_MainEngine\DB\Weapons\Vanilla_Cop_BLUE.sqf"; //SWAT (BLUE)
	[] execVM "PoliceState_MainEngine\DB\Weapons\Vanilla_EAST.sqf"; //EAST
	[] execVM "PoliceState_MainEngine\DB\Weapons\Vanilla_BW.sqf"; //BlackWater
	
	
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_Cop.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_WestDEFAULT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_NavySWAT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_CamoSWAT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_SheriffSWAT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_ESUSWAT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_BlackHRT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_GreenHRT.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_Delta1.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_Delta2.sqf"; //
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\Police\db_RHwep_OMEGA.sqf"; //
	
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\EAST\db_RHwep_EastDEFAULT.sqf"; //
	
	[] execVM "PoliceState_MainEngine\DB\Weapons\v2.0\BW\db_RHwep_BWdefault.sqf"; //
	
	
	
	
	
	//Voices
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop1.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop2.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop3.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop4.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop5.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop6.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop7.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop8.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop9.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_Cop10.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Police\Voice_All_Heli_Megaphone.sqf"; //Voice_All_Heli_Megaphone
	
	[] execVM "PoliceState_MainEngine\DB\Voices\BlackWater\Voice_BW1.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\BlackWater\Voice_BW2.sqf"; //Voice
	
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp1.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp2.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp3.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp4.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp5.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp6.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp7.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp8.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp9.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Suspects\Voice_Susp10.sqf"; //Voice
	[] execVM "PoliceState_MainEngine\DB\Voices\Voice_SWAT4Reaction.sqf"; //Voice_SWAT4Reaction
	
	[] execVM "PoliceState_MainEngine\DB\SirensDB.sqf"; //Sirens
	[] execVM "PoliceState_MainEngine\DB\Addon_SirenCarsDB.sqf"; //siren for 3rd parties addons
	[] execVM "PoliceState_MainEngine\DB\PoliceCars\PoliceCarsArray_VANILA.sqf"; //Police cars

	
	
	[] execVM "PoliceState_MainEngine\DB\GunStore\GunStore_Prices.sqf"; //Gun store
	[] execVM "PoliceState_MainEngine\DB\CarShop\CarStore_Prices.sqf"; //Car Shop
	
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_General_blue.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_General_camo.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_General_sheriff.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_General_esu.sqf"; //for PoliceStation module 
	
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_Chernarus_blue.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_Chernarus_camo.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_Chernarus_sheriff.sqf"; //for PoliceStation module 
	[] execVM "PoliceState_MainEngine\DB\PoliceStation\DB_PoliceWave_Chernarus_esu.sqf"; //for PoliceStation module 
	
	[] execVM "PoliceState_MainEngine\DB\Hospital\DB_AmbulanceWave.sqf"; // 
	[] execVM "PoliceState_MainEngine\DB\FireStation\DB_FiretruckWave.sqf"; // 

	
	VoiceArrayCop = ["Cop1","Cop2","Cop3","Cop4","Cop5","Cop6","Cop7","Cop8","Cop9","Cop10"];
	VoiceArrayCopReserve = VoiceArrayCop;
	
	VoiceArrayCopHeli = ["Heli1","Heli2","Heli3","Heli4"];
	VoiceArrayCopReserveHeli = VoiceArrayCopHeli;

	
	VoiceArraySusp = ["Susp1","Susp2","Susp3","Susp4","Susp5","Susp6","Susp7","Susp8","Susp9","Susp10"];
	VoiceArraySuspReserve = VoiceArraySusp;
	
	VoiceArrayBW = ["BW1","BW2"];
	VoiceArrayBWReserve = VoiceArrayBW;

	VoiceArrayBWHeli = ["Heli1","Heli2","Heli3","Heli4"];
	VoiceArrayBWReserveHeli = VoiceArrayBWHeli;

	VoiceCopBanMin = false; //used in CopSay
	VoiceShotsFiredSec = 7; //DEF: 7 MIN:1 sec | Change to make more police talk about Shooting (need to change also VoiceTalkAlotSec)
	VoiceTalkAlotSec = 3; //DEF: 3 MIN:1 sec | Change to make more police talk
	
	COP_SPEAK_TIMEOUT = 0; //DEF: 0 MAX:4 sec | Change to make more police talk (4)
	COP_SPEAK_CHANCE_TO_SAY = 60; //DEF: 50 MAX: 100 | Change to make more police talk (1000)
	SUSP_SPEAK_CHANCE_TO_SAY_NO = 75;//DEF: 75
	
	
	//VoiceBWBanMin
	
	//UNITS that will not have custom AI
	ExceptionUnits = [];

	//Current settings use for Stun!
	BulletType_Gas = ["SmokeShell", "G_40mm_Smoke"]; //func_ShotFired
	BulletType_FB = ["GrenadeHandTimedWest", "G_40mm_HE"]; //func_ShotFired
	
	
	
	//REARM MODULEs variables:
	
	if(isnil "BISAddWeaponsPOLICE")then{BISAddWeaponsPOLICE = false;};
	if(isnil "RHAddWeaponsPOLICE")then{RHAddWeaponsPOLICE = false;};
	
	if(isnil "BISAddWeaponsEast")then{BISAddWeaponsEast = false;};
	if(isnil "RHAddWeaponsEast")then{RHAddWeaponsEast = false;};
	
	if(isnil "BISAddWeaponsBW")then{BISAddWeaponsBW = false;};
	if(isnil "RHAddWeaponsBW")then{RHAddWeaponsBW = false;};

	if(isnil "OnlineMarkers")then{OnlineMarkers  = false}; //Online markes module
	
	//RestrictedAreas
	RestrictedAreas_array = [];
	RestrictedAreas_activated = false;
	
	
	//SETTINGS FOR CHASE
	DEF_MIN_DISTANCE_TO_GETOUT = 25;//DEF: 25
	
	//SETTINGS FOR PATROL
	WAIT_PATROL_TIME_RND = 120;
	
	//SETTINGS FOR MORALE
	MORALE_BONUS_FRIENDS = 10;//DEF: 10
	MORALE_BONUS_WEAPONS = 25;//DEF: 25
	MORALE_BONUS_DANGEROUS = 100;//DEF: 100
	
	MORALE_BONUS_InVehicvle = 25;//dEF: 25
	
	MORALE_PRESURE_BY_COP = 5;//DEF: 10
	MORALE_PRESURE_MINUS_MORAL_TARGET = 3;//DEF: 3
	MORALE_PRESURE_MINUS_MORAL_FRIEND = 1;//DEF: 1
	
	//SETTINGS FOR GROUP
	GROUP_STUCK_TIMER = 45;// DEF: 60   Сколько отчитывать времени если происходит простой группы, а задание не выполняется. (для бана)
	GROUP_WAYPOINT_UPD_TIME = 15;// DEF: 15 Сколько времени нужно чтобы пересоздать вейпоинт (обновить позицию задачи, нужен для police backup)
	
	
	//if(isnil "MedicActivatedScript")then{MedicActivatedScript = false;}; !!Already in Func_CreateHospital!!
	
// Variables and Arrays END

//----------FOR TEST!
// _Dialog = createdialog "DIALOG_OFPshop";
// _index = lbAdd [51414, "------------------------------EMPTY------------------------------"];		
// lbSetData [51414, _index, "empty"];
//[] call func_fill_DIALOG_ActionsWindow;



sleep 0.1;
// Procedures and Functions
	//**Func
	
	fnc_CheckArmed = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_CheckArmed.sqf"; //проверить вооружена ли персона
	fnc_AllGetOut = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_AllGetOut.sqf"; //Выйти экипажу (кроме стрелка и командира)
	fnc_CanSeeTarget = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_CanSeeTarget.sqf"; //Видит ли АИ цель
	fnc_Calculacte_dist_to_GetOut = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_Calculacte_dist_to_GetOut.sqf"; //NEW подсчитать дистанция для того чтобы затем выйти если сильный простой (при погони)
	fnc_GetClosestSuspInChaseForMember = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_GetClosestSuspInChaseForMember.sqf";//получить самого близкого подозреваемого
	fnc_Check_GroupMembersInChase = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_Check_GroupMembersInChase.sqf"; //Проверяем каждого члена группы что преследует, если не преследует, то будет дана команда к ближайщему бежать!
	//DEL fnc_GetGroupChasingSuspPos = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_GetGroupChasingSuspPos.sqf"; //Получить позицию первого рандомного подозреваемого, которого преследует группа (если вдруг лидер отстал и у него нет "ImChasing" из которого все бралось)
	fnc_RemoveAllWaypoints = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_RemoveAllWaypoints.sqf"; //Получить позицию первого рандомного подозреваемого, которого преследует группа (если вдруг лидер отстал и у него нет "ImChasing" из которого все бралось)
	fnc_createWaypoint = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_createWaypoint.sqf";//создать вейпоинт
	fnc_CheckMovementIfStuck = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_CheckMovementIfStuck.sqf";//проверить застряла ли группа при выполнении задания
	fnc_LostFormation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_LostFormation.sqf"; //снова сделать так чтобы подчиненные слушались командира + разрешить забираться в технику!
	fnc_UnstuckHelper = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_UnstuckHelper.sqf"; //помошник по решению застрявшей группы
	fnc_DomoveAllGroupMembers = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_DomoveAllGroupMembers.sqf"; //Domove для всех членов группы
	fnc_GetClosestInvestigation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_GetClosestInvestigation.sqf"; //найти ближайщую точку Investigation
	fnc_RemoveClosestInvestigation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_RemoveClosestInvestigation.sqf"; //найти ближайщую точку Investigation и удалить
	fnc_CreateDebugMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_CreateDebugMarker.sqf"; //создать тестовый маркер
	fnc_DebugMarkerMovement = compile preprocessfilelinenumbers  "PoliceState_MainEngine\func\fnc_DebugMarkerMovement.sqf";
	
	
	func_dead_WEST = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_WEST.sqf"; //remove from arrays, add spec status
	func_dead_EAST = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_EAST.sqf"; //remove from arrays, add spec status
	func_dead_RES = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_RES.sqf"; //remove from arrays, add spec status
	func_dead_CIV = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_CIV.sqf"; //remove from arrays, add spec status
	func_dead_MED = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_MED.sqf"; //remove from arrays, add spec status
	func_dead_FIRE = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_FIRE.sqf"; //remove from arrays, add spec status
	func_dead_BW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_BW.sqf"; //remove from arrays, add spec status
	func_fixStuckArrays = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_fixStuckArrays.sqf"; //fix cop arrays to restart their brains
	
	func_AllowGetIn = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_AllowGetIn.sqf"; ///
	func_CheckTheRandomCop = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_CheckTheRandomCop.sqf"; // 
	func_CheckTheRandomBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_CheckTheRandomBW.sqf"; // 
	func_SetHitEast = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_SetHitEast.sqf"; // Damage
	func_SetHitWest = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_SetHitWest.sqf"; // Damage
	func_SetHitBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_SetHitBW.sqf"; // Damage
	func_Stun = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Stun.sqf"; // Stun
	func_StunWest = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_StunWest.sqf"; // func_StunWest
	func_FireLessLethal = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_FireLessLethal.sqf"; //Use less lethal
	func_DropWeapons = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_DropWeapons.sqf"; //Drop All weapons
	func_ShotFired = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_ShotFired.sqf"; //Check every shot
	func_ShotFired_WEST = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_ShotFired_WEST.sqf"; //Check every shot SPECIAL FOR WEST
	func_ShotFired_BW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_ShotFired_BW.sqf"; //Check every shot SPECIAL FOR BW
	func_GasGrenadeStun = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_GasGrenadeStun.sqf"; //Gas grenade stun
	func_FlashbangStun = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_FlashbangStun.sqf"; //Flashbang stun
	func_useGrenade = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_useGrenade.sqf"; //Use grenade
	func_Bullet_Flashbang = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Bullet_Flashbang.sqf"; //
	func_Bullet_Gas = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Bullet_Gas.sqf"; //
	func_UseGrenadeLauncher = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_UseGrenadeLauncher.sqf"; //
	func_AllowGetInGROUP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_AllowGetInGROUP.sqf"; //
	func_CopWorkMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_CopWorkMarker.sqf"; // Check cop tasks of cops
	func_bw_WorkMarker= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_bw_WorkMarker.sqf"; //
	fnc_DoMove = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\fnc_DoMove.sqf"; //
	func_RandomNumber = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_RandomNumber.sqf"; //Random Number
	func_KilledByVEHICLE = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_KilledByVEHICLE.sqf"; //
	func_dead_WhoKilledYOU = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_dead_WhoKilledYOU.sqf"; //
	func_MakeWantedFriendsAfterMurder = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_MakeWantedFriendsAfterMurder.sqf"; //make wanted friends
	func_MakeWantedFriendsAfterMurder_BW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_MakeWantedFriendsAfterMurder_BW.sqf"; 
	func_ChooseElementFromArray = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_ChooseElementFromArray.sqf";
	func_VehicleRegistration = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_VehicleRegistration.sqf";
	func_position_Difference_btw2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_position_Difference_btw2.sqf";
	func_VehicleDESTROYED = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_VehicleDESTROYED.sqf";
	func_Global_Arrest = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Global_Arrest.sqf"; //POLICE ARREST
	func_Global_Arrest_step2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Global_Arrest_step2.sqf"; //
	func_Global_Arrest_Finalstep3 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_Global_Arrest_Finalstep3.sqf"; //
	func_TargetFix = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_TargetFix.sqf"; //
	func_WhoKilledWho = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_WhoKilledWho.sqf"; //
	func_POLICE_RISK_LEVEL_UP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\Func\func_POLICE_RISK_LEVEL_UP.sqf"; //
	
	
	//******Func END
	
	//**Module ReArm
	func_rearm_step1_UnitRole = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step1_UnitRole.sqf";
	func_rearm_step2a_WepPackName = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step2a_WepPackName.sqf";
	func_rearm_step2b_WepClass = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step2b_WepClass.sqf";
	func_rearm_step2c_WepLevel = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step2c_WepLevel.sqf";
	func_rearm_step3_REARM = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step3_REARM.sqf";
	//func_rearm_step2D_DefaultWepPackName = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_ReArm\func_rearm_step2D_DefaultWepPackName.sqf";
	
	
	//**module_Siren
	FUNC_COPSIREN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Siren\FUNC_COPSIREN.sqf"; //
	func_SirenInduvidualSound = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Siren\func_SirenInduvidualSound.sqf"; //
	FUNC_siren_step1_registration = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Siren\FUNC_siren_step1_registration.sqf"; //
	FUNC_siren_step2_activation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Siren\FUNC_siren_step2_activation.sqf"; //
	FUNC_siren_step2_activationG = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Siren\FUNC_siren_step2_activationG.sqf"; //
	
	
	
	//**Module Online Markers
	func_markers = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_markers.sqf"; //Online markers	
	func_CycleMarkers = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_CycleMarkers.sqf"; //Online markers	
	
	//**AI_Default
	func_DefaultSET = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Default\func_DefaultSET.sqf"; //add spec status		 
	
	//**AI_Police
	fnc_AI_PoliceSCAN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_AI_PoliceSCAN.sqf"; //POLICE SCAN 2020		
	fnc_AI_PoliceChase = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_AI_PoliceChase.sqf"; //POLICE CHASE 2020
	fnc_PoliceSpeak = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_PoliceSpeak.sqf"; //POLICE SPEAK
	fnc_PoliceGroup_TargetManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_PoliceGroup_TargetManager.sqf"; 
	fnc_OpenFire = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_OpenFire.sqf"; 
	fnc_EnemyClose = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_EnemyClose.sqf";
	fnc_ChooseClosestTarget = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_ChooseClosestTarget.sqf"; //Target	
	fnc_police_OutOfControlManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_police_OutOfControlManager.sqf"; //POLICE OUT OF CONTROL
	fnc_p_setChase = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_p_setChase.sqf"; //NEW установить копу атрибуты преследования
	
	
	func_CheckChaseStatus = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_CheckChaseStatus.sqf"; //POLICE CHASE CHECK	
	


	
	func_CopSaysSHOTSFIRED = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_CopSaysSHOTSFIRED.sqf"; //
	func_CopSaysOFFICERDOWN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_CopSaysOFFICERDOWN.sqf"; //
	func_CopSaysCIVDOWN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_CopSaysCIVDOWN.sqf"; //
	fnc_CopSAY = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\fnc_CopSAY.sqf"; //
	
	//**AI_Police SPEAK
	fnc_CopSay_Beep = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\fnc_CopSay_Beep.sqf";
	func_CopSay_DropGun = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_DropGun.sqf"; 
	func_CopSay_FirstContact = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_FirstContact.sqf"; 
	func_CopSay_HandsUp = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_HandsUp.sqf"; 
	func_CopSay_StopRunning = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_StopRunning.sqf"; 
	func_CopSay_Surrounded = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_Surrounded.sqf"; 
	func_CopSay_GetOut_Man = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_GetOut_Man.sqf"; 
	func_CopSay_GetOut_Veh = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_GetOut_Veh.sqf"; 
	func_CopSay_PullOver_Man = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_PullOver_Man.sqf"; 
	func_CopSay_PullOver_Veh = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_PullOver_Veh.sqf"; 
	func_CopSay_CivDown = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_CivDown.sqf"; 
	func_CopSay_Injured = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_Injured.sqf"; 
	func_CopSay_OfficerDown = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_OfficerDown.sqf"; 
	func_CopSay_SuspShooting = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_SuspShooting.sqf"; 
	func_CopSay_PleaseLeave = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_PleaseLeave.sqf"; 
	func_CopSay_ShowID = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_ShowID.sqf"; 
	func_CopSay_ThankCOOP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_ThankCOOP.sqf"; 
	func_CopSay_Arrested = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_Arrested.sqf"; 
	func_CopSay_MovingArrest = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_MovingArrest.sqf"; 
	func_CopSay_DontSeeHim = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_DontSeeHim.sqf"; 
	func_CopSay_WhoCalledPolice = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_WhoCalledPolice.sqf"; 
	func_CopSay_HeliSTOP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_HeliSTOP.sqf"; 
	func_CopSay_HeliGUNS = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_HeliGUNS.sqf";
	func_CopSay_ReactBang = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_ReactBang.sqf"; 
	func_CopSay_ReactGas = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_ReactGas.sqf"; 
	func_CopSay_Rubber = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_Rubber.sqf"; 
	func_CopSay_Stunned = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\Speak\func_CopSay_Stunned.sqf"; 
	//func_ShootFromAPC = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_ShootFromAPC.sqf"; 
	
	
		
	
	//**AI BLACK WATER
	func_BlackWaterSCAN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterSCAN.sqf"; //BW SCAN
	func_BlackWaterCHASE = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterCHASE.sqf"; //
	func_CheckChaseStatusBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_CheckChaseStatusBW.sqf"; //
	
	func_BWFireAtWill_GROUP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BWFireAtWill_GROUP.sqf"; 
	func_ChooseClosestTargetBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_ChooseClosestTargetBW.sqf"; //Target
	func_ChooseClosestTargetCHECKBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_ChooseClosestTargetCHECKBW.sqf";
	func_OpenFireBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_OpenFireBW.sqf"; //func_OpenFire
	func_EnemyCloseBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_EnemyCloseBW.sqf"; //func_OpenFire
	func_OutOfControlBW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_OutOfControlBW.sqf"; // OUT OF CONTROL
	func_BlackWaterspeak = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterspeak.sqf"; // SPEAK
	
	func_BlackWaterSAY = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterSAY.sqf"; 
	func_BlackWaterSaysCIVDOWN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterSaysCIVDOWN.sqf"; 
	func_BlackWaterSaysOFFICERDOWN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterSaysOFFICERDOWN.sqf"; 
	func_BlackWaterSaysSHOTSFIRED = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterSaysSHOTSFIRED.sqf";
	func_BlackWaterspeak = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\func_BlackWaterspeak.sqf"; 
	
	
	
	func_BWSay_CivDown = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_CivDown.sqf"; 
	func_BWSay_DropGun = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_DropGun.sqf"; 
	func_BWSay_FirstContact = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_FirstContact.sqf"; 
	func_BWSay_HandsUp = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_HandsUp.sqf"; 
	func_BWSay_MovingArrest = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_MovingArrest.sqf"; 
	func_BWSay_OfficerDown = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_OfficerDown.sqf"; 
	func_BWSay_PleaseLeave = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_PleaseLeave.sqf"; 
	func_BWSay_PleaseLeave2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_PleaseLeave2.sqf"; 
	func_BWSay_PleaseLeave3 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_PleaseLeave3.sqf"; 
	func_BWSay_PleaseLeaveSecond = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_PleaseLeaveSecond.sqf"; 
	func_BWSay_ReactBang = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_ReactBang.sqf"; 
	func_BWSay_ReactGas = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_ReactGas.sqf"; 
	func_BWSay_Rubber = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_Rubber.sqf"; 
	func_BWSay_StopRunning = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_StopRunning.sqf"; 
	func_BWSay_Stunned = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_Stunned.sqf"; 
	func_BWSay_SuspShooting = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_BlackWater\Speak\func_BWSay_SuspShooting.sqf"; 
	

	//**AI Civilan
	fnc_MoraleReaction = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\fnc_MoraleReaction.sqf"; //Give up or resist
	
	fnc_SurrenderOrFight = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\fnc_SurrenderOrFight.sqf"; //Give up or resist
	fnc_SurrenderOrFight_BW = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\fnc_SurrenderOrFight_BW.sqf"; //Give up or resist BW
	func_GiveUp = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\func_GiveUp.sqf"; //Give up or resist
	func_SuspSAY = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\func_SuspSAY.sqf"; //Say
	func_SuspSay_DontSee = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_DontSee.sqf"; //Say
	
	func_SuspSay_GiveUp = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_GiveUp.sqf"; 
	func_SuspSay_Hostage_Repl = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_Hostage_Repl.sqf"; 
	func_SuspSay_Help = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_Help.sqf";
	func_SuspSay_Hostage_Target = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_Hostage_Target.sqf"; 
	func_SuspSay_KillCop = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_KillCop.sqf";
	func_SuspSay_No = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_No.sqf"; 
	func_SuspSay_ReactBang = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_ReactBang.sqf"; 
	func_SuspSay_ReactGas = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_ReactGas.sqf";
	func_SuspSay_ReactRubber = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_ReactRubber.sqf"; 
	func_SuspSay_Stunned = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Civilian\Speak\func_SuspSay_Stunned.sqf"; 
		

		
	//**module_Hospital
	Func_CreateHospital= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Hospital\Func_CreateHospital.sqf";

	func_SpawnMedicDrivers= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Hospital\func_SpawnMedicDrivers.sqf";
	
	FUNC_Hospital_Cycle= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Hospital\FUNC_Hospital_Cycle.sqf";
	func_MedicWave_Spawn= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Hospital\func_MedicWave_Spawn.sqf";
		
	//**MEDIC AI
	func_MainMedicCycleCheck = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_MainMedicCycleCheck.sqf";
	func_p_MovingToRemoveCorpses = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_p_MovingToRemoveCorpses.sqf";
	func_p_MovingToRemoveCorpsesPart2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_p_MovingToRemoveCorpsesPart2.sqf";
	func_CheckCorpses = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_CheckCorpses.sqf";
	func_MedicWorkMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_MedicWorkMarker.sqf";
	func_RemovingCorpses = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_RemovingCorpses.sqf";
	func_AbortMissionMEDIC = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_AbortMissionMEDIC.sqf";
	func_BackToHospital = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_BackToHospital.sqf";
	func_HEAL_MISSION = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\func_HEAL_MISSION.sqf";
		
		
	//**module_FireStation
	func_CreateFireStation= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_FireStation\func_CreateFireStation.sqf";
	func_SpawnFireManDrivers= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_FireStation\func_SpawnFireManDrivers.sqf";
	FUNC_Firestation_Cycle= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_FireStation\FUNC_Firestation_Cycle.sqf";
	func_FirefighterWave_Spawn= compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_FireStation\func_FirefighterWave_Spawn.sqf";
		
	//**FIREFIGHTER AI
	func_p_MovingToRemoveCars = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_p_MovingToRemoveCars.sqf";	
	func_p_MovingToRemoveCarsPart2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_p_MovingToRemoveCarsPart2.sqf";	
	func_AbortMissionFF = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_AbortMissionFF.sqf";	
	func_FireManWorkMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Markers\func_FireManWorkMarker.sqf";
	func_RemovingFire = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_RemovingFire.sqf";
	func_BackToFireStation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_BackToFireStation.sqf";
	func_CheckFireCars = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_CheckFireCars.sqf";
	func_MainFiremanCycleCheck = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_FireFighters\func_MainFiremanCycleCheck.sqf";
		
		
		
	//**Module Close Combat
	func_fight = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_CloseCombat\func_fight.sqf"; //Close combat module

	
	//**Module Investigation
	func_CreateInvestigation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CreateInvestigation.sqf"; //Create investigation
	func_CreateInvestigationByModule = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CreateInvestigationByModule.sqf"; //
	func_CheckAvailableINV = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CheckAvailableINV.sqf"; //
	func_CheckCLOSESTAvailableINV = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CheckCLOSESTAvailableINV.sqf";
	func_CheckAndRemoveBadMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CheckAndRemoveBadMarker.sqf"; //
	func_CheckClosestINVandDEL = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CheckClosestINVandDEL.sqf"; //
	func_CheckClosestINVandDEL2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_CheckClosestINVandDEL2.sqf"; //
	func_calc_CheckEqualPos = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_calc_CheckEqualPos.sqf"; //
	func_RemoveInvJobFromPolice = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\POLICE\func_RemoveInvJobFromPolice.sqf"; //
	
	//**Module Investigation BW
	func_BW_CreateInvestigation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CreateInvestigation.sqf"; //Create investigation
	func_BW_CreateInvestigationByModule = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CreateInvestigationByModule.sqf"; //
	func_BW_CheckAvailableINV = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CheckAvailableINV.sqf"; //
	func_BW_CheckCLOSESTAvailableINV = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CheckCLOSESTAvailableINV.sqf";
	func_BW_CheckAndRemoveBadMarker = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CheckAndRemoveBadMarker.sqf"; //
	func_BW_CheckClosestINVandDEL = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CheckClosestINVandDEL.sqf"; //
	func_BW_CheckClosestINVandDEL2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_CheckClosestINVandDEL2.sqf"; //
	func_BW_calc_CheckEqualPos = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_calc_CheckEqualPos.sqf"; //
	func_BW_RemoveInvJobFromPolice  = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Investigation\BW\func_BW_RemoveInvJobFromPolice.sqf"; //
	
		
	//**module_Patrol	POLICE
	fnc_p_GroupManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE_2020\fnc_p_GroupManager.sqf"; 
	fnc_p_BackupManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE_2020\fnc_p_BackupManager.sqf"; 
	fnc_p_FindWhoNeedsBackup = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE_2020\fnc_p_FindWhoNeedsBackup.sqf"; 
	fnc_p_PatrolManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE_2020\fnc_p_PatrolManager.sqf"; 
	fnc_p_InvestigationManager = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE_2020\fnc_p_InvestigationManager.sqf"; 
	
	

	func_GivePatrolMission = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_GivePatrolMission.sqf"; //
	func_p_PatrolAndStop = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_p_PatrolAndStop.sqf"; //PATROL TYPE
	fnc_p_BackupIsComing = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\fnc_p_BackupIsComing.sqf"; //PATROL TYPE (COPS BACKUP/HELP)
	func_p_InvestigationInProgress = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_p_InvestigationInProgress.sqf"; //**Investigation
	func_p_InvestigationInProgressPart2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_p_InvestigationInProgressPart2.sqf";
	func_CheckHowManyCopsNeeded = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_CheckHowManyCopsNeeded.sqf"; //
	func_p_Guard = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_p_Guard.sqf"; //
	func_failToPatrol = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_failToPatrol.sqf"; //
	
	func_CreatePatrolPoint = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\CreatePatrolPoint\func_CreatePatrolPoint.sqf"; 
	func_CreatePatrolPointSYNC = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\CreatePatrolPoint\func_CreatePatrolPointSYNC.sqf"; 
	func_CreatePatrolPointSPHERE = compile preprocessfilelinenumbers "PoliceState_MainEngine\module_Patrol\POLICE\CreatePatrolPoint\func_CreatePatrolPointSPHERE.sqf";
	func_CreateRandomPatrolUnits = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\CreatePatrolSquad\func_CreateRandomPatrolUnits.sqf";
	//func_CreateUnit_LAND = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\CreatePatrolSquad\func_CreateUnit_LAND.sqf";
	func_p_PassiveGuardian = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\POLICE\func_p_PassiveGuardian.sqf";	
	//**module_Patrol	BW
	func_BW_MainPatrolCheck = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_MainPatrolCheck.sqf"; // JOB
	func_BW_GivePatrolMission = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_GivePatrolMission.sqf"; //
	func_BW_p_PatrolAndStop = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_PatrolAndStop.sqf"; //PATROL TYPE
	func_BW_p_BackupIsComing = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_BackupIsComing.sqf"; //PATROL TYPE ( BACKUP/HELP)
	func_BW_p_InvestigationInProgress = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_InvestigationInProgress.sqf"; //**Investigation
	func_BW_p_InvestigationInProgressPart2 = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_InvestigationInProgressPart2.sqf";
	func_BW_CheckHowManyCopsNeeded = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_CheckHowManyCopsNeeded.sqf"; //
	func_BW_p_Guard = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_Guard.sqf"; //
	func_BW_failToPatrol = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_failToPatrol.sqf"; //
	func_BW_LostFormation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_LostFormation.sqf"; //
	func_BW_CreatePatrolPoint = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\CreatePatrolPoint\func_BW_CreatePatrolPoint.sqf"; 
	func_BW_CreatePatrolPointSYNC = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\CreatePatrolPoint\func_BW_CreatePatrolPointSYNC.sqf"; 
	func_BW_CreatePatrolPointSPHERE = compile preprocessfilelinenumbers "PoliceState_MainEngine\module_Patrol\BW\CreatePatrolPoint\func_BW_CreatePatrolPointSPHERE.sqf";
	func_BW_CreateRandomPatrolUnits = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\CreatePatrolSquad\func_BW_CreateRandomPatrolUnits.sqf";
	func_BW_CreateUnit_LAND = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\CreatePatrolSquad\func_BW_CreateUnit_LAND.sqf";
	func_BW_p_PassiveGuardian = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Patrol\BW\func_BW_p_PassiveGuardian.sqf";
	
	//**module DayCycle
	func_DayCycle = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_DayCycle\func_DayCycle.sqf";
	
	//**module_TEST
	func_KillAll_CIVILIANS = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_TEST\func_KillAll_CIVILIANS.sqf";
	
	//**module Prison
	func_Prison_Main = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Prison\func_Prison_Main.sqf";
	func_Prison_SimpleTeleport = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Prison\func_Prison_SimpleTeleport.sqf";
	
	//**BIS FIRE
	func_BIS_FIRE =compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; // http://www.kylania.com/ex/?p=131
	
	//**module_HUD
	func_SimpleHUD = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\func_SimpleHUD.sqf";
	func_PoliceTestHUD = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\func_PoliceTestHUD.sqf";
	
	func_fill_DIALOG_ActionsWindow = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\DIALOG_ActionsWindow\func_fill_DIALOG_ActionsWindow.sqf";
	func_ValueChanged_DIALOG_ActionsWindow = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\DIALOG_ActionsWindow\func_ValueChanged_DIALOG_ActionsWindow.sqf";
	func_DIALOG_ActionsWindow_ButtonPressed = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\DIALOG_ActionsWindow\func_DIALOG_ActionsWindow_ButtonPressed.sqf";
	
	
	//Player inventory
	func_fill_DIALOG_PlayerInventory = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_HUD\DIALOG_PlayerInventory\func_fill_DIALOG_PlayerInventory.sqf";
	
	
	//**module_RestrictedAreas
	FUNC_CreateRestrictedArea = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_RestrictedAreas\FUNC_CreateRestrictedArea.sqf";	
	FUNC_LeaveTheArea = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_RestrictedAreas\BW_AI_Behavior\FUNC_LeaveTheArea.sqf";
	FUNC_DomoveToTressPasser = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_RestrictedAreas\BW_AI_Behavior\FUNC_DomoveToTressPasser.sqf";
	FUNC_BWSecondMan = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_RestrictedAreas\BW_AI_Behavior\FUNC_BWSecondMan.sqf";
	
	//**module_MakeWanted
	FUNC_MakeWantedByBlackWater = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_MakeWanted\FUNC_MakeWantedByBlackWater.sqf";
	FUNC_MakeWantedByBlackWaterGROUP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_MakeWanted\FUNC_MakeWantedByBlackWaterGROUP.sqf";
	FUNC_MakeWantedByPolice = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_MakeWanted\FUNC_MakeWantedByPolice.sqf";
	FUNC_MakeWantedByPoliceGROUP = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_MakeWanted\FUNC_MakeWantedByPoliceGROUP.sqf";

	//**module_Taxi
	FUNC_Taxi_CreateTaxiCar = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Taxi\FUNC_Taxi_CreateTaxiCar.sqf";
	func_Taxi_MoveToDestinaion = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Taxi\func_Taxi_MoveToDestinaion.sqf";
	func_TaxiPayment = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Taxi\func_TaxiPayment.sqf";

	func_TaxiOpenedMap = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Taxi\dialog\func_TaxiOpenedMap.sqf";
	
	//**module_Controls
	func_PlayerKeyControls =  compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Controls\func_PlayerKeyControls.sqf";
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call func_PlayerKeyControls"];
	
	//**module_Shop
	func_BuyFood_Cafe = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\Cafe\func_BuyFood_Cafe.sqf";
	FUNC_CreateEastFastFood = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\Cafe\FUNC_CreateEastFastFood.sqf";
	FUNC_CreateCAFE = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\Cafe\FUNC_CreateCAFE.sqf";
	FUNC_CreatePizza = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\Cafe\FUNC_CreatePizza.sqf";
	
	func_GasStation_Refuel = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GasStation\func_GasStation_Refuel.sqf";
	FUNC_CreateGasStation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GasStation\FUNC_CreateGasStation.sqf";
	func_GasStationWindow_fill = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GasStation\func_GasStationWindow_fill.sqf";
	func_GasStation_PriceListBox = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GasStation\func_GasStation_PriceListBox.sqf";
	
	FUNC_CreateRepairStation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\RepairStation\FUNC_CreateRepairStation.sqf";
	func_RepairStationWindow_fill = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\RepairStation\func_RepairStationWindow_fill.sqf";
	func_RepairStation_PriceListBox = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\RepairStation\func_RepairStation_PriceListBox.sqf";
	func_RepairStation_Repair = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\RepairStation\func_RepairStation_Repair.sqf";
	
	FUNC_CreateCarSeller = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarSeller\FUNC_CreateCarSeller.sqf";
	func_CarSellerWindow_fill = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarSeller\func_CarSellerWindow_fill.sqf";
	func_CarSeller_Sell = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarSeller\func_CarSeller_Sell.sqf";
	func_CarSeller_PriceListBox = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarSeller\func_CarSeller_PriceListBox.sqf";
	
	func_Hospital_check =  compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\Hospital\func_Hospital_check.sqf";
	func_Hospital_heal =  compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Medics\Hospital\func_Hospital_heal.sqf";
	
	FUNC_CreateGunShopRandomGuns = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\FUNC_CreateGunShopRandomGuns.sqf";
	func_GunStore_Fill_BEGIN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_Fill_BEGIN.sqf";
	func_ValueChanged_BoxTypeWep = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_ValueChanged_BoxTypeWep.sqf";
	FUNC_GunShop_SET_WeaponsToSell_RANDOM = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\FUNC_GunShop_SET_WeaponsToSell_RANDOM.sqf";
	func_GunStore_addToCart = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_addToCart.sqf";
	func_GunStore_Plus = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_Plus.sqf";
	func_GunStore_Minus = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_Minus.sqf";
	func_GunStore_ClearCart = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_ClearCart.sqf";
	func_GunStore_BUY = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\GunStore\func_GunStore_BUY.sqf";
	
	FUNC_CreateCarShopRandom = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\FUNC_CreateCarShopRandom.sqf";
	FUNC_CarShop_SET_RANDOM = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\FUNC_CarShop_SET_RANDOM.sqf";
	func_CarShop_Fill_BEGIN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\func_CarShop_Fill_BEGIN.sqf";
	func_ValueChanged_BoxTypeCar = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\func_ValueChanged_BoxTypeCar.sqf";
	func_ValueChanged_ListCarChosen = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\func_ValueChanged_ListCarChosen.sqf";
	func_CarShop_BUY = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_Shop\CarShop\func_CarShop_BUY.sqf";
	
	//**Module PHONE
	
	func_CallTaxi = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_phone\func_CallTaxi.sqf";
	func_CallPolice = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_phone\func_CallPolice.sqf";
	func_CallMedic = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_phone\func_CallMedic.sqf";
	func_CallFireFighter = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_phone\func_CallFireFighter.sqf";
	
	//**Module Police Station
	FUNC_CreatePoliceStation = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\FUNC_CreatePoliceStation.sqf"; 
	FUNC_PoliceStation_Cycle = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\FUNC_PoliceStation_Cycle.sqf"; 
	func_Step3_PoliceWave_Spawn = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step3_PoliceWave_Spawn.sqf"; 
	func_Step3_PoliceWave_Spawn_BONUS = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step3_PoliceWave_Spawn_BONUS.sqf"; 
	func_Step3_PoliceWave_Spawn_HELI = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step3_PoliceWave_Spawn_HELI.sqf"; 
	func_Step1_PoliceWave_ChooseRiskLevelArmy = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step1_PoliceWave_ChooseRiskLevelArmy.sqf"; 
	
	
	
	func_Step2_PoliceWave_ChooseArmy = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step2_PoliceWave_ChooseArmy.sqf"; 
	func_Step3_PoliceWave_Spawn_HELI = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_PoliceStation\func_Step3_PoliceWave_Spawn_HELI.sqf"; 
	
	//fnc_Cmb_changed = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_TEST\ThirdParty\fnc_Cmb_changed.sqf";
	//fnc_init_open = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_TEST\ThirdParty\fnc_init_open.sqf";
	//fnc_Sel_click = compile preprocessfilelinenumbers  "PoliceState_MainEngine\module_TEST\ThirdParty\fnc_Sel_click.sqf";
	
	//ОГОНЬ И ПРОКОЛОТЬ КОЛЕСО!
	//[suv1,10,time,false,true] spawn BIS_Effects_Burn;
	//suv1 setHit ["wheel_1_1_steering", 1];
	
	//ТЕКСТ НАЧАЛО МИССИИ!
	//waitUntil{!(isNil "BIS_fnc_init")};
	//[str ("Mission Name Here") ,  str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("Mission Location Here")] spawn BIS_fnc_infoText;
	
	//SupplyDrop Example
	//http://www.kylania.com/ex/?p=37
	
	
	//ЦВЕТНОЙ ТЕКСТ!
	//_text = parseText format
	//[   
	//  "Congrats <t color='%4'>%1</t> Team!<br/> You have been rewarded with an <t color='#FFCC33'>%2</t> for your efforts!<br/>     
	//  <t color='%4'><img size='4' image='%3'/></t>", SHOWTMessageLVL3, SHOWTMessageLVL3, SHOWTMessageLVL3, SHOWTMessageLVL3
	//]; 
	//hint _text;
		
	
	//БЕЖАТЬ В РАЗНЫЕ СТОРОНЫ! (func_position_Difference_btw2)
	//_SUBJECT setspeedMode "full"; 
	//_SUBJECT domove [(getpos _x select 0)+(Random 100 - (random 100)),(getpos _x select 1)+(Random 100 - (random 100)),0];
	
	//	{alive _x} count crew vehiclenamehere == 0
	
	//wp1 = group zaq2 addWaypoint [position zaq, 0]; [group zaq2, 1] setWaypointType "DESTROY"; [group zaq2, 1] waypointAttachVehicle vehicle zaq; 
	
	//_handle = Igla_AA_pod_TK_EP1 fireAtTarget [_helicopter,currentWeapon Igla_AA_pod_TK_EP1];
	
	//_veh doWatch _target; waitUntil {_veh aimedAtTarget [_target] > 0}; _veh fireAtTarget [_target]; Returns how good the weapon of the vehicle is aimed at the target.
	//_x commandFire _target;
	
	//player reveal _x   //Reveals a target to a group.
	
	
	//['task1','succeeded'] call bis_fnc_tasksetstate;
	//https://forums.bistudio.com/topic/76532-how-to-get-an-evidence-file/
	
// Procedures and Functions END

sleep 0.4;

// GAME WORLD SETUP		
	{		
		_x call func_DefaultSET;				
	} forEach allUnits;

	{  
		_x call func_VehicleRegistration;
		//player globalchat format ["%1",(typeof _x)];
	} forEach vehicles;
	
	
	if(SHOWTMessageLVL3)then // MESSAGE LVL3
	{
		player groupchat format ["|---Array_CopsSide CONTAINS: %1", Array_CopsSide];
		player groupchat format ["|---Array_SuspectSide CONTAINS: %1", Array_SuspectSide];
		player groupchat format ["|---Array_ThirdForce CONTAINS: %1", Array_ThirdForce];
		player groupchat format ["|---Array_CivilainSide CONTAINS: %1", Array_CivilainSide];
	};// MESSAGE LVL3 END
// GAME WORLD SETUP END

//START SCRIPTS
	//POLICE AI
	[] spawn fnc_AI_PoliceSCAN;
	[] spawn fnc_AI_PoliceChase;
	[] spawn fnc_PoliceGroup_TargetManager;
	
	[] spawn fnc_p_GroupManager;

	
	[] spawn func_fixStuckArrays;	
	//[] spawn FUNC_COPSIREN;	
	//BLACK WATER AI (WIP)
	[] spawn func_BlackWaterSCAN;
	[] spawn func_BlackWaterCHASE;
	//[] spawn func_fixStuckArrays;
	[] spawn func_OutOfControlBW;	
	[] spawn func_BW_MainPatrolCheck;
	//[] spawn FUNC_COPSIREN;
	// MEDIC AI
	[] spawn func_MainMedicCycleCheck;
	// FIREMAN AI
	[] spawn func_MainFiremanCycleCheck;
		
	//[] spawn func_markers; //ALREADY IN MODULE: MARKERS
//START SCRIPTS END



if(_SHOWTestMessage)then{hint format ["%1",_TestMessage];};




while {true} do 
{

// dostop Q;
// Q doTarget W2;
// Q dofire (vehicle W);
// Q doTarget W2;
// dostop Q;
//
//	
// sleep 0.1;
//_myWeaponPicture = getText(configFile >> "CfgWeapons" >> (CurrentWeapon Q) >> "Picture");
//_myWeaponName = getText(configFile >> "CfgWeapons" >> (CurrentWeapon Q) >> "displayName");
//_maxRange = getNumber (configFile >> "CfgWeapons" >> (CurrentWeapon Q) >> "maxRange");
//hint parseText format ["Test: <img image=%1/> Test2", _pic];
//hint parseText format ["<img image=%1/>", _myWeaponPicture];
//hint parseText format ["_maxRange =%1", _maxRange];

	//NITRO!
	// sleep 0.01;
	// if(isEngineOn vehicle player) then
	// {
		// _vcl = vehicle player;
		// _vel = velocity _vcl;
		// _spd = speed _vcl;
		// _vcl setVelocity [(_vel select 0) * 1.2, (_vel select 1) * 1.2, (_vel select 2) * 0.99];
		// _vcl setVelocity [(_vel select 0) * 2.006, (_vel select 1) * 2.006, (_vel select 2) * 2.99];
	// };

}
//[] spawn func_PoliceTestHUD;


//player addmagazine "SmokeShell";
//player addmagazine "SmokeShell";
//player addmagazine "SmokeShell";
//player addmagazine "SmokeShell";
//player addmagazine "SmokeShell";


//count_func_Global_Arrest_STARTED = 0;
//count_func_Global_Arrest_ExitWith1 = 0;
//count_func_Global_Arrest_ExitWith2 = 0;
//count_func_Global_Arrest_ExitWith3 = 0;


















