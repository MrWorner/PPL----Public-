//func_BWSay_CivDown.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_CivDown select round random ((count Voice_BW1_CivDown) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_CivDown select round random ((count Voice_BW2_CivDown) - 1);
	};	

	default { hint "func_BWSay_CivDown default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_CivDown Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
