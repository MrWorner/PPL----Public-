_cop= _this select 0;
_VariableISEEHIM = (Player getVariable "VariableISEEHIM");
while {(alive _cop)and(_VariableISEEHIM == 1)} do {
sleep 0.1;
};


if(_VariableISEEHIM > 1)exitwith{};


if(!(alive _cop))then{
[] execVM "effect1.sqf";
 _PlayerCanSay = ["effect3","effect4","effect5","effect6","effect7","effect8","Effect12"];
 _PlayerWillSay = (_PlayerCanSay select (round(random 6)));
setAccTime 0.2;
 titleText["", "WHITE IN", 2];
playmusic _PlayerWillSay;
sleep 0.7;
setAccTime 1;

};
