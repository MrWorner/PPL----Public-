//fnc_createWaypoint
private["_pos","_group"];

_group = _this select 0;
_pos = _this select 1;

_group setSpeedMode "FULL";
_waypoint = _group addwaypoint[_pos,0];

while {(count (waypoints _group)) == 0} do
{
	_waypoint = _group addwaypoint[_pos,0];
};

_waypoint setwaypointtype"Move"; 
_GROUP setFormation "COLUMN";
_GROUP setBehaviour "AWARE";