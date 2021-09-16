//fnc_RemoveAllWaypoints 2020
private["_group"];
_group = _this;

while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};