_cop = _this select 0;
_ISEEHIM = true;
ISEEHIM = ISEEHIM + 1;
_slowkill = false;
_HowLong = 0;

while {(alive _cop)and(_ISEEHIM)} do {

//**SLOWKILL
	if((ISEEHIM == 1 )and!(_slowkill))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;}; if(ISEEHIM > 1)then{_slowkill = false;};	
//**	
											   
//** ������� ������, ���� ���� ������� (������)
	if( (_cop distance player) >1000)then{_ISEEHIM = FALSE; };
//**

//**���� �� ��������������  (�������� ������ ����)
	if(((ISEEHIM > 0)and((_cop distance player) <300)and((_cop distance player) >15))and!(player in RestrainedPeople))THEN{
		_cop domove (getPos Player); 
	if((vehicle player) isKindOf "Car")then{_cop dotarget vehicle Player;}else{_cop dotarget Player;};
	hintSilent format ["Police're chasing you: %1", ISEEHIM];
	};
//**

_MySpeed = speed player;
_MySpeed2 = speed vehicle player;

//** ������� �������� � �������? ������������� ������� �� ������? �������� �� ���������!
	if((_MySpeed2>15) and ((vehicle player) isKindOf "Car"))then{_cop dofire vehicle player; };
//**

//** ������� ���� �� �������� �� ��������������! � ����� ������� + ����� �������� �� ������
	if(OpenFire)then{_cop setCombatMode "RED";  if((vehicle player) isKindOf "Car")then{_cop dofire vehicle Player;}else{_cop dofire Player;}; }else{_cop setCombatMode "BLUE";};
//**







////////////**** ������������

//**������������� ����� ��������
	if ((PlayerFired)and(alive _cop)and!((vehicle _cop) isKindOf "Car")) then { [_cop] execVM "Heli\PlayerFired.sqf"; PlayerFired = false;};
//**



//**������������� ��������
	if( (alive player) and !(player in RestrainedPeople) and !((vehicle player) isKindOf "Car")and !((vehicle _cop) isKindOf "Car") and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player>0))then{ [_cop] execVM "Heli\PutGunDown.sqf";};
//**

//** ���� ����� �� ����� ���� �����
	if((ISEEHIM > 5)  and !(player in RestrainedPeople) and !((vehicle _cop) isKindOf "Car")) then {[_cop] execVM "Heli\Surrounded.sqf";};
//**

_MySpeed = speed player;

//** ������������� ������� � ����� ����������
	if((_MySpeed>19) and !((vehicle player) isKindOf "Car") and !(player in RestrainedPeople)) then{[_cop] execVM "Heli\speed.sqf";};
//**


////////////**** ������������ ���������

//** ��������� SlowKill
	if((ISEEHIM == 1 )and!(_slowkill))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};
//**

//** ����������� SlowKill
	if(ISEEHIM > 1)then{_slowkill = false;};
//**

sleep 3;	
};
///����� �������
	

 ISEEHIM = ISEEHIM - 1;
hintSilent format ["Police're chasing you: %1", ISEEHIM];
if(ISEEHIM == 0 )then {[] execVM "EndBattle.sqf";};
if(alive _cop)then {[_cop] execVM "heli\SecondContact.sqf"; };