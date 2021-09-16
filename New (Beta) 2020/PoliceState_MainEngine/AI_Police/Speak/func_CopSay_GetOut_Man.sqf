//func_CopSay_GetOut_Man.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_GetOut_Man select round random ((count Voice_Cop1_GetOut_Man) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_GetOut_Man select round random ((count Voice_Cop2_GetOut_Man) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_GetOut_Man select round random ((count Voice_Cop3_GetOut_Man) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_GetOut_Man select round random ((count Voice_Cop4_GetOut_Man) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_GetOut_Man select round random ((count Voice_Cop5_GetOut_Man) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_GetOut_Man select round random ((count Voice_Cop6_GetOut_Man) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_GetOut_Man select round random ((count Voice_Cop7_GetOut_Man) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_GetOut_Man select round random ((count Voice_Cop8_GetOut_Man) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_GetOut_Man select round random ((count Voice_Cop9_GetOut_Man) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_GetOut_Man select round random ((count Voice_Cop10_GetOut_Man) - 1);
	};	
	default { hint "func_CopSay_GetOut_Man default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_GetOut_Man Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
