//func_CopSaysSHOTSFIRED.sqf
private["_COP","_Suspect","_this"];
_Suspect = _this;
_COP = _Suspect call func_CheckTheRandomCop;

if!(isnull _COP)then
{

//_COP globalchat format ["%1: TAKE COVER! HE IS SHOOTING!",name _COP];
[_COP,"SuspShooting"] call fnc_CopSAY;
};
sleep  (floor random VoiceShotsFiredSec);

_Suspect setVariable ["SuspShotsFired",false,true];