//func_DefaultSET.sqf
private["_SUBJECT","_this","_GROUP","_VoiceWillUse","_SIDE","_Civilian"];
_SUBJECT = _this;
//_SUBJECT setSpeaker "NoVoice";
//_SUBJECT disableConversation true;
_SUBJECT setVariable ["BIS_noCoreConversations", true];
if(_SUBJECT in ExceptionUnits)exitwith{hint "EXCEPTION FOR AI"; _SUBJECT setVariable ["AI_SET","EXCEPTION!",true];};

_SIDE = side _SUBJECT;
//IF(typeOf _SUBJECT == "RU_Policeman")THEN{_SIDE = WEST;}; //DOESN"T WORK!



if(_SUBJECT getVariable ["AI_SET","FALSE"] == "DONE" )exitwith{};
_SUBJECT setVariable ["AI_SET","DONE",true]; //AI SET ALREADY!
switch (_SIDE) do 
{	
	case West: 
	{  
		_SUBJECT disableConversation true;
		_SUBJECT setVehicleInit "enableSentences false;";
		_SUBJECT disableAI "AUTOTARGET";
		_SUBJECT setskill 1;
		
		_SUBJECT setVariable ["DISTANCE_TO_GETOUT", 25, true];//2020 USING IN: fnc_AI_PoliceChase, PURPOSE: чтобы вышел из машины при погони, когда не может доехать до подозреваемого!
		
		//_SUBJECT disableAI "FSM";
		//if(_SUBJECT in )exitwith{};
		Array_CopsSide = Array_CopsSide + [_SUBJECT];
		Count_TotalCops = Count_TotalCops + 1;
		_GROUP = group _SUBJECT;
		_SUBJECT setVariable ["origin", _GROUP];
		if!(_GROUP in PoliceGroups)then
		{
			PoliceGroups = PoliceGroups + [_GROUP];	
			if((count (waypoints _group)) == 2)then
			{
				
				_GROUP setVariable ["Mission","PassiveGuardian",true];		
				//player globalchat format [" def %1  ||  || ","PassiveGuardian"];
			}
			else
			{
				_GROUP setVariable ["Mission","PatrolAndStop",true];
				//player globalchat format [" def %1  ||  || ","PatrolAndStop"];
			};
			_GROUP setVariable ["PeaceWaypointCreated",false,true];
			_GROUP setVariable ["MissionGuardianPosition",(position leader _GROUP),true];
			_GROUP setVariable ["CurrentTargetMarker","",true];
			_GROUP setVariable ["LostFormation",false,true];
			_GROUP setVariable ["DistanceSize",25,true];
			_GROUP setVariable ["PatrolOutOfTime",0,true];
			_GROUP setVariable ["CurrentInvestigationMarker","",true];
			_GROUP setVariable ["investigationTimer",0,true];
			
			_GROUP setVariable ["WhatGroupIsDoing","NOTHING",true];
			_GROUP setVariable ["BackupOUpdateTime",0,true];
			_GROUP setVariable ["FailedWaypointJob",[],true];
			_GROUP setVariable ["FailToPatrol",0,true];
			
			
			
			_GROUP setVariable ["CurrentSuspect",ObjNull,true];
			_GROUP setVariable ["TimeToFailTask",GROUP_STUCK_TIMER,true];//2020
			_GROUP setVariable ["SuspectBlackList",[],true];//2020		
			
			//_GROUP spawn func_FireAtWill_GROUP;//OBSOLETE
			_GROUP enableAttack false;//2020
		};
		_SUBJECT addEventHandler ["killed", "[_this select 0,'WEST', _this select 1] call func_dead_WEST;"];
		_SUBJECT addEventHandler ["fired", { _this call func_ShotFired_WEST;}];
		
		//Voice
		if(count VoiceArrayCop < 1)then{ VoiceArrayCop = VoiceArrayCopReserve;};
		_VoiceWillUse = (VoiceArrayCop select (round(random ((count VoiceArrayCop) -1))));
		VoiceArrayCop = VoiceArrayCop - [_VoiceWillUse];
		_SUBJECT setVariable ["Voice",_VoiceWillUse,true];
		//hintc format ["_VoiceWillUse = %1, VoiceArrayCop = %2",_VoiceWillUse,VoiceArrayCop];
		
		//Voice END
		
		//VoiceHELI
		if(count VoiceArrayCopHeli < 1)then{ VoiceArrayCopHeli = VoiceArrayCopReserveHeli;};
		_VoiceWillUse = (VoiceArrayCopHeli select (round(random ((count VoiceArrayCopHeli) -1))));	
		VoiceArrayCopHeli = VoiceArrayCopHeli - [_VoiceWillUse];	
		//hintc format ["_VoiceWillUse = %1, VoiceArrayCopHeli = %2",_VoiceWillUse,VoiceArrayCopHeli];
		_SUBJECT setVariable ["VoiceHELI",_VoiceWillUse,true];
		
		//VoiceHELI END
		
		
		
		_SUBJECT call func_SirenInduvidualSound;
		if(SHOWTMessageLVL2)then{player sidechat format ["|---ADDED TO Array_CopsSide: %1", _SUBJECT];};// MESSAGE LVL2
		
		_SUBJECT addEventHandler ["HandleDamage", {_this call FUNC_SETHITWest;}];
		
		//if(BISAddWeaponsPOLICE)then{_SUBJECT call func_NewRearmCops_step2_ChosenBLUE;}; //BETA NOT CLASS DEPENDEND
		if(RHAddWeaponsPOLICE)then{_SUBJECT call func_rearm_step1_UnitRole;}; //BETA NOT CLASS DEPENDEND
	};
	case East: 
	{  
		//if(_SUBJECT in )exitwith{};
		Count_TotalSuspects = Count_TotalSuspects + 1;
		Array_SuspectSide = Array_SuspectSide + [_SUBJECT];
		_SUBJECT addEventHandler ["killed", "[_this select 0,'EAST', _this select 1] call func_dead_EAST;"];		
		_SUBJECT addEventHandler ["fired", { _this call func_ShotFired;}];
		//_SUBJECT call func_VanillaEastWep;
		
		//Voice
		if(count VoiceArraySusp < 1)then{ VoiceArraySusp = VoiceArraySuspReserve;};
		_VoiceWillUse = (VoiceArraySusp select (round(random ((count VoiceArraySusp) -1))));
		VoiceArraySusp = VoiceArraySusp - [_VoiceWillUse];
		_SUBJECT setVariable ["Voice",_VoiceWillUse,true];		
		//Voice END
		if(SHOWTMessageLVL2)then{player sidechat format ["|---ADDED TO Array_SuspectSide: %1 with VOICE: %2", _SUBJECT, _VoiceWillUse];};// MESSAGE LVL2
		
		_SUBJECT addEventHandler ["HandleDamage", {_this call FUNC_SETHITEast;}];
		
		
		//if(BISAddWeaponsEast)then{_SUBJECT call func_NewRearmEAST_step2_ChosenRED;}; //BETA NOT CLASS DEPENDEND
		if(RHAddWeaponsEast)then{_SUBJECT call func_rearm_step1_UnitRole;}; //BETA NOT CLASS DEPENDEND
	};
	case Resistance: 				
	{  

		if(SHOWTMessageLVL2)then{player sidechat format ["|---ADDED TO Array_BW: %1", _SUBJECT];};// MESSAGE LVL2	
		//if(_SUBJECT in )exitwith{};
		Array_BlackWater = Array_BlackWater + [_SUBJECT];
		Count_TotalBW = Count_TotalBW + 1;
		_GROUP = group _SUBJECT;
		if!(_GROUP in BWGroups)then
		{
			BWGroups = BWGroups + [_GROUP]; 
			
			if((count (waypoints _group)) == 2)then
			{	
				_GROUP setVariable ["Mission","PassiveGuardian",true];		
				//player globalchat format [" def %1  ||  || ","PassiveGuardian"];
			}
			else
			{
				_GROUP setVariable ["Mission","PatrolAndStop",true];
				//player globalchat format [" def %1  ||  || ","PatrolAndStop"];
			};
			
			_GROUP setVariable ["PeaceWaypointCreated",false,true];
			_GROUP setVariable ["MissionGuardianPosition",(position leader _GROUP),true];
			_GROUP setVariable ["CurrentTargetMarker","",true];
			_GROUP setVariable ["LostFormation",false,true];
			_GROUP setVariable ["DistanceSize",25,true];
			_GROUP setVariable ["PatrolOutOfTime",0,true];
			_GROUP setVariable ["CurrentInvestigationMarker","",true];
			_GROUP setVariable ["investigationTimer",0,true];
			_GROUP setVariable ["BW_Chase",false,true];
			_GROUP setVariable ["BW_ChaseSuspect",ObjNull,true];
			_GROUP setVariable ["WhatGroupIsDoing","NOTHING",true];
			_GROUP setVariable ["BackupOUpdateTime",0,true];
			_GROUP setVariable ["FailedWaypointJob",[],true];
			_GROUP setVariable ["FailToPatrol",0,true];
			waitUntil {!(isnil "func_BWFireAtWill_GROUP")};
			_GROUP spawn func_BWFireAtWill_GROUP;// <----
			_GROUP enableAttack false;//2020
			
			
			_GROUP setVariable ["TimeToFailTask",GROUP_STUCK_TIMER,true];//2020
			
		};
		_SUBJECT addEventHandler ["killed", "[_this select 0,'RES', _this select 1] call func_dead_BW;"];
		_SUBJECT addEventHandler ["fired", { _this call func_ShotFired_BW;}];
		_SUBJECT addEventHandler ["HandleDamage", {_this call FUNC_SETHITEast;}]; 
		
		//Voice
		if(count VoiceArrayBW < 1)then{ VoiceArrayBW = VoiceArrayBWReserve;};
		_VoiceWillUse = (VoiceArrayBW select (round(random ((count VoiceArrayBW) -1))));
		VoiceArrayBW = VoiceArrayBW - [_VoiceWillUse];
		_SUBJECT setVariable ["Voice",_VoiceWillUse,true];
		//hintc format ["_VoiceWillUse = %1, VoiceArrayBW = %2",_VoiceWillUse,VoiceArrayBW];
		
		//Voice END
		
		//VoiceHELI
		if(count VoiceArrayBWHeli < 1)then{ VoiceArrayBWHeli = VoiceArrayBWReserveHeli;};
		_VoiceWillUse = (VoiceArrayBWHeli select (round(random ((count VoiceArrayBWHeli) -1))));	
		VoiceArrayBWHeli = VoiceArrayBWHeli - [_VoiceWillUse];	
		//hintc format ["_VoiceWillUse = %1, VoiceArrayBWHeli = %2",_VoiceWillUse,VoiceArrayBWHeli];
		_SUBJECT setVariable ["VoiceHELI",_VoiceWillUse,true];
		
		//VoiceHELI END
		
		
		
		//_SUBJECT call func_SirenInduvidualSound; //<------------------- WIP
		if(SHOWTMessageLVL2)then{player sidechat format ["|---ADDED TO Array_BW: %1", _SUBJECT];};// MESSAGE LVL2
		
		//_SUBJECT addEventHandler ["HandleDamage", {_this call FUNC_SETHITWest;}]; //<------------------- WIP
		
		//if(BISAddWeaponsBlackWater)then{_SUBJECT call func_NewRearmBlackWaters_step2_ChosenBLUE;}; //<------------------- WIP
		//if(BISAddWeaponsBW)then{_SUBJECT call func_NewRearmBW_step2_ChosenGreen;}; 
		if(RHAddWeaponsBW)then{_SUBJECT call func_rearm_step1_UnitRole;}; //BETA NOT CLASS DEPENDEND
	
	};
	case Civilian: 				
	{  
		_Civilian = true;
		//if(_SUBJECT in )exitwith{};
			if((TypeOF _SUBJECT) == "RU_Doctor")then
			{ 
				_SUBJECT addEventHandler ["killed", "[_this select 0,'MED', _this select 1] call func_dead_MED;"];
				Count_TotalMedics = Count_TotalMedics + 1;
				_Civilian = false;
				Array_MedicalPersonal = Array_MedicalPersonal + [_SUBJECT];
				_SUBJECT disableAI "FSM";
				_GROUP = group _SUBJECT;
				if!(_GROUP in MedicGroups)then
				{
					MedicGroups = MedicGroups + [_GROUP];
					
					_GROUP setVariable ["CurrentJob","Free",true];					
					_GROUP setVariable ["CurrentDeadBodies",[],true];	//Array of Objects, not Markers!				
					_GROUP setVariable ["WhatGroupIsDoing","NOTHING",true];
					_GROUP setVariable ["FailedWaypointJob",[],true];
					_GROUP setVariable ["RemovingInProgress",false,true];
					_GROUP setVariable ["WaypointSet",false,true];
					_GROUP setVariable ["TimeToFailMission",30,true]; //To fix stand drivers who do nothing!
					//_GROUP setVariable ["MyParkingLOtName","",true];// ALREADY USED IN OTHER SCRIPT!
					
					//_GROUP setVariable ["Mission","PatrolAndStop",true];
					//_GROUP setVariable ["CurrentTargetMarker","",true];
					//_GROUP setVariable ["LostFormation",false,true];
					//_GROUP setVariable ["DistanceSize",25,true];
					//_GROUP setVariable ["PatrolOutOfTime",0,true];		
					//_GROUP setVariable ["investigationTimer",0,true];
					//_GROUP setVariable ["CurrentSuspect",ObjNull,true];
					//_GROUP setVariable ["BackupOUpdateTime",0,true];
					//_GROUP setVariable ["FailToPatrol",0,true];
					
					_GROUP setVariable ["TimeToFailTask",GROUP_STUCK_TIMER,true];//2020
				};
			
			
			
			
			
			
			};
			
			if((TypeOF _SUBJECT) == "TK_CIV_Worker01_EP1")then	//USMC_LHD_Crew_Red
			{ 
				_SUBJECT addEventHandler ["killed", "[_this select 0,'FIRE', _this select 1] call func_dead_FIRE;"];
				_Civilian = false;
				Count_TotalFirefighters = Count_TotalFirefighters + 1;
				Array_FiremanPersonal = Array_FiremanPersonal + [_SUBJECT];
				_SUBJECT disableAI "FSM";
				_GROUP = group _SUBJECT;
				if!(_GROUP in FirefighterGroups)then
				{
					FirefighterGroups = FirefighterGroups + [_GROUP];
					
					_GROUP setVariable ["CurrentJob","Free",true];					
					_GROUP setVariable ["CurrentFireObjects",[],true];	//Array of Objects (LOGICs), not Markers!				
					_GROUP setVariable ["WhatGroupIsDoing","NOTHING",true];
					_GROUP setVariable ["FailedWaypointJob",[],true]; //Array of Objects (LOGICs), not Markers!		
					_GROUP setVariable ["RemovingInProgress",false,true];
					_GROUP setVariable ["WaypointSet",false,true];
					_GROUP setVariable ["TimeToFailMission",30,true]; //To fix stand drivers who do nothing!
					//_GROUP setVariable ["MyParkingLOtName","",true];// ALREADY USED IN OTHER SCRIPT!
					
					//_GROUP setVariable ["Mission","PatrolAndStop",true];
					//_GROUP setVariable ["CurrentTargetMarker","",true];
					//_GROUP setVariable ["LostFormation",false,true];
					//_GROUP setVariable ["DistanceSize",25,true];
					//_GROUP setVariable ["PatrolOutOfTime",0,true];		
					//_GROUP setVariable ["investigationTimer",0,true];
					//_GROUP setVariable ["CurrentSuspect",ObjNull,true];
					//_GROUP setVariable ["BackupOUpdateTime",0,true];
					//_GROUP setVariable ["FailToPatrol",0,true];
					
					_GROUP setVariable ["TimeToFailTask",GROUP_STUCK_TIMER,true];//2020
				};
			
			
			
			
			
			
			};
			
		
			
			_SUBJECT addEventHandler ["fired", { _this call func_ShotFired;}];
			if(SHOWTMessageLVL2)then{player sidechat format ["|---ADDED TO Array_CivilainSide: %1", name _SUBJECT];};// MESSAGE LVL2	
			
			
			//Voice
			if(count VoiceArraySusp < 1)then{ VoiceArraySusp = VoiceArraySuspReserve;};
			_VoiceWillUse = (VoiceArraySusp select (round(random ((count VoiceArraySusp) -1))));
			VoiceArraySusp = VoiceArraySusp - [_VoiceWillUse];
			_SUBJECT setVariable ["Voice",_VoiceWillUse,true];	
			//Voice END
			
			_SUBJECT addEventHandler ["HandleDamage", {_this call FUNC_SETHITEast;}];
			
			if(_Civilian)then
			{
				_SUBJECT addEventHandler ["killed", "[_this select 0,'CIV', _this select 1] call func_dead_CIV;"];
				Count_TotalCivs = Count_TotalCivs + 1;
				Array_CivilainSide = Array_CivilainSide + [_SUBJECT];
			}
	};
	default 
	{ 
	hint "default !INIT.SQF!";
	};
};



