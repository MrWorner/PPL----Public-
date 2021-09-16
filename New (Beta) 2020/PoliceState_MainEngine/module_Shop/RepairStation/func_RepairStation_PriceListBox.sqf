//func_GasStation_PriceListBox
private["_Health", "_car","_car2","_client","_PRICE"];
_client = Player;
//_car =  (lbData [50703, (lbCurSel 50703)]);;
_car =  (lnbCurSelRow  50903); //ROW
_car2 = ((_client getVariable "Shop_CarDetected") select _car);
_Health = (getDammage  _car2);
_PRICE = round((1 - _Health) * 90);

ctrlSetText [50904, format  ["Price: $%1", _PRICE]]; //Set text
hint "";