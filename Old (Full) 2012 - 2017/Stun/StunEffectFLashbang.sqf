_Man = _this select 0;
StunnedpeopleFlashBang = StunnedpeopleFlashBang + [name _Man];


//player sidechat format ["_Man: %1", _Man];
//player sidechat format ["StunnedpeopleFlashBang: %1", StunnedpeopleFlashBang];

sleep 0.7;

if(Playerisdead)exitwith{};
 _ANIM= ["AmelPercMstpSnonWnonDnon_zasah6hlava","AmelPercMstpSnonWnonDnon_zasah3hard"];
 __ANIMChosen = (_ANIM select (round(random 1)));
 
 
_Man switchmove __ANIMChosen;
 
if(_Man == player)then {[] execVM "stun\StunEffect3.sqf";};
sleep 3;
StunnedpeopleFlashBang = StunnedpeopleFlashBang - [name _Man];