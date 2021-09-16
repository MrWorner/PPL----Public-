//func_CopSay_ReactBang.sqf
private["_COP","_this","_WhatToSay"];
_COP = _this;

if(isnull _COP)exitwith{};


switch (_COP getVariable "Voice") do 
{
	case "Cop1": 
	{ 
		_WhatToSay = Voice_SWAT1_ReactBang select round random ((count Voice_SWAT1_ReactBang) - 1);
	};
	case "Cop2": 
	{
		_WhatToSay = Voice_SWAT2_ReactBang select round random ((count Voice_SWAT2_ReactBang) - 1);
	};	
	case "Cop3": 
	{
		_WhatToSay = Voice_SWAT3_ReactBang select round random ((count Voice_SWAT3_ReactBang) - 1);
	};	
	case "Cop4": 
	{
		_WhatToSay = Voice_SWAT4_ReactBang select round random ((count Voice_SWAT4_ReactBang) - 1);
	};	
	case "Cop5": 
	{
		_WhatToSay = Voice_SWAT5_ReactBang select round random ((count Voice_SWAT5_ReactBang) - 1);
	};	
	case "Cop6": 
	{
		_WhatToSay = Voice_SWAT6_ReactBang select round random ((count Voice_SWAT6_ReactBang) - 1);
	};	
	case "Cop7": 
	{
		_WhatToSay = Voice_SWAT7_ReactBang select round random ((count Voice_SWAT7_ReactBang) - 1);
	};	
	case "Cop8": 
	{
		_WhatToSay = Voice_SWAT8_ReactBang select round random ((count Voice_SWAT8_ReactBang) - 1);
	};	
	case "Cop9": 
	{
		_WhatToSay = Voice_SWAT9_ReactBang select round random ((count Voice_SWAT9_ReactBang) - 1);
	};	
	case "Cop10": 
	{
		_WhatToSay = Voice_SWAT10_ReactBang select round random ((count Voice_SWAT10_ReactBang) - 1);
	};	
	default { hint "func_CopSay_ReactBang default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_CopSay_ReactBang Voice: %1", (_COP getVariable "Voice") ];};

	//_COP say [sound, maxTitlesDistance, speed];
	_COP say _WhatToSay;
