_cop = _this select 0;



sleep 5 + random 5;

_MySpeed = speed player;
if!((_MySpeed>19) and !((vehicle player) isKindOf "Car") and !(player in RestrainedPeople)) exitwith{};
if!(HeliSay)then{
HeliSay = true;
 _CopCanSay = ["COP_HELI_MEGAPHONE_02","COP_HELI_MEGAPHONE_03","COP_HELI_MEGAPHONE_09","COP_HELI_MEGAPHONE_15"];
 _CopWillSay = (_CopCanSay select (round(random 4)));
  _cop  say3D _CopWillSay;

_rNumber = random 5 + 5;
sleep _rNumber;

HeliSay = false;
};