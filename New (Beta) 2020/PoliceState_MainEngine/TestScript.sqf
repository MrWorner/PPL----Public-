





//hintc format ["NeedToInvestigate = %1", NeedToInvestigate];
onMapSingleClick "player setPos _pos; true; onMapSingleClick '';";
TestMan = CursorTarget;
if(isnull TestMan)exitwith{};

//hintc format ["Dofollow! %2 follow %1", leader (group TestMan), TestMan];
hintc format ["%1",TestMan in  PoliceGroups];
//PoliceGroups = PoliceGroups + [group TestMan];



//(group TestMan) setVariable ["LostFormation",true,true];
//(group TestMan) call fnc_LostFormation;

//addSwitchableUnit TestMan;

if(true)exitwith
{
	
};

// if(true)exitwith
// {
	// player exec "camera.sqs";
// };
//_marker = createMarker [("[M_Test]" + (name player)), position player];
//_marker setMarkerType "Dot";
//_marker setVariable ["Investigation",true,true];

//hintc format ["Investigation = %1",  _marker getvariable "Investigation"];

// [(name player),(position player)] call func_CreateInvestigation;


	//	{	
		//	_x setVariable ["LostFormation",true,true];	
	//	}
	//	foreach PoliceGroups;

//if(true)exitwith{hintc "TestScript";};


if(true && false)exitwith
//if(true)exitwith
{
	while{true}do
	{
		{	
			_CopLeader = leader _x;
			
			player sidechat format ["LostFormation=%1 for %2",(_x getvariable "LostFormation"), _x];
			
		}
		foreach PoliceGroups;
	sleep 1;
	};

};



if(player getvariable "Arrested")then{player switchmove ""; player setVariable ["Arrested",false,true]};




if(true && false)exitwith
//if(true)exitwith
{

	ENABLE_COP_AI = false;
	sleep 3;
	ENABLE_COP_AI = true;

	//AI_Police
	func_PoliceSCAN = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_PoliceSCAN.sqf"; //POLICE SCAN
	func_PoliceCHASE = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_PoliceCHASE.sqf"; //POLICE CHASE
	func_FireAtWill = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_FireAtWill.sqf"; //POLICE CHASE CHECK
	func_OutOfControl = compile preprocessfilelinenumbers  "PoliceState_MainEngine\AI_Police\func_OutOfControl.sqf"; //POLICE OUT OF CONTROL
	sleep 1;
	[] spawn func_PoliceSCAN;
	[] spawn func_PoliceCHASE;
	[] spawn func_FireAtWill;
	[] spawn func_fixStuckArrays;
	[] spawn func_OutOfControl;	
	//{		
	//		player setpos getpos _x;
	//		sleep 3;
	//} forEach Array_SuspectSide;


};


if(true && false)then
//if(true)then
{
	player sidechat format ["Dangerous = %1", Me getvariable "Dangerous"];
	player sidechat format ["WantedFor = %1", Me getvariable "WantedFor"];
	Me setVariable ["Dangerous",false,true];
	Me setVariable ["WantedFor",[],true];
	player setCaptive true;
	//sleep 3;
	player setCaptive false;
	player sidechat format ["Dangerous = %1", Me getvariable "Dangerous"];
	player sidechat format ["WantedFor = %1", Me getvariable "WantedFor"];
	//_wp =group ZACK addWaypoint [position cop1, 0];
	//_wp =group ZACK addWaypoint [position cop1, 0];
	//_wp =group ZACK addWaypoint [position cop1, 0];
};

TestMan = CursorTarget;
if(isnull TestMan)exitwith{};

