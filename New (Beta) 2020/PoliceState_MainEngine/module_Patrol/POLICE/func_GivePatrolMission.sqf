//func_GivePatrolMission.sqf
private["_group","_this"];
_group = _this;

switch (_group getvariable "Mission") do 
{			
	case "PatrolAndStop": 
	{  		
		_group call func_p_PatrolAndStop;
		_group setVariable ["WhatGroupIsDoing","PatrolAndStop",true];
		
	};	
	case "Guard": 				
	{  
		_group call func_p_Guard;
		_group setVariable ["WhatGroupIsDoing","Guard",true];
	};	
	case "PassiveGuardian": 				
	{  
		_group call func_p_PassiveGuardian;
		_group setVariable ["WhatGroupIsDoing","PassiveGuardian",true];
	};
	default 
	{ 
		hint "default !func_PatrolAreas.SQF!";
		_group setVariable ["WhatGroupIsDoing","NOTHING DEFAULT CASE",true];
	};
};			
