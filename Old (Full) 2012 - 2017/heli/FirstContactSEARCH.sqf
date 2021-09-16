
//nul = [this] execVM "heli\fIRSTCONTACTSEARCH.sqf";

_cop = _this select 0;
_active = true;
sleep 1;
[_cop] execVM "BeginBehaviour.sqf";
_copGrp = group _cop;

nul = [_cop] execVM "DorA.sqf"; [_copGrp] execVM "heli\LastPosition.sqf";



while{(_active)and(alive _cop)}do{

sleep 0.2;
_Knowledge =  _cop knowsAbout player;
_Knowledge2 =  _cop knowsAbout vehicle player;
if(((_Knowledge > 0.01)or(_Knowledge2 > 0.01))or((_Knowledge > 0.01) and !(player in RestrainedPeople) and({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player>0)))then{
  _CopCanSay = ["COP_HELI_MEGAPHONE_01","COP_HELI_MEGAPHONE_05","COP_HELI_MEGAPHONE_03","COP_HELI_MEGAPHONE_06","COP_HELI_MEGAPHONE_08","COP_HELI_MEGAPHONE_10","COP_HELI_MEGAPHONE_13"];
 _CopWillSay = (_CopCanSay select (round(random 6)));
 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;  _cop dotarget player;};
 _active = false;
 _cop domove getpos player;

 

 [_cop] execVM "heli\FollowFast.sqf";
 };


};

