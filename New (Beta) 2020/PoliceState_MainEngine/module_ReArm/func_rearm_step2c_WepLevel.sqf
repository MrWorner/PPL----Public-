//func_rearm_step2c_WepLevel.sqf
private ["_Choice","_randomChance"];

_randomChance = round (random 100);
if(_randomChance > 30)then
{// Usual weapons 0
	_Choice = 0;
}
else
{
	_randomChance = round (random 100);
	if(_randomChance > 15)then
	{// Unusual weapons 1
		_Choice = 1;	
	}
	else
	{//
		_randomChance = round (random 100);
		if(_randomChance > 10)then //10 chance OLD
		{// Rare weapons 2
			_Choice = 2;
		}
		else
		{// Legendary weapons  3
			//HINT "legendary!";
			_Choice = 3;
		}
	}
};

_Choice
