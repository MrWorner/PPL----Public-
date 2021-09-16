//func_CarShop_BUY
private["_client","_car","_cares","_Money","_TotalPriceToPay","_carNameClass"];
_client = player;

_carNameClass = (lbData [51504, (lbCurSel 51504)]);
_Money = (player getVariable "Money");
_TotalPriceToPay =  (Shop_ArrayPrices select (lbCurSel 51504));
if( _TotalPriceToPay >  _Money)exitwith
{
	player sidechat "You don't have enough money!";
	player sidechat format ["You need to pay $%2. Money have: $%1. Need: $%3",_TotalPriceToPay,_Money,((_TotalPriceToPay - _Money))];
};

_Client setVariable ["Money",(_Money - _TotalPriceToPay),true]; 
player sidechat format ["You paid $%2. Money left: $%3",_Money,_TotalPriceToPay,(_Money - _TotalPriceToPay)];
_car = _carNameClass createVehicle position player;

closedialog 51400;