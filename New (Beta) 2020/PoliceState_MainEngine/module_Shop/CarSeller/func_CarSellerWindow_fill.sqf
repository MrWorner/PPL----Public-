//func_CarSellerWindow_fill.sqf
private["_FUEL", "_cars","_client","_PRICE","_text","_count"];
_client = Player;
_Dialog = createdialog "DIALOG_CarSeller_Sell";
_count = 0;

_cars = nearestobjects[getpos _client, ["LandVehicle"], 27];
if(isnil "_cars")exitwith
{
	player sidechat "No car found";
	ctrlEnable [51105, false]; // Disable button
	//ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Restaurant.paa"]; //Set Pic
	//_var =  "Restaurant";
	//ctrlSetText [50208, format ["%1",_var]]; //Set text
	
};


//player sidechat format  ["count _cars = %1", (count _cars)];
{
	_text = "Vehicle: " + (TypeOf _x)  + " Damage: " +  format ["%1",(getDammage  _x)] ; //+ " Distance: " + format ["%1",(player distance _x)] 
	
	_index = lbAdd [51103, _text];		
	lbSetData [51103, _index,format  ["%1", (_count)]];
	_count = _count + 1;
	
	//lbSetValue [50703, _index, _x];
}
foreach _cars;
_client setVariable ["Shop_CarDetected",_cars,true];
		