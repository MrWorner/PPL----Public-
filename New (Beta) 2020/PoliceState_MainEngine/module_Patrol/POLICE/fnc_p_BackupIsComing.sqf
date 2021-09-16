//fnc_p_BackupIsComing.sqf 2020
private["_CopLeader","_group","_x","_SuspectPosition", "_waypoint", "_Suspect","_this"];

_group = _this;
_CopLeader = leader _group;

_Suspect = _GROUP getvariable "CurrentSuspect";
if!(_Suspect in Array_SuspectsInChase)then{_GROUP setVariable ["CurrentSuspect",ObjNull,true];};

IF(isNull _Suspect)THEN//SETTINGS
{
	IF(_group getVariable "PeaceWaypointCreated")THEN{_GROUP setVariable ["PeaceWaypointCreated",false,true];};
	_Suspect = _group call func_CheckHowManyCopsNeeded;
	
	if(isNull _Suspect)exitwith{_GROUP call func_p_InvestigationInProgress;};
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};	
	_SuspectPosition =  getPos _Suspect;
	_GROUP setVariable ["CurrentSuspect",_Suspect,true];
	_group setSpeedMode "FULL";
	_waypoint = _group addwaypoint[_SuspectPosition,0];
	_waypoint setwaypointtype"Move"; 
	_GROUP setFormation "COLUMN";
	_GROUP setBehaviour "AWARE";
	//player globalchat format ["|---fnc_p_BackupIsComing: POLICE BACKUP %1 TARGET SUSPECT: %2", _group,_Suspect];
	_group setVariable ["PatrolOutOfTime",0,true];
	_group setVariable ["BackupOUpdateTime",0,true];
};//SETTINGS END

if(isNull _Suspect)exitwith{};// EXITWITH FIX !EXPERIMENTAL!
	
if(_group getvariable "BackupOUpdateTime" > 4)then
{
	_group setVariable ["BackupOUpdateTime",0,true];																		
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};	
	_SuspectPosition =  getPos _Suspect;
	_waypoint = _group addwaypoint[_SuspectPosition,0];
	_waypoint setwaypointtype"Move"; 	
	//player globalchat format ["|---fnc_p_BackupIsComing: POLICE BACKUP %1 TARGET POSITION UPDATED!: %2", _group,_Suspect];		
	//hintc format ["|---fnc_p_BackupIsComing: POLICE BACKUP %1 TARGET POSITION UPDATED!: %2", _group,_Suspect];	
}
else
{
	_group setVariable ["BackupOUpdateTime",((_group getvariable "BackupOUpdateTime") + 1),true];
};

if(speed vehicle _CopLeader < 4)then
{
	if(_group getvariable "PatrolOutOfTime" > 12)then
	{
		_group setVariable ["PatrolOutOfTime",0,true];
		_group setVariable ["LostFormation",true,true];
		_GROUP setVariable ["CurrentSuspect",ObjNull,true];
		[_group,true] call func_AllowGetInGROUP;
		player globalchat  format ["|---fnc_p_BackupIsComing: POLICE BACKUP %1 FAILED TO SUPPORT!!!!: %2", _group,_Suspect];
		
	}
	else
	{
		if(_group getvariable "PatrolOutOfTime" > 10)then
			{
				if(vehicle _CopLeader distance vehicle _Suspect < 1500)
				then
				{
					{			
						[_x] allowGetIn false;						
					}foreach units _GROUP;
				};
				{			
					[_x] domove position vehicle _Suspect;			
					//player globalchat format ["|---fnc_p_BackupIsComing: DOMOVE %1 TARGET (SUSP): %2", _group,_Suspect];					
				}foreach units _GROUP;
			};
	
		_group setVariable ["PatrolOutOfTime",((_group getvariable "PatrolOutOfTime") + 1),true];
	};
}
else
{
	_group setVariable ["PatrolOutOfTime",0,true];
};

if(vehicle _Suspect isKindOf "Man")then
{
	if(vehicle _CopLeader distance getPos _Suspect < 200)then 
	{//EXPERIMENTAL [NEEDED IF CRIME SCENE IN FOREST!]
		_group setVariable ["LostFormation",true,true];
		if(speed vehicle _CopLeader < 20)then
		{
			{
				if!(((vehicle _x isKindOf "Air")and(_x == driver vehicle _x))or(_x == gunner vehicle _x))then
				{
					[_x] allowGetIn false; 
					_x domove getpos _Suspect;
				};
			}foreach units _GROUP;
		};

	}//EXPERIMENTAL 
	else
	{
		
	};
}
else
{
	_group call func_LostFormation;
};

[name leader _group + format ["%1",round random 1000], position _Suspect, "BACKUP"] spawn func_CopWorkMarker; //FOR TESTING
