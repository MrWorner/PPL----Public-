//func_NewRearm_ALL_FINAL
private ["_Subject","_chosenArray", "_gun","_ammo","_randomChance","_y", "_x"];

//FOR ANY CLASS MAN AND ANY CLASS WEAPONS

_Subject = _this select 0;
_gun = (_this select 1) select 0;
_ammo = (_this select 1) select 1;
_y = 0;
_x = 0;

//hintc format ["_Subject = %1  _gun = %2   _ammo = %3 ",name _Subject, _gun, _ammo];




removeAllWeapons _Subject; 


while{_y!=10}do
	{
	_Subject addmagazine _ammo;
	_y = _y +1;
	};


while{_x!=2}do
	{
	//_SUBJECT addmagazine "SmokeShell";
	_x = _x +1;
	};
	
_Subject addweapon _gun;