//func_p_MovingToRemoveCorpses.sqf
private["_MedicLeader","_group","_x","_DeadBodiesChosenARRAY","_randomMarker", "_waypoint","_AvailableInvestigationMarker","_FirstDeadBodyMarker","_ManyTimes"];
_group = _this;
_MedicLeader = leader _group;
_DeadBodiesChosenARRAY = _group getvariable ["CurrentDeadBodies",[]];
//hintc format ["TARGET MARKER: %1  POS: %2 POS2: %3",_DeadBodiesChosenARRAY, getMarkerPos "",getMarkerPos _DeadBodiesChosenARRAY ];
_FirstDeadBodyMarker = "";
_ManyTimes = 0;

/////if(Medic_TOTAL_WorkDoneCount == Count_TOTAL_DEAD_BODIES)exitwith{};
IF((count _DeadBodiesChosenARRAY < 1) )THEN //and !(_GROUP getVariable "RemovingInProgress")
{//Settings
	_DeadBodiesChosenARRAY = _group call func_CheckCorpses; 
	[_group,_MedicLeader,_DeadBodiesChosenARRAY ] call func_p_MovingToRemoveCorpsesPart2;// <-------------TO CREATE WAYPOINT!

}
else
{// <-------------TO CREATE WAYPOINT!};
	if!(_GROUP getVariable "WaypointSet")then{[_group,_MedicLeader,_DeadBodiesChosenARRAY ] call func_p_MovingToRemoveCorpsesPart2;};
};
	

//Settings END




if((count _DeadBodiesChosenARRAY < 1))exitwith{}; //NO WORK, ALL WORK WILL BE DONE BY OTHERS!





if(_GROUP getVariable "RemovingInProgress")then
{//TO FIX EMPTY ARRAY ERROR
	_FirstDeadBodyMarker = _MedicLeader getVariable "MyMarkerName";
}
else
{
	_FirstDeadBodyMarker = _DeadBodiesChosenARRAY select 0;
	
	if(speed vehicle _MedicLeader < 4)then 
	{//EXPERIMENTAL [NEEDED IF DEAD BODY IN FOREST!]
		_ManyTimes = _GROUP getVariable "TimeToFailMission";
		if((vehicle _MedicLeader ) isKindOf "Man")then
		{//CAN'T DO ANYTHING! CANCEL!
		
			
			_ManyTimes = _ManyTimes - 1;
			_GROUP setVariable ["TimeToFailMission",_ManyTimes,true];
			if(_ManyTimes < (-10))then
			{
				//ABORT MISSION
				//hint "ABORT MISSION!";
				_GROUP call func_AbortMissionMEDIC;
			};			
		}
		else
		{
				
			
			if(_ManyTimes < 1)then
			{
				{
					if!(((vehicle _x isKindOf "Air")and(_x == driver vehicle _x)))then
					{
						[_x] allowGetIn false; 
					};
					///////_GROUP setVariable ["TimeToFailMission",30,true];
				}foreach units _GROUP;		
			}
			else
			{
				_ManyTimes = _ManyTimes - 1;
				_GROUP setVariable ["TimeToFailMission",_ManyTimes,true];
			};
			
		};
		//player groupchat format ["TimeToFailMission = %1",_ManyTimes];
	};//EXPERIMENTAL 
	
};







if(count _DeadBodiesChosenARRAY > 0)then{[name leader _group + format ["%1",round random 1000], getMarkerPos _FirstDeadBodyMarker, "REMOVE_CORP"] spawn func_MedicWorkMarker;}; //FOR TESTING


//player sidechat format ["_FirstDeadBodyMarker = %1 || RemovingInProgress = %2 || name _MedicLeader = %3", _FirstDeadBodyMarker, _GROUP getVariable "RemovingInProgress", name _MedicLeader];

{
	if((_x distance getMarkerPos _FirstDeadBodyMarker) <35)then
	{
		//player groupchat format ["_MedicLeader distance _FirstDeadBodyMarker = %1",_MedicLeader distance getMarkerPos _FirstDeadBodyMarker];
		if!(_GROUP getVariable "RemovingInProgress")then
		{
			_GROUP setVariable ["RemovingInProgress",true,true];
			_GROUP spawn func_RemovingCorpses;
		}
	};
} foreach units _GROUP;






//if(TRUE)exitwith{};// <-------------WIP DEL










