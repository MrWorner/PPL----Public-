//func_BackToFireStation.sqf
private["_group","_x","_waypoint"];
_group = _this;
_Leader = leader _group;	


 while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};	
_waypoint = _group addwaypoint[getmarkerpos (_group getVariable "MyParkingLOtName"),5];	
_waypoint setwaypointtype"HOLD";
 
