//func_SuspSay_DontSee.sqf
//DontSee
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_DontSee select round random ((count Voice_Susp1_DontSee) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_DontSee select round random ((count Voice_Susp2_DontSee) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_DontSee select round random ((count Voice_Susp3_DontSee) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_DontSee select round random ((count Voice_Susp4_DontSee) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_DontSee select round random ((count Voice_Susp5_DontSee) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_DontSee select round random ((count Voice_Susp6_DontSee) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_DontSee select round random ((count Voice_Susp7_DontSee) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_DontSee select round random ((count Voice_Susp8_DontSee) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_DontSee select round random ((count Voice_Susp9_DontSee) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_DontSee select round random ((count Voice_Susp10_DontSee) - 1 );
	};	
	default { hintC "func_SuspSay_DontSee default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_DontSee Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