//DEFAULT
_SUBJECT setVariable ["InFighting",false,true]; //MODULE Close Combat
_SUBJECT setVariable ["Stunned",false,true]; //Stunned?
//_SUBJECT setVariable ["MyMarkerName","",true]; //OnlineMarker
_SUBJECT setVariable ["AmountOfCS",0,true]; //Amount of CS gas grenades
_SUBJECT setVariable ["CanSaySomething",true,true]; //

//COP
_SUBJECT setVariable ["ImChasing",[],true]; //suspects in range
_SUBJECT setVariable ["inDanger",false,true]; //Dont move to a suspect, has visual to shoot dangerous person. 
_SUBJECT setVariable ["inDangerTargetPerson",ObjNull,true]; //Dont move to a suspect, has visual to shoot dangerous person. 
_SUBJECT setVariable ["ImGoingToArrest",false,true]; //Is going to arrest someone?
_SUBJECT setVariable ["ImGoingToArrestPERSON",ObjNull,true]; //Is going to arrest person
_SUBJECT setVariable ["SpeakBan",4,true]; //Speak ban | 0 - can say something, max delay 4 *2.5 sec = 10 sec
_SUBJECT setVariable ["SayHello",true,true]; //Speak first time ban | false = ban until chase end
_SUBJECT setVariable ["GetIn",true,true]; //Can get in vehicles?
_SUBJECT setVariable ["ShootDistance",(120 + round random 160),true]; //EXPERIMENTAL Which distance will be used to shoot
_SUBJECT setVariable ["DoMovePos",[0,0],true]; //EXPERIMENTAL
_SUBJECT getVariable ["APC_GUNNER", false];
//_SUBJECT setvariable ["allowGetIn", true];

