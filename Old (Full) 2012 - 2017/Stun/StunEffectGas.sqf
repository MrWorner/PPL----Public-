_Man = _this select 0;
_Pos = _this select 1;
StunnedpeopleFlashBang = StunnedpeopleFlashBang + [_Man];
sleep 0.7;

if(Playerisdead)exitwith{};
 //_ANIM= ["AmelPercMstpSnonWnonDnon_zasah6hlava","AmelPercMstpSnonWnonDnon_zasah3hard"];
 //_ANIMChosen = (_ANIM select (round(random 1)));
 
 
//if!(_Man in StunnedpeopleFlashBang2)exitwith{}; 
 if(!(Alreadystunned)and(_man == player))then{_Man switchmove __ANIMChosen;};
 if(_man != player)then{_Man switchmove __ANIMChosen;};
 
//if(_Man == player)then {[] execVM "stun\StunEffect3.sqf";};
if(_Man == player)then {[_Pos,_Man] execVM "stun\Otravlenie.sqf";};
if(_Man == player)then {[_Man] execVM "stun\OtravlenieSound.sqf";};
sleep 3;
StunnedpeopleFlashBang = StunnedpeopleFlashBang - [_Man];