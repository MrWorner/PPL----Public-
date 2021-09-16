//func_BWSay_StopRunning.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_StopRunning select round random ((count Voice_BW1_StopRunning) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_StopRunning select round random ((count Voice_BW2_StopRunning) - 1);
	};		
	default { hint "func_BWSay_StopRunning default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_StopRunning Voice: %1", (_BW getVariable "Voice") ];};
	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
