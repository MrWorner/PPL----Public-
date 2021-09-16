
FunctionPoliceChase=
{

_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;

_ISEEHIM = true;
//_VariableISEEHIM = _VariableISEEHIM + 1;

_VariableISEEHIM = (_Suspect getVariable "VariableISEEHIM") + 1;
_Suspect setVariable ["VariableISEEHIM", _VariableISEEHIM, true];

_slowkill = false;
_count = 0;
_GrenadeLimit = false;
_GrenadeLimitCount = 25;

[_cop,_Suspect] execVM "COPFile\CheckFight.sqf";
//player groupChat format ["_cop: %1", (name _cop)];
//player groupChat format ["_Suspect %1",(name _Suspect) ];
//player groupChat format ["_cop: %1 vs _Suspect %2", (name _cop), (name _Suspect) ];

while {(alive _cop)and(_ISEEHIM)and(alive _Suspect)and!(_cop in RestrainedPeople)and(_Suspect getVariable "PlayerisWANTED")and!(_Suspect in RestrainedPeople)} do {




//**SLOWKILL
	if(((_Suspect getVariable "VariableISEEHIM") == 1 )and!(_slowkill)and( player == _Suspect))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;}; if((_Suspect getVariable "VariableISEEHIM") > 1)then{_slowkill = false;};	
//**	
											   
//** Условия выхода, если враг потерян (далеко)
	if( (_cop distance _Suspect) >=450)then{_ISEEHIM = FALSE; };
//**

//**Идти на подозреваемого  (Основной движок идти)
	if((((_Suspect getVariable "VariableISEEHIM") > 0)and((_cop distance _Suspect) <300)and((_cop distance _Suspect) >15))and!(_Suspect in RestrainedPeople))THEN{
	  if(((_cop distance _Suspect) >=19)and!(_Suspect getVariable "OpenFire"))then{	_cop domove (getPos _Suspect); };
	if((vehicle _Suspect) isKindOf "Car")then{_cop dotarget vehicle _Suspect;}else{_cop dotarget _Suspect;};
	if(_Suspect == Player)then{hintSilent format ["Police're chasing you: %1", (_Suspect getVariable "VariableISEEHIM")];};
	};
//**

_MySpeed = speed _Suspect;
_MySpeed2 = speed vehicle _Suspect;

//** Опасная ситуация с машиной? Подозреваемый убегает на машине? Стреляем на поражение!
	if((_MySpeed2>15) and ((vehicle _Suspect) isKindOf "Car"))then{_cop dofire vehicle _Suspect; };
//**

//** Зеленый свет на стрельбу по подозреваемому! А также возврат + Снова стрельба по машине
	if(_Suspect getVariable "OpenFire")then{_cop setCombatMode "RED";  if((vehicle _Suspect) isKindOf "Car")then{_cop dofire vehicle _Suspect;}else{_cop dofire _Suspect; _Suspect setVariable ["RFAgo", true, true];}; }else{_cop setCombatMode "BLUE";};
//**


//**Близко с оружием? Стрелять на поражение! 
	if( ((_cop distance _Suspect) < 7) and (alive _Suspect) and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _Suspect>0)and !((vehicle _Suspect) isKindOf "Car"))then{ _cop dofire _Suspect; _Suspect setVariable ["OpenFire", true, true];  _Suspect setVariable ["RFAgo", true, true];};
//**


//** Не приближаться близко только если арест одному копу + если подозреваемый не вооружен и долго стоит на месте, то все постараются скрутить его
  // + Тажке активация для SlowKill
if( ((_cop distance _Suspect) <17) and (alive _Suspect))then   //and (_MySpeed<19)
	{ 
		if((_Suspect getVariable "WhoIsGoing") != _cop)then{ if!(_Suspect getVariable "RFAgo")then {dostop _cop; _cop domove getpos _cop;};  sleep 2; if(( (_Suspect getVariable "VariableISEEHIM") == 1 )and!(_slowkill)and(_Suspect == Player))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};};
		if((_Suspect getVariable "WhoIsGoing") == _cop)then {_cop domove (getPos _Suspect); sleep 3; if(((_Suspect getVariable "VariableISEEHIM") == 1 )and!(_slowkill)and(player == _Suspect))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};};
	};
