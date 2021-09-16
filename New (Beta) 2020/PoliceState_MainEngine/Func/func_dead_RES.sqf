//func_dead_RES
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer"];
_SUBJECT = _this select 0;
_SIDE = _this select 1;
_killer = _this select 2;
//hint format ["side:%1", (side _SUBJECT)];

[_SUBJECT, _killer, "RES"] call func_dead_WhoKilledYOU;

Array_ThirdForce = Array_ThirdForce - [_SUBJECT];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array + [_SUBJECT getVariable "MyMarkerName"];
Count_KilledThirdForce = Count_KilledThirdForce + 1;
Count_TOTAL_DEAD_BODIES = Count_TOTAL_DEAD_BODIES + 1;

_SUBJECT removeAllEventHandlers "killed";
_SUBJECT removeAllEventHandlers "HandleDamage";
_SUBJECT removeAllEventHandlers "fired";

if(SHOWTMessageLVL2)then{player sidechat format ["|---REMOVED FROM Array_ThirdForce: %1", _SUBJECT];};// MESSAGE LVL2
//hintc "REMOVED FROM Array_ThirdForce!";
(_SUBJECT getVariable "MyMarkerName") SETMARKERPOS GETPOS _SUBJECT;
(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_DeadBody";
			