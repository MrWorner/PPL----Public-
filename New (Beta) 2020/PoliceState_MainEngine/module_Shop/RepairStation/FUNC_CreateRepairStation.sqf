//FUNC_CreateRepairStation =

private["_this","_Module","_objects","_x","_marker"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the RepairStation module with any citizens!"};
{
	if(!(_x in RepairArray)and(_x != _Module))then
	{
	RepairArray = RepairArray + [_x];
	RepairCount = RepairCount + 1;
	sleep 0.1;
	_x disableAI "FSM";
	_da = "RepairStation: " + format ["%1",(RepairCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	

	sleep 0.5;

	_marker setMarkerType "HW_Repair";
	_marker setMarkerText "Repair Station";
	};
}foreach _objects;

