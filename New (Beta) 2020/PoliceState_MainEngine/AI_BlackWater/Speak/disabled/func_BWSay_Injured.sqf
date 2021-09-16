//func_BWSay_Injured.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_BW1_Injured select round random ((count Voice_BW1_Injured) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_BW2_Injured select round random ((count Voice_BW2_Injured) - 1);
	};	
	case "BW3": 
	{
		_WhatToSay = Voice_BW3_Injured select round random ((count Voice_BW3_Injured) - 1);
	};	
	case "BW4": 
	{
		_WhatToSay = Voice_BW4_Injured select round random ((count Voice_BW4_Injured) - 1);
	};	
	case "BW5": 
	{
		_WhatToSay = Voice_BW5_Injured select round random ((count Voice_BW5_Injured) - 1);
	};	
	case "BW6": 
	{
		_WhatToSay = Voice_BW6_Injured select round random ((count Voice_BW6_Injured) - 1);
	};	
	case "BW7": 
	{
		_WhatToSay = Voice_BW7_Injured select round random ((count Voice_BW7_Injured) - 1);
	};	
	case "BW8": 
	{
		_WhatToSay = Voice_BW8_Injured select round random ((count Voice_BW8_Injured) - 1);
	};	
	case "BW9": 
	{
		_WhatToSay = Voice_BW9_Injured select round random ((count Voice_BW9_Injured) - 1);
	};	
	case "BW10": 
	{
		_WhatToSay = Voice_BW10_Injured select round random ((count Voice_BW10_Injured) - 1);
	};	
	default { hint "func_BWSay_Injured default" };
};


if(isnil "_WhatToSay")exitwith{player setpos getpos _BW; hintc format ["Error in func_BWSay_Injured Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
