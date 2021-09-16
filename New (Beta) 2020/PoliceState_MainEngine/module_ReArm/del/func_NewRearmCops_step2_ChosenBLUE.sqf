//func_NewRearmCops_step2_ChosenBLUE.sqf
private ["_Subject","_this","_y","_randomN","_gun","_ammo","_randomChance", "_ChosenWepPack"];

_Subject = _this;
_ChosenWepPack = [];
removeAllWeapons _Subject; 
//sleep 0.5;


_randomChance = round (random 100);

if(_randomChance > 45)then
{//SMG
	//hintc "SWAT_BLUE_SMGs";
	_ChosenWepPack = SWAT_BLUE_SMGs call func_step3_SelectWep;
}
else
{
	_randomChance = round (random 100);
	if(_randomChance > 50)then
	{//Shotgun
		//hintc "SWAT_BLUE_Shotguns";
		_ChosenWepPack = SWAT_BLUE_Shotguns call func_step3_SelectWep;	
	}
	else
	{//
		_randomChance = round (random 100);
		if(_randomChance > 35)then
		{//AssaultRifle
			//hintc "SWAT_BLUE_AssaultRifles";
			_ChosenWepPack = SWAT_BLUE_AssaultRifles call func_step3_SelectWep;	
		}
		else
		{//LessLethal
			//hintc "SWAT_BLUE_LessLethals";
			_ChosenWepPack = SWAT_BLUE_LessLethals call func_step3_SelectWep;
		}
	}
};


[_Subject, _ChosenWepPack] call func_NewRearm_ALL_FINAL;