//**
 //if!(alive _Suspect) exitwith{};
////////////**** РАЗГОВОРЧИКИ

//**Подозреваемый близко и начинаем драться
	//if( ((_cop distance _Suspect) <4) and (alive _Suspect) and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and !((_Suspect getVariable "FightBan")) and !((_Suspect getVariable "Fight"))  and (alive _cop) and !((vehicle _cop) isKindOf "Car") and !((vehicle _Suspect) isKindOf "Car")) then { [_cop] execVM "Fight.sqf";  sleep 5;};
//**

////////////**** РАЗГОВОРЧИКИ
if(!(_cop in Trouble)and!(_cop in RestrainedPeople))then{
//**Подозреваемый начал стрельбу
	if ((_Suspect getVariable "PlayerFired")and(alive _cop)and!((vehicle _cop) isKindOf "Car")) then { [_cop,_Voice] execVM "COPfile\PlayerFired.sqf"; _Suspect setVariable ["PlayerFired", false, true];};
//**

//** Подозреваемый в машине
	if ((vehicle _Suspect) isKindOf "Car") then { [_cop,_Voice,_Suspect] execVM "COPfile\GetOutFromCar.sqf";};
//**

//**Подозреваемый вооружен
	if( (alive _Suspect) and !(_Suspect in RestrainedPeople) and !((vehicle _Suspect) isKindOf "Car")and !((vehicle _cop) isKindOf "Car") and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _Suspect>0))then{ [_cop,_Voice,_Suspect] execVM "COPfile\PutGunDown.sqf";};
//**

//** Если копов до Ебени Фени много
	if(((_Suspect getVariable "VariableISEEHIM") > 5)  and !(_Suspect in RestrainedPeople) and !((vehicle _cop) isKindOf "Car")) then {[_cop,_Voice] execVM "COPfile\Surrounded.sqf";};
//**

_MySpeed = speed _Suspect;

//** Подозреваемый убегает и пятки засверкали
	if((_MySpeed>19) and !((vehicle _Suspect) isKindOf "Car") and !(_Suspect in RestrainedPeople)) then{[_cop,_Voice,_Suspect] execVM "COPfile\speed.sqf";};
//**

//** Подозреваемый стоит без оружия
	if((_MySpeed<19) and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car")  and !(_Suspect in RestrainedPeople)) then{[_cop,_Voice,_Suspect] execVM "COPfile\HandsUp.sqf";};
//**

//** Офицер убит
	if((OfficerDown)and(alive _cop)and!((vehicle _cop) isKindOf "Car"))then{[_cop,_Voice] execVM "COPfile\OfficerDown.sqf"; OfficerDown = false;};
//**

//** Гражданский словил пулю
	if((CivDown)and(alive _cop)and!((vehicle _cop) isKindOf "Car"))then{[_cop,_Voice] execVM "COPfile\CivDown.sqf";CivDown = false;};
//**
};
////////////**** РАЗГОВОРЧИКИ закончены


_CopSpeed = speed vehicle _cop;


//** Выпругнуть из машины, если подозреваемый близко без машины
	if (((vehicle _cop) isKindOf "Car") and !((vehicle _Suspect) isKindOf "Car")  and ((_cop distance _Suspect) <50) and (_CopSpeed< 15))then
   {
		sleep random 1;
		_cop action ["getOut", (vehicle _cop)];
		//_Suspect globalchat "bang";
		[_cop] orderGetIn false;
		//if((_cop distance _Suspect) <25)then{dostop _cop;}else{ _cop domove (getPos _Suspect);};
		_cop dotarget vehicle _Suspect;
		//_cop dowatch vehicle _Suspect; 
   };
//**	

//** Произвести арест подозреваемого! + активация SlowKill
	if((_Suspect getVariable "GaveUp")and!((_Suspect getVariable "CopGoingtoArrest"))and(alive _cop)and!((vehicle _cop) isKindOf "Car") and !(_cop in Trouble)and!(_cop in RestrainedPeople))then
	{

		_Suspect setVariable ["WhoIsGoing", _cop, true];
		_Suspect setVariable ["CopGoingtoArrest", true, true];
		if(((_Suspect getVariable "VariableISEEHIM") == 1 )and!(_slowkill)and(player == _Suspect))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};
		sleep 2;
		_cop domove getpos _Suspect;
		[_cop,_Voice,_Suspect] execVM "COPfile\readyToArrest.sqf";
	};

