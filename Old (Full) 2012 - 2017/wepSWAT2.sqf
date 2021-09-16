/// SWAT ASSAULT 1
_human = _this select 0;_x = 0;_y = 0;removeAllWeapons _human;

_human addweapon "RH_M4EOTECH";

///MAIN GUN
while{_x!=12}do{
_human addmagazine "30Rnd_556x45_Stanag";
_x = _x +1;
};
///HANDGUN
_human addweapon "RH_USP";
while{_y!=8}do{
_human addmagazine "15rnd_9x19_usp";
_y = _y +1;
};