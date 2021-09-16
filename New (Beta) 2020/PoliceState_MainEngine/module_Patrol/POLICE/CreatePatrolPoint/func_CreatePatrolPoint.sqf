//func_CreatePatrolPoint
private ["_this","_Position","_Rname","_marker","_name"];
//sleep 4;
_Position = _this select 0;
_Rname = round(random 99999);
_name = format ["%1", (_Rname) ] + "_PatrolPoint_" + format ["%1", (count PatrolLocation) ];



_marker = createMarker [ _name, getpos _Position ];

if(OnlineMarkers)then
{
	_marker setMarkerType "HW_PatrolPoint";
}
else
{
	_marker setMarkerType "Empty";
};


PatrolLocation = PatrolLocation + [_marker];

player sidechat format ["func_CreatePatrolPoint| Patrol point created: %1",_marker];


if(OnlineMarkers)then
{
	sleep 3;
	_marker setMarkerType "Empty";
};


//if!(VisibleMarkersON)then
//{
//_marker setMarkerAlpha 0; 
//};