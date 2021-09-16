//func_CreateFireStation
private ["_Module","_this","_name","_marker","_CarPark"];

_Module = _this select 0;



_name = "FireStation_No_" + format ["%1",(count FireStationArray + 1)];
_marker = createMarker [_name, (getpos _Module)];
_marker setMarkerType "HW_Done";	
player sidechat format ["Fire station created: %1",_name];
FireStationArray = FireStationArray + [_marker];


if(isnil "ENABLE_Firefighter_AI")then
{
	ENABLE_Firefighter_AI = true;
};



if(!FirestationCycle_Started)then
{
	FirestationCycle_Started = true;
	sleep 3;
	waitUntil { !(isNil "FUNC_Firestation_Cycle") };
	[] spawn FUNC_Firestation_Cycle;
};

	

sleep 1;
_marker setMarkerAlphaLocal 0; 

//_CarPark = nearestObjects [getMarkerPos _name, FireStationAutopark, 100];
//_CarPark call func_SpawnFireManDrivers;

