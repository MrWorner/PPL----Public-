//func_BWSay_Surrounded.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_Surrounded select round random ((count Voice_BW1_Surrounded) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_Surrounded select round random ((count Voice_BW2_Surrounded) - 1);
	};	

	default { hint "func_BWSay_Surrounded default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_Surrounded Voice: %1", (_BW getVariable "Voice") ];};
	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
