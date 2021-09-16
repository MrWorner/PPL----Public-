//func_VehicleDESTROYED
private["_vehicle","_this","_marker"];
_vehicle = _this select 0;
_vehicle removeAllEventHandlers "killed";



_marker = _vehicle getVariable ["VehiclePlate",""];
_marker setMarkerType "HW_BigFire";	
_marker setMarkerPos getpos _vehicle;
if(_marker == "")exitwith{hintc format ["func_VehicleDESTROYED = %1 MARMER NAME EMPTY",_marker];};

_center = createCenter sideLogic;
_group = createGroup _center;
_logic = _group createUnit ["LOGIC",getpos _vehicle , [], 0, ""];
_logic attachTo [_vehicle, [0, 0, 0] ]; 
_logic setVariable ["VehiclePlate",_marker,true];

LogicEffectFireArray = LogicEffectFireArray + [_logic];
Count_TOTAL_DESTROYED_CARS = Count_TOTAL_DESTROYED_CARS + 1;

//hintc format ["LogicEffectFireArray = %1",LogicEffectFireArray];
[_logic,10,time,false,false] spawn func_BIS_FIRE;


