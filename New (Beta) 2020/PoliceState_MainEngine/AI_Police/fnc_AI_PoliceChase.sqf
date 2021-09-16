//fnc_AI_PoliceChase.sqf 2020
private["_cop", "_stop","_noControl", "_dist"];
if(SHOWTMessageLVL2)then{player globalchat format ["|---POLICE CHASE: STARTED!", player];};// MESSAGE LVL2

while{ENABLE_cop_AI}do
{
	sleep 1;//1
	{//foreach Array_copsSide;
		if(count (_x getvariable "ImChasing") > 0)then	
		{
			_cop = _x;
			// player sidechat format ["ImChasing= %1",(_cop getvariable "ImChasing") select 0];	
			{//foreach (_cop getvariable "ImChasing");		
				if(alive _x)then
				{					
					//----------------------------------------------------------------									
					if ( _x == ((_cop getvariable "ImChasing") select 0) )then
					{		
						if(!(_cop getvariable "inDanger"))then
						{
							_noControl = _x getvariable "OutOfControl";
							_dist = vehicle _cop distance vehicle _x;
							if(!(_cop getvariable "ImGoingToArrest"))then								
							{
								if(vehicle _cop isKindOf "Man")then
								{																							
									_stop = false;
									if(_dist < 35 )then
									{
										if(vehicle _x isKindOf "Man")then
										{//если подозреваемый - пеший															
											if(!_noControl)then//NEW если враг OutOfControl, то коп должен идти силой на него	
											{	
												if(!(_x getVariable "GivingUp"))then
												{
													if(!(_x getVariable "Stunned"))then
													{
														if(speed (vehicle _x) <= 5)then//NEW чтобы когда бежал ПЕШИЙ ОТ КОПОВ, копы тоже бежали	в погоню сразу
														{													
															if([_cop, _x] call fnc_CanSeeTarget)then
															{											
																_stop = true;									
															}												
														}
													}
												}
											}																						
										}
										else
										{//если подозреваемый в машине
											if([_cop, _x] call fnc_CanSeeTarget)then
											{											
												_stop = true;									
											}	
										}
									};
												
									if(_stop)then
									{																												
										if(currentWeapon _cop in LESS_LETHAL_ARSENAL)then
										{
											[_cop, _x] call func_FireLessLethal;//WIP										
										}
										else
										{	
											[_cop] allowGetIn false;//FIX 2020 иначе иногда может пойти тупо залезть в машину, ИГНОРИРУЕТ DOSTOP!!!										
											dostop _cop;							
										}																																																												
									}
									else
									{//NEED TO MOVE
										if(_dist < 3.5)then//ЕСЛИ СЛИШКОМ БЛИЗКО ПОДОЗРЕВАЕМЫЙ К КОПУ, ЧТОБЫ НЕ БЕЖАТЬ НА МЕСТЕ
										{
											[_cop] allowGetIn false;//FIX 2020 иначе иногда может пойти тупо залезть в машину, ИГНОРИРУЕТ DOSTOP!!!
											dostop _cop;
										}
										else
										{
											[_cop,_x] call fnc_DoMove;
										}							
									};	

								}//!(vehicle _cop isKindOf "Man")																						
								else
								{//COP IN A VEHICLE	
									if(_cop != gunner (vehicle _cop))then
									{
										if(_cop != commander (vehicle _cop))then
										{
								
											if(vehicle _x isKindOf "Man")then
											{									
												if(_dist < (_cop call fnc_Calculacte_dist_to_GetOut) )then
												{																														
													if(speed (vehicle _cop) < 20)then
													{											
														_cop spawn fnc_AllGetOut;//Exit from vehicle to surround the suspect!	
													}
													else
													{
														if(driver vehicle _cop == _cop)then
														{
															dostop vehicle _cop;
														}
													}
												}
												else
												{
													if(driver vehicle _cop == _cop )then
													{
														[_cop,_x] call fnc_DoMove;//spawn
													}
												};									
											}
											else
											{//	!vehicle _x isKindOf "Man"																			
												
												if(_dist < (_cop call fnc_Calculacte_dist_to_GetOut))then
												{
													if( (speed (vehicle _x) < 10)and(speed (vehicle _x) > (-10)) and (speed (vehicle _cop) < 10))then
													{											
														_cop spawn fnc_AllGetOut;//Exit from vehicle to surround the suspect!
														
													};
												}
												else
												{
													if(driver vehicle _cop == _cop)then
													{
														
														[_cop,_x] call fnc_DoMove;
													};
												}																					
											}																																																			
										}//!commander																																																		
									}//!gunner																																																		
								}//!(vehicle _cop isKindOf "Man")
							};//!(_cop getvariable "ImGoingToArrest")
							
							if!(_noControl)then
							{
								_x call fnc_police_OutOfControlManager;
							};
							
							if(_dist < 220)then
							{
								//if!(_cop getvariable "inDanger")then 
								//{
									//[_cop, _x] spawn fnc_PoliceSpeak; //CALL
									[_cop, _x] call fnc_PoliceSpeak; //CALL
								//};
							}
														
						}//!(_cop getvariable "inDanger")		
																
					};// _x == ((_cop getvariable "ImChasing") select 0) 
					//---------------------------------------   -------------------------						
				}
				else
				{//(!alive _x)
					_cop setVariable ["ImChasing",(_cop getvariable "ImChasing") - [_x],true];												
				};
							
				[_cop, _x] call func_CheckChaseStatus;
			}foreach (_cop getvariable "ImChasing");
		}//count (_x getvariable "ImChasing") > 0
	}foreach Array_copsSide;
};
