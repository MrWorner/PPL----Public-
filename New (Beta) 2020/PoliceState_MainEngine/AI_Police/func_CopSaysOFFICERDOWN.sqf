//func_CopSaysOFFICERDOWN.sqf.sqf
private["_COP","_Suspect","_this"];
_Suspect = _this;
_COP = _Suspect call func_CheckTheRandomCop;
if!(isnull _COP)then
{
_COP globalchat format ["%1: OFFICER DOWN, NEED BACKUP!",name _COP];
[_COP,"OfficerDown"] call fnc_CopSAY;
};
//sleep 5;
//_Suspect setVariable ["SuspShotsFired",false,true];