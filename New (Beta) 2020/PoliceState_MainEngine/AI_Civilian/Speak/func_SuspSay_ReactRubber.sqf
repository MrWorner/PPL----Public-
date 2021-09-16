//func_SuspSay_ReactRubber.sqf
//ReactRubber
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_ReactRubber select round random ((count Voice_Susp1_ReactRubber) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_ReactRubber select round random ((count Voice_Susp2_ReactRubber) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_ReactRubber select round random ((count Voice_Susp3_ReactRubber) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_ReactRubber select round random ((count Voice_Susp4_ReactRubber) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_ReactRubber select round random ((count Voice_Susp5_ReactRubber) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_ReactRubber select round random ((count Voice_Susp6_ReactRubber) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_ReactRubber select round random ((count Voice_Susp7_ReactRubber) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_ReactRubber select round random ((count Voice_Susp8_ReactRubber) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_ReactRubber select round random ((count Voice_Susp9_ReactRubber) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_ReactRubber select round random ((count Voice_Susp10_ReactRubber) - 1 );
	};	
	default { //hintC format ["func_SuspSay_ReactRubber default Voice:%1, Susp name: %2",(_Susp getVariable "Voice"),name _Susp]; 
	};
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_ReactRubber Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
