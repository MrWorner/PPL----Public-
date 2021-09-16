//func_SpawnMedicDrivers.sqf
private ["_this","_marker","_newCAR","_GROUP","_DRIVER","_PASSENGER","_name","_marker"];


_CarPark = _this;



{
	_newCAR = _x;
	_GROUP = Creategroup civilian;
	_DRIVER = _GROUP createUnit ["RU_Doctor",getpos _newCAR, [], 1, "NONE"]; 
	_DRIVER moveindriver _newCAR;
	_DRIVER call func_DefaultSET;
	_PASSENGER = _GROUP createUnit ["RU_Doctor",getpos _newCAR, [], 0, "NONE"]; 
	_PASSENGER moveincargo _newCAR;
	_PASSENGER call func_DefaultSET;
	
	
	//PARKING LOT
	_name = "H_ParkingLot_No_" + format ["%1",(count HospitalParkingLot + 1)];
	_marker = createMarker [_name, (getpos _newCAR)];
	_marker setMarkerType "Empty";	
	player sidechat format ["Parking lot created: %1",_name];
	_GROUP setVariable ["MyParkingLOtName",_marker,true];
	HospitalParkingLot= HospitalParkingLot + [_marker];
}foreach _CarPark;

//hintc format ["HospitalParkingLot = %1",HospitalParkingLot];