//func_MainFiremanCycleCheck.sqf
private["_FireManLeader","_x","_group","_MarkerName","_randomMarker", "_waypoint"];
// Corps + Calls = BUSY
// Nothing to do + Park vehicle on parking lot of Hospital = NO WORK

if(SHOWTMessageLVL2)then{player globalchat format ["|---func_MainFireManCycleCheck: LOADED!", player];};// MESSAGE LVL2
sleep 5;
while{ENABLE_Firefighter_AI}do
{
//player sidechat format ["FireManGroups=%1",FireManGroups];
	{
		_FireManLeader = leader _x;	
		if!(isnull _FireManLeader)then		
		{	
		//MAIN
			if(alive _FireManLeader)then	
			{	
				
			
				if(_x getvariable "CurrentJob" != "MoveToCall")then
				{
					//player globalchat format [" Count_TOTAL_DEAD_BODIES = %1", Count_TOTAL_DEAD_BODIES];
					if( (Count_TOTAL_DESTROYED_CARS > Firefighter_TOTAL_WorkDoneCount)  )then		//and (count _x getvariable "CurrentDeadBodies" == 0)
					{//GO TO REMOVE CORPS
						
						_x call func_p_MovingToRemoveCars;
						_x setVariable ["WhatGroupIsDoing","func_p_MovingToRemoveCars",true];
					}
					else
					{// GO BACK TO FIRE STATION	
						if(_x getvariable "WhatGroupIsDoing" != "func_BackToFireStation")then
						{
							_x call func_BackToFireStation; //<------WIP
							_x setVariable ["WhatGroupIsDoing","func_BackToFireStation",true];
						};					
					};
				}
				else
				{//Move to Call
					
					_x setVariable ["WhatGroupIsDoing","???????????????",true];
				};
				
				
				
				
				
				
				
				
			};				
		//MAIN END
		}
		else
		{
			FirefighterGroups = FireManGroups - [_x];
			FirefighterDeadGroups = FirefighterDeadGroups + [_x];

		};
		_x call FUNC_siren_step2_activationG;
	}
	foreach FirefighterGroups;
	
sleep 5;
};