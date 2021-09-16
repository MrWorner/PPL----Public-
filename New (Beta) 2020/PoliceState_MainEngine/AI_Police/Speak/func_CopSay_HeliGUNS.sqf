//func_CopSay_HeliGUNS.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "VoiceHELI") do 
{
	case "Heli1": 
	{ 
		_WhatToSay = Voice_Heli1_Wep select round random ((count Voice_Heli1_Wep) - 1);
		 //hintc format [" func_CopSay_HeliGUNS Voice_Heli4_Wep: %1 | _WhatToSay %2", Voice_Heli1_Wep, _WhatToSay];
	};
	case "Heli2": 
	{
		_WhatToSay = Voice_Heli2_Wep select round random ((count Voice_Heli2_Wep) - 1);
		// hintc format [" func_CopSay_HeliGUNS Voice_Heli4_Wep: %1 | _WhatToSay %2", Voice_Heli2_Wep, _WhatToSay];
	};	
	case "Heli3": 
	{
		_WhatToSay = Voice_Heli3_Wep select round random ((count Voice_Heli3_Wep) - 1);
		// hintc format [" func_CopSay_HeliGUNS Voice_Heli4_Wep: %1 | _WhatToSay %2", Voice_Heli3_Wep, _WhatToSay];
	};	
	case "Heli4": 
	{
		
		_WhatToSay = Voice_Heli4_Wep select round random ((count Voice_Heli4_Wep) - 1);
		// hintc format [" func_CopSay_HeliGUNS Voice_Heli4_Wep: %1 | _WhatToSay %2", Voice_Heli4_Wep, _WhatToSay];
	};	

	default { hint "func_CopSay_HeliGUNS default" };
};

if(isnil "_WhatToSay")exitwith{ hintc format ["Error in func_CopSay_HeliGUNS Voice: %1 | %2", (_COP getVariable "Voice"), (_COP getVariable ["VoiceHELI","VoiceHELI not set!"])];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;

	//player groupchat format ["VoiceHELI = %1, _WhatToSay = %2",(_COP getVariable "VoiceHELI"),_WhatToSay];