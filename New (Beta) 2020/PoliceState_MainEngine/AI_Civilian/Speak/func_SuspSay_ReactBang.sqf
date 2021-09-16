//func_SuspSay_ReactBang.sqf
//ReactBang
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_ReactBang select round random ((count Voice_Susp1_ReactBang) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_ReactBang select round random ((count Voice_Susp2_ReactBang) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_ReactBang select round random ((count Voice_Susp3_ReactBang) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_ReactBang select round random ((count Voice_Susp4_ReactBang) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_ReactBang select round random ((count Voice_Susp5_ReactBang) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_ReactBang select round random ((count Voice_Susp6_ReactBang) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_ReactBang select round random ((count Voice_Susp7_ReactBang) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_ReactBang select round random ((count Voice_Susp8_ReactBang) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_ReactBang select round random ((count Voice_Susp9_ReactBang) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_ReactBang select round random ((count Voice_Susp10_ReactBang) - 1 );
	};	
	default { hintC "func_SuspSay_ReactBang default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_ReactBang Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
