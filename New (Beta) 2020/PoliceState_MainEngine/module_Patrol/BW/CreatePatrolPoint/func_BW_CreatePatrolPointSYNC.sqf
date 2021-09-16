//func_BW_CreatePatrolPointSYNC.sqf

private["_module", "_objects","_Rname","_name","_marker","_x","_TempArray"];

_module = _this;
_objects = synchronizedObjects (_module select 0);
_TempArray = [];
//hintc  format ["_objects = %1",_objects];
{

	if(OnlineMarkers)then
{

};
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
	_marker setMarkerType "HW_PatrolPoint";
	//player sidechat format ["Marker = %1",_marker];
	deletevehicle _x;
	player sidechat format ["func_BW_CreatePatrolPointSYNC| Patrol point created: %1",_marker];
}foreach _objects;




if(OnlineMarkers)then
{	
	sleep 3;
	{
		sleep 0.1;
		_x setMarkerType "Empty";
	}foreach _TempArray;
};


