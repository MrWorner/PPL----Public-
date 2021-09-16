//FUNC_Taxi_CreateTaxiCar
private["_this","_VehType","_TAXIVEHICLE","_CrewCount","_Position","_NewName","_Rname","_name","_GROUP","_DRIVER","_CrewType"];
_Position = _this select 0;
_VehType = _this select 1;
_CrewCount = 1;
_CrewType = "Citizen1";

_Rname = random 99999;
_NewName = random 99999;
_name = format ["%1", (_Rname) ] + "_CREATEAI_" + format ["%1", (_NewName) ];
_marker = createMarker [ _name, _Position ];
_marker setMarkerType "HW_Done";
_GROUP = Creategroup Civilian;

player sidechat format ["FUNC_Taxi_CreateTaxiCar| Creating new taxi unit = %1", _VehType];
sleep 3;

//-vehicle
_TAXIVEHICLE = createVehicle [_VehType,_Position,[], 0, "NONE"];
_TAXIVEHICLE setdir 180;

sleep 0.1;

//Driver
_DRIVER = _GROUP createUnit [_CrewType,getpos _TAXIVEHICLE, [], 1, "NONE"]; 
_DRIVER moveindriver _TAXIVEHICLE;
sleep 0.1;
_DRIVER call func_DefaultSET;
Array_TaxiDrivers = Array_TaxiDrivers + [_DRIVER];

sleep 0.9;

deletemarker _marker;