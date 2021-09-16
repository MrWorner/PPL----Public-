//func_VehicleRegistration
private["_vehicle","_this","_true","_name","_Array","_marker"];
_vehicle = _this;

if!(_vehicle isKindOf "LandVehicle" or _vehicle isKindOf "Air")exitwith{};
if(_vehicle getVariable ["VehiclePlate",""] != "")exitwith{};



clearWeaponCargo _vehicle; 
clearMagazineCargo _vehicle;
AllVehicleCount = AllVehicleCount + 1;



_name = format ["VehicleNo_%1_%2", AllVehicleCount, typeof _vehicle];
//CarAliveArrayMARKERS = CarAliveArrayMARKERS + [_name];


_marker = createMarker [_name, (getpos _vehicle)];
_marker setMarkerType "Empty";	

_vehicle setVariable ["VehiclePlate",_name,true];
player sidechat ("Vehicle registered: " + _name);

_vehicle call FUNC_siren_step1_registration;

_vehicle addEventHandler ["killed", "_this call func_VehicleDESTROYED;"];
//_vehicle addEventHandler ["HitPart", "hint format ['%1', (_this select 0) select 5];"];