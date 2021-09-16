//func_ValueChanged_ListCarChosen
private["_client","_ShopMan","_x","_condition","_var"];
_client = player;
_ShopMan = _client getVariable "Shop_USE_cars";



_condition = (lbData [51504, (lbCurSel 51504)]);
//player globalchat format ["lbData = %1" , _condition]; //COMBO BOX

if(_condition == "")exitwith{};

lbClear 51510;


				
_index = lbAdd [51510, (  format["NAME: %1",(getText(configFile >> "CfgVehicles" >> _condition >> "displayName")) ] )];					
_index = lbAdd [51510, (  format["PRICE: $%1", (Shop_ArrayPrices select (lbCurSel 51504)) ] )];			
_index = lbAdd [51510, (  format["MAX SPEED: %1",(getNumber(configFile >> "CfgVehicles" >> _condition >> "maxSpeed")) ] )];		
_index = lbAdd [51510, (  format["FUEL CAP: %1",(getNumber(configFile >> "CfgVehicles" >> _condition >> "fuelCapacity")) ] )];		
_index = lbAdd [51510, (  format["TEXT: %1",(getText(configFile >> "CfgVehicles" >> _condition  >> "Library" >> "libTextDesc")) ] )];		

	
		
//lbSetData [51510, _index, "-"];




