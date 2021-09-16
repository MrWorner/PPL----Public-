//0-0 FIRST
private["_sleepTime","_Looping","_Looping_sleepTime"];
_Cursor = cursorTarget;
//selectPlayer _Cursor;

 //hintc format ["currentWeapon = %1",currentWeapon _Cursor];
 //hintc format ["currentWeapon = %1",currentWeapon _Cursor];
 //_Cursor dotarget player;
//_Cursor switchmove "zaza";







////////////////SCRIPT TIME TEST START

	_fnc_dump = {
		player globalchat str _this;
		diag_log str _this;
		//copytoclipboard str _this;
		hint format ["%1", _this];
		player sidechat format ["%1", _this];
	};

	///////////////INIT

	player setVariable ["ImChasing", [], true];
	sleep 1;

	///////////////////

	_t1 = diag_tickTime;


	///////////////START
	
		_i = 0;
		while {_i < 10} do 
		{
			{
				player setVariable ["ImChasing",(player getvariable "ImChasing") + [_x],true];
			}foreach AllUnits;
			_i = _i + 1;
		};

	/////////////////


	(diag_tickTime - _t1) call _fnc_dump;

////////////////SCRIPT TIME TEST END



if(WEST knowsAbout (vehicle player) > 0.1)then
{
	

};


// for [{_i=1}, {_i < 7}, {_i = _i + 1}] do 
// {
	// {
		// [(getpos player),_x] spawn func_Step3_PoliceWave_Spawn_BONUS;
		// sleep 3;
	// }foreach(PoliceWaveArray_Chernarus_blue select _i);
// };

//***********************************************************************************************************
if(true)exitwith{};	//hintc format [" = %1",];
//***********************************************************************************************************



{
	// [(getpos player),_x] spawn func_Step3_PoliceWave_Spawn_BONUS;
	// sleep 1;

}foreach (PoliceWaveArray_General_blue select 6);


{
	//[(getpos player),_x] spawn func_Step3_PoliceWave_Spawn_BONUS;
	//sleep 3;

}foreach ((PoliceWaveArray_General_blue select 0) select 1);

{
	//[(getpos player),_x] spawn func_Step3_PoliceWave_Spawn_BONUS;
	//sleep 3;

}foreach ((PoliceWaveArray_General_blue select 0) select 0);




_pic = getText (configFile >> "CfgWeapons" >> "G36a" >> "picture");
_textPicture = format ["<t color='#42b6ff' shadow='2' align='left' size='2.8'><img image='%1'/></t> ",_pic];
hint parseText _textPicture;
//hintc _textPicture;
//hintc str parseText format ["Test: <img image=_pic/> Test2",1];





Text101 = format["%1",(getText(configFile >> "CfgWeapons" >> "LeeEnfield" >> "displayName"))];
Text102 = format["%1",(getText(configFile >> "CfgWeapons" >> "LeeEnfield" >> "type"))];
Text103 = format["%1",(getText(configFile >> "CfgWeapons" >> "LeeEnfield" >> "magazines"))];
_picture = getText (configFile >> "cfgWeapons" >> "LeeEnfield" >> "picture");
//[_Cursor, false] spawn func_Global_Arrest;

hint parseText format 
[
"-***-Test-***-

\Text101 = %1
\Text102 = %2
<br/>
<t color='#112233'>Image:<br/>
<img size='5.75' image='%3'/><br/>
"
,
Text101,
Text102,
_picture
//_Cursor getVariable "DoMovePos"//13
];


waitUntil { !(isnil "Voice_BW1_WhoCalledPolice") };

player sidechat "ZAQ SAY SOMETHING!";
{
		zaq say _x;	
		player globalchat format ["ZAQ SAYING %1!",_x];
}
foreach Voice_BW1_MovingArrest;


player sidechat "ZAQ SAY SOMETHING!";
{
		zaq say _x;	
		player globalchat format ["ZAQ SAYING %1!",_x];
}
foreach Voice_BW2_MovingArrest;


