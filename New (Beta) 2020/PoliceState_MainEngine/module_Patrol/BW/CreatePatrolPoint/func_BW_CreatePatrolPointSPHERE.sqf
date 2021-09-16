//func_BW_CreatePatrolPointSPHERE
private["_x", "_Rname","_name","_marker","_TempArray"];
_TempArray = [];


{  
	if(typeof _x == "SIGN_SPHERE10CM_EP1")then
	{
		//player globalchat format ["Type = %1, Patrol point has been created!",(typeof _x)];
		_Rname = round(random 99999);
		_name = format ["%1", (_Rname) ] + "_PatrolPoint_" + format ["%1", (count BWPatrolLocation ) ];
		
		_marker = createMarker [ _name, getpos _x ];
		
		if(OnlineMarkers)then
		{
			_marker setMarkerType "HW_PatrolPoint";
		}
		else
		{
			_marker setMarkerType "Empty";
		};
		BWPatrolLocation  = BWPatrolLocation  + [_marker];
		_TempArray = _TempArray + [_marker];
		//player sidechat format ["Marker = %1",_x];
		deletevehicle _x;
		player sidechat format ["func_BW_CreatePatrolPointSPHERE| Patrol point created: %1",_marker];
	};	
} forEach vehicles;

if(OnlineMarkers)then
{
	sleep 3;
	{
		_x setMarkerType "Empty";
	} forEach _TempArray;
};

