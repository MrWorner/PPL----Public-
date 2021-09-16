//FUNC_CreateEastFastFood =

private["_MarkerType","_MarkerWillUse","_this","_Module","_objects","_x","_da","_marker","_markerNWillUse"];
_MarkerType = ["HW_FastFood","HW_FastFood2","HW_FastFood3","HW_FastFood4","HW_FastFood5","HW_FastFood6","HW_FastFood7","HW_FastFood8"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the East Fast Food module with any citizens!"};
{
	if(!(_x in EastFastFoodArray)and(_x != _Module))then
	{
	EastFastFoodArray = EastFastFoodArray + [_x];
	EastFastFoodCount = EastFastFoodCount + 1;
	sleep 0.1;
	_da = "EastFastFood: " + format ["%1",(EastFastFoodCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	
	_x disableAI "Move";
	sleep 0.5;

	
	_MarkerWillUse = (_MarkerType select (round(random (count _MarkerType -1))));
	_MarkerType = _MarkerType - [_MarkerWillUse];
	if(EastFastFoodCount == 8)then{EastFastFoodCount = 0; _MarkerType = ["HW_FastFood","HW_FastFood2","HW_FastFood3","HW_FastFood4","HW_FastFood5","HW_FastFood6","HW_FastFood7","HW_FastFood8"];};
	
	_marker setMarkerType _MarkerWillUse;
	_marker setMarkerText "FastFood";
	};
}foreach _objects;

