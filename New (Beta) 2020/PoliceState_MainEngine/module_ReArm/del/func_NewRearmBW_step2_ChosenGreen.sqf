//func_NewRearmBW_step2_ChosenGreen.sqf
private ["_Subject","_this","_y","_randomN","_gun","_ammo","_randomChance", "_ChosenWepPack"];

_Subject = _this;
_ChosenWepPack = [];
removeAllWeapons _Subject; 
//sleep 0.5;


//_randomChance = round (random 100);

//if(_randomChance > 50)then
//{//HANDGUN	
//	_ChosenWepPack = EAST_HandGuns call func_step3_SelectWep;

//}
//else
//{
	_randomChance = round (random 100);
	if(_randomChance > 50)then
	{//SMG
		_ChosenWepPack = BW_SMGs call func_step3_SelectWep;	
	}
	else
	{
		_randomChance = round (random 100);
		if(_randomChance > 50)then
		{//SHOTGUN
			_ChosenWepPack = BW_Shotguns call func_step3_SelectWep;	
		}
		else
		{
			_randomChance = round (random 100);
			if(_randomChance > 50)then
			{//ASSAULT RIFLE
				_ChosenWepPack = BW_AssaultRifles call func_step3_SelectWep;	
			}
			else
			{	
				_randomChance = round (random 100);
				if(_randomChance > 50)then
				{//SNIPER RIFLE	
					_ChosenWepPack = BW_SniperRifles call func_step3_SelectWep;	
				}
				else
				{//MACHINE GUN
					_ChosenWepPack = BW_MachineGuns call func_step3_SelectWep;		
				}
			}		
		}
	};
//};


[_Subject, _ChosenWepPack] call func_NewRearm_ALL_FINAL;
