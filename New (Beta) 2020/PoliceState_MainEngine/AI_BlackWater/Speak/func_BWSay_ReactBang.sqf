//func_BWSay_ReactBang.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this;

if(isnull _BW)exitwith{};


switch (_BW getVariable "Voice") do 
{
	case "BW1": 
	{ 
		_WhatToSay = Voice_SWAT1_ReactBang select round random ((count Voice_SWAT1_ReactBang) - 1);
	};
	case "BW2": 
	{
		_WhatToSay = Voice_SWAT2_ReactBang select round random ((count Voice_SWAT2_ReactBang) - 1);
	};	

	default { hint "func_BWSay_ReactBang default" };
};

if(isnil "_WhatToSay")exitwith{hintc format ["Error in func_BWSay_ReactBang Voice: %1", (_BW getVariable "Voice") ];};

	//_BW say [sound, maxTitlesDistance, speed];
	_BW say _WhatToSay;
