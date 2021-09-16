_cop = _this select 0;
_ISEEHIM = true;
ISEEHIM = ISEEHIM + 1;
_slowkill = false;
_HowLong = 0;

while {(alive _cop)and(_ISEEHIM)} do {

//**SLOWKILL
	if((ISEEHIM == 1 )and!(_slowkill))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;}; if(ISEEHIM > 1)then{_slowkill = false;};	
//**	
											   
//** Условия выхода, если враг потерян (далеко)
	if( (_cop distance player) >1000)then{_ISEEHIM = FALSE; };
//**

//**Идти на подозреваемого  (Основной движок идти)
	if(((ISEEHIM > 0)and((_cop distance player) <300)and((_cop distance player) >15))and!(player in RestrainedPeople))THEN{
		_cop domove (getPos Player); 
	if((vehicle player) isKindOf "Car")then{_cop dotarget vehicle Player;}else{_cop dotarget Player;};
	hintSilent format ["Police're chasing you: %1", ISEEHIM];
	};
//**

_MySpeed = speed player;
_MySpeed2 = speed vehicle player;




//** Активация SlowKill
	if((ISEEHIM == 1 )and!(_slowkill))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};
//**

//** Деактивация SlowKill
	if(ISEEHIM > 1)then{_slowkill = false;};
//**

sleep 3;	
};
///Конец скрипта
	

 ISEEHIM = ISEEHIM - 1;
hintSilent format ["Police're chasing you: %1", ISEEHIM];
if(ISEEHIM == 0 )then {[] execVM "EndBattle.sqf";};
if(alive _cop)then {[_cop] execVM "robot\SecondContact.sqf"; };