//fnc_CheckMovementIfStuck.sqf 2020
private["_group","_speed", "_isMoving", "_inVehicle", "_timeOut", "_stuck", "_pos", "_dist", "_distPrev"];

_group = _this;
//_pos = _this select 1;

_speed = speed (vehicle (leader _group));
_stuck = false;


//BEGIN Проверяем если лидер в движении
if( _speed < 2 || _speed > (-2) )then
{
	_isMoving = false;
	//ПРОВЕРЯЕМ ЧТО ХОТЬ КТО ТО ДВИЖЕТСЯ, если лидер стоит тупо (напр идет садиться в машину командира!)		
	{
		_speed = speed (vehicle _x);
		if( _speed >= 2 || _speed <= (-2) )exitwith
		{
			_isMoving = true;
			//if(_isMoving)exitwith{};
		};
	}foreach units _group;
}
else
{
	_isMoving = true;
};
//END Проверяем если лидер в движении


//BEGIN NEW проверяем двинулись ли хотя бы на метр
if(!_isMoving)then
{
	_job = _group getVariable "WhatGroupIsDoing";
	switch (_job) do 
	{
		case "Backup": 
		{
			_pos = getpos (_group getvariable "CurrentSuspect");
		};
		case "Patrol": 
		{
			_pos = getMarkerPos (_group getvariable "PatrolMarker");
		};
		case "Investigate": 
		{
			_pos = getMarkerPos (_group getvariable "InvestigationM");
		};
		default 
		{ 
			hintc format ["fnc_CheckMovementIfStuck: Unknown _job = %1", _job];		
		};
	};
	
	
	
	_dist = round ( vehicle leader _group distance _pos);
	_distPrev = _group getvariable ["StuckDistancePrev", 0];
	if(_dist != _distPrev)then
	{
		_group setvariable ["StuckDistancePrev", _dist];
		_isMoving = true;
	};
	
	//hint format ["%1", _dist];
	//if()
};
//END NEW проверяем двинулись ли хотя бы на метр



_timeOut = _group getVariable["TimeToFailTask", GROUP_STUCK_TIMER];
if(_isMoving)then
{
	//Ресет таймера
	if(_timeOut != GROUP_STUCK_TIMER)then
	{
		_group setVariable["TimeToFailTask", GROUP_STUCK_TIMER];
	};	
}
else
{//ВОЗМОЖНО ЗАСТРЯЛ!
	if(_timeOut < 1)then
	{//ВРЕМЯ ВЫШЛО, БЛОКИРУЕМ ЗАДАНИЕ!	
		_group setVariable["TimeToFailTask", GROUP_STUCK_TIMER];
		_stuck = true;
		//player sidechat format ["fnc_CheckMovementIfStuck: STUCK!!!!!!!! %2", _timeOut, name (leader _group )];
	}
	else
	{//Минус время
		_timeOut = _timeOut - 5;//Минус 5 секунд
		_group setVariable["TimeToFailTask", _timeOut];
		
		//player sidechat format ["fnc_CheckMovementIfStuck: _timeOut: %1, leader: %2", _timeOut, name (leader _group )];
	};
};

_stuck;