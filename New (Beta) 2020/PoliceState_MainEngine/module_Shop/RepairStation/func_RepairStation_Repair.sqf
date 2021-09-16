//func_RepairStation_Repair
private["_Health", "_x","_client","_PRICE","_Money"];
_client = Player;
_x = ((player getVariable "Shop_CarDetected") select (_this select 0));
_Money =(_client getVariable "Money" ); 

if ((getDammage _x) < 0.01) then 
{
	player globalchat "The vehicle is fine!";
} 
else 
{
	_Health = (getDammage  _x);
	_PRICE = round((1 - _Health) * 90);
	if( _Money < _PRICE)then
	{
		player sidechat "You don't have enough money!";
		player sidechat format ["You need to pay $%2 to repair. Money have: $%1. Need: $%3",_Money,_price,((_Money - _price)*(-1))];
	}
	else
	{
		player sidechat format ["You paid $%2 for repair. Money left: $%3.",_Money,_price,(_Money - _price)];
		_Client setVariable ["Money",(_Money - _price),true]; 
		_x setDamage 0;
	}
	
};



_client setVariable ["Shop_CarDetected",[],true];