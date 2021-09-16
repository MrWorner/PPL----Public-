/// Cop
_human = _this select 0;_x = 0;_y = 0;removeAllWeapons _human;

//_human addweapon "RH_Scarh_gl_acog";

///MAIN GUN
//while{_x!=12}do{
//_human addmagazine "RH_20Rnd_762x51_SCAR";
//_x = _x +1;
//};
///HANDGUN
_human addweapon "RH_MK22";
while{_y!=8}do{
_human addmagazine "8Rnd_9x19_MK";
_y = _y +1;
};