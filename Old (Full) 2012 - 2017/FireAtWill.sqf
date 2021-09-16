_civ = _this select 0;

//_civ = player;
//player groupChat format ["%1 from FireAtWill.sqf script!", _civ];

_score = -50000;

if((_civ getVariable "VariableISEEHIM")>0)then{
_civ setVariable ["OpenFire", true, true];
if!(_civ getVariable "PlayerFiredBan")then{_civ setVariable ["PlayerFired", true, true]; _civ setVariable ["PlayerFiredBan", true, true]; _civ addRating _score;  _civ setcaptive false; sleep 3; _civ setVariable ["PlayerFiredBan", false, true];};
};


if(((LastPos distance _civ) <700)and((_civ getVariable "VariableISEEHIM")==0))then{
LastPos setpos getpos _civ;
"LastPos" setMarkerPos getpos _civ;
LastPosGuarded = false;
}; 


if(((_civ getVariable "VariableISEEHIM")<1)and((LastPos distance _civ) > 10))then{
{
if((side _x == west))then{
LastPos setpos getpos _civ;
"LastPos" setMarkerPos getpos _civ;
LastPosGuarded = false;
};
}foreach nearestObjects [position _civ, ["Man"], 700];
};