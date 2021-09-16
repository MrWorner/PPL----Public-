//fnc_p_InvestigationManager.sqf 2020
private[ "_group", "_leader", "_investigating", "_curInvest", "_lostF","_totalI", "_otherMarker", "_needToInvest", "_addIt", "_time", "_bannedList", "_job", "_redMarkers", "_totalInvestigating"];

_group = _this;
_leader = leader _group;
_investigating = false;

_curInvest = _group getvariable ["InvestigationM", ""];
if( _curInvest != "" && !(_curInvest in NeedToInvestigate) )then//Если Investigation есть, но уже выполнено кем то! То ресет!
{//Reset
	_group setvariable ["InvestigationM", ""];
	_curInvest = "";
};

if( _curInvest == "")then
{//ПОПРОБУЕМ НАЗНАЧИТЬ ЗАДАЧУ
	_totalI = count NeedToInvestigate;
	if(_totalI > 0)then
	{					
		//пытаемся найти точки те, которые другие полицейские патрули не используют для себя
		_needToInvest = [];
		_redMarkers = [];
		_bannedList = _group getVariable ["InvestigationBlackList",[]];
		{
			if(_x == "")then
			{//FIX
				//hint format ["fnc_p_InvestigationManager: NeedToInvestigate removed empty! '' _x =  %1", _x];
				NeedToInvestigate  = NeedToInvestigate - [""];
			}
			else
			{
				if( !(_x in _bannedList) )then
				{
					_curInvest = _x;	
					_addIt = true;					
					{
						if(_addIt)then
						{
							_otherMarker = _x getvariable ["InvestigationM", ""];
							
							if(_curInvest == _otherMarker)then
							{
								_addIt = false;
								if(getMarkerColor _otherMarker == "ColorRed")then
								{
									if( !(_otherMarker in _redMarkers) )then{_redMarkers = _redMarkers + [_otherMarker]; };								
								}; 
							};
							
						};						
					}foreach PoliceGroups;
					if(_addIt)then{_needToInvest = _needToInvest + [_curInvest]};
					
					//player groupchat format ["_curInvest = %1 _redMarkers = %2 _needToInvest = %3",_curInvest, _redMarkers, _needToInvest];
				};
			};
		}foreach NeedToInvestigate;
				
		//Ищем важные (RED) investigation, которые нужно investigate
		{			
			if(vehicle _leader distance getMarkerPos _x < 1500)then
			{//добавить, так как близко
				_needToInvest = _needToInvest + [_x];
			}
			else
			{ 
				_totalInvestigating = 0;
				_curInvest = _x;
				{
					_otherMarker = _x getvariable ["InvestigationM", ""];
					if(_otherMarker == _curInvest)then
					{
						_totalInvestigating = _totalInvestigating + (count units _x);
					};				
				}foreach PoliceGroups;
				
				if(_totalInvestigating < 10)then
				{//добавить, так как мало или никто не заниммется данным расследованием
					_needToInvest = _needToInvest + [_curInvest];
				};
			};						
		}foreach _redMarkers;
				
		//массив с важными маркерами, им первыми нужно заняться!
		_redMarkers = [];//сбрасываем, чтобы здесь хранить важные маркера
		{
			if(getMarkerColor _x == "ColorRed")then
			{
				_redMarkers = _redMarkers + [_x]							
			};		
		}foreach _needToInvest;
		if(count _redMarkers > 0)then{_needToInvest = _redMarkers;};//если нет важных, то берем обычные
		
		//hintc format ["_curInvest = %1 _redMarkers = %2 _needToInvest = %3",_curInvest, _redMarkers, _needToInvest];
		
		//FNALE ВЫБИРАЕМ МАРКЕР!		
		if(count _needToInvest > 0 )then
		{
			_curInvest = [_leader, _needToInvest] call fnc_GetClosestInvestigation;
			_group setvariable ["InvestigationM", _curInvest];
			
			//Lost formation RESET
			_lostF = _group getVariable ["LostFormation", false];
			if(_lostF)then{_group call fnc_LostFormation;};			
			_group setVariable["TimeToFailTask", GROUP_STUCK_TIMER];//РЕСЕТ ТАЙМЕРА STUCK
			
			_group call fnc_RemoveAllWaypoints;
			[_group, (getMarkerPos _curInvest)] call fnc_createWaypoint;
			//player sidechat format ["fnc_p_InvestigationManager: GROUP: %1, CHOSEN INVESTIGATION: %2",name leader _group, _curInvest];
			//hint format ["%1",_needToInvest];
			_group setvariable ["InvestWait", 30];
			_investigating = true;
		};		
	};
}
else
{//ПРОВЕРЯЕМ ДОЕХАЛИ ЛИ
	//hintc "fnc_p_InvestigationManager ПРОВЕРЯЕМ ДОЕХАЛИ ЛИ";
	if(vehicle _leader distance getMarkerPos _curInvest < 30 )then
	{//Если достигли цели	
		if(getMarkerColor _curInvest == "ColorRed")then
		{
			_time = _group getvariable "InvestWait";
			if(_time > 0)then
			{//ждем на точке		
				if(_time == 30)then
				{//нужно создать Waypoint Search and Destroy			
					_group call fnc_RemoveAllWaypoints;
					_waypoint = _group addwaypoint[getMarkerPos _curInvest,0];
					while {(count (waypoints _group)) == 0} do
					{
						_waypoint = _group addwaypoint[getMarkerPos _curInvest,0];
					};
					_waypoint setWaypointType "SAD";
					//_leader spawn fnc_AllGetOut;					
					{
						if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
						{
							[_x] allowGetIn false; 
						};
					}foreach units _group;
										
					_lostF = _group getVariable ["LostFormation", false];
					if(!_lostF)then{_group setVariable ["LostFormation", true]};
				};							
				_investigating = true;
				_time = _time - 5;
				_group setvariable ["InvestWait", _time];
				[_group, false] call fnc_removeClosestInvestigation;//удаляем обычные
				//player groupchat format ["fnc_p_InvestigationManager: GROUP: %1, _time: %2",name leader _group, _time];							
			}
			else
			{//RESET				
				//WIP DEL RED CLOSE AND CURRENT INVEST
				[_group, true] call fnc_removeClosestInvestigation;
				if(_curInvest in NeedToInvestigate)then
				{
					NeedToInvestigate = NeedToInvestigate - [_curInvest];
					deleteMarker _curInvest;
				};			
				_group setvariable ["InvestigationM", ""];
				//player groupchat format ["fnc_p_InvestigationManager: GROUP: %1, TIME RESET!",name leader _group];
				//_investigating = _group call fnc_p_InvestigationManager;//РЕКУРСИЯ!
			};				
		}
		else
		{//Удаляем обычное Investigation
			[_group, false] call fnc_removeClosestInvestigation;
			//_investigating = _group call fnc_p_InvestigationManager;//РЕКУРСИЯ!
		};	
		_investigating = true;
	}
	else
	{//если еще в пути
		_stuck = _group call fnc_CheckMovementIfStuck;
		if(_stuck)then
		{//Если застрял, то пробуем исправить	
			_banned = _group call fnc_UnstuckHelper;
			if(_banned)then
			{//ЗАБАНЕНА ЦЕЛЬ, ИЩЕМ СЛЕДУЮЩУЮ
				_investigating = _group call fnc_p_InvestigationManager;//РЕКУРСИЯ!
			}
			else
			{//fnc_UnstuckHelper чем то помог! Продолжаем задание!
				_investigating = true;
			};
		}
		else
		{
			_investigating = true;
		};
	};
};

if(_investigating)then
{
	_job = _group getVariable ["WhatGroupIsDoing", ""];
	if(_job != "Investigate")then
	{//RESET
		_group setVariable ["WhatGroupIsDoing", "Investigate"];
		_lostF = _group getVariable ["LostFormation", false];
		if(_lostF)then{_group call fnc_LostFormation;};
	};
};

_investigating;