//**********[NOTES] Police Groups variables [NOTES]
//_GROUP setVariable ["Mission","",true]; //Group mission
//-	PatrolAndStop
//-	PatrolAndMove
//-	Nothing
//-
//_GROUP setVariable ["CurrentTargetMarker","",true]; //Target marker
//_GROUP setVariable ["LostFormation",false,true]; //Lost formation after police chase
//_GROUP setVariable ["DistanceSize",20,true]; //Distance size, to fix bug if cops can't reach chosen place
//_GROUP setVariable ["PatrolOutOfTime",0,true]; //Cancel marker point
//_GROUP setVariable ["CurrentInvestigationMarker","",true]; //Target marker
//_GROUP setVariable ["investigationTimer","",true]; //Timer to complete investigation
//_GROUP setVariable ["CurrentSuspect",ObjNull,true]; //Current group in a police chase
//_GROUP setVariable ["WhatGroupIsDoing","NOTHING",true]; //What Exactly Current Group Is Doing
//_group setVariable ["BackupOUpdateTime",0,true];
//_group setVariable ["FailedWaypointJob",[],true];
//_group setVariable ["FailToPatrol",0,true];


//SUSP
_SUBJECT setVariable ["WantedFor",[],true];//current warrants
_SUBJECT setVariable ["BW_WantedFor",[],true];//current warrants
_SUBJECT setVariable ["GivingUp",false,true];//
//_SUBJECT setVariable ["GaveUp",false,true];//
_SUBJECT setVariable ["Morale",(round (random 300)),true];
_SUBJECT setVariable ["Dangerous",false,true]; // true = shoot to kill him!
_SUBJECT setVariable ["BW_Dangerous",false,true]; // true = shoot to kill him!
_SUBJECT setVariable ["StaminaMax",(round (random 200)) + 50,true]; //Maximum resistance againts stun weapons
_SUBJECT setVariable ["StaminaCur",(_SUBJECT getVariable "StaminaMax"),true]; // Current resistance againts stun weapons
_SUBJECT setVariable ["PoliceChaseInProgress",0,true]; // number = how many cops are chasing
_SUBJECT setVariable ["BW_ChaseInProgress",0,true]; // number = how many BW are chasing
_SUBJECT setVariable ["OutOfControl",false,true]; //Cops can try to kick his ass in close combat
_SUBJECT setVariable ["BW_OutOfControl",false,true]; //BW can try to kick his ass in close combat
_SUBJECT setVariable ["OutOfControPoints",60,true]; //To activate OutOfControl
_SUBJECT setVariable ["BW_OutOfControPoints",20,true]; //To activate OutOfControl
_SUBJECT setVariable ["Arrested",false,true]; //Arrested
_SUBJECT setVariable ["LastPos",(getPos _SUBJECT),true]; //Last pos, to avoid cop move bug in func_PoliceCHASE.sqf
_SUBJECT setVariable ["SomeoneIsGoingToArrestMe",ObjNull,true]; //Person who will do arrest
_SUBJECT setVariable ["WhoIsChasingMe",[],true]; //NEW  needed to know who is chasing
_SUBJECT setVariable ["BW_WhoIsChasingMe",[],true]; //NEW  needed to know who is chasing
_SUBJECT setVariable ["CopSaidHello",false,true]; //Speak first time ban | true = ban until chase end
_SUBJECT setVariable ["BW_SaidHello",false,true]; //Speak first time ban | true = ban until chase end
_SUBJECT setVariable ["SuspShotsFired",false,true]; //Cop will say TAKE COVER if TRUE

