//func_Hospital_heal.sqf
private ["_client","_decimalPlaces","_health","_PRICE","_dialog","_Money"];
_client = player;
_decimalPlaces = 2;
_health = damage _client;
_PRICE =  round (_health * 1000);

_Money = _Client getVariable "Money";


if(_Money >= _PRICE)then
{
	_Client setVariable ["Money",(_Money - _price),true]; 
	_Client setDamage 0;
	player sidechat format ["You paid $%2 for medical service. Money left: $%3",_Money,_price,(_Money - _price),_food];
}
else
{
	player sidechat "You don't have enough money!";
	player sidechat format ["You need to pay $%2 for medical service. Money have: $%1. Need: $%3",_Money,_price,((_Money - _price)*(-1))];
};