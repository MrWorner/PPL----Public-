//FUNC_CreateGunShopRandomGuns
private["_MarkerType","_this","_Module","_objects","_x","_da","_marker","_MarkerWillUse"];
_MarkerType = ["HW_GunShop1","HW_GunShop2","HW_GunShop3","HW_GunShop4","HW_GunShop5","HW_GunShop6","HW_GunShop7","HW_GunShop8","HW_GunShop9","HW_GunShop10"];
_Module = _this;
_objects = synchronizedObjects _module;
if((count _objects) < 1)exitwith{player sidechat "Please sync the Cafe module with any citizens!"};
{
	if(!(_x in GunShopArray)and(_x != _Module))then
	{
	GunShopArray = GunShopArray + [_x];
	GunShopCount = GunShopCount + 1;
	_da = "GunStore: " + format ["%1",(GunShopCount)]+ format ["_by %1",(name _x)];
	_marker = createMarker [_da, (getpos _x)];
	_marker setMarkerType "HW_Done";	
	_x disableAI "FSM";
	sleep 0.5;
	
	_MarkerWillUse = (_MarkerType select (round(random ((count _MarkerType) -1))));
	_marker setMarkerType _MarkerWillUse;
	_MarkerType = _MarkerType - [_MarkerWillUse];
	if(GunShopCount == 10)then{GunShopCount = 0; _MarkerType = ["HW_GunShop1","HW_GunShop2","HW_GunShop3","HW_GunShop4","HW_GunShop5","HW_GunShop6","HW_GunShop7","HW_GunShop8","HW_GunShop9","HW_GunShop10"];};
	_marker setMarkerText "Gun Store";
	
	
	_x call FUNC_GunShop_SET_WeaponsToSell_RANDOM;
	
	};
}foreach _objects;