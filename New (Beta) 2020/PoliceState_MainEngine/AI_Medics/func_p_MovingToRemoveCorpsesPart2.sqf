//func_p_MovingToRemoveCorpsesPart2.sqf
private["_Leader","_group","_x","_CorpsArrayChosenMarkers","_randomMarker", "_waypoint","_AvailableInvestigationMarker","_FirstDeadBody","_formula"];
_group = _this select 0;
_Leader = _this select 1;
_CorpsArrayChosenMarkers = _this select 2;

if((count _CorpsArrayChosenMarkers < 1))exitwith{}; //NO WORK, ALL WORK WILL BE DONE BY OTHERS!

_FirstDeadBody = (_CorpsArrayChosenMarkers select 0);
_FirstDeadBodyMarker = _FirstDeadBody;


_formula = round ((_Leader distance getmarkerpos _FirstDeadBodyMarker)/ 50);
//hintc format ["_formula = %1, DISTANCE: %2",_formula, (_Leader distance getmarkerpos _FirstDeadBodyMarker)];
_GROUP setVariable ["TimeToFailMission",_formula,true];

 while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};	
_waypoint = _group addwaypoint[getmarkerpos _FirstDeadBodyMarker,5];
//_waypoint setwaypointtype"GETOUT";	
//_waypoint setwaypointtype"UNLOAD";	
_waypoint setwaypointtype"HOLD";
 

//_GROUP setVariable ["investigationTimer",0,true];	 //DEL?
//_GROUP setVariable ["PatrolOutOfTime",0,true];	 //DEL?
_GROUP setVariable ["WaypointSet",true,true];
player globalchat format ["|---func_p_MovingToRemoveCorpsesPart2: Added new waypoints for medics to remove corps for %1 TARGET MARKER: %2", _group,(_FirstDeadBodyMarker)];
