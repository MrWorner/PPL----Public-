//func_BlackWaterSaysOFFICERDOWN.sqf
private["_BW","_Suspect","_this"];
_Suspect = _this;
_BW = _Suspect call func_CheckTheRandomBW;
if!(isnull _BW)then
{
_BW globalchat format ["%1: OFFICER DOWN, NEED BACKUP!",name _BW];
[_BW,"OfficerDown"] call func_BlackWaterSAY;
};
//sleep 5;
//_Suspect setVariable ["SuspShotsFired",false,true];