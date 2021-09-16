//func_dead_WEST.sqf
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer","_friends","_PoliceBonusScore"];
_SUBJECT = _this select 0;
_SIDE = _this select 1;
_killer = _this select 2;
//hint format ["side:%1", (side _SUBJECT)];

[_SUBJECT, _killer, "WEST"] call func_dead_WhoKilledYOU;

Array_CopsSide = Array_CopsSide - [_SUBJECT];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array + [_SUBJECT getVariable "MyMarkerName"];
Count_KilledCops = Count_KilledCops + 1;
Count_TOTAL_DEAD_BODIES = Count_TOTAL_DEAD_BODIES + 1;

_SUBJECT removeAllEventHandlers "killed";
_SUBJECT removeAllEventHandlers "HandleDamage";
_SUBJECT removeAllEventHandlers "fired";

(_SUBJECT getvariable "ImChasing") call func_MakeWantedFriendsAfterMurder;
if(SHOWTMessageLVL2)then{player sidechat format ["|---REMOVED FROM Array_CopsSide: %1", _SUBJECT];};// MESSAGE LVL2		
{				
	_x setVariable ["PoliceChaseInProgress",(_x getvariable "PoliceChaseInProgress") - 1,true];
	_x setVariable ["WhoIsChasingMe",(_x getvariable "WhoIsChasingMe") - [_SUBJECT],true];
	//if(SHOWTMessageLVL2)then{player globalchat format ["|---%2 REMOVED FROM PoliceChaseInProgress of %1 ", _SUBJECT, _x];};// MESSAGE LVL2	
	if(count (_x getvariable "WhoIsChasingMe") < 1)then{[(_x),(position _x),false] call func_CreateInvestigation; };
	
}
foreach (_SUBJECT getvariable "ImChasing");


(_SUBJECT getVariable "MyMarkerName") SETMARKERPOS GETPOS _SUBJECT;
(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_DeadBody";

_PoliceBonusScore = (_SUBJECT getVariable ["Police_RiskLevel_BonusScore",0]); //WANTED LEVEL: POLICE GLOBAL RISK LEVEL UP
POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + _PoliceBonusScore; //WANTED LEVEL: POLICE AVAILABLE SCORE UP

if(side _killer != West)then
{
	POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + _PoliceBonusScore; //WANTED LEVEL: POLICE GLOBAL RISK LEVEL UP

	if(_SUBJECT !=_killer)then
	{
		//hintc format ["NOT himself %1", _killer];
		_killer setVariable ["Morale",(_killer getVariable "Morale") + 25,true];
		_friends =  (units group _killer);
		{
			_morale = (_x getVariable "Morale") + 20;
			_x setVariable ["Morale",_morale,true];
		}foreach _friends;
		
		
		_killer setVariable ["WantedFor",(_killer getVariable "WantedFor") + ["Cop murder"],true];
		
		if(count (_killer getvariable "WhoIsChasingMe") < 1)then
		{
			[(_killer),(position _killer),true] call func_CreateInvestigation; 
			[_SUBJECT,(position _SUBJECT),false] call func_CreateInvestigation; 
			_killer setVariable ["Dangerous",true,true]; 
			(_x getVariable "MyMarkerName") setMarkerColor "ColorRed";
						
			group _SUBJECT reveal _killer;//---2020 добавлено по причине: один чел незаметно убивал копов с леса, а его так никто и не замечает!
			
		}
		else
		{
			_killer spawn func_CopSaysOFFICERDOWN; 
		};
	};
}
else
{
	Count_FriendlyFireCops = Count_FriendlyFireCops + 1;
};
