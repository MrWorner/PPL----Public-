//func_rearm_step3_REARM.sqf
private ["_Subject","_chosenArray", "_gun","_ammo","_randomChance","_y", "_x","_Wepack","_WepArray","_WepArrayFULL","_random","_found"];
//FOR ANY CLASS MAN AND ANY CLASS WEAPONS
_Subject = _this select 0;
_WepName = _this select 1;
_WepChosenClass = _this select 2;
_WepLevel = _this select 3;

_WepArray = [];
_WepArrayFULL = [];
_gun = "";
_ammo = "";
_gp_grenade = "";
_y = 0;
_random = 0;
_found = false;

removeAllWeapons _Subject; 



{
		
	if( _WepName == (_x select 0))exitwith
	{
		_WepArrayFULL = ((_x select 3) select _WepChosenClass) select _WepLevel;
		
		//hintc format ["_x = %1  _WepName = ",_WepArrayFULL];
		_found = true;
	};
	if(_found)exitwith{};
}foreach GLOBAL_WepPack_RH;

if(!_found)exitwith
{ 
	hintc format ["func_rearm_step3_REARM: ERROR not _found _WepName =%1 _WepChosenClass=%2 _WepLevel=%3", _WepName,_WepChosenClass,_WepLevel];
};


if(count _WepArrayFULL == 0)exitwith
{
	hintc format ["func_rearm_step3_REARM: ERROR count _WepArrayFULL == 0 _WepArrayFULL _WepName =%1 _WepChosenClass=%2 _WepLevel=%3 count _WepArrayFULL = %4 _random = %5", _WepName,_WepChosenClass,_WepLevel, count _WepArrayFULL, _random];
};


if(count _WepArrayFULL == 1)then
{
	_WepArray = _WepArrayFULL select 0;
}
else
{
	_random = ((count _WepArrayFULL) - 1) call func_RandomNumber;
	_WepArray = _WepArrayFULL select _random;
};


if(isnil "_WepArray")exitwith
{ 
	hintc format ["func_rearm_step3_REARM: ERROR isnull _WepArrayFULL _WepName =%1 _WepChosenClass=%2 _WepLevel=%3 count _WepArrayFULL = %4 _random = %5", _WepName,_WepChosenClass,_WepLevel, count _WepArrayFULL, _random];
};


_gun = _WepArray select 0;
_ammo = _WepArray select 1;
if(count _WepArray > 2)then
{//GP grenade
	_gp_grenade = _WepArray select 3;
	_SUBJECT addmagazine _gp_grenade;
	_SUBJECT addmagazine _gp_grenade;
	_SUBJECT addmagazine _gp_grenade;
	_y = _y + 3;
};


if(_WepChosenClass == 0)then
{//PISTOL
	_y = _y + 4;
};

while{_y!=12}do
{
	_Subject addmagazine _ammo;
	_y = _y +1;
};

_Subject addweapon _gun;

if(_gun == "swat")then{_Subject setUnitPos "UP"; };


//if(_gun == "M79_EP1")then{ hint "da!"; player setpos getpos _Subject };

// while{_x!=2}do
//{
	// _SUBJECT addmagazine "SmokeShell";
	// _x = _x +1;
//};