//func_BWSay_HeliGUNS.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "VoiceHELI") do 
{
	case "Heli1": 
	{ 
		_WhatToSay = Voice_Heli1_Wep select round random ((count Voice_Heli1_Wep) - 1);
	};
	case "Heli2": 
	{
		_WhatToSay = Voice_Heli2_Wep select round random ((count Voice_Heli2_Wep) - 1);
	};	
	case "Heli3": 
	{
		_WhatToSay = Voice_Heli3_Wep select round random ((count Voice_Heli3_Wep) - 1);
	};	
	case "Heli4": 
	{
		_WhatToSay = Voice_Heli4_Wep select round random ((count Voice_Heli4_Wep) - 1);
	};	

	default { hint "func_BWSay_HeliGUNS default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_HeliGUNS Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;

	player groupchat format ["VoiceHELI = %1, _WhatToSay = %2",(_BW getVariable "VoiceHELI"),_WhatToSay];