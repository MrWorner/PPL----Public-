//func_CarSeller_PriceListBox.sqf
private["_Health", "_car","_car2","_client","_PRICE","_fuel"];
_client = Player;
//_car =  (lbData [50703, (lbCurSel 50703)]);;
_car =  (lnbCurSelRow  51103); //ROW
_car2 = ((_client getVariable "Shop_CarDetected") select _car);
_Health = (getDammage  _car2);
_fuel = fuel _car2;
_PRICE = round((_Health) * 20 + _fuel * 50);

ctrlSetText [51104, format  ["Price: $%1", _PRICE]]; //Set text
hint "";