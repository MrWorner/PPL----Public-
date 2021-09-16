//func_BWSay_PullOver_Veh.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_PullOver_Veh select round random ((count Voice_BW1_PullOver_Veh) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_PullOver_Veh select round random ((count Voice_BW2_PullOver_Veh) - 1);
	};	
	case "BW3": 
	{
		_WhatToSay = Voice_BW3_PullOver_Veh select round random ((count Voice_BW3_PullOver_Veh) - 1);
	};	
	case "BW4": 
	{
		_WhatToSay = Voice_BW4_PullOver_Veh select round random ((count Voice_BW4_PullOver_Veh) - 1);
	};	
	case "BW5": 
	{
		_WhatToSay = Voice_BW5_PullOver_Veh select round random ((count Voice_BW5_PullOver_Veh) - 1);
	};	
	case "BW6": 
	{
		_WhatToSay = Voice_BW6_PullOver_Veh select round random ((count Voice_BW6_PullOver_Veh) - 1);
	};	
	case "BW7": 
	{
		_WhatToSay = Voice_BW7_PullOver_Veh select round random ((count Voice_BW7_PullOver_Veh) - 1);
	};	
	case "BW8": 
	{
		_WhatToSay = Voice_BW8_PullOver_Veh select round random ((count Voice_BW8_PullOver_Veh) - 1);
	};	
	case "BW9": 
	{
		_WhatToSay = Voice_BW9_PullOver_Veh select round random ((count Voice_BW9_PullOver_Veh) - 1);
	};	
	case "BW10": 
	{
		_WhatToSay = Voice_BW10_PullOver_Veh select round random ((count Voice_BW10_PullOver_Veh) - 1);
	};	
	default { hint "func_BWSay_PullOver_Veh default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_PullOver_Veh Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
