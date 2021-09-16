//func_CopSay_ThankCOOP.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_ThankCOOP select round random ((count Voice_Cop1_ThankCOOP) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_ThankCOOP select round random ((count Voice_Cop2_ThankCOOP) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_ThankCOOP select round random ((count Voice_Cop3_ThankCOOP) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_ThankCOOP select round random ((count Voice_Cop4_ThankCOOP) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_ThankCOOP select round random ((count Voice_Cop5_ThankCOOP) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_ThankCOOP select round random ((count Voice_Cop6_ThankCOOP) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_ThankCOOP select round random ((count Voice_Cop7_ThankCOOP) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_ThankCOOP select round random ((count Voice_Cop8_ThankCOOP) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_ThankCOOP select round random ((count Voice_Cop9_ThankCOOP) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_ThankCOOP select round random ((count Voice_Cop10_ThankCOOP) - 1);
	};	
	default { hint "func_CopSay_ThankCOOP default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_ThankCOOP Voice: %1", (_COP getVariable "Voice") ];};
	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
