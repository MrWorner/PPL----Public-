//func_Global_Arrest.sqf
private["_Susp","_this","_ManIsMoving","_Timer","_LongTimeTimer","_SuspOrderedToMove","_dangerous","_Man"];
_Timer = 0;
_LongTimeTimer = 0;
_SuspOrderedToMove = false;
_Man = ObjNull;
_Susp = _this select 0;
_dangerous = _this select 1;
_ManIsMoving = false;

if(isnull _Susp)exitwith{ };
//_Susp setCaptive true;
sleep 2;
if!(alive _Susp)exitwith{};

while
{
	((_Susp getvariable "Stunned")or(_Susp getvariable "GivingUp"))and
	(alive _Susp)and
	!(_Susp getVAriable "Arrested")and
	((count (_Susp getVAriable "WhoIsChasingMe")> 0)or
	(count (_Susp getVAriable "BW_WhoIsChasingMe")> 0))
}
do
{
	//player sidechat format ["func_Global_Arrest| PHASE 1 _Man = %1",_Man];
	if(vehicle _Susp isKindOf "Man")then{_Man = _Susp call func_Global_Arrest_step2;}else{if(speed (vehicle _susp) < 15 )then{_susp action ["getOut", vehicle _susp];};};
					
	if!(isNull _Man)then
	{
		_Timer = 0;
		_Man setVariable ["ImGoingToArrest",true,true]; 
		_Man setVariable ["ImGoingToArrestPERSON",_Susp,true];
		_Susp setVariable ["SomeoneIsGoingToArrestMe",_Man,true];
		[_Man] allowGetIn false;
		_Susp setVariable ["InFighting",false,true];
		//player sidechat format ["func_Global_Arrest| PHASE 2 SETTING UP = %1",_Man];
		
		//ADDED IF NO IN FIGHTING COP in WHILE! (EXPERIMENTAL)
		while{(alive _Man)and(alive _Susp)and((_Susp getvariable "Stunned")or(_Susp getvariable "GivingUp"))and!(_Susp getvariable "Arrested")and!(_Man getVAriable "InFighting")}do
			{
				if!(vehicle _Susp isKindOf "Man")then{if(speed (vehicle _susp) < 15 )then{_susp action ["getOut", vehicle _susp];};};
				if((_Man distance _Susp < 5 ))then 
				{
					[_Susp, _Man] spawn func_Global_Arrest_Finalstep3;	
				}
				else
				{
					if!(_Man getvariable "inDanger")then
					{
						//player sidechat format ["func_Global_Arrest|PHASE 3 MOVING TO ARREST = %1",_Man];
						if!(_ManIsMoving)then
						{
							_Man domove getPosATL _Susp;
							_ManIsMoving = true;
						}
						else
						{
							_ManIsMoving = false;
						};					
					
					
						if(vehicle _Man isKindOf "Man")then
						{
							_Timer = _Timer + 2; //4
							//player sidechat format  ["_Timer + 2; = %1", _Timer];
							if(speed _Man < 2)then{ _Timer = _Timer + 4;}; //player sidechat format  ["_Timer + 4; = %1", _Timer]; 
						}
						else
						{
							[_Man] allowGetIn false;
						};
						
						if((_Timer > 25)and(_Susp getvariable "GivingUp")and!(_Susp getvariable "Stunned"))then
						{
							if!(_Susp getvariable "Stunned")then{_LongTimeTimer = _LongTimeTimer + 1;};
							//player sidechat format  ["_LongTimeTimer + 4; = %1", _LongTimeTimer];
							if(_LongTimeTimer < 2)then
							{
								_Man enableAI "MOVE";
								//_Man enableAI "ANIM";
								_Man setVariable ["ImGoingToArrest",false,true];
								_Man setVariable ["ImGoingToArrestPERSON",ObjNull,true];
								//if(count (_Man getvariable "ImChasing") == 0)then{[_Man] allowGetIn true;};// <----- NOT NEEDED?	
								_Man setVariable ["InFighting",false,true];	// <----- NOT NEEDED?			
								//(group _Man) setVariable ["LostFormation",true,true];
								_Man = ObjNull;	
								_Timer = 0;
							}
							else
							{
								//if!(vehicle _Susp isKindOf "Man")then{ [_Susp] allowGetIn false; sleep 1;}; //_Susp action ["getOut", vehicle _Susp];
								if!(vehicle _Susp isKindOf "Man")then{ _Susp action ["getOut", vehicle _Susp]; hintc "func_Global_Arrest.sqf GET OUT!" ;sleep 1;}; //
								_LongTimeTimer = 0;
								_Timer = 0;//(-8);
								_Susp globalchat format ["SUSPECT %1 is moving closer to the police! %2",name _Susp,name _Man];			
								_Susp enableAI "MOVE";
								//_Susp enableAI "ANIM";
								_Susp enableAI "FSM";
								_Susp domove getpos _Man;
								if((_SuspOrderedToMove)and(_Susp distance _Man < 50))then
								{
									hint "CAN'T ARREST, suspect auto arrested!!!";
									_Susp setpos getpos _Man;
									//------COPY PAST
									[_Susp, _Man] spawn func_Global_Arrest_Finalstep3;	
									//------COPY PAST END			
								}
								else
								{
									_SuspOrderedToMove = true;
								};
								
							};
								
						};
					}
					else
					{
						_Timer = 0;
						_Man enableAI "MOVE";
						_Man setVariable ["ImGoingToArrest",false,true]; 
						_Man setVariable ["ImGoingToArrestPERSON",ObjNull,true];
						_Susp setVariable ["SomeoneIsGoingToArrestMe",ObjNull,true];
						//[_Man] allowGetIn false;			
						(group _Man) setVariable ["LostFormation",true,true];// <----- NOT NEEDED?
					
					};
				};
				sleep 2;
			};	
			
			if(alive _Man)then
			{
				_Man enableAI "MOVE";
				//_Man enableAI "ANIM";
				_Man setVariable ["ImGoingToArrest",false,true];
				_Man setVariable ["ImGoingToArrestPERSON",ObjNull,true];
				_Man setVariable ["InFighting",false,true];	
				[_Man] allowGetIn true;	
				//(if(count (_Man getvariable "ImChasing") == 0)then{[_Man] allowGetIn true;};// <----- NOT NEEDED?	
				(group _Man) setVariable ["LostFormation",true,true];// <----- NOT NEEDED?
			};
		
	};

	
	sleep 1;
};

if!(alive _Susp)exitwith{};

if!(_Susp getVAriable "Arrested")then
{
		//hintc format ["Why not surrendering?: Stunned %1 | GivingUp %2 | alive %3 | Arrested %4 | count WhoIsChasingMe %5",(_Susp getvariable "Stunned") ,(_Susp getvariable "GivingUp"),(alive _Susp),(_Susp getVAriable "Arrested"), (count (_Susp getVAriable "WhoIsChasingMe"))];
		
		_Susp enableAI "MOVE";
		_Susp enableAI "FSM";
		_susp setUnitPos "AUTO";
		_Susp enableAI "ANIM";
		_Susp setVariable ["GivingUp",false,true];
		_Susp setVariable ["OutOfControl",true,true];
		_Susp setVariable ["Morale",(round (random 100)),true];
		_Susp globalchat format ["SUSPECT is not surrendering anymore! %1",name _Susp];
		_susp setVariable ["InFighting",false,true];
		if(_dangerous)then{_susp setVariable ["Dangerous",true,true];};
};