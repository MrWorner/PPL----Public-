//func_fill_DIALOG_ActionsWindow

 private["_client","_this","_x","_NearestMan","_AddedCafe","_AddedPizza","_AddedEastFastFood","_AddedGasStation","_AddedRepairStation","_AddedCarSeller","_AddedGunShop","_AddedCarShop"];

_index = lbAdd [51606, (name Player)];		
lbSetData [51606, _index, (name Player)];
_index = lbAdd [51613, "Ground"];		
lbSetData [51613, _index, "Ground"];


lbSetCurSel [51606, 0]; //Select default value
lbSetCurSel [51613, 0]; //Select default value

//ctrlEnable [50206, false]; // Disable button

//ctrlSetText [50204, "#(argb,8,8,3)color(1,1,1,1)"]; //Set Pic
//text = "#(argb,8,8,3)color(1,1,1,1)";



//** Start
_client = player;
_NearestMan = nearestObjects [player, ["Man"], 5];

{
	if(alive _x)then
	{	
		if(_x in CarShopArray and !_AddedCarShop)then
		{
			_AddedCarShop = true;
			_client setVariable ["Shop_USE_cars",_x,true];
			_index = lbAdd [50203, "Car shop"];		
			lbSetData [50203, _index, "Shop_Cars"];		
		};	
	};
}foreach _NearestMan;
//** END