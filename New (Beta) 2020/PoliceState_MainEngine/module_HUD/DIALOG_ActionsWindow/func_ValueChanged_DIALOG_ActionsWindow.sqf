//func_ValueChanged_DIALOG_ActionsWindow
private["_this","_x","_condition","_var"];





_condition = (lbData [50203, (lbCurSel 50203)]);
//player globalchat format ["lbData = %1" , _condition]; //COMBO BOX

switch (_condition) do 
{
    case "None": 
	{ 
		ctrlEnable [50206, false]; // Disable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\NoAction.paa"]; //Set Pic
		ctrlSetText [50208, "Not available"]; //Set text
	};
	case "TS_D": //Taxi service: Destination
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Taxi_Destination.paa"]; //Set Pic
		ctrlSetText [50208, "Choose your destination."]; //Set text
	};	
	case "phone": //Taxi service: Destination
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\PhoneOLD.paa"]; //Set Pic
		ctrlSetText [50208, "Old mobile phone."]; //Set text
	};	
	case "TS_P": //Taxi service: Payment
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Taxi_meter.paa"]; //Set Pic
		_var = "Bill: $" + format ["%1",(player getVariable "TaxiPayment")] ;
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	
	
	case "Shop_cafe": //Shop: Cafe
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Cafe.paa"]; //Set Pic
		_var = "Cafe";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_rest": //Shop: Restaurant
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Restaurant.paa"]; //Set Pic
		_var =  "Restaurant";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_fastF": //Shop: Fast Food
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\FastFood.paa"]; //Set Pic
		_var = "Fast food";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_Gas": //Shop
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\GasStationActionWindow.paa"]; //Set Pic
		_var = "Gas Station";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_Repair": //Shop
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\RepairStation.paa"]; //Set Pic
		_var = "Repair Station";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_CarSell": //Shop: Car seller
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\CarSeller.paa"]; //Set Pic
		_var = "Car seller";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_medic": //Shop
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\Hospital.paa"]; //Set Pic
		_var = "Medical service";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_Guns": //Shop
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\GunShop.paa"]; //Set Pic
		_var = "Gun store";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};	
	case "Shop_Cars": //Shop
	{ 
		ctrlEnable [50206, true]; // Enable button
		ctrlSetText [50204, "PoliceState_Resources\Pictures\module_HUD\CarShop.paa"]; //Set Pic
		_var = "Car shop";
		ctrlSetText [50208, format ["%1",_var]]; //Set text
	};
    default {  hintc "func_ValueChanged_DIALOG_ActionsWindow default"  };
};