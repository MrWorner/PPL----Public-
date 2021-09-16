//func_HEAL_MISSION
private["_group","_x","_DeadBodiesMarkerCHosenARRAY","_randomMarker", "_waypoint","_MarkerCall","_firstMan","_secondMan","_numberOne","_positionDeadBody","_GetMarkerPos"];
_group = _this select 0;
_MarkerCall = _this select 1;
_GetMarkerPos = getMarkerPos _MarkerCall;


_firstMan = ObjNull;
_secondMan = ObjNull;
_numberOne = true;

{
	if(_numberOne)then
	{
		_firstMan = _x;
		_numberOne = false;	
	}
	else
	{
		_secondMan = _x;
	};
	if (isNil "_secondMan")then{_secondMan = _firstMan;};
	if (isNil "_firstMan")exitwith{};
	[_x] allowGetIn false;
	_x domove _GetMarkerPos;
} foreach units _GROUP;


sleep 60;

_DeadBodiesMarkerCHosenARRAY = _group getvariable ["CurrentDeadBodies",[]]; 
_DeadBodiesMarkerCHosenARRAY = _DeadBodiesMarkerCHosenARRAY - [_MarkerCall];
_group setVariable ["CurrentDeadBodies",_DeadBodiesMarkerCHosenARRAY,true];
UnitsWIthMarkers = UnitsWIthMarkers - [_MarkerCall];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array - [_MarkerCall];
Medic_PhoneCalls = Medic_PhoneCalls - [_MarkerCall];
deleteMarker _MarkerCall;
Medic_TOTAL_WorkDoneCount = Medic_TOTAL_WorkDoneCount + 1;

sleep 1;

if(count _DeadBodiesMarkerCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;}; //Should I disable it?




_GROUP setVariable ["WaypointSet",false,true];
_GROUP setVariable ["RemovingInProgress",false,true];
_group setVariable ["WhatGroupIsDoing","Nothing",true];

	 