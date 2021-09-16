//func_SuspSay_Hostage_Target.sqf
//Hostage_Target
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_Hostage_Target select round random ((count Voice_Susp1_Hostage_Target) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_Hostage_Target select round random ((count Voice_Susp2_Hostage_Target) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_Hostage_Target select round random ((count Voice_Susp3_Hostage_Target) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_Hostage_Target select round random ((count Voice_Susp4_Hostage_Target) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_Hostage_Target select round random ((count Voice_Susp5_Hostage_Target) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_Hostage_Target select round random ((count Voice_Susp6_Hostage_Target) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_Hostage_Target select round random ((count Voice_Susp7_Hostage_Target) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_Hostage_Target select round random ((count Voice_Susp8_Hostage_Target) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_Hostage_Target select round random ((count Voice_Susp9_Hostage_Target) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_Hostage_Target select round random ((count Voice_Susp10_Hostage_Target) - 1 );
	};	
	default { hintC "func_SuspSay_Hostage_Target default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_Hostage_Target Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
