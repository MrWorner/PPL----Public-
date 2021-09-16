//func_VanillaCopWepOLD.sqf
private ["_Subject","_this","_y","_randomN","_gun","_ammo"];

_Subject = _this;



removeAllWeapons _Subject; 
//sleep 0.5;

_randomN = round random ((count VanillaWeapons) - 1);
_gun = VanillaWeapons select _randomN;
_ammo = VanillaMags select _randomN;
_y = 0;
while{_y!=10}do
{
	_Subject addmagazine _ammo;
	_y = _y +1;
};
_Subject addweapon _gun;

//_SUBJECT addmagazine "SmokeShell";
//_SUBJECT addmagazine "HandGrenade_West";



//TEST
//while{_y!=999}do
//{
//	_Subject addmagazine _ammo;
//	_y = _y +1;
//};
//TEST END