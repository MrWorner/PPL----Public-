//func_VanillaCopWep.sqf
private ["_Subject","_this","_y","_randomN","_gun","_ammo","_randomChance", "_chosenPack"];

_Subject = _this;
removeAllWeapons _Subject; 
//sleep 0.5;
_chosenPack = [];




_randomChance = round (random 100);

if(_randomChance > 97)then{_chosenPack = VanillaArsenal_SniperRifles_ALL;}
else
{
	if(_randomChance > 85)then{_chosenPack = VanillaArsenal_AssaultRifles_ALL;}
	else
	{
		if(_randomChance > 60)then{_chosenPack = VanillaArsenal_SMGs_ALL;}
		else
		{
			if(_randomChance > 55)then{_chosenPack = VanillaArsenal_ShotGuns_ALL;}
			else
			{
				if(_randomChance > 5)then{_chosenPack = VanillaArsenal_AssaultRifles_SCOPE_ALL;}
				else
				{
					_chosenPack = VanillaArsenal_GrenadeLaunchers_ALL;	
				}	
			}
		}
	}
};



//VanillaArsenal_HandGuns_ALL					COP|10%  EAST|50%    RES|%
//VanillaArsenal_ShotGuns_ALL					COP|10%  EAST|50%    RES|%
//VanillaArsenal_SMGs_ALL						COP|10%  EAST|50%    RES|%
//VanillaArsenal_AssaultRifles_ALL				COP|10%  EAST|50%    RES|%
//VanillaArsenal_AssaultRifles_SCOPE_ALL		COP|10%  EAST|50%    RES|%
//VanillaArsenal_AssaultRifles_GP_ALL			COP|10%  EAST|50%    RES|%
//VanillaArsenal_AssaultRifles_GP_SCOPE_ALL		COP|10%  EAST|50%    RES|%
//VanillaArsenal_SniperRifles_ALL				COP|10%  EAST|50%    RES|%
//VanillaArsenal_MachineGuns_ALL				COP|10%  EAST|50%    RES|%
//VanillaArsenal_GrenadeLaunchers_ALL			COP|10%  EAST|50%    RES|%




_randomN = round random ((count _chosenPack) - 1);
_gun = ((_chosenPack select _randomN) select 0);
_ammo =  ((_chosenPack select _randomN) select 1);
_y = 0;


while{_y!=10}do
{
	_Subject addmagazine _ammo;
	_y = _y +1;
};
_Subject addweapon _gun;


if(random 100 > 80)then{_SUBJECT addmagazine "SmokeShell";};
if(random 100 > 80)then{_SUBJECT addmagazine "HandGrenade_West";};


//TEST
//while{_y!=999}do
//{
//	_Subject addmagazine _ammo;
//	_y = _y +1;
//};
//TEST END