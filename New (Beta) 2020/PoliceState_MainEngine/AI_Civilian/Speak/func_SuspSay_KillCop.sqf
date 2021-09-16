//func_SuspSay_KillCop.sqf
//KillCop
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_KillCop select round random ((count Voice_Susp1_KillCop) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_KillCop select round random ((count Voice_Susp2_KillCop) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_KillCop select round random ((count Voice_Susp3_KillCop) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_KillCop select round random ((count Voice_Susp4_KillCop) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_KillCop select round random ((count Voice_Susp5_KillCop) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_KillCop select round random ((count Voice_Susp6_KillCop) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_KillCop select round random ((count Voice_Susp7_KillCop) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_KillCop select round random ((count Voice_Susp8_KillCop) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_KillCop select round random ((count Voice_Susp9_KillCop) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_KillCop select round random ((count Voice_Susp10_KillCop) - 1 );
	};	
	default { hintC "func_SuspSay_KillCop default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_KillCop Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
