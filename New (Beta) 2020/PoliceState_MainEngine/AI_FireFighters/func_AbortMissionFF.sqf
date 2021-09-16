//func_AbortMission
private["_group","_x","_FireLogicCHosenARRAY", "_waypoint","_FirstFireLogic","_firstMan","_secondMan","_numberOne","_positionFireLogic","_GetFireLogicPos"];
_group = _this;
_FireLogicCHosenARRAY = _group getvariable ["CurrentFireObjects",[]]; 
_FirstFireLogic = _FireLogicCHosenARRAY select 0;
_NearestObjectInFire = (nearestObjects [GetPos _FirstFireLogic, ["LandVehicle","Air"], 1]) select 0;
_GetFireLogicPos = getpos _FirstFireLogic;
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
	[_x] allowGetIn false;
	if (isNil "_firstMan")then{_firstMan = ObjNull};
	if (isNil "_secondMan")then{_secondMan = _firstMan;};
	
	_x domove _GetFireLogicPos;
} foreach units _GROUP;


{
	if!(alive _x)exitwith{_NearestObjectInFire = _x;};
}foreach nearestObjects [getpos _FirstFireLogic, ["LandVehicle","Air"], 1];


if (isNil "_NearestDeadCar") exitwith {

	_FireLogicCHosenARRAY = _FireLogicCHosenARRAY - [_FirstFireLogic];
	_group setVariable ["CurrentFireObjects",_FireLogicCHosenARRAY,true];
	LogicEffectFireArray = LogicEffectFireArray - [_FirstFireLogic];
	deleteMarker (_FirstFireLogic getvariable "VehiclePlate");
	deleteVehicle _FirstFireLogic;
	if(count _FireLogicCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;};
	Firefighter_TOTAL_WorkDoneCount = Firefighter_TOTAL_WorkDoneCount + 1;
	_GROUP setVariable ["RemovingInProgress",false,true];
	_GROUP setVariable ["WaypointSet",false,true];
};



_FireLogicCHosenARRAY = _FireLogicCHosenARRAY - [_FirstFireLogic];
_group setVariable ["CurrentFireObjects",_FireLogicCHosenARRAY,true];
LogicEffectFireArray = LogicEffectFireArray - [_FirstFireLogic];
deleteMarker (_FirstFireLogic getvariable "VehiclePlate");
deleteVehicle _FirstFireLogic;
deleteVehicle _NearestObjectInFire;

if(count _FireLogicCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;};

Firefighter_TOTAL_WorkDoneCount = Firefighter_TOTAL_WorkDoneCount + 1;

_GROUP setVariable ["WaypointSet",false,true];


	 