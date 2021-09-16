//func_CopSay_StopRunning.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_StopRunning select round random ((count Voice_Cop1_StopRunning) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_StopRunning select round random ((count Voice_Cop2_StopRunning) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_StopRunning select round random ((count Voice_Cop3_StopRunning) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_StopRunning select round random ((count Voice_Cop4_StopRunning) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_StopRunning select round random ((count Voice_Cop5_StopRunning) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_StopRunning select round random ((count Voice_Cop6_StopRunning) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_StopRunning select round random ((count Voice_Cop7_StopRunning) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_StopRunning select round random ((count Voice_Cop8_StopRunning) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_StopRunning select round random ((count Voice_Cop9_StopRunning) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_StopRunning select round random ((count Voice_Cop10_StopRunning) - 1);
	};	
	default { hint "func_CopSay_StopRunning default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_StopRunning Voice: %1", (_COP getVariable "Voice") ];};
	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