_SUBJECT setVariable ["Tresspassing_Yellow",false,true]; //Tresspassing
_SUBJECT setVariable ["Tresspassing_Red",false,true]; //Tresspassing
_SUBJECT setVariable ["Tresspassing_Compromised",false,true]; //

_SUBJECT setVariable ["Tresspassing_GuardMan_1",false,true]; //
_SUBJECT setVariable ["Tresspassing_GuardMan_2",false,true]; //



//_SUBJECT setVariable ["TaxiDestinationPos",position player,true]; //TAXI MODULE CLIENT
_SUBJECT setVariable ["TaxiPayment",0,true]; //TAXI MODULE CLIENT
_SUBJECT setVariable ["TaxiDestinationWIP",false,true]; //TAXI MODULE CLIENT
//_SUBJECT setVariable ["TaxiPayment",0,true]; //TAXI MODULE CLIENT
//

_SUBJECT setVariable ["Police_RiskLevel_BonusScore",0,true]; // Addition score to add points when the subject dies in murder case.

_SUBJECT setVariable ["Money",990,true]; //Money
_SUBJECT setVariable ["Hunger",55,true]; //




_SUBJECT setVariable ["CarOwner",[],true]; //
_SUBJECT setVariable ["Shop_CarDetected",[],true]; //for Gas Station refuel
_SUBJECT setVariable ["Shop_USE",objNull,true]; //for Shop use (Gun store)
_SUBJECT setVariable ["Shop_USE_cars",objNull,true]; //for Shop use


