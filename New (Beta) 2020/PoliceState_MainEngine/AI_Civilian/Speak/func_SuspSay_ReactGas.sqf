//func_SuspSay_ReactGas.sqf
//ReactGas
private["_Susp","_this","_WhatToSay"];
_Susp = _this;




switch (_Susp getVariable "Voice") do 
{
	case "Susp1": 
	{ 
		_WhatToSay = Voice_Susp1_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp1_ReactGas + Voice_SWAT_cauch)) - 1 );
	};
	case "Susp2": 
	{
		_WhatToSay = Voice_Susp2_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp2_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp3": 
	{
		_WhatToSay = Voice_Susp3_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp3_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp4": 
	{
		_WhatToSay = Voice_Susp4_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp4_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp5": 
	{
		_WhatToSay = Voice_Susp5_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp5_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp6": 
	{
		_WhatToSay = Voice_Susp6_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp6_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp7": 
	{
		_WhatToSay = Voice_Susp7_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp7_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp8": 
	{
		_WhatToSay = Voice_Susp8_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp8_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp9": 
	{
		_WhatToSay = Voice_Susp9_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp9_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	case "Susp10": 
	{
		_WhatToSay = Voice_Susp10_ReactGas+ Voice_SWAT_cauch select round random ((count (Voice_Susp10_ReactGas + Voice_SWAT_cauch)) - 1 );
	};	
	default { hintC "func_SuspSay_ReactGas default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_SuspSay_ReactGas Voice: %1", (_Susp getVariable "Voice") ];};


	//_Susp say [sound, maxTitlesDistance, speed];
	_Susp say _WhatToSay;
