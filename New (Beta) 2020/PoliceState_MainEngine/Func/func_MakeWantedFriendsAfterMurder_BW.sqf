//func_MakeWantedFriendsAfterMurder_BW.sqf

private["_SUSP_ARRAY","_ARMED"];
_SUSP_ARRAY = _this;
//player globalchat format ["count _SUSP_ARRAY: %1",count _SUSP_ARRAY];

{

	//player globalchat format ["Dangerous: %1 for %2!", (_x getvariable "Dangerous"),_x];
	//player globalchat format ["fnc_CheckArmed: %1 for %2!", (_x call fnc_CheckArmed), _x];
	if!(_x getvariable "BW_Dangerous")then
	{
		if(_x call fnc_CheckArmed)then
		{
			_x setVariable ["BW_Dangerous",true,true];
			//player globalchat format ["%1 added to dangerous list!", _x];
			//(_x getVariable "MyMarkerName") setMarkerType "HW_Suspect";
		};
	};


}
foreach _SUSP_ARRAY;