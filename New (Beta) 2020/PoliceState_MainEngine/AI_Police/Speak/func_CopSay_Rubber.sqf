//func_CopSay_Rubber.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_SWAT1_ReactRubber select round random ((count Voice_SWAT1_ReactRubber) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_SWAT2_ReactRubber select round random ((count Voice_SWAT2_ReactRubber) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_SWAT3_ReactRubber select round random ((count Voice_SWAT3_ReactRubber) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_SWAT4_ReactRubber select round random ((count Voice_SWAT4_ReactRubber) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_SWAT5_ReactRubber select round random ((count Voice_SWAT5_ReactRubber) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_SWAT6_ReactRubber select round random ((count Voice_SWAT6_ReactRubber) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_SWAT7_ReactRubber select round random ((count Voice_SWAT7_ReactRubber) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_SWAT8_ReactRubber select round random ((count Voice_SWAT8_ReactRubber) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_SWAT9_ReactRubber select round random ((count Voice_SWAT9_ReactRubber) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_SWAT10_ReactRubber select round random ((count Voice_SWAT10_ReactRubber) - 1);
	};	
	default { hint "func_CopSay_Rubber default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_Rubber Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
