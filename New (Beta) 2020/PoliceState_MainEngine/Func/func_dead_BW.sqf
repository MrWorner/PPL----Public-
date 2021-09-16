//func_dead_BW
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer"];
_SUBJECT = _this select 0;
_SIDE = _this select 1;
_killer = _this select 2;
//hint format ["side:%1", (side _SUBJECT)];

[_SUBJECT, _killer, "BW"] call func_dead_WhoKilledYOU;

Array_BlackWater = Array_BlackWater - [_SUBJECT];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array + [_SUBJECT getVariable "MyMarkerName"];
Count_KilledBW = Count_KilledBW + 1;
Count_TOTAL_DEAD_BODIES = Count_TOTAL_DEAD_BODIES + 1;

_SUBJECT removeAllEventHandlers "killed";
_SUBJECT removeAllEventHandlers "HandleDamage";
_SUBJECT removeAllEventHandlers "fired";

if(SHOWTMessageLVL2)then{player sidechat format ["|---REMOVED FROM Array_BlackWater: %1", _SUBJECT];};// MESSAGE LVL2
		
(_SUBJECT getvariable "ImChasing") call func_MakeWantedFriendsAfterMurder_BW;
{				
	_x setVariable ["BW_ChaseInProgress",(_x getvariable "BW_ChaseInProgress") - 1,true];
	_x setVariable ["BW_WhoIsChasingMe",(_x getvariable "BW_WhoIsChasingMe") - [_SUBJECT],true];
	//if(SHOWTMessageLVL2)then{player globalchat format ["|---%2 REMOVED FROM BW_ChaseInProgress of %1 ", _SUBJECT, _x];};// MESSAGE LVL2	
	//if(count (_x getvariable "BW_WhoIsChasingMe") < 1)then{[(_x),(position _x),false] call func_CreateInvestigation; };
	
}
foreach (_SUBJECT getvariable "ImChasing");


(_SUBJECT getVariable "MyMarkerName") SETMARKERPOS GETPOS _SUBJECT;
(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_DeadBody";
if(side _killer != West)then
{
	if(_SUBJECT !=_killer)then
	{
		//hintc format ["NOT himself %1", _killer];
		_killer setVariable ["Morale",(_killer getVariable "Morale") + 25,true];
		_friends =  (units group _killer);
		{
			_morale = (_x getVariable "Morale") + 20;
			_x setVariable ["Morale",_morale,true];
		}foreach _friends;
		
		
		_killer setVariable ["BW_WantedFor",(_killer getVariable "BW_WantedFor") + ["BW murder"],true];
		
		if(count (_killer getvariable "BW_WhoIsChasingMe") < 1)then
		{
			//[(_killer),(position _killer),true] call func_CreateInvestigation; 
			//[_SUBJECT,(position _SUBJECT),false] call func_CreateInvestigation; 	
			_killer setVariable ["BW_Dangerous",true,true]; 
			(_x getVariable "MyMarkerName") setMarkerColor "ColorRed";
		}
		else
		{
			_killer spawn func_BlackWaterSaysOFFICERDOWN; 
		};
	};
}
else
{
	Count_FriendlyBW = Count_FriendlyBW + 1;
};
