//FUNC_LeaveTheArea.sqf

private["_SUBJECT", "_Enemy","_condition","_SecondMan"];

_SUBJECT = _this select 0;
_Enemy = _this select 1;
_SecondMan = ObjNull;
_condition = 0;
_SUBJECT dowatch vehicle _Enemy;
_SUBJECT domove getpos vehicle _Enemy;

while {(alive _SUBJECT)and(alive _Enemy)and(_Enemy getVariable "Tresspassing_Yellow")and(count(_SUBJECT getvariable "ImChasing") == 0)} do 
{

	switch (_condition) do {
		case 0: 
		{ 
			[_SUBJECT,"PleaseLeave"] call func_BlackWaterSAY;
			
			_SUBJECT LookAt position vehicle _Enemy;
		};
		case 1: 
		{ 
			[_SUBJECT,"PleaseLeave2"] call func_BlackWaterSAY;
			_SUBJECT LookAt position vehicle _Enemy;
		};
		case 2: 
		{ 
			[_SUBJECT,"PleaseLeave3"] call func_BlackWaterSAY;
			_SUBJECT LookAt position vehicle _Enemy;
			_SecondMan = _Enemy call FUNC_BWSecondMan;
			if!(isnull _SecondMan)then
			{
				_SecondMan domove getpos vehicle _Enemy;
				_SecondMan LookAt position vehicle _Enemy;
				_SecondMan dowatch vehicle _Enemy;
			};
			
		};
		case 3: 
		{ 
			_SUBJECT LookAt position vehicle _Enemy;
			if!(isnull _SecondMan)then
			{			
				[_SecondMan,"PleaseLeaveSecond"] call func_BlackWaterSAY;
				_SecondMan LookAt position vehicle _Enemy;
				_SecondMan dowatch vehicle _Enemy;
				_SecondMan domove getPos vehicle _Enemy;
			};										
		};
		case 4: 
		{ 
			if!(isnull _SecondMan)then
			{
				_SecondMan LookAt position vehicle _Enemy;
			};
			_SUBJECT LookAt position vehicle _Enemy;
			_Enemy setVariable ["BW_WantedFor", (_Enemy getvariable "BW_WantedFor") + ["Tresspassing"],true];
		};
		default 
		{ 
		hintc "FUNC_LeaveTheArea: ERROR CASE"; 
		};
	};
	_condition = _condition + 1;
	sleep (5 + random(5));
};

_SUBJECT setVariable ["Tresspassing_GuardMan_1",false,true];
if!(isnull _SecondMan)then{_SecondMan setVariable ["Tresspassing_GuardMan_2",false,true];};
_Enemy setVariable ["Tresspassing_Compromised",false,true];


if(count (_Enemy getVariable "BW_WantedFor") < 1 and (_Enemy getVariable "Tresspassing_Yellow") and _condition > 2)then{_Enemy setVariable ["BW_WantedFor", (_Enemy getvariable "BW_WantedFor") + ["Tresspassing"],true];};