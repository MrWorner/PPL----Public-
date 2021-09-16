//func_CopSay_SuspShooting.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_SuspShooting select round random ((count Voice_Cop1_SuspShooting) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_SuspShooting select round random ((count Voice_Cop2_SuspShooting) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_SuspShooting select round random ((count Voice_Cop3_SuspShooting) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_SuspShooting select round random ((count Voice_Cop4_SuspShooting) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_SuspShooting select round random ((count Voice_Cop5_SuspShooting) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_SuspShooting select round random ((count Voice_Cop6_SuspShooting) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_SuspShooting select round random ((count Voice_Cop7_SuspShooting) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_SuspShooting select round random ((count Voice_Cop8_SuspShooting) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_SuspShooting select round random ((count Voice_Cop9_SuspShooting) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_SuspShooting select round random ((count Voice_Cop10_SuspShooting) - 1);
	};	
	default { hint "func_CopSay_SuspShooting default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_SuspShooting Voice: %1", (_COP getVariable "Voice") ];};
	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
