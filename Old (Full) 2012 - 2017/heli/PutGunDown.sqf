_cop = _this select 0;

sleep 5 + random 5;
if!( (alive player) and !(player in RestrainedPeople) and !((vehicle player) isKindOf "Car") and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player > 0)) exitwith{};
if!(HeliSay)then{
HeliSay = true;

 _CopCanSay = ["COP_HELI_MEGAPHONE_WEAPON_01","COP_HELI_MEGAPHONE_WEAPON_02","COP_HELI_MEGAPHONE_WEAPON_03","COP_HELI_MEGAPHONE_WEAPON_04","COP_HELI_MEGAPHONE_WEAPON_06","COP_HELI_MEGAPHONE_WEAPON_07","COP_HELI_MEGAPHONE_WEAPON_08","COP_HELI_MEGAPHONE_WEAPON_09","COP_HELI_MEGAPHONE_WEAPON_11","COP_HELI_MEGAPHONE_WEAPON_13"];
 _CopWillSay = (_CopCanSay select (round(random 9)));
  _cop  say3D _CopWillSay;

sleep 5 + random 5;
HeliSay = false;



};