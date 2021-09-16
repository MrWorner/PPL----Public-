//FUNC_CreateCarSeller =

private["_markerNType","_this","_Module","_objects","_x","_da","_marker","_markerNWillUse"];
_markerNType = ["HW_CarSell1","HW_CarSell2","HW_CarSell3"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the CarSell module with any citizens!"};
{
	if(!(_x in CarSellerArray)and(_x != _Module))then
	{
	CarSellerArray = CarSellerArray + [_x];
	CarSellerCount = CarSellerCount + 1;
	sleep 0.1;
	_da = "CarSell: " + format ["%1",(CarSellerCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	
	_x disableAI "FSM";
	sleep 0.5;

	_markerNWillUse = (_markerNType select (round(random (count _MarkerNType -1))));
	_markerNType = _markerNType - [_markerNWillUse];
	if(CarSellerCount == 3)then{CarSellerCount = 0; 	_markerNType = ["HW_CarSell1","HW_CarSell2","HW_CarSell3"];};
	_marker setMarkerType _markerNWillUse;
	_marker setMarkerText "Sell car";
	};
}foreach _objects;

