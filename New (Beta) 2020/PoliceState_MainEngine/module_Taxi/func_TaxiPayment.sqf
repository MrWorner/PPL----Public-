//func_TaxiPayment

private["_this", "_Money","_Client","_Payment"];


_Client = player;


_Money = _Client getVariable "Money";
_Payment = (_Client getVariable "TaxiPayment");

if(_Money >= _Payment)then
{

	_Client setVariable ["TaxiPayment", 0,true];
	_Client setVariable ["Money",(_Money - _Payment),true]; 
	player sidechat format ["You paid $%2 for taxi service. Money left: $%3",_Money,_Payment,(_Money - _Payment)];
}
else
{
	player sidechat "You don't have enough money!";
	player sidechat format ["You need to pay $%2 for taxi service. Money have: $%1. Need: $%3",_Money,_Payment,((_Money - _Payment)*(-1))];

};
