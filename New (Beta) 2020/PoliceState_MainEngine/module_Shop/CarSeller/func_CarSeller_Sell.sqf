//func_CarSeller_Sell.sqf
private["_Health", "_x","_client","_PRICE","_Money","_fuel"];
_client = Player;
_x = ((player getVariable "Shop_CarDetected") select (_this select 0));
_Money =(_client getVariable "Money" ); 
_fuel = fuel _x;
_Health = (getDammage  _x);	
_PRICE = round((_Health) * 20 + _fuel * 50);

player sidechat format ["You sold your car for $%2.",_Money,_price,(_Money - _price)];
_Client setVariable ["Money",(_Money + _price),true]; 
deleteVehicle _x;

_client setVariable ["Shop_CarDetected",[],true];