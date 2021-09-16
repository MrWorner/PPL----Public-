//fnc_EnemyClose.sqf
private["_COP","_x", "_this","_distance","_speed"];
_COP = _this;
{
	if(alive _x)then
	{
		_distance = vehicle _x distance vehicle _COP;
		if!(_COP getvariable "inDanger")then
		{				
			 //DISTANCE											
			//if!(_x getvariable "Dangerous")then
			//{		
			//PRIMARY TARGET
			if (( _x == ((_COP getvariable "ImChasing") select 0) ))then
			{			
				if(_x getVariable "Arrested")then
				{
					//_COP setVariable ["ImChasing",((_COP getvariable "ImChasing") - [_x]),true];
					_COP call func_TargetFix;
				}
				else
				{
					//if(assignedTarget _COP != (vehicle _x))then//2020
					//{
						_COP dotarget (vehicle _x);
						//_COP lookAt  (vehicle _x);
					//};						
				}
			};
			
			if!(_x getvariable "Dangerous")then
			{
				//Add crimes (Very close to the police)
				if(_distance < 15)then//10
				{
					if(vehicle _x isKindOf "Man")then
					{
						if( _x call fnc_CheckArmed)then
						{
							if!(_x getvariable "Stunned")then
							{
								_x setVariable ["Dangerous",true,true];
								_x setVariable ["WantedFor", (_x getvariable "WantedFor") + ["Armed threat to the police"],true];	
								//(_x getVariable "MyMarkerName") setMarkerType "HW_Suspect";
							};	
						};								
					}
					else
					{			
						if(vehicle _COP isKindOf "Man")then
						{
							_speed = speed vehicle _x;
							if((_speed > 5)or(_speed < (-5)))then
							{   
								_x setVariable ["Dangerous",true,true];
								_x setVariable ["WantedFor", (_x getvariable "WantedFor") + ["Threat to the police with a vehicle"],true];
								//(_x getVariable "MyMarkerName") setMarkerType "HW_Suspect";
							};
						};
					}					
				}			
			};					
			//};			
		};			
		if(_distance < 2.5)then
		{
			if(vehicle _x isKindOf "Man")then
			{
				if(vehicle _COP isKindOf "Man")then
				{
					[_COP, _x] spawn func_fight;// MODULE CLOSE COMBAT 
				}
			}		
		};
	};
}foreach (_COP getvariable "ImChasing")//Array_SuspectSide;		


	
