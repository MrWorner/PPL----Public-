//func_BWSCAN.sqf
private["_BW","_x"];

//knowsAbout 0.2
//getvariable "ImChasing"
//distance _x < 450
//Eye contact

//- getvariable "BW_WantedFor"
//- currentWeapon secondaryWeapon  | NOT A CAR



if(SHOWTMessageLVL2)then{player globalchat format ["|---BW SCAN: STARTED!", player];};// MESSAGE LVL2

while{ENABLE_BW_AI}do
{
sleep 0.1;
	{
		if(RESISTANCE knowsAbout (vehicle _x) > 0.1)then
		{
		_susp = _x;
			{	
				//_BW = _x;
				if((_x knowsAbout (vehicle _susp) > 0.1))then
				{

					if!(_susp in (_x getvariable "ImChasing"))then
					{
						if(_x distance _susp < 450)then
						{								
							//Way N1 WANTED
							if(count(_susp getvariable "BW_WantedFor") > 0)then
							{
							
								
								_x setVariable ["ImChasing",(_x getvariable "ImChasing") + [_susp],true];
								_susp setVariable ["BW_WhoIsChasingMe",(_susp getvariable "BW_WhoIsChasingMe") + [_x],true];//NEW
								_susp setVariable ["BW_ChaseInProgress",(_susp getvariable "BW_ChaseInProgress") + 1,true];			
								if!(_susp in Array_BW_SuspectsInChase)then{Array_BW_SuspectsInChase = Array_BW_SuspectsInChase + [_susp]};
								//if(SHOWTMessageLVL3)then{player globalchat format ["|---BW SCAN: %2 WANTED, GO GO %1!", _x, _susp];};// MESSAGE LVL3
							
							}
							else
							{
								
								if(_susp call fnc_CheckArmed)then
								{
									//Way N2 ILLEGAL WEAPONS ARE VISIBLE
									if(vehicle _susp isKindOf "Man")then
									{
										_x setVariable ["ImChasing",(_x getvariable "ImChasing") + [_susp],true];
										_susp setVariable ["BW_ChaseInProgress",(_susp getvariable "BW_ChaseInProgress") + 1,true];	
										_susp setVariable ["BW_WhoIsChasingMe",(_susp getvariable "BW_WhoIsChasingMe") + [_x],true];//NEW
										_susp setVariable ["BW_WantedFor", (_susp getvariable "BW_WantedFor") + ["Illegal firearm"],true];	
										if!(_susp in Array_BW_SuspectsInChase)then{Array_BW_SuspectsInChase = Array_BW_SuspectsInChase + [_susp]};											
										//if(SHOWTMessageLVL3)then{player globalchat format ["|---BW SCAN: %2 HAS GUNS, GO GO %1!", _x, _susp];};// MESSAGE LVL3
									}
								}	
								else
								{
									if((_susp getVariable "Tresspassing_Red"))then
									{
										if(!(lineIntersects [eyePos vehicle _x, eyePos vehicle _susp, vehicle _x, vehicle _susp]))then
										{
											if(!(terrainIntersectASL  [eyePos vehicle _x, eyePos vehicle _susp]))then
											{
												_x setVariable ["ImChasing",(_x getvariable "ImChasing") + [_susp],true];
												_susp setVariable ["BW_ChaseInProgress",(_susp getvariable "BW_ChaseInProgress") + 1,true];	
												_susp setVariable ["BW_WhoIsChasingMe",(_susp getvariable "BW_WhoIsChasingMe") + [_x],true];//NEW
												_susp setVariable ["BW_WantedFor", (_susp getvariable "BW_WantedFor") + ["Tresspassing"],true];	
												if!(_susp in Array_BW_SuspectsInChase)then{Array_BW_SuspectsInChase = Array_BW_SuspectsInChase + [_susp]};
											}
										}	
									}
									else
									{
										if((_susp getVariable "Tresspassing_Yellow"))then
										{		
											if(!(lineIntersects [eyePos vehicle _x, eyePos vehicle _susp, vehicle _x, vehicle _susp]))then
											{
												if(!(terrainIntersectASL  [eyePos vehicle _x, eyePos vehicle _susp]))then
												{
													if(!(_susp getVariable "Tresspassing_Compromised")and!(_x getVariable "Tresspassing_GuardMan_1")and!(_x getVariable "Tresspassing_GuardMan_2")and(count(_x getvariable "ImChasing") == 0))then
													{
														_x setVariable ["Tresspassing_GuardMan_1",true,true];
														_susp setVariable ["Tresspassing_Compromised",true,true];
														[_x,_susp] spawn FUNC_LeaveTheArea;
													};
												}
											}
										};
									};
								}			
							}	
						}
					}
				}
			}
			foreach Array_BlackWater
		}
	}
	foreach Array_SuspectSide;
}
hintc "!!!POLCIE SCAN DISABLED!!!";