hintc format 
[
"-*** TEST HUD-***-

\nStunned %1
\nGivingUp %2
\nArrested %3
\nWhoIsChasingMe %4
\nInFighting %5
\nSomeoneIsGoingToArrestMe %6

\count_func_Global_Arrest_STARTED %7
\count_func_Global_Arrest_ExitWith1 %8
\count_func_Global_Arrest_ExitWith2 %9
\count_func_Global_Arrest_ExitWith3 %10

"
,

(_Cursor getvariable "Stunned"),//4
(_Cursor getvariable "GivingUp"),
(_Cursor getVAriable "Arrested"),
count (_Cursor getVAriable "WhoIsChasingMe"),
(_Cursor getVAriable "InFighting"),
_Cursor getVAriable "SomeoneIsGoingToArrestMe",
count_func_Global_Arrest_STARTED,
count_func_Global_Arrest_ExitWith1,
count_func_Global_Arrest_ExitWith2,
count_func_Global_Arrest_ExitWith3
];



hintc format 
[
"-***-Test-***-

\nArray_SuspectSide = %1
\nArray_SuspectsInChase = %2
\nArray_ArrestedGuys = %3

"
,
Array_SuspectSide,
Array_SuspectsInChase,
Array_ArrestedGuys
//_Cursor getVariable "DoMovePos"//13
];



	{
		_COP = _x;	
		if(count (_COP getvariable "ImChasing") > 0)then
		{
			
			hint "DADADA3";
			
		}
		else
		{
			hint "NET";
		};		
	}
	foreach Array_CopsSide;



//WIP SHOOTING FROM VEHICLE;
	ZAQ1 lookAt position ZZZ1; 
	ZAQ1 doWatch ZZZ1; 
	ZAQ1 doTarget ZZZ1; 

_group = group ZZZ1;
_TargetEliminated = true;
_target = ObjNull;
while{ count units _group > 0}do
{
	if(_TargetEliminated)then
	{
		while {(count (waypoints  group ZAQ1)) > 0} do
		{
			deleteWaypoint ((waypoints  group ZAQ1) select 0);
			hint "";
		};	
		_target = ( (units _group) select 0);
		_wp1 = group ZAQ1 addWaypoint [position vehicle _target, 0]; 
		[group ZAQ1, 0] setWaypointType "DESTROY"; 
		[group ZAQ1, 0] waypointAttachVehicle vehicle _target; 		
		_wp2 = group ZAQ1 addWaypoint [position vehicle _target, 1]; 
		[group ZAQ1, 1] setWaypointType "DESTROY"; 
		[group ZAQ1, 1] waypointAttachVehicle vehicle _target; 		
		_TargetEliminated = false;
	};

	
	{
		_x reveal _target;
				_x domove getpos _target;
		//_x lookAt position ZZZ1; 
		_x doTarget _target; 
		_x commandFire _target;		
		if (_x aimedAtTarget [_target] > 0)then
		{ 
			_x fireAtTarget [_target];
			_x doFire _target;
			
			//player sidechat format ["%1",_x];
			player sidechat format ["%1 %2",name _target, name _x];
		};
		
	}foreach units group ZAQ1;
	hintSilent format [" _target: %1 ", _target];
	sleep 0.1;
	if!(alive _target)then{_TargetEliminated = true;};
};
hintc "END!";

//WIP SHOOTING FROM VEHICLE END;




