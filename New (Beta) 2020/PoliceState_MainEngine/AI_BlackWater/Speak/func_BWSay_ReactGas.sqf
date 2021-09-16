//func_BWSay_ReactGas.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_SWAT1_ReactGas + Voice_SWAT_cauch select round random ((count( Voice_SWAT1_ReactGas + Voice_SWAT_cauch)) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_SWAT2_ReactGas + Voice_SWAT_cauch select round random ((count (Voice_SWAT2_ReactGas + Voice_SWAT_cauch)) - 1);
	};	

	default { hint "func_BWSay_ReactGas + Voice_SWAT_cauch default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_ReactGas + Voice_SWAT_cauch Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
