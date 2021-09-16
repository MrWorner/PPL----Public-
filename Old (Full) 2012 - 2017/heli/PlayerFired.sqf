_cop = _this select 0;
sleep 0.1;
if!(HeliSay)then{
HeliSay = true;
_CopCanSay = ["COP_HELI_MEGAPHONE_WEAPON_05","COP_HELI_MEGAPHONE_WEAPON_10","COP_HELI_MEGAPHONE_WEAPON_12","COP_HELI_MEGAPHONE_WEAPON_14","COP_HELI_MEGAPHONE_WEAPON_15"];
_CopWillSay = (_CopCanSay select (round(random 4)));
 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;};

 sleep random 6;
 HeliSay = false;
 };