if(side TestMan == West)then
{
	sleep 0.1;
	//player sidechat format ["Array_SuspectsInChase = %1", Array_SuspectsInChase];
	//hintc format ["Array_SuspectsInChase = %1",  Array_SuspectsInChase];

	//Array_SuspectsInChase = [];

	player sidechat format ["TestMan = %1",  vehicle TestMan];
	hintc format ["TestMan = %1",  TestMan];
	sleep 0.1;
	player sidechat format ["ImChasing = %1",  TestMan getvariable "ImChasing"];
	hintc format ["ImChasing = %1",  TestMan getvariable "ImChasing"];
	//((TestMan getvariable "ImChasing") select 0) setpos getpos player;
	sleep 0.1;
	player sidechat format ["inDanger = %1",  TestMan getvariable "inDanger"];
	hintc format ["inDanger = %1",  TestMan getvariable "inDanger"];
	sleep 0.1;
	//player sidechat format ["inDangerTargetPerson = %1",  TestMan getvariable "inDangerTargetPerson"];
	//hintc format ["inDangerTargetPerson = %1",  TestMan getvariable "inDangerTargetPerson"];
	//(TestMan getvariable "inDangerTargetPerson") setpos getpos player;
	//sleep 0.1;
	//hintc format ["inDangerTargetPerson  in  ImChasing= %1", (TestMan getvariable "inDangerTargetPerson") in (TestMan getvariable "ImChasing")];
	//sleep 0.1;
	//hintc format ["inDangerTargetPerson WantedFor = %1", (TestMan getvariable "inDangerTargetPerson") getvariable "WantedFor"];
	//sleep 0.1;
	player sidechat format ["InFighting = %1",  TestMan getvariable "InFighting"];
	hintc format ["InFighting = %1",  TestMan getvariable "InFighting"];
	sleep 0.1;
	player sidechat format ["ImGoingToArrest = %1",  TestMan getvariable "ImGoingToArrest"];
	hintc format ["ImGoingToArrest = %1",  TestMan getvariable "ImGoingToArrest"];
	//_CopLeader = leader group TestMan;
	_group = group TestMan;
	//player sidechat format ["LostFormation=%1 for %2",(_x getvariable "LostFormation"), _x];
	//sleep 0.1;
	//player sidechat format ["CurrentTargetMarker = %1",  _group getvariable "CurrentTargetMarker"];
	//hintc format ["CurrentTargetMarker = %1",  _group getvariable "CurrentTargetMarker"];
	
	sleep 0.1;
	player sidechat format ["LostFormation = %1",  _group getvariable "LostFormation"];
	hintc format ["LostFormation = %1",  _group getvariable "LostFormation"];
	
	//sleep 0.1;
	//player sidechat format ["DistanceSize = %1",  _group getvariable "DistanceSize"];
	//hintc format ["DistanceSize = %1",  _group getvariable "DistanceSize"];	
	
	//sleep 0.1;
	//player sidechat format ["PatrolOutOfTime = %1",  _group getvariable "PatrolOutOfTime"];
	//hintc format ["PatrolOutOfTime = %1",  _group getvariable "PatrolOutOfTime"];		
	
	//sleep 0.1;
	//player sidechat format ["CurrentInvestigationMarker = %1",  _group getvariable "CurrentInvestigationMarker"];
	//hintc format ["CurrentInvestigationMarker = %1",  _group getvariable "CurrentInvestigationMarker"];	
	
	//sleep 0.1;
	//player sidechat format ["investigationTimer = %1",  _group getvariable "investigationTimer"];
	//hintc format ["investigationTimer = %1",  _group getvariable "investigationTimer"];	
	
	sleep 0.1;
	player sidechat format ["Mission = %1",  _group getvariable "Mission"];
	hintc format ["Mission = %1",  _group getvariable "Mission"];	
	
	//sleep 0.1;
	//player sidechat format ["CurrentSuspect = %1",  _group getvariable "CurrentSuspect"];
	//hintc format ["CurrentSuspect = %1",  _group getvariable "CurrentSuspect"];	
	
	sleep 0.1;
	player sidechat format ["WhatGroupIsDoing = %1",  _group getvariable "WhatGroupIsDoing"];
	hintc format ["WhatGroupIsDoing = %1",  _group getvariable "WhatGroupIsDoing"];	
	
	//_CopLeader = leader _group;
	//sleep 0.1;
	///player sidechat format [" TestMan == _CopLeader = %1",  TestMan == _CopLeader];
	//hintc format [" TestMan == _CopLeader = %1",  TestMan == _CopLeader];

	//[player] join (group TestMan);
	//(group TestMan) setVariable ["LostFormation",true,true];
	//sleep 30;
	//[player] joinSilent grpNull;	
	
	//LostFormation
	
	(group TestMan) setVariable ["LostFormation",true,true];

}
else
{

	sleep 0.1;
	player sidechat format ["InFighting = %1",  TestMan getvariable "InFighting"];
	hintc format ["InFighting = %1",  TestMan getvariable "InFighting"];

	sleep 0.1;
	player sidechat format ["Stunned = %1",  TestMan getvariable "Stunned"];
	hintc format ["Stunned = %1",  TestMan getvariable "Stunned"];

	sleep 0.1;
	player sidechat format ["SomeoneIsGoingToArrestMe = %1",  TestMan getvariable "SomeoneIsGoingToArrestMe"];
	hintc format ["SomeoneIsGoingToArrestMe = %1",  TestMan getvariable "SomeoneIsGoingToArrestMe"];

	sleep 0.1;
	player sidechat format ["WantedFor = %1",  TestMan getvariable "WantedFor"];
	hintc format ["WantedFor = %1",  TestMan getvariable "WantedFor"];

	sleep 0.1;
	player sidechat format ["Arrested = %1",  TestMan getvariable "Arrested"];
	hintc format ["Arrested = %1",  TestMan getvariable "Arrested"];

	sleep 0.1;
	player sidechat format ["Dangerous = %1",  TestMan getvariable "Dangerous"];
	hintc format ["Dangerous = %1",  TestMan getvariable "Dangerous"];

	sleep 0.1;
	player sidechat format ["PoliceChaseInProgress = %1",  TestMan getvariable "PoliceChaseInProgress"];
	hintc format ["PoliceChaseInProgress = %1",  TestMan getvariable "PoliceChaseInProgress"];

	sleep 0.1;
	player sidechat format ["OutOfControl = %1",  TestMan getvariable "OutOfControl"];
	hintc format ["OutOfControl = %1",  TestMan getvariable "OutOfControl"];

	sleep 0.1;
	player sidechat format ["Morale = %1",  TestMan getvariable "Morale"];
	hintc format ["Morale = %1",  TestMan getvariable "Morale"];

	sleep 0.1;
	player sidechat format ["GivingUp = %1",  TestMan getvariable "GivingUp"];
	hintc format ["GivingUp = %1",  TestMan getvariable "GivingUp"];
	
	sleep 0.1;
	player sidechat format ["WhoIsChasingMe = %1",  TestMan getvariable "WhoIsChasingMe"];
	hintc format ["WhoIsChasingMe = %1",  TestMan getvariable "WhoIsChasingMe"];
	
	sleep 0.1;
	player sidechat format ["WhoIsChasingMe %1 vs PoliceChaseInProgress %2",(count  (TestMan getvariable "WhoIsChasingMe")), TestMan getvariable "PoliceChaseInProgress"];
	hintc format ["WhoIsChasingMe %1 vs PoliceChaseInProgress %2",(count  (TestMan getvariable "WhoIsChasingMe")), TestMan getvariable "PoliceChaseInProgress"];	
	
	sleep 0.1;
	player sidechat format ["MyMarkerName %1 Name = %2",(  (TestMan getvariable "MyMarkerName")), name TestMan];
	hintc format ["MyMarkerName %1 Name = %2",(  (TestMan getvariable "MyMarkerName")), name TestMan];

}




//sleep 1;
//player sidechat format ["Array_CopsSide = %1",  Array_CopsSide];
//player sidechat format ["Array_SuspectSide = %1",  Array_SuspectSide];