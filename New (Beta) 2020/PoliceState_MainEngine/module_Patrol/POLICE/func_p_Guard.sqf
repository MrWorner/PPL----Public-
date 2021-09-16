//func_p_Guard.sqf
private["_CopLeader","_group","_x","_MarkerName","_randomMarker", "_waypoint"];

if(count (PatrolLocation) == 0)exitwith{};
_group = _this;
_CopLeader = leader _group;
_MarkerName = _group getvariable "CurrentTargetMarker";




IF!(_group getVariable "PeaceWaypointCreated")THEN
{//SETTINGS
	
_GROUP setVariable ["PeaceWaypointCreated",true,true];
	 while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	
	_waypoint = _group addwaypoint [getpos _CopLeader,1];
	_waypoint setwaypointtype "GETOUT"; 	
	_waypoint = _group addwaypoint [getpos _CopLeader,5];
	//_waypoint setwaypointtype "GUARD"; 
	_waypoint setwaypointtype "DISMISS"; 

	_group setSpeedMode "NORMAL";
	_group setFormation "COLUMN";
	_group setBehaviour "AWARE";
	//player globalchat format ["|---func_p_Guard: is now active for %1", _group];
	
//SETTINGS END
};



[name leader _group + format ["%1",round random 1000], getpos _CopLeader, "DISMISS"] spawn func_CopWorkMarker; //FOR TESTING




