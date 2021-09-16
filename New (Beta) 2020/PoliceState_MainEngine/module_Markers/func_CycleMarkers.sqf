//func_CycleMarkers.sqf
private["_x","_nomer","_marker","_subj"];
sleep 1;
if(SHOWTMessageLVL2)then{player globalchat format ["|---func_CycleMarkers: LOADED!", player];};// MESSAGE LVL2
if!(OnlineMarkers)exitwith{player globalchat format ["|---func_CycleMarkers: TURNED OFF!", player];};
while{(OnlineMarkers)}do
{


	{	
		if!(_X in RegisteredUnitsWIthMarkers)then
		{
		
			//player sidechat format ["_x AI_SET  = %1",_x getVariable "AI_SET"];
			if(_x getVariable ["AI_SET","NULL"] == "NULL")then{_X call func_DefaultSET;};
			
					
			_marker = createMarker [((name _x) + format[" %1",(count UnitsWIthMarkers)] ), position _x];
			_marker setMarkerType "Empty";
			_x setVariable ["MyMarkerName",_marker,true];
			
			UnitsWIthMarkers = UnitsWIthMarkers + [_X];
			RegisteredUnitsWIthMarkers = RegisteredUnitsWIthMarkers + [_X];		
			//hint format ["ADDED NEW UNIT MARKER= %1 SIDE: %2",name _X, side _X];

			
		};
	} forEach allUnits;
	//player sidechat format ["UnitsWIthMarkers = %1",UnitsWIthMarkers];
	sleep 10; //10 SECONDS DEFAULT
};
