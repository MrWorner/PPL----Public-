_cop = _this select 0;

sleep 5 + random 5;
if!((ISEEHIM > 3)  and !(player in RestrainedPeople)) exitwith {};
if!(HeliSay2)then{
HeliSay2 = true;
 _CopCanSay = ["COP_HELI_MEGAPHONE_04","COP_HELI_MEGAPHONE_07","COP_HELI_MEGAPHONE_12","COP_HELI_MEGAPHONE_14"];
 _CopWillSay = (_CopCanSay select (round(random 3)));
  if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;};

_rNumber = random 5 + 20;
sleep _rNumber;

HeliSay2 = false;
};