//fnc_CopSay_Beep.sqf 2020
private["_COP","_this","_WhatToSayCar"];
_COP = _this;

if(isnull _COP)exitwith{};

_random = round (random ((count SirenSoundA_ArrayRESERVE) - 1));
_WhatToSayCar = SirenSoundA_ArrayRESERVE select _random;
	
if(isnil "_WhatToSayCar")exitwith{hintc format ["Error in fnc_CopSay_Beep Voice: %1 %2 %3", (_COP getVariable "Voice"), count SirenSoundB_Array, _random ];};

//_COP say [sound, maxTitlesDistance, speed];
vehicle _COP say _WhatToSayCar;
