//func_CopSay_Injured.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_Injured select round random ((count Voice_Cop1_Injured) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_Injured select round random ((count Voice_Cop2_Injured) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_Injured select round random ((count Voice_Cop3_Injured) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_Injured select round random ((count Voice_Cop4_Injured) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_Injured select round random ((count Voice_Cop5_Injured) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_Injured select round random ((count Voice_Cop6_Injured) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_Injured select round random ((count Voice_Cop7_Injured) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_Injured select round random ((count Voice_Cop8_Injured) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_Injured select round random ((count Voice_Cop9_Injured) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_Injured select round random ((count Voice_Cop10_Injured) - 1);
	};	
	default { hint "func_CopSay_Injured default" };
};


if(isnil "_WhatToSay")exitwith{player setpos getpos _COP; hintc format ["Error in func_CopSay_Injured Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
