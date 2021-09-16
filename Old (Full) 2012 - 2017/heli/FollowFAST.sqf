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

//** Опасная ситуация с машиной? Подозреваемый убегает на машине? Стреляем на поражение!
	if((_MySpeed2>15) and ((vehicle player) isKindOf "Car"))then{_cop dofire vehicle player; };
//**

//** Зеленый свет на стрельбу по подозреваемому! А также возврат + Снова стрельба по машине
	if(OpenFire)then{_cop setCombatMode "RED";  if((vehicle player) isKindOf "Car")then{_cop dofire vehicle Player;}else{_cop dofire Player;}; }else{_cop setCombatMode "BLUE";};
//**







////////////**** РАЗГОВОРЧИКИ

//**Подозреваемый начал стрельбу
	if ((PlayerFired)and(alive _cop)and!((vehicle _cop) isKindOf "Car")) then { [_cop] execVM "Heli\PlayerFired.sqf"; PlayerFired = false;};
//**



//**Подозреваемый вооружен
	if( (alive player) and !(player in RestrainedPeople) and !((vehicle player) isKindOf "Car")and !((vehicle _cop) isKindOf "Car") and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player>0))then{ [_cop] execVM "Heli\PutGunDown.sqf";};
//**

//** Если копов до Ебени Фени много
	if((ISEEHIM > 5)  and !(player in RestrainedPeople) and !((vehicle _cop) isKindOf "Car")) then {[_cop] execVM "Heli\Surrounded.sqf";};
//**

_MySpeed = speed player;

//** Подозреваемый убегает и пятки засверкали
	if((_MySpeed>19) and !((vehicle player) isKindOf "Car") and !(player in RestrainedPeople)) then{[_cop] execVM "Heli\speed.sqf";};
//**


////////////**** РАЗГОВОРЧИКИ закончены

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
if(alive _cop)then {[_cop] execVM "heli\SecondContact.sqf"; };