//_SUBJECT setVariable ["ShopItems_HandGuns",[],true]; //GUN STORE
//_SUBJECT setVariable ["ShopItems_ShotGuns",[],true]; //GUN STORE
//_SUBJECT setVariable ["ShopItems_SMGs",[],true]; //GUN STORE
//_SUBJECT setVariable ["ShopItems_AssaultRifles",[],true]; //GUN STORE
//_SUBJECT setVariable ["ShopItems_SniperRifles",[],true]; //GUN STORE
//_SUBJECT setVariable ["ShopItems_MachineGuns",[],true]; //GUN STORE



//_SUBJECT setVariable ["ShopItems_Motorcycles",[],true]; //Car STORE
//_SUBJECT setVariable ["ShopItems_Cars",[],true]; //Car STORE
//_SUBJECT setVariable ["ShopItems_Vans",[],true]; //Car STORE
//_SUBJECT setVariable ["ShopItems_OffRoads",[],true]; //Car STORE
//_SUBJECT setVariable ["ShopItems_Trucks",[],true]; //Car STORE
//_SUBJECT setVariable ["ShopItems_Buses",[],true]; //Car STORE



//RES

//CIV
_SUBJECT addrating 50000;


if(SHOWTMessageLVL2)then{player globalchat format ["|---func_DefaultSET: %1", _SUBJECT];};// MESSAGE LVL2

