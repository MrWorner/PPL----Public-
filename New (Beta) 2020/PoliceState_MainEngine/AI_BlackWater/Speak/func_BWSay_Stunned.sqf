//func_BWSay_Stunned.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_SWAT1_Stunned select round random ((count Voice_SWAT1_Stunned) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_SWAT2_Stunned select round random ((count Voice_SWAT2_Stunned) - 1);
	};	
	default { hint "func_BWSay_Stunned default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_Stunned Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
