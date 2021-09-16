//func_CopSay_OfficerDown.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_Cop1_OfficerDown select round random ((count Voice_Cop1_OfficerDown) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_Cop2_OfficerDown select round random ((count Voice_Cop2_OfficerDown) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_Cop3_OfficerDown select round random ((count Voice_Cop3_OfficerDown) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_Cop4_OfficerDown select round random ((count Voice_Cop4_OfficerDown) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_Cop5_OfficerDown select round random ((count Voice_Cop5_OfficerDown) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_Cop6_OfficerDown select round random ((count Voice_Cop6_OfficerDown) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_Cop7_OfficerDown select round random ((count Voice_Cop7_OfficerDown) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_Cop8_OfficerDown select round random ((count Voice_Cop8_OfficerDown) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_Cop9_OfficerDown select round random ((count Voice_Cop9_OfficerDown) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_Cop10_OfficerDown select round random ((count Voice_Cop10_OfficerDown) - 1);
	};	
	default { hint "func_CopSay_OfficerDown default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_OfficerDown Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
