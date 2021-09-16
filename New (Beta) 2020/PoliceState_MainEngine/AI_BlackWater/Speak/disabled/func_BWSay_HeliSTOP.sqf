//func_BWSay_HeliSTOP.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "VoiceHELI") do 
{
	case "Heli1": 
	{ 
		_WhatToSay = Voice_Heli1_STOP select round random ((count Voice_Heli1_STOP) - 1);
	};
	case "Heli2": 
	{
		_WhatToSay = Voice_Heli2_STOP select round random ((count Voice_Heli2_STOP) - 1);
	};	
	case "Heli3": 
	{
		_WhatToSay = Voice_Heli3_STOP select round random ((count Voice_Heli3_STOP) - 1);
	};	
	case "Heli4": 
	{
		_WhatToSay = Voice_Heli4_STOP select round random ((count Voice_Heli4_STOP) - 1);
	};	
	default { hint "func_BWSay_HeliSTOP default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_HeliSTOP Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
