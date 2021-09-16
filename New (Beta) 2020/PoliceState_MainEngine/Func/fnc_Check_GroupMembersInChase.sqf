//fnc_Check_GroupMembersInChase.sqf 2020
private["_IN_CHASE","_x", "_totalChasing", "_totalWaiting", "_closestSusp", "_job"];

_group = _this;
_IN_CHASE = false;
_totalChasing = 0;
_totalWaiting = 0;

{
	if(count (_x getvariable ["ImChasing", []]) == 0)then
	{
		_totalWaiting = _totalWaiting + 1;
	}
	else
	{
		_totalChasing = _totalChasing + 1;
	};

}foreach units _group;


if(_totalChasing > 0)then
{
	_IN_CHASE = true;
};

///FIX ПРОВЕРЯЕМ ЧТО В ГРУППЕ НЕТ ТЕХ КТО НЕ ПРЕСЛЕДУЕТ НИКОГО, А ОСТАЛЬНЫЕ В ПОГОНЕ!
if(_IN_CHASE)then
{

	_job = _group getVariable ["WhatGroupIsDoing", ""];
	if(_job != "Chase")then
	{
		_group setVariable ["WhatGroupIsDoing", "Chase"];
		_group setvariable ["PatrolMarker", ""];
		_group setvariable ["InvestigationM", ""];
	};

	//player sidechat format ["_totalChasing = %1, _totalWaiting = %2", _totalChasing, _totalWaiting];
	if(_totalWaiting != 0)then
	{	
		{
			//hintc format ["%1",(_x getvariable "ImChasing")];
			//НАХОДИМ ТОГО КТО НЕ ПРЕСЛЕДУЕТ И ЗАСТАВЛЯЕМ ЕГО ПРЕСЛЕДОВАТЬ САМОГО БЛИЗЖАЙЩЕГО!
			if(count (_x getvariable "ImChasing") == 0)then
			{
				if( (vehicle _x isKindOf "Man") || ( !(vehicle _x isKindOf "Man") && (_x == driver vehicle _x )) )then//ДОЛЖЕН БЫТЬ ПЕШИМ ЛИБО ВОДИТЕЛЕМ!
				{
					_closestSusp = _x call fnc_GetClosestSuspInChaseForMember;
					if((vehicle _x isKindOf "Man") )then{dostop _x;};//2020 Необходимый фикс для пешего, который не преследует никого
					[_x, _closestSusp] call fnc_DoMove;
					//Player globalchat format ["fnc_Check_GroupMembersInChase = FOUND IDLE COP %1. MOVING TO CLOSEST SUSP %2", _x, name _closestSusp];
					//hintc format ["fnc_Check_GroupMembersInChase = FOUND IDLE COP %1. MOVING TO CLOSEST SUSP %2", _x, name _closestSusp];
				};				
			};
		}foreach units _group;
	};
};
///FIX ПРОВЕРЯЕМ ЧТО В ГРУППЕ НЕТ ТЕХ КТО НЕ ПРЕСЛЕДУЕТ НИКОГО, А ОСТАЛЬНЫЕ В ПОГОНЕ!

_IN_CHASE;