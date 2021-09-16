sleep 0.1;
//FUNC_CreateGasStation =
//{
private["_MarkerWillUse","_this","_Module","_objects","_x","_da","_marker"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the GasStation module with any citizens!";};
{
	if(!(_x in GasStationArray)and(_x != _Module))then
	{
	GasStationArray = GasStationArray + [_x];
	GasStationCount = GasStationCount + 1;
	sleep 0.1;
	_x disableAI "FSM";
	_da = "GasStation: " + format ["%1",(GasStationCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	

	sleep 0.5;

	_marker setMarkerType "HW_GasStation";
	_marker setMarkerText "Gas Station";
	};
}foreach _objects;


//};
