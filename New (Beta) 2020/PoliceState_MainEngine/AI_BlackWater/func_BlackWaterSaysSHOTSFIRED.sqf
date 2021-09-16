//func_BWSaysSHOTSFIRED.sqf
private["_BW","_Suspect","_this"];
_Suspect = _this;
_BW = _Suspect call func_CheckTheRandomBW;

if!(isnull _BW)then
{

_BW globalchat format ["%1: TAKE COVER! HE IS SHOOTING!",name _BW];
[_BW,"SuspShooting"] call func_BlackWaterSAY;
};
sleep  (floor random VoiceShotsFiredSec);

_Suspect setVariable ["SuspShotsFired",false,true];