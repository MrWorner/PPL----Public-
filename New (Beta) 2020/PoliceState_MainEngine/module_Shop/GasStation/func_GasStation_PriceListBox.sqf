//func_GasStation_PriceListBox
private["_FUEL", "_car","_car2","_client","_PRICE"];
_client = Player;
//_car =  (lbData [50703, (lbCurSel 50703)]);;
_car =  (lnbCurSelRow  50703); //ROW
_car2 = ((_client getVariable "Shop_CarDetected") select _car);
_FUEL = (fuel _car2);
_PRICE = round((1 - _FUEL) * 50);

ctrlSetText [50704, format  ["Price: $%1", _PRICE]]; //Set text
hint "";