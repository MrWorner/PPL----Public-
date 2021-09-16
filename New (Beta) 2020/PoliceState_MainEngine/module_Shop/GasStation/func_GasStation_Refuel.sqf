//func_GasStation_Refuel
private["_FUEL", "_x","_client","_PRICE","_Money"];
_client = Player;
_x = ((player getVariable "Shop_CarDetected") select (_this select 0));
_Money =(_client getVariable "Money" ); 

if ((fuel _x) > 0.99) then 
{
	player globalchat "The vehicle has enough fuel!";
} 
else 
{
	_FUEL = (fuel _x);
	_PRICE = round((1 - _FUEL) * 50);
	if( _Money < _PRICE)then
	{
		player sidechat "You don't have enough money!";
		player sidechat format ["You need to pay $%2 for Fuel. Money have: $%1. Need: $%3",_Money,_price,((_Money - _price)*(-1))];
	}
	else
	{
		player sidechat format ["You paid $%2 for fuel. Money left: $%3.",_Money,_price,(_Money - _price)];
		_Client setVariable ["Money",(_Money - _price),true]; 
		_x setfuel 1;
	}
	
};



_client setVariable ["Shop_CarDetected",[],true];