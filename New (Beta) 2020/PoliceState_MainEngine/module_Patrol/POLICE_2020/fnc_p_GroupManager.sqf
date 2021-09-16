//fnc_p_GroupManager.sqf
private["_leader", "_chase", "_backup", "_patrol"];

if(SHOWTMessageLVL2)then{player globalchat format ["|---fnc_p_GroupManager: LOADED!", player];};// MESSAGE LVL2
while{ENABLE_Cop_AI}do
{
	sleep 5;
	//player sidechat format ["PoliceGroups=%1",PoliceGroups];
	{	
		if(count units _x > 0)then		
		{	
			//MAIN
			_leader = leader _x;	
			if(alive _leader)then	
			{							
				_chase = _x call fnc_Check_GroupMembersInChase;//проверка что группа в процессе погони + FIX (если хотя бы один преследует, приказать другим товарищам без дела преследовать)			
				if( !_chase )then
				{//NOT IN CHASE
																
					_backup = _x call fnc_p_BackupManager;
					if(!_backup)then
					{	
						_investigation = _x call fnc_p_InvestigationManager;
						//_investigation = false;
						if(!_investigation)then
						{						
							_patrol =  _x call fnc_P_PatrolManager;
							if(!_patrol)then
							{	
								player globalchat format ["fnc_p_GroupManager: Waiting %1", _x];
								if(_x getVariable "WhatGroupIsDoing" != "Waiting")then
								{
									_x setVariable ["WhatGroupIsDoing","Waiting",true];	
									_x call fnc_LostFormation;	
									_x setVariable["TimeToFailTask", GROUP_STUCK_TIMER];//РЕСЕТ ТАЙМЕРА STUCK								
								};																
							};	
						};							
						//[name leader _x + format ["%1", _x], position _leader, "No Patrol Points"] spawn func_CopWorkMarker; //УСТАРЕЛ!
					};
				};
			};				
		//MAIN END
		}
		else
		{
			//hintc format ["PoliceGroups GROUP REMOVED: %1",_x];
			PoliceGroups = PoliceGroups - [_x];
			PoliceDeadGroups = PoliceDeadGroups + [_x];
		};
		_x call FUNC_siren_step2_activationG;
	}foreach PoliceGroups;	
};

hintc "fnc_p_GroupManager = AI DISABLED. PLEASE RESTART CURRENT FUNCTION MANUALLY!";