hintc format 
[
"-***-POLICE TEST HUD-***-

\nSame person target = %1
\n%2
\n%3
\ninDanger = %5
\ninDangerTargetPerson = %6
\nSpeakBan = %9
\nSayHello = %10
\nGetIn = %11
\nShootDistance = %12
\nDoMovePos = %13
\nImGoingToArrest = %7
\nImGoingToArrestPERSON = %8
\nImChasing = %4
"
,

((_Cursor getVariable "inDangerTargetPerson") == _Cursor), //1
"",//2	_GROUP getVariable "CurrentSuspect"
"",//3	_GROUP getVariable "WhatGroupIsDoing"

_Cursor getVariable "ImChasing",//4
_Cursor getVariable "inDanger",//5
_Cursor getVariable "inDangerTargetPerson",//6
_Cursor getVariable "ImGoingToArrest",//7
_Cursor getVariable "ImGoingToArrestPERSON",//8
_Cursor getVariable "SpeakBan",//9
_Cursor getVariable "SayHello",//10
_Cursor getVariable "GetIn",//11
_Cursor getVariable "ShootDistance",//12
_Cursor getVariable "DoMovePos"//13
];

_marker1 = createMarker ["Marker1111", position player];
_marker1 setMarkerType "Warning";
_marker2 = createMarker ["Marker2221", position (_Cursor getVariable "inDangerTargetPerson")];
_marker2 setMarkerType "Warning";
_CHASING = 0;
_CHASING2 = count (_Cursor getVariable "ImChasing");

{
	if!(alive _x)then{_CHASING = _CHASING + 1;};
	if(isnull _x)then{_CHASING = _CHASING + 1;};
}
foreach (_Cursor getVariable "ImChasing");
sleep 4;
hintc format ["CHASING ERROR:%1  TOTAL:%2 ",_CHASING,_CHASING2];
deleteMarker _marker1;
deleteMarker _marker2;

//player setpos getpos (_Cursor getVariable "inDangerTargetPerson");



_aimingQuality = player aimedAtTarget [ZAQ1];

hint format [" _aimingQuality: %1 ", _aimingQuality];


//ZAQ1 doWatch player;
	ZAQ1 lookAt position ZZZ1; 
	ZAQ1 doWatch ZZZ1; 
	ZAQ1 doTarget ZZZ1; 

_group = group ZZZ1;
while{ count units _group > 0}do
{


	_target = ( (units _group) select 0);
	
	{
		_x reveal _target;
		
		//_x lookAt position ZZZ1; 
		_x doTarget _target; 		
		if (_x aimedAtTarget [_target] > 0)then
		{ 
			_x fireAtTarget [_target];
			_x doFire _target;
			_x commandFire _target;

		};
		
	}foreach units group ZAQ1;
	
	hintSilent format [" _target: %1 ", _target];
	sleep 0.1;
};
hintc "END!";
{
	//player setpos getpos _x;
	//sleep 5;
} forEach Array_SuspectSide;



//_MedicLeader = leader (MedicGroups select 0);

//allGroups = allGroups - [(allGroups select 1)];
//hintc format [" count: %1", count units (allGroups select 1)];
//hintc format [" count: %1", count units (allGroups select 1)];
//hintc format [" count: %1", count units (allGroups select 1)];




{		
		_SIDE = side _x;
		player sidechat format [ "func_KillAll_CIVILIANS _SIDE = %1",_SIDE];
		if(((TypeOF _x) != "RU_Doctor"))then
		{
			if(_x != player)then{_x setdamage 1;};
			player sidechat "func_KillAll_CIVILIANS = CIVILAN KILLED!";
		}		
} forEach allUnits;
hintc format ["DeadBodyMARKERS_Array = %1 | Count = %2 |", DeadBodyMARKERS_Array, count DeadBodyMARKERS_Array];
hintc format ["DeadBodyMARKERS_Array =  | Count = %2 |", DeadBodyMARKERS_Array, count DeadBodyMARKERS_Array];

{
 hint format [" count: %1", count units (allGroups select 1)];;
}
foreach units (allGroups select 1);

{
	if!(alive _x)then{hint "DA4";};
}
foreach ALLUNITS;