//**Еще раз дать цель на поражение (но зачем? пустая трата строк?)
	if(_Suspect getVariable "OpenFire")then{_cop setCombatMode "RED";  if((vehicle _Suspect) isKindOf "Car")then{_cop dofire vehicle _Suspect;}else{_cop dofire _Suspect; }; };
//**

//**Снова остановить копа, если подозреваемый близко
	if(((_Suspect getVariable "WhoIsGoing") != _cop) and ((_cop distance _Suspect) <17) and (alive _Suspect))then{dostop _cop; _cop domove getpos _cop;};
//**

_MySpeed2 = speed vehicle _Suspect;

//** И снова опасная ситуация когда подозреваемый на машине!
	if((_MySpeed2>15) and ((vehicle _Suspect) isKindOf "Car"))then{_cop dofire vehicle _Suspect; };
//**

//** Активация SlowKill
	if(( (_Suspect getVariable "VariableISEEHIM") == 1 )and!(_slowkill)and(player == _Suspect))then {[_cop] execVM "SlowKill.sqf";_slowkill=true;};
//**

//** Деактивация SlowKill
	if((_Suspect getVariable "VariableISEEHIM") > 1)then{_slowkill = false;};
//**

_pWeap = primaryWeapon _cop;
_Magz = magazines _cop;
_SWeap = secondaryWeapon _cop;
//_Suspect globalchat format ["_SWeap = %1",_SWeap];

