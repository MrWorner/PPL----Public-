//func_dead_EAST
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer","_friends"];
_SUBJECT = _this select 0;
_SIDE = _this select 1;
_killer = _this select 2;
//hint format ["side:%1", (side _SUBJECT)];
Array_SuspectSide = Array_SuspectSide - [_SUBJECT];
Array_ArrestedGuys = Array_ArrestedGuys - [_SUBJECT];
Array_SuspectsInChase = Array_SuspectsInChase - [_SUBJECT];
Array_BW_SuspectsInChase = Array_BW_SuspectsInChase - [_SUBJECT];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array + [_SUBJECT getVariable "MyMarkerName"];
Count_KilledSuspects = Count_KilledSuspects + 1;
Count_TOTAL_DEAD_BODIES = Count_TOTAL_DEAD_BODIES + 1;

[_SUBJECT, _killer, "EAST"] call func_dead_WhoKilledYOU;

_SUBJECT removeAllEventHandlers "killed";
_SUBJECT removeAllEventHandlers "HandleDamage";
_SUBJECT removeAllEventHandlers "fired";


{
	_chasingList = (_x getvariable "ImChasing");
	if(_SUBJECT in _chasingList)then					
	{
		_chasingList = _chasingList - [_SUBJECT];
		_x setVariable ["ImChasing",_chasingList,true];
		if(( _x getvariable "inDangerTargetPerson") == _SUBJECT)then
		{
			_x setVariable ["inDanger",false,true]; 
		};
	};	

}
foreach Array_CopsSide;
	(_SUBJECT getVariable "MyMarkerName") SETMARKERPOS GETPOS _SUBJECT;
	(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_DeadBody";

if(SHOWTMessageLVL2)then{player sidechat format ["|---REMOVED FROM Array_SuspectSide: %1", _SUBJECT];};// MESSAGE LVL2
if(_SUBJECT getvariable "Arrested")then{ player sidechat "suspect killed when was restrained!";};//player setpos getpos _SUBJECT;
if(side _killer == East)then{Count_FriendlySuspects = Count_FriendlySuspects + 1;};

_friends =  (units group _SUBJECT);
{
	_morale = (_x getVariable "Morale") - 50;
	_x setVariable ["Morale",_morale,true];
}foreach _friends;

