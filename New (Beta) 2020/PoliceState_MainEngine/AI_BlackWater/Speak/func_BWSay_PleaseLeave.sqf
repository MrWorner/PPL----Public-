//func_BWSay_PleaseLeave.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_PleaseLeave select round random ((count Voice_BW1_PleaseLeave) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_PleaseLeave select round random ((count Voice_BW2_PleaseLeave) - 1);
	};	
	default { hint "func_BWSay_PleaseLeave default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_PleaseLeave Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
