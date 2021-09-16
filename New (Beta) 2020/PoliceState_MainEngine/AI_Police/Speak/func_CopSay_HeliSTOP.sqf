//func_CopSay_HeliSTOP.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "VoiceHELI") do 
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
	default { hint "func_CopSay_HeliSTOP default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_HeliSTOP Voice: %1 | %2", (_COP getVariable "Voice"), (_COP getVariable ["VoiceHELI","VoiceHELI not set!"])];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
