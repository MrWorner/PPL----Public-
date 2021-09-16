//func_ValueChanged_BoxTypeWep
private["_client","_ShopMan","_x","_condition","_var"];
_client = player;
_ShopMan = _client getVariable "Shop_USE";

		ctrlEnable [51407, true]; // Disable button
		ctrlEnable [51408, true]; // Disable button
		ctrlEnable [51409, true]; // Disable button
		ctrlEnable [51410, true]; // Disable button
		ctrlEnable [51412, true]; // Disable button
		ctrlEnable [51413, true]; // Disable button
		ctrlEnable [51415, true]; // Disable button
		ctrlEnable [51416, true]; // Disable button


_condition = (lbData [51403, (lbCurSel 51403)]);
//player globalchat format ["lbData = %1" , _condition]; //COMBO BOX

lbClear 51404;



Shop_ArrayItem = [];
Shop_ArrayPrices = [];
Shop_ArrayTypeItem = [];
	
ctrlSetText [51406, "1"]; //RscEdit Def value

switch (_condition) do 
{
    case "None": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\ChooseCategory.paa"]; //Set Pic
		 
		
		ctrlEnable [51407, false]; // Disable button
		ctrlEnable [51408, false]; // Disable button
		ctrlEnable [51409, false]; // Disable button
		ctrlEnable [51410, false]; // Disable button
		ctrlEnable [51412, false]; // Disable button
		ctrlEnable [51413, false]; // Disable button
		ctrlEnable [51415, false]; // Disable button
		ctrlEnable [51416, false]; // Disable button
		
	};
	case "GunShop_Handgun":
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\HandGun.paa"]; //Set Pic
		 
		
		{	
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];

			// _pic = getText (configFile >> "CfgWeapons" >> "G36a" >> "picture");
			// _textPicture = format ["<t color='#42b6ff' shadow='2' align='left' size='2.8'><img image='%1'/></t> ",_pic];
			// hint parseText _textPicture;
			// _index = lbAdd [51404, ( 51404 ctrlSetStructuredText  parseText _textPicture )];	
			// _index = lbAdd [51404, ("TEST END")];	
								
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_HandGuns"));
		
					
	};	
	case "GunShop_Shotgun": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\shotgun.paa"]; //Set Pic
		 
		
		{
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_ShotGuns"));
		
	};	
	case "GunShop_SMG": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\SMG.paa"]; //Set Pic
		 
		
			
		{
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_SMGs"));
	};	
	case "GunShop_assaultR": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\AssaultRifle.paa"]; //Set Pic
		 
		
			
		{
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_AssaultRifles"));
	};	
	case "GunShop_SniperR": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\SniperRifle.paa"]; //Set Pic
		 
		
			
		{
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_SniperRifles"));
	};	
	case "GunShop_Machineguns": 
	{ 
 
		ctrlSetText [51411, "PoliceState_Resources\Pictures\module_Shop\GunStore\MachineGun.paa"]; //Set Pic
		 
		
			
		{
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 0), (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")) ] )];					
			lbSetData [51404, _index, (_x select 1)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 1)]; 
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgWeapons"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 0)];	
			
			_index = lbAdd [51404, (  format["$%1 %2", (_x select 2), (getText(configFile >> "CfgMagazines" >> (_x select 3) >> "displayName")) ] )];		
			lbSetData [51404, _index,(_x select 3)]; //
			Shop_ArrayItem = Shop_ArrayItem + [(_x select 3)];
			Shop_ArrayTypeItem = Shop_ArrayTypeItem + ["CfgMagazines"];
			Shop_ArrayPrices = Shop_ArrayPrices + [(_x select 2)];
		}
		foreach( (_ShopMan getVariable "ShopItems_MachineGuns"));
	};	

    default {  hintc "func_ValueChanged_BoxTypeWep default"  };
};

lbSetCurSel [51404, 0]; //Select default value



