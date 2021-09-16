//func_CallPolice

private["_ManWhoCalled", "_center","_marker","_group","_logic"];

player sidechat format ["You called firefighters!",name player];

_ManWhoCalled = player;
_marker = createMarker [(name player + format ["%1",round (random 1000)]) , position player];
_marker setMarkerType "HW_BigFire";	
_marker setMarkerPos getpos _ManWhoCalled;

_center = createCenter sideLogic;
_group = createGroup _center;
_logic = _group createUnit ["LOGIC",getpos _ManWhoCalled , [], 0, ""];
//_logic attachTo [_ManWhoCalled, [0, 0, 0] ]; 
_logic setVariable ["VehiclePlate",_marker,true];

LogicEffectFireArray = LogicEffectFireArray + [_logic];
Firefighter_PhoneCalls = Firefighter_PhoneCalls + [_logic];
Count_TOTAL_DESTROYED_CARS = Count_TOTAL_DESTROYED_CARS + 1;

