//func_CarShop_Fill_BEGIN

 private["_client","_ShopMan","_index"];
_client = player;
_ShopMan = _client getVariable "Shop_USE_cars";
 
Shop_ArrayItemChosen = [];
Shop_ArrayPricesChosen = [];
Shop_ArrayTypeItemChosen = [];	
Shop_ArrayItemAmountChosen = [];	
 
_index = lbAdd [51503, "None"];		
lbSetData [51503, _index, "None"];

lbSetCurSel [51503, 0]; //Select default value




ctrlEnable [51506, false]; // Disable button
ctrlEnable [51507, false]; // Disable button





ctrlSetText [51508, "Total: $0"]; //Set text


ctrlSetText [51505, "PoliceState_Resources\Pictures\module_Shop\GunStore\ChooseCategory.paa"]; //Set Pic

//ctrlSetText [50204, "#(argb,8,8,3)color(1,1,1,1)"]; //Set Pic
//text = "#(argb,8,8,3)color(1,1,1,1)";


if(count (_ShopMan getVariable ["ShopItems_Motorcycles",[]]) > 0)then
{
	_index = lbAdd [51503, "Motorcycles"];		
	lbSetData [51503, _index, "ShopItems_Motorcycles"];
};

//hint format ["_ShopMan = %1 count = %2 ", _ShopMan, _ShopMan getVariable "ShopItems_HandGuns"];

if(count (_ShopMan getVariable ["ShopItems_Cars",[]]) > 0)then
{
	_index = lbAdd [51503, "Cars"];		
	lbSetData [51503, _index, "ShopItems_Cars"];
};

if(count (_ShopMan getVariable ["ShopItems_Vans",[]]) > 0)then
{
	_index = lbAdd [51503, "Vans"];		
	lbSetData [51503, _index, "ShopItems_Vans"];
};

if(count (_ShopMan getVariable ["ShopItems_OffRoads",[]]) > 0)then
{
	_index = lbAdd [51503, "OffRoads"];		
	lbSetData [51503, _index, "ShopItems_OffRoads"];
};

if(count (_ShopMan getVariable ["ShopItems_Trucks",[]]) > 0)then
{
	_index = lbAdd [51503, "Trucks"];		
	lbSetData [51503, _index, "ShopItems_Trucks"];
};

if(count (_ShopMan getVariable ["ShopItems_Buses",[]]) > 0)then
{
	_index = lbAdd [51503, "Buses"];		
	lbSetData [51503, _index, "ShopItems_Buses"];
};
	

_index = lbAdd [51510, "------------------------------EMPTY------------------------------"];		
lbSetData [51510, _index, "empty"];