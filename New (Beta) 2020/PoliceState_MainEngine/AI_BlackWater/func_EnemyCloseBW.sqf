//func_EnemyCloseBW.sqf
private["_BW","_x", "_this","_distance","_speed","_checkPerson"];
_distance = 0;
_speed = 0;
_BW = _this;
	{
		if(alive _x)then
		{
			_distance = vehicle _x distance vehicle _BW;
			
			 //DISTANCE											
			if!(_x getvariable "BW_Dangerous")then
			{		
				//PRIMARY TARGET
				if (( _x == ((_BW getvariable "ImChasing") select 0) )and!(_BW getvariable "inDanger"))then
				{
				
					if(_x getVariable "Arrested")then
					{
						//_BW setVariable ["ImChasing",((_BW getvariable "ImChasing") - [_x]),true];
						_BW call func_TargetFix;
					}
					else
					{
						_BW dotarget (vehicle _x);	
					}

				};
				
				//if(_BW getvariable "inDanger")then{HINT "DANGER!";};
				//Add crimes (Very close to the police)
				if(_distance < 10)then
				{
					if(vehicle _x isKindOf "Man")then
					{
						if(( _x call fnc_CheckArmed ) and !(_x getvariable "Stunned"))then
						{
							_x setVariable ["BW_Dangerous",true,true];
							_x setVariable ["BW_WantedFor", (_x getvariable "BW_WantedFor") + ["Armed threat to the police"],true];	
							//(_x getVariable "MyMarkerName") setMarkerType "HW_Suspect";
						};			
					}
					else
					{			
						if(vehicle _BW isKindOf "Man")then
						{
							_speed = speed vehicle _x;
							if((_speed > 2)or(_speed < (-2)))then
							{
								_x setVariable ["BW_Dangerous",true,true];
								_x setVariable ["BW_WantedFor", (_x getvariable "BW_WantedFor") + ["Threat to the police with a vehicle"],true];
								//(_x getVariable "MyMarkerName") setMarkerType "HW_Suspect";
							};
						};
					}					
				}			
			};			
			if(_distance < 2.5)then{[_BW, _x] spawn func_fight;};// MODULE CLOSE COMBAT 
		};
	}
	foreach (_BW getvariable "ImChasing")//Array_SuspectSide;		
