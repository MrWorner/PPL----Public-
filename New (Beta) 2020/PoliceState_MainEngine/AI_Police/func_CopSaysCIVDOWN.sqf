//func_CopSaysCIVDOWN.sqf.sqf
private["_COP","_Suspect","_this"];
_Suspect = _this;
_COP = _Suspect call func_CheckTheRandomCop;
if!(isnull _COP)then
{
_COP globalchat format ["%1: CIV DOWN, REQUEST EMT!",name _COP];
[_COP,"CivDown"] call fnc_CopSAY;
};
//sleep 5;
//_Suspect setVariable ["SuspShotsFired",false,true];