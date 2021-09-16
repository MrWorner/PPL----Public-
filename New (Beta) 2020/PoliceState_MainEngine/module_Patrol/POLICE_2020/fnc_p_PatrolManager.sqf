//fnc_p_PatrolManager.sqf
private[ "_group", "_leader", "_patroling", "_curMarker", "_lostF","_totalP","_visitedP", "_notVisited", "_otherMarker", "_freeMarkers", "_addIt", "_time", "_bannedList", "_job"];

_group = _this;
_leader = leader _group;
_patroling = false;

_curMarker = _group getvariable ["PatrolMarker", ""];

//player groupchat format ["_curMarker: %1",_curMarker];
if(_curMarker == "")then
{//ПОПРОБУЕМ НАЗНАЧИТЬ ЗАДАЧУ
	_totalP = count PatrolLocation;
	if(_totalP > 1)then
	{		
		//Пробуем найти уникальную точку для патрулирования!		
		_visitedP = _group getvariable ["PatrolVisitedMarkers", []];
		//player groupchat format ["fnc_p_PatrolManager: GROUP: %1, _visitedP = %2",name leader _group, _visitedP];
		if(count _visitedP >= _totalP)then
		{//сброс посещенных точек, если не осталось свободных на выбор	
			_group setvariable ["PatrolVisitedMarkers", []]; 
			_visitedP = [];
			//hintc "_visitedP reset!"
		};		
		_notVisited = [];
		_bannedList = _group getVariable ["PatrolBlackList",[]];
		{
			if( !(_x in _bannedList) )then
			{
				if( !(_x in _visitedP) )then{_notVisited = _notVisited + [_x]};
			};
			
		}foreach PatrolLocation;
				
		//пытаемся найти точки те, которые другие полицейские патрули не используют для себя
		_freeMarkers = [];
		{
			_curMarker = _x;	
			_addIt = true;
					
			{
				if(_addIt)then
				{
					_otherMarker = _x getvariable ["PatrolMarker", ""];
					if(_curMarker == _otherMarker)then
					{
						_addIt = false;
					};
				};						
			}foreach PoliceGroups;
			if(_addIt)then{_freeMarkers = _freeMarkers + [_curMarker]};
		}foreach _notVisited;
		
		if(count _freeMarkers == 0)then{_freeMarkers = _notVisited;};
		
		//FNALE ВЫБИРАЕМ МАРКЕР!
		_rnd = (round random ( (count _freeMarkers) - 1));
		//if(_rnd < 0)then{_rnd = 0;};
		_curMarker = _freeMarkers select _rnd;	
		_group setvariable ["PatrolMarker", _curMarker];
		
		//Lost formation RESET
		_lostF = _group getVariable ["LostFormation",false];
		if(_lostF)then{_group call fnc_LostFormation;};			
		_group setVariable["TimeToFailTask", GROUP_STUCK_TIMER];//РЕСЕТ ТАЙМЕРА STUCK
		
		_group call fnc_RemoveAllWaypoints;
		
		
		//while{}do
		//{
			[_group, (getMarkerPos _curMarker)] call fnc_createWaypoint;
		//};
		
		
		_patroling = true;
		_group setvariable ["PatrolWait", round random WAIT_PATROL_TIME_RND];
		
		//player sidechat format ["fnc_p_PatrolManager: GROUP: %1, CHOSEN PATROL: %2",name leader _group, _curMarker];
	};
}
else
{//ПРОВЕРЯЕМ ДОЕХАЛИ ЛИ

	if(vehicle _leader distance getMarkerPos _curMarker < 30 )then
	{//Если достигли цели
	
		_time = _group getvariable "PatrolWait";
		_time = _time - 5;
		if(_time > 0)then
		{//ждем на точке
			///--------_patroling = true;			
			_group setvariable ["PatrolWait", _time];
			//player groupchat format ["fnc_p_PatrolManager: GROUP: %1, _time: %2",name leader _group, _time];
		}
		else
		{//END
			
			_visitedP = _group getvariable ["PatrolVisitedMarkers", []];
			_visitedP = _visitedP + [_curMarker];
			_group setvariable ["PatrolVisitedMarkers", _visitedP];		
			_group setvariable ["PatrolMarker", ""];					
			//player groupchat format ["fnc_p_PatrolManager: GROUP: %1, TIME RESETing!",name leader _group];
			//-----------_patroling = _group call fnc_p_PatrolManager;//РЕКУРСИЯ!		
		};	
		_patroling = true;
	}
	else
	{//если еще в пути
		_stuck = _group call fnc_CheckMovementIfStuck;
		if(_stuck)then
		{//Если застрял, то пробуем исправить	
			_banned = _group call fnc_UnstuckHelper;
			if(_banned)then
			{//ЗАБАНЕНА ЦЕЛЬ, ИЩЕМ СЛЕДУЮЩУЮ
				_patroling = _group call fnc_p_PatrolManager;//РЕКУРСИЯ!
			}
			else
			{//fnc_UnstuckHelper чем то помог! Продолжаем задание!
				_patroling = true;
			};
		}
		else
		{
			_patroling = true;
		};
	};
};

if(_patroling)then
{
	_job = _group getVariable ["WhatGroupIsDoing", ""];
	if(_job != "Patrol")then
	{//RESET		
		_group setVariable ["WhatGroupIsDoing", "Patrol"];
		_lostF = _group getVariable ["LostFormation", false];
		if(_lostF)then{_group call fnc_LostFormation;};
	};
};

_patroling;