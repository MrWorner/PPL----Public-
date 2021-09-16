//func_BW_p_PatrolAndStop.sqf
private["_BWLeader","_group","_x","_MarkerName","_randomMarker", "_waypoint"];


_group = _this;
_BWLeader = leader _group;
if(count (BWPatrolLocation ) == 0)exitwith{[name _BWLeader + format ["%1",round random 1000], getPos _BWLeader, "No Patrol Points"] spawn func_bw_WorkMarker;};
_MarkerName = _group getvariable "CurrentTargetMarker";



IF(_MarkerName == "")THEN
{//SETTINGS
	_randomMarker = (round random count (BWPatrolLocation ) - 1);
	if(_randomMarker < 0)then
	{
		_randomMarker = 0;									
	};
	_MarkerName =  (BWPatrolLocation ) select _randomMarker;	
	
	 while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	
	_waypoint = _group addwaypoint [getmarkerpos _MarkerName,5];
	_waypoint setwaypointtype "Hold"; 
	_group setVariable ["CurrentTargetMarker",_MarkerName,true];	
	
	if(vehicle _BWLeader isKindOf "Air")then
	{
		_group setVariable ["DistanceSize",125,true];
	}
	else
	{
		_group setVariable ["DistanceSize",25,true];
	};
	_group setVariable ["PatrolOutOfTime",0,true];
	_group setSpeedMode "NORMAL";
	_group setFormation "COLUMN";
	_group setBehaviour "AWARE";
	//player globalchat format ["|---func_BW_PatrolAreas: Added new waypoints for %1 TARGET MARKER: %2", _group,_MarkerName];
	
};//SETTINGS END

if(vehicle _BWLeader distance getMarkerPos _MarkerName < _group getvariable "DistanceSize")then
{
	_group setVariable ["CurrentTargetMarker","",true];
	//player globalchat format ["|---func_BW_PatrolAreas: Mission completed for %1 TARGET MARKER: %2", _group,_MarkerName];		
	_GROUP setVariable ["FailToPatrol",0,true];
	[_group,true] call func_AllowGetInGROUP;
}
else
{		
	if(speed vehicle _BWLeader < 3)then
	{
		if(vehicle _BWLeader distance getMarkerPos _MarkerName < 150)then
		{
			_group setVariable ["DistanceSize", ((_group getvariable "DistanceSize") + 5),true];
		}
		else
		{
			if(_group getvariable "PatrolOutOfTime" > 10)then
			{
				_group setVariable ["FailedWaypointJob",(_group getvariable "FailedWaypointJob") + [_MarkerName],true];
				_group setVariable ["PatrolOutOfTime",0,true];
				_group setVariable ["DistanceSize",25,true];										
				_group setVariable ["CurrentTargetMarker","",true];
				_group setVariable ["LostFormation",true,true];
				//titleText [ format ["|---func_BW_PatrolAreas: Mission FAILED for %1 TARGET MARKER: %2", _group,_MarkerName], "PLAIN"];			
				[_group,true] call func_BW_AllowGetInGROUP;			
				player globalchat format ["|---func_BW_PatrolAreas: Mission FAILED for %1 TARGET MARKER: %2", _group,_MarkerName];		
				_GROUP call func_BW_failToPatrol;			
				
			}
			else
			{
				_group setVariable ["PatrolOutOfTime",((_group getvariable "PatrolOutOfTime") + 1),true];
			};
		
		};
	}
	else
	{
		_group setVariable ["PatrolOutOfTime",0,true];
		if(vehicle _BWLeader isKindOf "Air")then{_group setVariable ["DistanceSize", ((_group getvariable "DistanceSize") + 1),true];};
	};	
	_group call func_BW_LostFormation;	
	
};
	


[name leader _group + format ["%1",round random 1000], getMarkerPos _MarkerName, "PATROLING"] spawn func_BW_WorkMarker; //FOR TESTING