_SUBJECT setVariable ["AI_FULLYSET",true,true]; //AI SET ALREADY!

//*************TEST
//_SUBJECT setVariable ["WantedFor",["ASS"],true];
if(player == _SUBJECT)then
{
	_SUBJECT setVariable ["Morale",900,true];
	
	//player setcaptive true;
	
	if(side _SUBJECT == East)then{_SUBJECT setVariable ["WantedFor",["TEST"],true];};
	//if(side _SUBJECT == East)then{_SUBJECT setVariable ["Dangerous",true,true];};
}
else
{
	//FOR TEST!
	//_SUBJECT setVariable ["Morale",(-999),true];
	//_SUBJECT setVariable ["Dangerous",true,true]; 
	//_SUBJECT setVariable ["Dangerous",true,true];
	///--------------------if(side _SUBJECT == East)then{_SUBJECT setVariable ["WantedFor",["TEST"],true];};
	if(side _SUBJECT == East)then{_SUBJECT setVariable ["WantedFor",["TEST"],true];};
	//if(side _SUBJECT == East)then{_SUBJECT setVariable ["Dangerous",true,true];};
	//if(side _SUBJECT == East)then{_SUBJECT setVariable ["Morale",6000,true];};
	//if(side _SUBJECT == East)then{_SUBJECT disableAI "Move"};
	//if(side _SUBJECT == East)then{Q reveal _SUBJECT};
	//if(side _SUBJECT == East)then{_SUBJECT setUnitPos "UP";};
	if(side _SUBJECT == East)then{addSwitchableUnit _SUBJECT;};
	//if(side _SUBJECT == East)then{_SUBJECT setVariable ["Morale",9999,true];};
	//if(side _SUBJECT == East)then{removeAllweapons _SUBJECT;};
	
	//if(side _SUBJECT == East)then{_SUBJECT ADDRATING (-150000)};
	//FOR TEST! END
};
//_SUBJECT setVariable ["ShootDistance",140,true]; //DEL
//_SUBJECT setVariable ["WantedFor",["TEST"],true];//current warrants
//_SUBJECT setVariable ["BW_WantedFor",["TEST"],true];//current warrants



//_SUBJECT addEventHandler ["FiredNear", { hint format ["%1",_this select 1];}];





//[player, ZAQ] call func_position_Difference_btw2;
//[_SUBJECT, player] call func_position_Difference_btw2;
