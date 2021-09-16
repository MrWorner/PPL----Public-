_cop = _this select 0;
_active = true;
[_cop] execVM "BeginBehaviour.sqf";

while{(_active)and(alive _cop)}do{

sleep 3;
_Knowledge =  _cop knowsAbout player;
_Knowledge2 =  _cop knowsAbout vehicle player;
if(((_Knowledge > 0.45)or(_Knowledge2 > 0.25))and((_cop distance player) <1000)and!(player in RestrainedPeople))then{
  _CopCanSay = ["COP_HELI_MEGAPHONE_01","COP_HELI_MEGAPHONE_05","COP_HELI_MEGAPHONE_03","COP_HELI_MEGAPHONE_06","COP_HELI_MEGAPHONE_08","COP_HELI_MEGAPHONE_10","COP_HELI_MEGAPHONE_13"];
 _CopWillSay = (_CopCanSay select (round(random 6)));
 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay; _cop domove getpos player;};
 _active = false;
 _cop dotarget player;
 
 [_cop] execVM "heli\FollowFast.sqf";
 };


};
