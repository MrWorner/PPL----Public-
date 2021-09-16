//func_BWCHASE.sqf
private["_BW","_x","_susp","_distance"];
_distance = 0;
if(SHOWTMessageLVL2)then{player globalchat format ["|---BW CHASE: STARTED!", player];};// MESSAGE LVL2

while{ENABLE_BW_AI}do
{
sleep 2.5;
	{
		if(count (_BW getvariable "ImChasing") > 0)then	
		{
			_BW = _x;
			// player sidechat format ["ImChasing= %1",(_BW getvariable "ImChasing") select 0];	
			{			
				if!(alive _x)then
				{
					//hintc "NOT ALIVE! FIXing IMCHASING in POLICE CHASE";
					_BW setVariable ["ImChasing",(_BW getvariable "ImChasing") - [_x],true];
					// hintc format ["%2 ImChasing FIXED= %1", (_BW getvariable "ImChasing"),_BW];	
				}
				else
				{
					if ( _x == ((_BW getvariable "ImChasing") select 0) )then
					{
						_distance = _BW distance _x;
						//if!(_BW getvariable "inDanger")then{_BW dotarget (vehicle _x)};
								//DISTANCE OLD= 23
						if((_distance < 35)&&(!(lineIntersects [eyePos vehicle _BW, eyePos vehicle _x, vehicle _BW, vehicle _x])and!(terrainIntersectASL  [eyePos vehicle _BW, eyePos vehicle _x])))then
						{	
							 
							//if(((!(_x getvariable "BW_OutOfControl") or!(vehicle _x isKindOf "Man")) and !(vehicle _BW isKindOf "LandVehicle")) )then 
							if((vehicle _x isKindOf "Man") and (vehicle _BW isKindOf "Man")) then //08.03.2017 v8b
							{
			
								if!(_BW getvariable "ImGoingToArrest")then
								{
								
									if((_x getVariable "GivingUp")or(_x getVariable "Stunned"))then
									{
										if( (isnull (_x getVariable "SomeoneIsGoingToArrestMe")) or ((_x getVariable "SomeoneIsGoingToArrestMe") distance 	_x > 35))then
										{
											_x setVariable ["SomeoneIsGoingToArrestMe",_BW,true];
											[_x,false] spawn func_Global_Arrest; 
											
										}
									}
									else
									{
										dostop _BW; 			
										if(!(_x getVariable "GivingUp")and!(_x getVariable "Stunned"))then  //08.03.2017 v8b
										{																								
											if(_x getvariable "BW_OutOfControl")then
											{
												if!(currentWeapon _BW in LESS_LETHAL_ARSENAL)then
												{
													[_BW,_x] call fnc_DoMove;
												};
											}
											else
											{
												dostop _BW;//hint "stop";	
											};	
											[_BW, _x] call func_FireLessLethal;
										};
									
									};
									
								}; //hintSilent "STOP1";				
							}
							else
							{//
								if!(_BW getvariable "inDanger")then
								{
									//_distance = _BW distance _x;
									if(_distance > 15)then
									{
										//(vehicle _BW) domove getPosATL (vehicle _x);
										//[_BW,_x] call fnc_DoMove;// hint "DOMOVE!"; player sidechat "DOMOVE!";
										(vehicle _BW) domove getpos (vehicle _x); //01.05.2017 EXPERIMENTAL
									}
									else
									{// 01.05.2017 EXPERIMENTAL
										if(vehicle _BW isKindOf "Man")then
										{
											dostop _BW; 
										} //hint "stop NEW 1"; player sidechat "stop NEW 1";
										else
										{
											dostop vehicle _COP; 
											if( (speed (vehicle _x) < 3)and(speed (vehicle _x) > (-3)) and (speed (vehicle _BW) < 3))then
											{
												//Exit from vehicle to surround the suspect!
												_BW call func_CrewGetOut_special;
											};
										};
									};
									
								};// TO FIX BUG WITH DISTANCE KEEPERS
							};//
												
							if(vehicle _x isKindOf "Man")then
							{
								_BW call func_CrewGetOut_special;
								//hintc "GET OUT!";
							};														
						}
						else
						{															
							//if(!(_BW getvariable "inDanger")and(_distance > 4)and!(_BW getvariable "ImGoingToArrest"))then{(vehicle _BW) domove getPosATL (vehicle _x);[_BW,_x] call fnc_DoMove;}; //SIMPLE				
							if(!(_BW getvariable "inDanger")and(_distance > 4)and!(_BW getvariable "ImGoingToArrest"))then{[_BW,_x] call fnc_DoMove;}; //EXPERIMENTAL!
						};
						if(_distance < 220)then
						{
							//if!(_BW getvariable "inDanger")then 
							//{
								[_BW, _x] spawn func_BlackWaterspeak; //CALL
							//};
						};
					};		
					[_BW, _x] call func_CheckChaseStatusBW;
					
					
					
					//FIX When lost units not with the leader, they do nothing!
					if(leader group _BW == _BW)then
					{
						_susp = _x;
						{ 
							if(count (_x getvariable "ImChasing") < 1)then
							{
							//	_x commandMove  getPos (vehicle _susp); 
							}
						
						} forEach units group _BW; 
					};
					//															
				};
			} 
			foreach (_BW getvariable "ImChasing");
		}


	}
	foreach Array_BlackWater;
};