_suspect = _this select 0;

_Suspect setVariable ["readyForActionStarted", true, true];
if((_suspect getVariable "readyForActionStarted")and !(_suspect getVariable "RFAgo" ))then {
_x = 0;
while{_x < 31}do{
_MySpeed = speed _suspect;
//player globalchat format ["_x = %1", _x];
sleep 1;
_x = _x +1;
if(({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _suspect>0) and(_MySpeed<19))then{_x = _x + 4;};
if(({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _suspect==0) and(_MySpeed>19))then{_x = _x + 15;};
if(({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _suspect>0) and(_MySpeed>19))then{_x = _x + 15.5;};
};
if((_suspect getVariable "VariableISEEHIM") > 0 )then {_Suspect setVariable ["RFAgo", true, true];};

};




