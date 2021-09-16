//FUNC_COPSIREN=
//{
private["_x","_CopLeader","_WasActivated"];
_WasActivated = false;
_Minus = 0;
if(SHOWTMessageLVL2)then{player globalchat format ["|---FUNC_COPSIREN: STARTED!", player];};// MESSAGE LVL2
	
while{ENABLE_COP_AI}do
{
	sleep 5;
	if(_WasActivated)then
	{
		//sleep 24;
		sleep 10;
		_WasActivated = false;
	};
	
	{
		if(vehicle _x isKindOf "LandVehicle")then
		{
				
			if(_x == driver vehicle _x)then
			{		
				_CopLeader = leader _x;

				if(group _x getVariable "WhatGroupIsDoing" == "InChase")then
				{
					if(speed vehicle _x > 25)then
					{
						//vehicle _x say3D (_x getVariable "SirenA");
						vehicle _x say3D (_x getVariable "SirenC");
						//player sidechat format  ["SIREN ACTIVATED! A = %1",(_x getVariable "SirenA")];
					}
					else
					{
						if(speed vehicle _x > 10)then
						{
							_x spawn 
							{
								sleep (random 5);
								vehicle _this say3D (_this getVariable "SirenB");
								//player sidechat format  ["SIREN ACTIVATED! B = %1",(_this getVariable "SirenB")];
							};
						};

					};
					_WasActivated = true;			
				
				}
				else
				{
					if(group _x getVariable "WhatGroupIsDoing" == "Backup" or group _x getVariable "WhatGroupIsDoing" == "func_p_InvestigationInProgress" )then
					{
						if(speed vehicle _x > 40)then
						{
							//vehicle _x say3D (_x getVariable "SirenA");
							vehicle _x say3D (_x getVariable "SirenA");
							//player sidechat format  ["SIREN ACTIVATED! A = %1",(_x getVariable "SirenA")];
						}
			
					
					}		
				}
			}
		}	
	}
	foreach Array_CopsSide
}
hintc "!!!FUNC_COPSIREN DISABLED!!!";