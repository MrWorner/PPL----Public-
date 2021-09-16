//func_step3_SelectWep.sqf
private ["_this", "_randomChance", "_ChosenArray"];

//FOR ANY CLASS COPS AND ANY CLASS WEAPONS

_WepPackClass = _this; // for example SMGs
_ChosenArray = [];	// for example SMGs_Level_1
_SelectedWepPack = []; //for example ["MP5","9mm"]
_randomChance = round (random 100);


if(_randomChance > 30)then
{// Usual weapons SELECT 0
	_ChosenArray = _WepPackClass SELECT 0;
}
else
{
	_randomChance = round (random 100);
	if(_randomChance > 15)then
	{// Unusual weapons SELECT 1
		_ChosenArray = _WepPackClass SELECT 1;	
	}
	else
	{//
		_randomChance = round (random 100);
		if(_randomChance > 10)then //10 chance OLD
		{// Rare weapons SELECT 2
			_ChosenArray = _WepPackClass SELECT 2;
		}
		else
		{// Legendary weapons SELECT 3
			HINT "legendary!";
			_ChosenArray = _WepPackClass SELECT 3;
		}
	}
};


_SelectedWepPack = _ChosenArray call func_ChooseElementFromArray;

_SelectedWepPack


