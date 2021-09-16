//func_AbortMissionMEDIC
private["_group","_x","_DeadBodiesMarkerCHosenARRAY","_randomMarker", "_waypoint","_FirstDeadBodyMarker","_firstMan","_secondMan","_numberOne","_positionDeadBody","_GetMarkerPos"];
_group = _this;
_DeadBodiesMarkerCHosenARRAY = _group getvariable ["CurrentDeadBodies",[]]; 
_FirstDeadBodyMarker = _DeadBodiesMarkerCHosenARRAY select 0;
_NearestDeadBody = (nearestObjects [GetMarkerPos _FirstDeadBodyMarker, ["Man"], 1]) select 0;
_GetMarkerPos = getMarkerPos _FirstDeadBodyMarker;


{
	if!(alive _x)exitwith{_NearestDeadBody = _x;};
}foreach nearestObjects [GetMarkerPos _FirstDeadBodyMarker, ["Man"], 1];


if (isNil "_NearestDeadBody") exitwith {
	_DeadBodiesMarkerCHosenARRAY = _DeadBodiesMarkerCHosenARRAY - [_FirstDeadBodyMarker];
	_group setVariable ["CurrentDeadBodies",_DeadBodiesMarkerCHosenARRAY,true];
	DeadBodyMARKERS_Array = DeadBodyMARKERS_Array - [_FirstDeadBodyMarker];
	deleteMarker _FirstDeadBodyMarker;
	if(count _DeadBodiesMarkerCHosenARRAY < 1)then
	{
		{
			[_x] allowGetIn true;
		}foreach units _group;
	};
	Medic_TOTAL_WorkDoneCount = Medic_TOTAL_WorkDoneCount + 1;
	_GROUP setVariable ["WaypointSet",false,true];
	_GROUP setVariable ["RemovingInProgress",false,true];
};



_DeadBodiesMarkerCHosenARRAY = _DeadBodiesMarkerCHosenARRAY - [_FirstDeadBodyMarker];
_group setVariable ["CurrentDeadBodies",_DeadBodiesMarkerCHosenARRAY,true];
UnitsWIthMarkers = UnitsWIthMarkers - [_NearestDeadBody];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array - [_FirstDeadBodyMarker];
deleteMarker _FirstDeadBodyMarker;
deleteVehicle _NearestDeadBody;

if(count _DeadBodiesMarkerCHosenARRAY < 1)then
{
	{
		[_x] allowGetIn true;
	}foreach units _group;
};
Medic_TOTAL_WorkDoneCount = Medic_TOTAL_WorkDoneCount + 1;

_GROUP setVariable ["WaypointSet",false,true];


	 