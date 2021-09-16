//func_p_MovingToRemoveFiresesPart2.sqf
private["_Leader","_group","_x","_FiresArrayChosen","_randomMarker", "_waypoint","_FirstFireLogic","_formula"];
_group = _this select 0;
_Leader = _this select 1;
_FiresArrayChosen = _this select 2;

if((count _FiresArrayChosen < 1))exitwith{}; //NO WORK, ALL WORK WILL BE DONE BY OTHERS!

_FirstFireLogic = (_FiresArrayChosen select 0);
_FirstFireLogicMarker = _FirstFireLogic;


_formula = round ((_Leader distance getpos _FirstFireLogicMarker)/ 50);
//hintc format ["_formula = %1, DISTANCE: %2",_formula, (_Leader distance getmarkerpos _FirstFireLogicMarker)];
_GROUP setVariable ["TimeToFailMission",_formula,true];

 while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};	
_waypoint = _group addwaypoint[getpos _FirstFireLogicMarker,5];	
_waypoint setwaypointtype"HOLD";
 

_GROUP setVariable ["WaypointSet",true,true];
//player globalchat format ["|---func_p_MovingToRemoveFiresesPart2: Added new waypoints for medics to remove Fires for %1 TARGET MARKER: %2", _group,(_FirstFireLogicMarker)];
