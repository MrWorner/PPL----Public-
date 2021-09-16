_Shop = _this select 0;
sleep 0.1;

//player globalchat format  ["%1",_Shop];



//**Gas Station
	if(_Shop == "Gas1")then
	{
	ImUsingShop = GasAssistant1;
	if (!(createDialog "GasStationdialog")) exitWith {hint "Dialog Error!";};
	};
//**
	
//**Gun Shop 1
	if(_Shop == "GunShop1")then{
	if (!(createDialog "WEPdialog")) exitWith {hint "Dialog Error!";};
	{
	_index = lbAdd [1, (_x select 1) + format [" - $%1", (_x select 2)]];		
	lbSetData [1, _index, (_x select 1)];
	} forEach WeaponList1;
		ImUsingShop = BoxDealer1;
		buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""GunShop\BuyAction.sqf"";"];
	};
//**


//**Car Shop 1
	if(_Shop == "CarShop1")then{
	if (!(createDialog "WEPdialog")) exitWith {hint "Dialog Error!";};
	{
	_index = lbAdd [1, (_x select 1) + format [" - $%1", (_x select 2)]];		
	lbSetData [1, _index, (_x select 1)];
	} forEach CarList1;
		ImUsingShop = CarPosDealer1;
		buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""GunShop\BuyAction2.sqf"";"];
	};
//**


//**Sell car 1
	if(_Shop == "Sell1")then{
	if (!(createDialog "Dump")) exitWith {hint "Dialog Error!";};

		ImUsingShop = CarSellDealer1;
		//buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""GunShop\SellAction2.sqf"";"];
	};
//**

//**Repair car 1
	if(_Shop == "Repair1")then{
	if (!(createDialog "RepairDialog")) exitWith {hint "Dialog Error!";};

		ImUsingShop = RepairWork1;
		//buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""GunShop\SellAction2.sqf"";"];
	};
//**



//**Gas Station
	if(_Shop == "Cafe1")then
	{
	ImUsingShop = Cafe1;
	if (!(createDialog "CafeDialog")) exitWith {hint "Dialog Error!";};
	};
//**


//**Phone
	if(_Shop == "Phone")then
	{
	if (!(createDialog "PhoneDialog")) exitWith {hint "Dialog Error!";};
	};
//**


//**Hospital or Medic
	if(_Shop == "Medic")then{
	if (!(createDialog "HospitalDialog")) exitWith {hint "Dialog Error!";};

		ImUsingShop = MedicWork1;
		//buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""GunShop\MedicChecking.sqf"";"];
	};
//**
