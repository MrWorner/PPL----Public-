//func_p_InvestigationInProgressPart2.sqf
private["_CopLeader","_group","_x","_MarkerCHosen","_randomMarker", "_waypoint","_AvailableInvestigationMarker"];
_group = _this select 0;
_CopLeader = _this select 1;
_MarkerCHosen = _this select 2;


	 while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};	
	_waypoint = _group addwaypoint[getmarkerpos _MarkerCHosen,5];
	_waypoint setwaypointtype"UNLOAD";	
	 
	_GROUP setVariable ["CurrentInvestigationMarker",_MarkerCHosen,true];
	_GROUP setVariable ["investigationTimer",0,true];	
	_GROUP setVariable ["PatrolOutOfTime",0,true];
	if(vehicle _CopLeader isKindOf "Air")then
	{
		_group setVariable ["DistanceSize",125,true];
	}
	else
	{
		_group setVariable ["DistanceSize",25,true];
	};
	//player globalchat format ["|---func_p_InvestigationInProgress: Added new INVESTIGATION waypoints for %1 TARGET MARKER: %2", _group,_MarkerCHosen];

