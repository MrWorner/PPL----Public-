//func_SuspSay_No.sqf
//No
private["_Susp","_this","_WhatToSay"];
_Susp = _this;


//hintc format ["Voice: %1", (_Susp getVariable "Voice") ];

switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_No select round random ((count Voice_Susp1_No) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_No select round random ((count Voice_Susp2_No) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_No select round random ((count Voice_Susp3_No) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_No select round random ((count Voice_Susp4_No) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_No select round random ((count Voice_Susp5_No) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_No select round random ((count Voice_Susp6_No) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_No select round random ((count Voice_Susp7_No) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_No select round random ((count Voice_Susp8_No) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_No select round random ((count Voice_Susp9_No) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_No select round random ((count Voice_Susp10_No) - 1 );
	};	
	default { hintC "func_SuspSay_No default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_No Voice: %1", (_Susp getVariable "Voice") ];};

	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