{
	_group = _x;
	_Leader = leader _group;								
	{		
		_x doFollow _Leader; 	
		//_x setVariable ["WaypointSet",false,true];
		[_x] allowGetIn true;
		
	} forEach units _group ;
	hint "DONE!";
}
foreach MedicGroups;

//if(true)exitwith{hintc format ["_Cursor = %1", _Cursor];}
if(! (alive _Cursor))exitwith{hintc "ShowVar not alive";};

_sleepTime = 0.1;
_Looping = true;
_Looping_sleepTime = 1;

//hintc format [" NeedToInvestigate: %1", NeedToInvestigate];

//player setpos getmarkerpos (NeedToInvestigate select 0);

//if(true)exitwith{};


//{
//	sleep 0.7;
//	player sidechat format [" Array_SuspectSide: %1 with VOICE: %2", name _x, _x getvariable "Voice"];
	
//
//}foreach Array_SuspectSide;



sleep 0.1;
//hintc format [" InFighting: %1", _Cursor getVariable "InFighting"];
sleep 0.1;
//hintc format [" Stunned: %1", _Cursor getVariable "Stunned"];
sleep 0.1;
//hintc format [" AmountOfCS: %1", _Cursor getVariable "AmountOfCS"];
sleep 0.1;
//hintc format [" GivingUp: %1", _Cursor getVariable "GivingUp"];
sleep 0.1;
//hintc format [" Morale: %1", _Cursor getVariable "Morale"];
sleep 0.1;
//hintc format [" Dangerous: %1", _Cursor getVariable "Dangerous"];
sleep 0.1;
//hintc format [" PoliceChaseInProgress: %1", _Cursor getVariable "PoliceChaseInProgress"];
sleep 0.1;
//hintc format [" Arrested: %1", _Cursor getVariable "Arrested"];
sleep 0.1;
//hintc format [" SomeoneIsGoingToArrestMe: %1", _Cursor getVariable "SomeoneIsGoingToArrestMe"];
//player setpos getpos (_Cursor getVariable "SomeoneIsGoingToArrestMe");
_Cursor setVariable ["SomeoneIsGoingToArrestMe",ObjNull,true];
_Cursor setVariable ["GivingUp",false,true];
sleep 0.1;
hintc format [" WhoIsChasingMe: %1", _Cursor getVariable "WhoIsChasingMe"];
sleep 0.1;
if(true)exitwith{};



player groupchat "|=>>> SHOWVAR ACTIVATED";
//sleep _sleepTime;
//player groupchat format ["|(W)=>>> Array_CopsSide: %1", Array_CopsSide];
//sleep _sleepTime;
//player groupchat format ["|(W)=>>> Array_SuspectSide: %1", Array_SuspectSide];
//sleep _sleepTime;
//player groupchat format ["|(W)=>>> Array_ThirdForce: %1", Array_ThirdForce];
//sleep _sleepTime;
//player groupchat format ["|(W)=>>> Array_CivilainSide: %1", Array_CivilainSide];
//sleep _sleepTime;
if(ShowVar)then{ShowVar = false}else{ShowVar = true};
player groupchat "|(W)=>>> -----------------------------";
while{(_Looping && ShowVar)}do
{
//player groupchat format ["|(W2)=>>> Array_CopsSide: %1", Array_CopsSide];
//sleep _Looping_sleepTime;
//player groupchat format ["|(W2)=>>> Array_SuspectSide: %1", Array_SuspectSide];
//sleep _Looping_sleepTime;
//player groupchat format ["|(W2)=>>> Array_ThirdForce: %1", Array_ThirdForce];
//sleep _Looping_sleepTime;
//player groupchat format ["|(W2)=>>> Array_CivilainSide: %1", Array_CivilainSide];
//sleep _Looping_sleepTime;
player groupchat format ["|(W2)=>>> player: %1", player];
sleep _Looping_sleepTime;
player groupchat "|(W2)=>>> -----------------------------LOOP";


}


//HINT FORMAT [" %1 ", ];
