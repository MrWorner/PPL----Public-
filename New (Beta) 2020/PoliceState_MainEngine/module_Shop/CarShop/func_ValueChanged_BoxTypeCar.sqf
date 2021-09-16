//func_ValueChanged_BoxTypeCar
private["_client","_ShopMan","_x","_condition","_var"];
_client = player;
_ShopMan = _client getVariable "Shop_USE_cars";



ctrlEnable [51506, true]; // ENABLE button
ctrlEnable [51507, true]; // ENABLE button



_condition = (lbData [51503, (lbCurSel 51503)]);
//player globalchat format ["lbData = %1" , _condition]; //COMBO BOX

lbClear 51504;



Shop_ArrayItem = [];
Shop_ArrayPrices = [];
Shop_ArrayTypeItem = [];
	
switch (_condition) do 
{
    case "None": 
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\ChooseCategory.paa"]; //Set Pic
		ctrlEnable [51506, false]; // Disable button
		ctrlEnable [51507, false]; // Disable button
	};
	case "ShopItems_Motorcycles":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_Motorcycles"));				
	};	
	case "ShopItems_Cars":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_Cars"));				
	};		
	case "ShopItems_Vans":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_Vans"));				
	};		
	case "ShopItems_OffRoads":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_OffRoads"));				
	};	
	case "ShopItems_Trucks":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_Trucks"));				
	};		
	case "ShopItems_Buses":
	{ 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic	
		{	
			_index = lbAdd [51504, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51504, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			//Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgVehicles"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
		}
		foreach( (_ShopMan getVariable "ShopItems_Buses"));				
	};	

    default {  hintc "func_ValueChanged_BoxTypeCar default"  };
};

lbSetCurSel [51504, 0]; //Select default value



