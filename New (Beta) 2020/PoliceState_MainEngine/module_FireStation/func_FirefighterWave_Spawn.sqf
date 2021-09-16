//func_FirefighterWave_Spawn
private["_StationMarker","_UnitsArray","_this","_NewName","_name","_marker","_GROUP","_Veh","_DRIVER","_PASSENGER","_x","_CHOSEN_UnitsArray","_CHOSEN_Veh","_CHOSEN_DriversSize","_CHOSEN_DefaultSkin_CrewSize","_CHOSEN_RandomTrueFalse","_CHOSEN_DriverSkin","_CHOSEN_CrewSkin","_CHOSEN_BaseCOST","_CHOSEN_AdditonCrewArray","_MyCount","_y","_Police_RiskLevel_BonusScore","_i"];

_StationMarker = _this;
_CHOSEN_UnitsArray = FiretruckWave_Cars_ALL;//<-------------------------------
if((count _CHOSEN_UnitsArray) == 0)exitwith{ hintc "func_FirefighterWave_Spawn: Firefighters are not chosen!"};

_CHOSEN_Veh = _CHOSEN_UnitsArray select (round (random ( (count _CHOSEN_UnitsArray) - 1)));	

_NewName = random 99999;
_name = format ["_CREATE_AI_%1", _NewName];
_marker = createMarker [ _name, (getMarkerPos  _StationMarker) ];
_marker setMarkerType "HW_Done";

_GROUP = Creategroup Civilian;
	
_Veh = createVehicle [_CHOSEN_Veh, (getMarkerPos  _StationMarker),[], 0, "NONE"];
_Veh setdir 180;
_Veh call func_VehicleRegistration;

sleep 0.1;

_DRIVER = _GROUP createUnit ["TK_CIV_Worker01_EP1", _Veh, [], 1, "NONE"];
_DRIVER call func_DefaultSET; 
_DRIVER moveindriver _Veh;

sleep 0.1;

_PASSENGER = _GROUP createUnit ["TK_CIV_Worker01_EP1", _Veh, [], 1, "NONE"]; 
_PASSENGER moveincargo _Veh;
_PASSENGER call func_DefaultSET;

//PARKING LOT
_name = "F_ParkingLot_No_" + format ["%1",(count FireStationParkingLot + 1)];


_GROUP setVariable ["MyParkingLOtName",_StationMarker,true];
if!(_StationMarker in FireStationParkingLot )then{FireStationParkingLot= FireStationParkingLot + [_StationMarker];};


_DRIVER setIdentity "GasMask";
_PASSENGER setIdentity "GasMask";

//player sidechat format ["func_Step3_PoliceWave_Spawn: Risk level %1, units are spawning! _CHOSEN_UnitsArray: %2",POLICE_RISK_LEVEL, _CHOSEN_UnitsArray];
sleep 1;
deletemarker _marker;