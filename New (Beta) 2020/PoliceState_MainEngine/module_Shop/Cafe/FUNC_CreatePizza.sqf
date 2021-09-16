//FUNC_CreatePizza =

private["_markerNWillUse","_this","_Module","_objects","_x","_da","_markerN","_markerNType"];
_markerNType = ["HW_Pizza","HW_Pizza2","HW_Pizza3","HW_Pizza4","HW_Pizza5","HW_Pizza6","HW_Pizza7","HW_Pizza8"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the Pizza module with any citizens!"};
{
	if(!(_x in PizzaArray)and(_x != _Module))then
	{
	PizzaArray = PizzaArray + [_x];
	PizzaCount = PizzaCount + 1;
	sleep 0.1;
	_da = "Pizza: " + format ["%1",(PizzaCount)]+ format ["_by %1",(name _x)];
	_markerN = createMarker [_da, (getpos _x)];
	_markerN setMarkerType "HW_Done";	
	_x disableAI "Move";	
	sleep 0.5;

	_markerNWillUse = (_markerNType select (round(random (count _MarkerNType -1))));
	_markerN setMarkerType _markerNWillUse;
	_markerNType = _markerNType - [_markerNWillUse];
	if(PizzaCount == 8)then{PizzaCount = 0; _markerNType = ["HW_Pizza","HW_Pizza2","HW_Pizza3","HW_Pizza4","HW_Pizza5","HW_Pizza6","HW_Pizza7","HW_Pizza8"];};
	_markerN setMarkerText "Pizza";
	};
}foreach _objects;

