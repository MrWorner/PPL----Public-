//FUNC_CreatePoliceStation=

private["_module", "_Type","_da","_marker"];

sleep 1;
_Module = _this select 0;
_Type =  _this select 1;

//player sidechat format ["_Module! : %1", _Module];
//player sidechat format ["_Type! : %1", _Type];


Count_PoliceStation = Count_PoliceStation + 1;

_da = "PoliceStation_" + format ["%1_%2",_Type,(Count_PoliceStation)];
_marker = createMarker [_da, (getpos (_Module select 0))];
_marker setMarkerType "HW_Done";	
sleep 1.4;
_marker setMarkerAlphaLocal 0; 


ALL_PoliceStations = ALL_PoliceStations + [ [_marker, _Type] ];

if(!PoliceStationCycle_Started)then
{
	PoliceStationCycle_Started = true;
	sleep 3;
	waitUntil { !(isNil "FUNC_PoliceStation_Cycle") };
	[] spawn FUNC_PoliceStation_Cycle;
};