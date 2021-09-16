//FUNC_CreateCarShopRandom
private["_MarkerType","_this","_Module","_objects","_x","_da","_marker","_MarkerWillUse"];
_MarkerType = ["HW_CarShop","HW_CarShop2","HW_CarShop3","HW_CarShop4","HW_CarShop5","HW_CarShop6","HW_CarShop7","HW_CarShop8"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the Car shop module with any citizens!"};
{
	if(!(_x in CarShopArray)and(_x != _Module))then
	{
	CarShopArray = CarShopArray + [_x];
	CarShopCount = CarShopCount + 1;
	_da = "CarShop: " + format ["%1",(CarShopCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	
	_x disableAI "FSM";
	sleep 0.5;
	
	_MarkerWillUse = (_MarkerType select (round(random ((count _MarkerType) -1))));
	_marker setMarkerType _MarkerWillUse;
	_MarkerType = _MarkerType - [_MarkerWillUse];
	if(CarShopCount == 8)then{CarShopCount = 0; _MarkerType = ["HW_CarShop","HW_CarShop2","HW_CarShop3","HW_CarShop4","HW_CarShop5","HW_CarShop6","HW_CarShop7","HW_CarShop8"];};
	_marker setMarkerText "Car shop";
	
	
	_x call FUNC_CarShop_SET_RANDOM;
	
	};
}foreach _objects;