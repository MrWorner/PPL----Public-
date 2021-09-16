//Func_CreateHospital
private ["_Module","_this","_name","_marker","_CarPark"];

_Module = _this select 0;



_name = "Hospital_No_" + format ["%1",(count HospitalArray + 1)];
_marker = createMarker [_name, (getpos _Module)];
_marker setMarkerType "HW_Done";	
player sidechat format ["Hospital created: %1",_name];
HospitalArray = HospitalArray + [_marker];
HospitalArrayCount = HospitalArrayCount + 1;


if(isnil "MedicActivatedScript")then
{
	MedicActivatedScript = true;
};




if(!HospitalCycle_Started)then
{
	HospitalCycle_Started = true;
	sleep 3;
	waitUntil { !(isNil "FUNC_Hospital_Cycle") };
	[] spawn FUNC_Hospital_Cycle;
};





sleep 1;
_marker setMarkerAlphaLocal 0; 

//_CarPark = nearestObjects [getMarkerPos _name, HospitalAutopark, 100];
//_CarPark call func_SpawnMedicDrivers;

