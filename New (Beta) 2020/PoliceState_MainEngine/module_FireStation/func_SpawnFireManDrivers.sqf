//func_SpawnFireManDrivers.sqf
private ["_this","_marker","_newCAR","_GROUP","_DRIVER","_PASSENGER","_name","_marker"];


_CarPark = _this;



{

	_newCAR = _x;	
	_GROUP = Creategroup civilian;
	//_Sample = _GROUP createUnit ["TK_CIV_Takistani01_EP1",getpos _newCAR, [], 1, "NONE"]; 
	_DRIVER = _GROUP createUnit ["TK_CIV_Worker01_EP1",getpos _newCAR, [], 1, "NONE"]; 
	_DRIVER setCaptive true;
	_DRIVER moveindriver _newCAR;
	_DRIVER call func_DefaultSET;
	_PASSENGER = _GROUP createUnit ["TK_CIV_Worker01_EP1",getpos _newCAR, [], 0, "NONE"]; 
	_PASSENGER setCaptive true;
	_PASSENGER moveincargo _newCAR;
	_PASSENGER call func_DefaultSET;
	
	
	//PARKING LOT
	_name = "FS_ParkingLot_No_" + format ["%1",(count FireStationParkingLot + 1)];
	_marker = createMarker [_name, (getpos _newCAR)];
	_marker setMarkerType "Empty";	
	player sidechat format ["Parking lot created: %1",_name];
	_GROUP setVariable ["MyParkingLOtName",_marker,true];
	FireStationParkingLot= FireStationParkingLot + [_marker];
	//hintc format ["USMC_LHD_Crew_Red = %1", side _PASSENGER];
}foreach _CarPark;

//hintc format ["FireStationParkingLot = %1",FireStationParkingLot];