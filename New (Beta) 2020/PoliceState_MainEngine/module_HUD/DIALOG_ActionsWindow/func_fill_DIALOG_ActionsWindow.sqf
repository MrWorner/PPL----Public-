//func_fill_DIALOG_ActionsWindow

 private["_client","_this","_x","_ShopMan","_AddedCafe","_AddedPizza","_AddedEastFastFood","_AddedGasStation","_AddedRepairStation","_AddedCarSeller","_AddedGunShop","_AddedCarShop"];

_index = lbAdd [50203, "None"];		
lbSetData [50203, _index, "None"];

lbSetCurSel [50203, 0]; //Select default value
ctrlEnable [50206, false]; // Disable button


//--
_damage = (damage player * 100);
_text = "HEALTHY";
if(_damage > 5)then{_text = "LITTLE BIT IJNURED"};
if(_damage > 24)then{_text = "INJURED"};
if(_damage > 75)then{_text = "HEAVY INJURED"};
if(_damage > 89)then{_text = "DEADLY INJURED"};
if(_damage == 89)then{_text = "DEAD"};
ctrlSetText [50209, format ["%1", _text]]; //Set text	TextHealth: RscText

_Money = player getVariable ["Money", 0];
ctrlSetText [50210, format ["$%1", _Money]]; //Set text	TextMoney: RscText

_Hunger = player getVariable ["Hunger", 0];
_text = "NOT HUNGRY";
if(_Hunger > 24)then{_text = "LITTLE BIT HUNGRY"};
if(_Hunger > 49)then{_text = "HUNGRY"};
if(_Hunger > 74)then{_text = "VERY HUNGRY"};
ctrlSetText [50211, format ["%1%", _text]]; //Set text	TextHunger: RscText
//--




//ctrlSetText [50204, "#(argb,8,8,3)color(1,1,1,1)"]; //Set Pic
//text = "#(argb,8,8,3)color(1,1,1,1)";

//**PHONE (ALPHA VERSION SIMPLE)
	_index = lbAdd [50203, "Phone: v0.1"];		
	lbSetData [50203, _index, "phone"];
//**PHONE (ALPHA VERSION SIMPLE) END

//**Taxi Service
{
	//hintc format ["_x = %1; vehicle player == vehicle _x = %2;   _x == driver vehicle _x = %3; all = %4 ", name _x,vehicle player == vehicle _x,  _x == driver vehicle _x, vehicle player == vehicle _x and alive _x and vehicle _x == driver vehicle _x];
	if(vehicle player == vehicle _x and alive _x and _x == driver vehicle _x)exitwith
	{
		_index = lbAdd [50203, "Taxi service: Destination"];		
		lbSetData [50203, _index, "TS_D"];
	};
	
}foreach Array_TaxiDrivers;
//**Taxi Service END


//**Taxi Service PAYMENT
if(player getVariable "TaxiPayment" > 0)then
{
		_index = lbAdd [50203, "Taxi service: Bills"];		
		lbSetData [50203, _index, "TS_P"];
};
//**Taxi Service PAYMENT END



//**Module_Shop Start
_client = player;
_ShopMan = nearestObjects [player, ["Man"], 5];
_AddedCafe= false;
_AddedPizza = false;
_AddedEastFastFood = false;
_AddedGasStation = false;
_AddedRepairStation = false;
_AddedCarSeller = false;
_AddedGunShop = false;
_AddedCarShop = false;
{
	if(alive _x)then
	{	
		if(_x in CafeArray and !_AddedCafe)then
		{
			_AddedCafe = true;
			_index = lbAdd [50203, "Cafe"];		
			lbSetData [50203, _index, "Shop_cafe"];
		
		};
		if(_x in PizzaArray and !_AddedPizza)then
		{
			_AddedPizza = true;
			_index = lbAdd [50203, "Pizza restaurant"];		
			lbSetData [50203, _index, "Shop_rest"];
		
		};
		if(_x in EastFastFoodArray and !_AddedEastFastFood)then
		{
			_AddedEastFastFood = true;
			_index = lbAdd [50203, "Fast food"];		
			lbSetData [50203, _index, "Shop_fastF"];		
		};		
		if(_x in GasStationArray and !_AddedGasStation)then
		{
			_AddedGasStation = true;
			_index = lbAdd [50203, "Gas Station"];		
			lbSetData [50203, _index, "Shop_Gas"];		
		};
		if(_x in RepairArray and !_AddedRepairStation)then
		{
			_AddedRepairStation = true;
			_index = lbAdd [50203, "Repair Station"];		
			lbSetData [50203, _index, "Shop_Repair"];		
		};	
		if(_x in CarSellerArray and !_AddedCarSeller)then
		{
			_AddedCarSeller = true;
			_index = lbAdd [50203, "Car seller"];		
			lbSetData [50203, _index, "Shop_CarSell"];		
		};	
		if((_x in Array_MedicalPersonal or _x in  Array_MedicalPersonalHOSPITAL) and !_AddedCarSeller)then
		{
			_AddedCarSeller = true;
			_index = lbAdd [50203, "Medical service"];		
			lbSetData [50203, _index, "Shop_medic"];		
		};
		if(_x in GunShopArray and !_AddedGunShop)then
		{
			_AddedGunShop = true;
			_client setVariable ["Shop_USE",_x,true];
			_index = lbAdd [50203, "Gun shop"];		
			lbSetData [50203, _index, "Shop_Guns"];		
		};
		if(_x in CarShopArray and !_AddedCarShop)then
		{
			_AddedCarShop = true;
			_client setVariable ["Shop_USE_cars",_x,true];
			_index = lbAdd [50203, "Car shop"];		
			lbSetData [50203, _index, "Shop_Cars"];		
		};	

	};
}foreach _ShopMan;
//**Module_Shop END