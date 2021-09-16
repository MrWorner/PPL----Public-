//func_p_PassiveGuardian.sqf
private["_CopLeader","_group","_Position", "_waypoint"];

_group = _this;
_CopLeader = leader _group;
_Position = _group getVariable "MissionGuardianPosition";
//_PositionFakeMarker = _group getVariable "CurrentTargetMarker";
//_GROUP setVariable ["CurrentTargetMarker","",true];




IF!(_group getVariable "PeaceWaypointCreated")THEN
{//SETTINGS
	
	_GROUP setVariable ["PeaceWaypointCreated",true,true];
	 while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	
	{		
		_x setVariable ["SayHello",true,true];
		_x doFollow  _CopLeader; 
		if(vehicle _x isKIndOf "Man")then{[_x] allowGetIn true;};
	} forEach units _group ;
	
	
	_waypoint = _group addwaypoint [_Position,5];
	_waypoint setwaypointtype "MOVE"; 
	_waypoint = _group addwaypoint [_Position,5];
	_waypoint setwaypointtype "MOVE"; 
	//_group setVariable ["CurrentTargetMarker",_Position,true];	
	_group setSpeedMode "NORMAL";
	_group setFormation "COLUMN";
	_group setBehaviour "AWARE";
	hint "";

	
};//SETTINGS END

[name leader _group + format ["%1",round random 1000], _Position, "GUARDIAN"] spawn func_CopWorkMarker; //FOR TESTING




