//func_CopSay_DontSeeHim.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_DontSeeHim select round random ((count Voice_Cop1_DontSeeHim) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_DontSeeHim select round random ((count Voice_Cop2_DontSeeHim) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_DontSeeHim select round random ((count Voice_Cop3_DontSeeHim) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_DontSeeHim select round random ((count Voice_Cop4_DontSeeHim) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_DontSeeHim select round random ((count Voice_Cop5_DontSeeHim) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_DontSeeHim select round random ((count Voice_Cop6_DontSeeHim) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_DontSeeHim select round random ((count Voice_Cop7_DontSeeHim) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_DontSeeHim select round random ((count Voice_Cop8_DontSeeHim) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_DontSeeHim select round random ((count Voice_Cop9_DontSeeHim) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_DontSeeHim select round random ((count Voice_Cop10_DontSeeHim) - 1);
	};	
	default { hint "func_CopSay_DontSeeHim default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_DontSeeHim Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
