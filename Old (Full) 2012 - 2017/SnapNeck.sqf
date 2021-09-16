_Victim = _this select 0;
//player sidechat format ["_Victim: %1", _Victim];
_Victim ENABLESIMULATION TRUE;
player attachto [_Victim,[0,1.2,0]]; player setdir 180; 
//detach player;
player switchmove "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end";
sleep 1;
playsound "Neck";
sleep 1.0;
detach player;
_Victim setdammage 1;
 _VariableISEEHIM = (Player getVariable "VariableISEEHIM");
if(_VariableISEEHIM>0)then{

player setcaptive false;
Player setVariable ["OpenFire", false, true];
};