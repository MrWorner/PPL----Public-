//func_SuspSay_Help.sqf
//Help
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_Help select round random ((count Voice_Susp1_Help) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_Help select round random ((count Voice_Susp2_Help) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_Help select round random ((count Voice_Susp3_Help) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_Help select round random ((count Voice_Susp4_Help) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_Help select round random ((count Voice_Susp5_Help) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_Help select round random ((count Voice_Susp6_Help) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_Help select round random ((count Voice_Susp7_Help) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_Help select round random ((count Voice_Susp8_Help) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_Help select round random ((count Voice_Susp9_Help) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_Help select round random ((count Voice_Susp10_Help) - 1 );
	};	
	default { hintC "func_SuspSay_Help default" };
};


if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_Help Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
