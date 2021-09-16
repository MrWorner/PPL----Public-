//func_SuspSay_Stunned.sqf
//Stunned
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_Stunned select round random ((count Voice_Susp1_Stunned) - 1);
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_Stunned select round random ((count Voice_Susp2_Stunned) - 1);
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_Stunned select round random ((count Voice_Susp3_Stunned) - 1);
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_Stunned select round random ((count Voice_Susp4_Stunned) - 1);
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_Stunned select round random ((count Voice_Susp5_Stunned) - 1);
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_Stunned select round random ((count Voice_Susp6_Stunned) - 1);
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_Stunned select round random ((count Voice_Susp7_Stunned) - 1);
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_Stunned select round random ((count Voice_Susp8_Stunned) - 1);
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_Stunned select round random ((count Voice_Susp9_Stunned) - 1);
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_Stunned select round random ((count Voice_Susp10_Stunned) - 1);
	};	
	default {
	//hintc format ["default func_SuspSay_Stunned Voice: Susp name: %2",(_Susp getVariable "Voice"),name _Susp];
	};
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_Stunned Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
