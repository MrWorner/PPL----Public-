//func_GasStationWindow_fill
private["_FUEL", "_cars","_client","_PRICE","_text","_count"];
_client = Player;
_Dialog = createdialog "DIALOG_GasStation_Fuel";
_count = 0;

_cars = nearestobjects[getpos _client, ["LandVehicle"], 27];
if(isnil "_cars")exitwith
{
	player sidechat "No car found";
	ctrlEnable [50705, false]; // Disable button
	//ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Restaurant.paa"]; //Set Pic
	//_var =  "Restaurant";
	//ctrlSetText [50208, format ["%1",_var]]; //Set text
	
};


//player sidechat format  ["count _cars = %1", (count _cars)];
{
	_text = "Vehicle: " + (TypeOf _x)  + " Fuel: " +  format ["%1",(fuel _x)] ; //+ " Distance: " + format ["%1",(player distance _x)] 
	
	_index = lbAdd [50703, _text];		
	lbSetData [50703, _index,format  ["%1", (_count)]];
	_count = _count + 1;
	
	//lbSetValue [50703, _index, _x];
}
foreach _cars;
_client setVariable ["Shop_CarDetected",_cars,true];
		