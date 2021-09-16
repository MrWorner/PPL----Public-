//func_BlackWaterSaysCIVDOWN.sqf.sqf
private["_BW","_Suspect","_this"];
_Suspect = _this;
_BW = _Suspect call func_CheckTheRandomBW;//For Cops 
if!(isnull _BW)then
{
_BW globalchat format ["%1: CIV DOWN, REQUEST EMT!",name _BW];
[_BW,"CivDown"] call func_BlackWaterSAY;
};
//sleep 5;
//_Suspect setVariable ["SuspShotsFired",false,true];