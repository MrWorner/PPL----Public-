//func_RemovingFire
private["_group","_x","_FireLogicCHosenARRAY", "_waypoint","_FirstFireLogic","_firstMan","_secondMan","_numberOne","_positionFireLogic","_GetFireLogicPos"];
_group = _this;
_FireLogicCHosenARRAY = _group getvariable ["CurrentFireObjects",[]]; 
_FirstFireLogic = _FireLogicCHosenARRAY select 0;
_NearestObjectInFire = (nearestObjects [GetPos _FirstFireLogic, ["LandVehicle","Air"], 1]) select 0;
_GetFireLogicPos = getPos _FirstFireLogic;


{
	if!(alive _x)exitwith{_NearestObjectInFire = _x;};
}foreach nearestObjects [GetPos _FirstFireLogic, ["LandVehicle","Air"], 1];


if (isNil "_NearestObjectInFire") exitwith {

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
		[_x] allowGetIn false;
		if (isNil "_secondMan")then{_secondMan = _firstMan;};
		if (isNil "_firstMan")exitwith{};
		_x domove _GetFireLogicPos;
	} foreach units _GROUP;

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
	[_x] allowGetIn false;
	if (isNil "_secondMan")then{_secondMan = _firstMan;};
	if (isNil "_firstMan")exitwith{};
	_x domove _GetFireLogicPos;
} foreach units _GROUP;
if (isNil "_firstMan")exitwith{};

sleep 5;
_secondMan switchmove "RepairingKneel"; 
_firstMan  switchmove "RepairingKneel";
_firstMan lookAt _GetFireLogicPos; 
_secondMan lookAt _GetFireLogicPos; 


sleep 9;

_FireLogicCHosenARRAY = _FireLogicCHosenARRAY - [_FirstFireLogic];
_group setVariable ["CurrentFireObjects",_FireLogicCHosenARRAY,true];
LogicEffectFireArray = LogicEffectFireArray - [_FirstFireLogic];
deleteMarker (_FirstFireLogic getvariable "VehiclePlate");
deleteVehicle _FirstFireLogic;
_firstMan lookAt _NearestObjectInFire; 
_secondMan lookAt _NearestObjectInFire; 


sleep 9;
deleteVehicle _NearestObjectInFire;

sleep 1;
_firstMan switchmove "RepairingKneel333";
_secondMan switchmove "RepairingKneel333";

if(count _FireLogicCHosenARRAY < 1)then{[_firstMan, _secondMan] allowGetIn true;};
Firefighter_TOTAL_WorkDoneCount = Firefighter_TOTAL_WorkDoneCount + 1;
	

_GROUP setVariable ["WaypointSet",false,true];
_GROUP setVariable ["RemovingInProgress",false,true];


	 