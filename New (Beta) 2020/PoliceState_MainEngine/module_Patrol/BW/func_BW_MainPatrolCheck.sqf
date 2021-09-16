//func_BW_MainPatrolCheck.sqf
private["_BWLeader","_x","_group","_MarkerName","_randomMarker", "_waypoint"];
//_BWLeader = 0;
//_x = 0;

if(SHOWTMessageLVL2)then{player globalchat format ["|---func_BW_MainPatrolCheck: LOADED!", player];};// MESSAGE LVL2
while{ENABLE_BW_AI}do
{
//player sidechat format ["BWGroups=%1",BWGroups];
	{
		_BWLeader = leader _x;	
		if!(isnull _BWLeader)then		
		{	
		//MAIN
			if(alive _BWLeader)then	
			{	
				if(count (_BWLeader getvariable "ImChasing") == 0)then
				{
					if( (count Array_BW_SuspectsInChase  > 0) and (_x getvariable "CurrentInvestigationMarker" == "") )then
					{//SUPPORT OFFICERS IN TROUBLE
						_x call func_BW_p_BackupIsComing;
						_x setVariable ["WhatGroupIsDoing","func_BW_p_BackupIsComing",true];
					}
					else
					{
						if(count BWNeedToInvestigate > 0)then
						{//IN INVESTIGATION
							_x call func_BW_p_InvestigationInProgress;		
							_x setVariable ["WhatGroupIsDoing","func_BW_p_InvestigationInProgress",true];
								
						}
						else
						{//IN PATROL
							_x call func_BW_GivePatrolMission;
							_x setVariable ["WhatGroupIsDoing","func_BW_p_PassiveGuardian",true];
							
						};
					};
				}
				else
				{//IN CHASE
					if!(_x getVariable "LostFormation")then{_x setVariable ["LostFormation",true,true];};
					if(_x getVariable "WhatGroupIsDoing" == "InChase")then
					{
						_x setVariable ["WhatGroupIsDoing","InChase",true];
						while {(count (waypoints _x)) > 0} do
						{
							deleteWaypoint ((waypoints _x) select 0);
						};	
					};
				
					[name leader _x + format ["%1",round random 1000], getpos ((_BWLeader getvariable "ImChasing") select 0), "CHASING"] spawn func_BW_WorkMarker; 
					// if(behaviour _BWLeader == "COMBAT")then
					// {
						// _x setSpeedMode "FULL";
						// _x setFormation "VEE";
						// _x setBehaviour "AWARE";
					// };
					IF(_x getVariable "PeaceWaypointCreated")THEN{_x setVariable ["PeaceWaypointCreated",false,true];};
				};
			};				
		//MAIN END
		}
		else
		{
			BWGroups = BWGroups - [_x];
			BWDeadGroups = BWDeadGroups + [_x];

		}
	}
	foreach BWGroups;
sleep 5;
};