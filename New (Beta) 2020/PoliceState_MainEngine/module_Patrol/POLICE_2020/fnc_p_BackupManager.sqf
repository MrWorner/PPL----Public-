//fnc_p_BackupManager.sqf 2020
private["_leader","_group", "_susp", "_backupNeeded", "_stuck", "_wpUT", "_lostF", "_dist", "_banned", "_reset"];

_group = _this;
_backupNeeded = false;
_leader = leader _group;

_susp = _group getvariable "CurrentSuspect";

//BEGIN RESET
// _reset = false;
// _job = _group getVariable "WhatGroupIsDoing";
// if( (isNull _susp) || (_job != "Backup")  || !(alive _susp) || !(_susp in Array_SuspectsInChase) )then
// {
	// _reset = true;
// };

// if(_reset)then
// {	
	// _susp = ObjNull;
	// _group setVariable ["CurrentSuspect",_susp,true];//RESET
// };
//END RESET

//BEGIN RESET
_reset = false;
_job = _group getVariable ["WhatGroupIsDoing", ""];
if(_job != "Backup")then
{
	_reset = true;
}
else
{
	if( !(alive _susp) )then
	{
		_reset = true;
	}
	else
	{
		if(  !(_susp in Array_SuspectsInChase)  )then{_reset = true;};
	};
};

if(_reset)then
{	
	_susp = ObjNull;
	_group setVariable ["CurrentSuspect",_susp,true];//RESET
};
//END RESET

if(isNull _susp)then//ЕСЛИ НЕ НАЗНАЧЕТ, ТО ПРОВЕРИМ НУЖНО ЛИ
{
	
	_susp = _group call fnc_p_FindWhoNeedsBackup;
	if( !(isNull _susp) )then//ЕСЛИ НАЗНАЧЕН, ТО УСТАНАВЛИВАЕМ ВСЕ НЕОБХОДИМОЕ!
	{	
		_lostF = _group getVariable ["LostFormation", false];
		if(_lostF)then{_group call fnc_LostFormation;};
		
		_group setVariable["TimeToFailTask", GROUP_STUCK_TIMER];//РЕСЕТ ТАЙМЕРА STUCK
		_group setVariable ["CurrentSuspect",_susp,true];
		_group setVariable ["WhatGroupIsDoing","Backup",true];		
		_group call fnc_RemoveAllWaypoints;
		[_group, (position _susp)] call fnc_createWaypoint;
		_backupNeeded = true;
	}
}
else
{
	_stuck = _group call fnc_CheckMovementIfStuck;
	if(_stuck)then
	{//Если застрял, то пробуем исправить	
		_banned = _group call fnc_UnstuckHelper;
		if(_banned)then
		{//ЗАБАНЕНА ЦЕЛЬ, ИЩЕМ СЛЕДУЮЩУЮ
			_backupNeeded = _group call fnc_p_BackupManager;//РЕКУРСИЯ!
		}
		else
		{//fnc_UnstuckHelper чем то помог! Продолжаем задание!
			_backupNeeded = true;
		};
	}
	else
	{//если все ок, значит нужно подкрепление. Создаем вейпоинт, либо просто DoMove если близко.
		_backupNeeded = true;		
		//ЕСЛИ ПРОТИВНИК БЛИЗКО, ТО ПРОСТО DOMOVE!
		{				
			_dist = vehicle _x distance vehicle _susp;
			if(_dist < 200)then 
			{//EXPERIMENTAL [NEEDED IF CRIME SCENE IN FOREST!]	
				if(_dist < 50)then
				{
					//_x reveal _susp;
					[_x,_susp] call fnc_p_setChase;
					//hint "fnc_p_BackupManager reveal SUSP";
				}
				else
				{
					_lostF = _group getVariable ["LostFormation", false];
					if(	!_lostF	)then{_group setVariable ["LostFormation",true,true];};				
					[_x, _susp] call fnc_DoMove;
				};							
			}				
		}foreach units _group;		
					
		//BEGIN WAYPOINT UPDATE!
		_wpUT = _group getVariable ["waypointUpdateTime", GROUP_WAYPOINT_UPD_TIME];		
		if(_wpUT > 0)then
		{//таймер
			_wpUT = _wpUT - 5;
			_group setVariable ["waypointUpdateTime", _wpUT];		
		}
		else
		{//Обновляем вейпоинт и сбрасываем таймер!
			_group setVariable ["waypointUpdateTime", GROUP_WAYPOINT_UPD_TIME];	
			_group call fnc_RemoveAllWaypoints;
			[_group, (position _susp)] call fnc_createWaypoint;
		};
		//END WAYPOINT UPDATE!

	};
};

// if(_job == "Backup")then
// {
	// player globalchat format ["_backupNeeded = %1 _susp = %2 _job = %3", _backupNeeded, _susp, _job];
// };

_backupNeeded;