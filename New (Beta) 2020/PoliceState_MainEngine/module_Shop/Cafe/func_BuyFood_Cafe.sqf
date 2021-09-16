//func_BuyFood_Cafe.sqf
private["_food","_this","_price","_hungerMinus","_client","_Money"];

//""Shashlik"",45,90

_food = _this select 0;
_price = _this select 1;
_hungerMinus = _this select 2;
_client = player;


_Money = _Client getVariable "Money";


if(_Client getVariable "Hunger" > 99)exitwith{player sidechat "You are not hungry!";};


if(_Money >= _price)then
{
	_Client setVariable ["Money",(_Money - _price),true]; 
	//(_Client getVariable "Hunger" + )
	_hungerMinus = (_Client getVariable "Hunger") + _hungerMinus;
	if(_hungerMinus >100)then{_hungerMinus = 100;};
	_Client setVariable ["Hunger",_hungerMinus,true]; 
	player sidechat format ["You paid $%2 for food: %4. Money left: $%3. Hunger: %5",_Money,_price,(_Money - _price),_food, (100 - _hungerMinus)];
}
else
{
	player sidechat "You don't have enough money!";
	player sidechat format ["You need to pay $%2 for food: %4. Money have: $%1. Need: $%3",_Money,_price,((_Money - _price)*(-1)),_food];
};

