//func_MainMedicCycleCheck.sqf
private["_MedicLeader","_x","_group","_MarkerName","_randomMarker", "_waypoint"];
// Corps + Calls = BUSY
// Nothing to do + Park vehicle on parking lot of Hospital = NO WORK

if(SHOWTMessageLVL2)then{player globalchat format ["|---func_MainMedicCycleCheck: LOADED!", player];};// MESSAGE LVL2
sleep 5;

while{ENABLE_Medic_AI}do
{
//player sidechat format ["MedicGroups=%1",MedicGroups];

	{
		_MedicLeader = leader _x;	
		if!(isnull _MedicLeader)then		
		{	
		//MAIN
			if(alive _MedicLeader)then	
			{	
				
			
				if(_x getvariable "CurrentJob" != "MoveToHeal")then
				{
					//player globalchat format [" Count_TOTAL_DEAD_BODIES = %1", Count_TOTAL_DEAD_BODIES];
					if( (Count_TOTAL_DEAD_BODIES > Medic_TOTAL_WorkDoneCount)  )then		//and (count _x getvariable "CurrentDeadBodies" == 0)
					{//GO TO REMOVE CORPS
						
						_x call func_p_MovingToRemoveCorpses;
						_x setVariable ["WhatGroupIsDoing","func_p_MovingToRemoveCorpses",true];
					}
					else
					{// GO BACK TO HOSPITAL OR CHECK STATUS OF CURRENT MISSION			
						if(_x getvariable "WhatGroupIsDoing" != "func_BackToHospital")then{_x call func_BackToHospital; _x setVariable ["WhatGroupIsDoing","func_BackToHospital",true];};					
					};
				};
				//else
				//{//MoveToHeal
					
				//	_x setVariable ["WhatGroupIsDoing","???????????????",true];
				//	_x setVariable ["WhatGroupIsDoing","MoveToHeal",true];
				//};
				
				
				
				
				
				
				
				
			};				
		//MAIN END
		}
		else
		{
			MedicGroups = MedicGroups - [_x];
			MedicDeadGroups = MedicDeadGroups + [_x];

		};
		_x call FUNC_siren_step2_activationG;
	}
	foreach MedicGroups;
	
sleep 5;
};