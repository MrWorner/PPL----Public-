//fnc_AI_PoliceSCAN.sqf
private["_susp", "_origin"];

//knowsAbout 0.2
//getvariable "ImChasing"
//distance _susp < 450
//Eye contact

//- getvariable "WantedFor"
//- currentWeapon secondaryWeapon  | NOT A CAR

if(SHOWTMessageLVL2)then{player globalchat "|---fnc_AI_PoliceSCAN: STARTED!"};// MESSAGE LVL2

while{ENABLE_COP_AI}do
{
	sleep 0.1;
	{	
		if(WEST knowsAbout (vehicle _x) > 0.1)then
		{
			_susp = _x;
			{
				//_COP = _x;
				if(_x knowsAbout (vehicle _susp) > 0.1)then
				{
						
					if!(_susp in (_x getvariable "ImChasing"))then
					{						
						if(_x distance _susp < 450)then//450
						{
							//if(!(lineIntersects [eyePos vehicle _x, eyePos vehicle _susp, vehicle _x, vehicle _susp])and!(terrainIntersectASL  [eyePos vehicle _x, eyePos vehicle _susp]))then
							//{				
								//Way N1 WANTED
								if(count(_susp getvariable "WantedFor") > 0)then
								{		
									[_x,_susp] call fnc_p_setChase;
									//----------[_x, 3] call FUNC_siren_step2_activation;
									//if(SHOWTMessageLVL3)then{player globalchat format ["|---POLICE SCAN: %2 WANTED, GO GO %1!", _x, _susp];};// MESSAGE LVL3
								
								}
								else
								{									
									if(vehicle _susp isKindOf "Man")then
									{
										//Way N2 ILLEGAL WEAPONS ARE VISIBLE
							
										if(_susp call fnc_CheckArmed)then
										{	
											//player sidechat "susp is armed!";
											if([_x, _susp] call fnc_CanSeeTarget)then //2020
											{	
												[_x,_susp] call fnc_p_setChase;
												_susp setVariable ["WantedFor", (_susp getvariable "WantedFor") + ["Illegal firearm"],true];		
												//----------[_x, 3] call FUNC_siren_step2_activation;											
												//if(SHOWTMessageLVL3)then{player globalchat format ["|---POLICE SCAN: %2 HAS GUNS, GO GO %1!", _x, _susp];};// MESSAGE LVL3
											}												
										}
									}				
								}
						//  }
						}
					}
				};									
				if( !(group _x in PoliceGroups) )then
				{
					//player setpos getpos vehicle _x;
					_origin = _x getVariable "origin";					
					//hintc format ["Current unit _x = %1 NOT IN PoliceGroups! _origin = %2 current group = %3", _x, _origin, group _x];
					[_x] joinSilent _origin;
					//PoliceGroups = PoliceGroups + [group _x];
					[getpos _x, "ColorBrown"] call fnc_CreateDebugMarker;
				};
			} foreach Array_CopsSide
		}
	} foreach Array_SuspectSide;
}
hintc "!POLCIE SCAN DISABLED! PLEASE, RESTART IT MANUALLY!";