//** Стрельба нелетальным оружием

 //**Taser
	if( ((_cop distance _Suspect) <30) and !(_Suspect getVariable "OpenFire") and (_Suspect getVariable "RFAgo") and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and (alive _Suspect) and (_cop hasWeapon "x26")and !((vehicle _Suspect) isKindOf "Car")and !((vehicle _cop) isKindOf "Car") )then 
	{
	///this addMagazine "x26_Mag";
	_count = _cop ammo "x26";

	if(_count>0)then{
	dostop _cop;
	_cop selectWeapon "x26";
	sleep 2;
	_cop fire "x26";
	};
    };



    //**Pepper gun
	if( ((_cop distance _Suspect) <50) and (_Suspect getVariable "RFAgo") and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and (alive _Suspect) and (_pWeap == "cal68_egosl")and !((vehicle _Suspect) isKindOf "Car")and !((vehicle _cop) isKindOf "Car") )then 
	{
	///this addMagazine "cal68_50FP";
	_cop dofire _Suspect;
	};
	
	
	   //**Non-Lethal Shotgun
	if( ((_cop distance _Suspect) <50) and (_Suspect getVariable "RFAgo")  and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and (alive _Suspect) and ((_pWeap == "D3z_maxus")or(_pWeap == "M1014"))and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car"))then 
	{

	_cop dofire _Suspect;
	//this addMagazine "d3z_buck_75_5";
	//                  8Rnd_B_Beneli_74Slug
	};
	
	
	
	//**Газовый гранатомет M79
	if( ((_cop distance _Suspect) >150) and (_Suspect getVariable "RFAgo")  and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and ((_cop distance _Suspect) <530) and !(_Suspect in RestrainedPeople) and !(_Suspect getVariable "GaveUp") and (alive _Suspect) and (_pWeap == "M79_EP1")and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car") )then 
	{
	_count = _cop ammo "M79_EP1";
	//_Suspect globalchat format ["_count = %1",_count];
	if(_count>0)then{
	dostop _cop;
	sleep 0.3;
	_cop fire "M79_EP1";
	};
	///this addMagazine "1Rnd_Smoke_M203";
	};
	
	//**Газовый гранатомет M32
	if( ((_cop distance _Suspect) >150) and (_Suspect getVariable "RFAgo")  and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and ((_cop distance _Suspect) <530) and !(_Suspect in RestrainedPeople) and !(_Suspect getVariable "GaveUp") and (alive _Suspect) and (_pWeap == "M32_EP2")and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car") )then 
	{
	_count = _cop ammo "M32_EP2";
	
	if(_count>0)then{
	for [{_x=1},{_x<=6},{_x=_x+1}] do{
	dostop _cop;
	_cop fire "M32_EP2";
	sleep 0.5;
	};
	sleep 5;
	};
	///this addMagazine "6Rnd_Smoke_M203";
	};

//_Suspect globalchat format ["_Magz = %1",_Magz];
	_ThrowGrenade = random 100;	
		
		//**Flashbang
	if( ((_cop distance _Suspect) <130) and (_Suspect getVariable "RFAgo")  and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and ((_cop distance _Suspect) > 50) and (_Suspect getVariable "OpenFire")  and !(_GrenadeLimit) and (_ThrowGrenade > 75) and !(_Suspect in RestrainedPeople) and !(_Suspect getVariable "GaveUp") and (alive _Suspect) and ("RAB_L111A1" in _Magz)and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car") )then 
	{
	_cop setunitpos "up";
	sleep 0.3;
	dostop _cop;
	_cop dowatch _Suspect;
	_cop fire ["RAB_ThrowMuzzle","RAB_ThrowMuzzle","RAB_L111A1"];
	
	sleep 1;
	_GrenadeLimit = true;
	_cop setunitpos "AUTO";
	};
	
		//**GasGrenade
	if( ((_cop distance _Suspect) <130) and (_Suspect getVariable "RFAgo")  and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and ((_cop distance _Suspect) > 50) and (_Suspect getVariable "OpenFire")  and !(_GrenadeLimit) and (_ThrowGrenade > 75) and !(_Suspect in RestrainedPeople) and !(_Suspect getVariable "GaveUp") and (alive _Suspect) and ("SmokeShell" in _Magz)and !((vehicle _Suspect) isKindOf "Car") and !((vehicle _cop) isKindOf "Car"))then 
	{
	_cop setunitpos "up";
	sleep 0.3;
	dostop _cop;
	_cop dowatch _Suspect;
	_cop fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
	
	sleep 1;
	_GrenadeLimit = true;
	_cop setunitpos "AUTO";
	};
	
if(_GrenadeLimit)then{ _GrenadeLimitCount = _GrenadeLimitCount - 1;};
if(_GrenadeLimitCount <= 0)then {_GrenadeLimit = false; _GrenadeLimitCount = 60 + random 25; };
	
	
//////unitname fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShellRed"];
//**



sleep 2;	
};
///Конец скрипта
	
	
[_cop] orderGetIn true;	

 _VariableISEEHIM = (_Suspect getVariable "VariableISEEHIM") - 1;
_Suspect setVariable ["VariableISEEHIM", _VariableISEEHIM, true];
_Variable = (_Suspect getVariable "CopsKnowMe") - [_cop];
 _Suspect setVariable ["CopsKnowMe", _Variable, true];
 
if(_Suspect == Player)then{hintSilent format ["Police're chasing you: %1", _VariableISEEHIM];};
if(((_Suspect getVariable "VariableISEEHIM") == 0 ))then {[_Suspect] execVM "EndBattle.sqf";};
//if(alive _cop)then {[_cop,_Voice] spawn FunctionPoliceSecondContact; }else{OfficerDown = true;};
if(alive _cop)then {[_cop,_Voice] spawn FunctionPoliceFirstContactSEARCH; }else{OfficerDown = true;};

//player globalchat format ["_cop: %1 vs _Suspect %2 DONE!",  (name _cop), (name _Suspect)];



//Hintc format ["(alive _cop) = %1",(alive _cop)];
//sleep 0.1;
//Hintc format ["(_ISEEHIM) = %1",(_ISEEHIM)];
//sleep 0.1;
//Hintc format ["(_cop in RestrainedPeople) = %1",(_cop in RestrainedPeople)];
//sleep 0.1;
//Hintc format ["(_Suspect in RestrainedPeople) = %1",(_Suspect in RestrainedPeople)];
//sleep 0.1;
//Hintc format ["(alive _Suspect) = %1",(alive _Suspect)];
//sleep 0.1;
//_sus = (_Suspect getVariable "PlayerisWANTED");
//Hintc format ["(_Suspect getVariable PlayerisWANTED) = %1",_sus];
}