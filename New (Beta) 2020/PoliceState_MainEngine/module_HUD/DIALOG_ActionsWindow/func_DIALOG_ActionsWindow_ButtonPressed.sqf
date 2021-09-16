//func_DIALOG_ActionsWindow_ButtonPressed
private["_this","_x","_condition"];





_condition = (lbData [50203, (lbCurSel 50203)]);
closedialog 50200;
//player globalchat format ["func_DIALOG_ActionsWindow_ButtonPressed lbData = %1" , _condition]; //COMBO BOX
switch (_condition) do 
{
    case "None": 
	{ 
		// Disabled button
	};
	case "phone": //Shop: Cafe
	{ 
		_Dialog = createdialog "DIALOG_PhoneOld";
	};	
	case "TS_D": //Taxi service: Destination
	{ 
		// Enabled button
		
		//_Dialog = createdialog "DIALOG_ModuleTaxi_Map";
		//if (!(_Dialog)) exitWith {hintc "func_DIALOG_ActionsWindow_ButtonPressed DIALOG_ModuleTaxi_Map: Dialog Error!";};
		//[] call func_fill_DIALOG_ActionsWindow;
		
		[] spawn func_TaxiOpenedMap;
		
	};
	case "TS_P": //Taxi service: Payment
	{ 
		// Enabled button
		
		//_Dialog = createdialog "DIALOG_ModuleTaxi_Map";
		//if (!(_Dialog)) exitWith {hintc "func_DIALOG_ActionsWindow_ButtonPressed DIALOG_ModuleTaxi_Map: Dialog Error!";};
		//[] call func_fill_DIALOG_ActionsWindow;
		
		[] spawn func_TaxiPayment;
		
	};
	
	case "Shop_cafe": //Shop: Cafe
	{ 
		_Dialog = createdialog "DIALOG_Cafe1";
	};	
	case "Shop_rest": //Shop: Restaurant
	{ 
		_Dialog = createdialog "DIALOG_Pizza1";
	};	
	case "Shop_fastF": //Shop: Fast food
	{ 
		_Dialog = createdialog "DIALOG_FastFood1";
	};
	case "Shop_Gas": //Shop
	{ 
		_Dialog = createdialog "DIALOG_GasStation";
	};	
	case "Shop_Repair": //Shop
	{ 
		_Dialog = createdialog "DIALOG_RepairStation";
	};	
	case "Shop_CarSell": //Shop
	{ 
		_Dialog = createdialog "DIALOG_CarSeller";
	};	
	case "Shop_medic": //Shop
	{ 
		_Dialog = createdialog "DIALOG_Hospital";
	};	
	case "Shop_Guns": //Shop
	{ 
		_Dialog = createdialog "DIALOG_GunShop";
		[] spawn func_GunStore_Fill_BEGIN;
	};	
	case "Shop_Cars": //Shop
	{ 
		_Dialog = createdialog "DIALOG_CarShop";
		[] spawn func_CarShop_Fill_BEGIN;
	};
	
    default {  hintc "func_DIALOG_ActionsWindow_ButtonPressed default"  };
};