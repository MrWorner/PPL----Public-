//func_RemovingCorpses
private["_group","_x","_DeadBodiesMarkerCHosenARRAY","_randomMarker", "_waypoint","_FirstDeadBodyMarker","_firstMan","_secondMan","_numberOne","_positionDeadBody","_GetMarkerPos"];
_group = _this;
_DeadBodiesMarkerCHosenARRAY = _group getvariable ["CurrentDeadBodies",[]]; 
_FirstDeadBodyMarker = _DeadBodiesMarkerCHosenARRAY select 0;

if(_FirstDeadBodyMarker in Medic_PhoneCalls)exitwith
{
	_group setVariable ["WhatGroupIsDoing","MoveToHeal",true];
	[_group, _FirstDeadBodyMarker] spawn func_HEAL_MISSION;
};

_NearestDeadBody = (nearestObjects [GetMarkerPos _FirstDeadBodyMarker, ["Man"], 1]) select 0;
_GetMarkerPos = getMarkerPos _FirstDeadBodyMarker;

{
	if!(alive _x)exitwith{_NearestDeadBody = _x;};
}foreach nearestObjects [GetMarkerPos _FirstDeadBodyMarker, ["Man"], 1];


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



if (isNil "_NearestDeadBody") exitwith {

	_DeadBodiesMarkerCHosenARRAY = _DeadBodiesMarkerCHosenARRAY - [_FirstDeadBodyMarker];
	_group setVariable ["CurrentDeadBodies",_DeadBodiesMarkerCHosenARRAY,true];
	DeadBodyMARKERS_Array = DeadBodyMARKERS_Array - [_FirstDeadBodyMarker];
	deleteMarker _FirstDeadBodyMarker;
	_GROUP setVariable ["RemovingInProgress",false,true];
	_GROUP setVariable ["WaypointSet",false,true];
	Medic_TOTAL_WorkDoneCount = Medic_TOTAL_WorkDoneCount + 1;
	if (isNil "_firstMan")exitwith{};
	if(count _DeadBodiesMarkerCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;};

};


sleep 4;
//_firstMan attachto [_FirstDeadBodyMarker,[-0.1,-0.2,0]];
//_secondMan attachto [_FirstDeadBodyMarker,[+0.1,+0.3,0]];
//_secondMan setdir 90;
//_firstMan setdir 180;
//_firstMan switchmove "AinvPknlMstpSnonWrflDnon_medic";
//_secondMan switchmove "AinvPknlMstpSnonWrflDnon_medic";

if (alive _firstMan)then
{
	_firstMan  attachto [_NearestDeadBody,[-0.3,-0.2,0]];
	_firstMan  setdir 180;
	_firstMan  switchmove "AinvPknlMstpSnonWrflDr_medic2";	
};
 
if (alive _secondMan)then
{
	_secondMan attachto [_NearestDeadBody,[+0.1,0,0]]; 
	_secondMan setdir 180; 
	_secondMan switchmove "AinvPknlMstpSnonWrflDnon_medic";	
};
 
 


sleep 10;
if (alive _firstMan)then{_firstMan switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";};
if (alive _secondMan)then{_secondMan switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";};

sleep 1;
detach  _firstMan;
detach _secondMan;


_DeadBodiesMarkerCHosenARRAY = _DeadBodiesMarkerCHosenARRAY - [_FirstDeadBodyMarker];
_group setVariable ["CurrentDeadBodies",_DeadBodiesMarkerCHosenARRAY,true];
UnitsWIthMarkers = UnitsWIthMarkers - [_NearestDeadBody];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array - [_FirstDeadBodyMarker];
deleteMarker _FirstDeadBodyMarker;
deleteVehicle _NearestDeadBody;
_Deadbody = "Body" createVehicle _GetMarkerPos;

sleep 1;
if (alive _firstMan)then
{
	_firstMan attachto [_Deadbody,[-0.3,-0.2,0]];
	_firstMan setdir 310;
	_firstMan switchmove "AinvPknlMstpSnonWrflDr_medic2";
};
if (alive _secondMan)then
{
	_secondMan attachto [_Deadbody,[+0.7,0.0,0]];
	_secondMan setdir 20;
	_secondMan switchmove "AinvPknlMstpSnonWrflDnon_medic";
};


sleep 10;
if (alive _firstMan)then{_firstMan switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";};
if (alive _secondMan)then{_secondMan switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";};



sleep 1;
detach  _firstMan;
detach _secondMan;
deleteVehicle _Deadbody;
if(count _DeadBodiesMarkerCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;};
Medic_TOTAL_WorkDoneCount = Medic_TOTAL_WorkDoneCount + 1;

_GROUP setVariable ["WaypointSet",false,true];
_GROUP setVariable ["RemovingInProgress",false,true];


	 