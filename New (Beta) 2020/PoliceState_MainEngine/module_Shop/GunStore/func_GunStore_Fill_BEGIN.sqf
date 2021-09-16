//func_GunStore_Fill_BEGIN

 private["_client","_ShopMan","_index"];
_client = player;
_ShopMan = _client getVariable "Shop_USE";
 
Shop_ArrayItemChosen = [];
Shop_ArrayPricesChosen = [];
Shop_ArrayTypeItemChosen = [];	
Shop_ArrayItemAmountChosen = [];	
 
_index = lbAdd [51403, "None"];		
lbSetData [51403, _index, "None"];

lbSetCurSel [51403, 0]; //Select default value

ctrlEnable [51407, false]; // Disable button
ctrlEnable [51408, false]; // Disable button
ctrlEnable [51409, false]; // Disable button
ctrlEnable [51410, false]; // Disable button
ctrlEnable [51412, false]; // Disable button
ctrlEnable [51413, false]; // Disable button
ctrlEnable [51415, false]; // Disable button
ctrlEnable [51416, false]; // Disable button

ctrlSetText [51417, "Total: $0"]; //Set text


ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\ChooseCategory.paa"]; //Set Pic

//ctrlSetText [50204, "#(argb,8,8,3)color(1,1,1,1)"]; //Set Pic
//text = "#(argb,8,8,3)color(1,1,1,1)";


if(count (_ShopMan getVariable ["ShopItems_HandGuns",[]]) > 0)then
{
	_index = lbAdd [51403, "Handguns"];		
	lbSetData [51403, _index, "GunShop_Handgun"];
};

//hint format ["_ShopMan = %1 count = %2 ", _ShopMan, _ShopMan getVariable "ShopItems_HandGuns"];

if(count (_ShopMan getVariable ["ShopItems_ShotGuns",[]]) > 0)then
{
	_index = lbAdd [51403, "Shotguns"];		
	lbSetData [51403, _index, "GunShop_Shotgun"];
};

if(count (_ShopMan getVariable ["ShopItems_SMGs",[]]) > 0)then
{
	_index = lbAdd [51403, "SMG"];		
	lbSetData [51403, _index, "GunShop_SMG"];
};

if(count (_ShopMan getVariable ["ShopItems_AssaultRifles",[]]) > 0)then
{
	_index = lbAdd [51403, "Assault Rifles"];		
	lbSetData [51403, _index, "GunShop_assaultR"];
};

if(count (_ShopMan getVariable ["ShopItems_SniperRifles",[]]) > 0)then
{
	_index = lbAdd [51403, "Sniper rifles"];		
	lbSetData [51403, _index, "GunShop_SniperR"];
};

if(count (_ShopMan getVariable ["ShopItems_MachineGuns",[]]) > 0)then
{
	_index = lbAdd [51403, "Machineguns"];		
	lbSetData [51403, _index, "GunShop_Machineguns"];
};
	

_index = lbAdd [51414, "------------------------------EMPTY------------------------------"];		
lbSetData [51414, _index, "empty"];