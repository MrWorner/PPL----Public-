//FUNC_CreateCAFE =


private["_MarkerType","_this","_Module","_objects","_x","_da","_marker","_MarkerWillUse"];
_MarkerType = ["HW_Cafe","HW_Cafe2","HW_Cafe3","HW_Cafe4","HW_Cafe5","HW_Cafe6","HW_Cafe7","HW_Cafe8"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the Cafe module with any citizens!"};
{
	if(!(_x in CafeArray)and(_x != _Module))then
	{
	CafeArray = CafeArray + [_x];
	CafeCount = CafeCount + 1;
	_da = "Cafe: " + format ["%1",(CafeCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	
	_x disableAI "FSM";
	sleep 0.5;
	
	_MarkerWillUse = (_MarkerType select (round(random ((count _MarkerType) -1))));
	_marker setMarkerType _MarkerWillUse;
	_MarkerType = _MarkerType - [_MarkerWillUse];
	if(CafeCount == 8)then{CafeCount = 0; _MarkerType = ["HW_Cafe","HW_Cafe2","HW_Cafe3","HW_Cafe4","HW_Cafe5","HW_Cafe6","HW_Cafe7","HW_Cafe8"];};
	_marker setMarkerText "Cafe";
	};
}foreach _objects;
