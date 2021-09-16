//func_p_MovingToRemoveCars.sqf
private["_FireManLeader","_group","_x","_FireLogicChosenARRAY","_randomMarker", "_waypoint","_FirstFireLogic","_ManyTimes"];
_group = _this;
_FireManLeader = leader _group;
_FireLogicChosenARRAY = _group getvariable ["CurrentFireObjects",[]];
//hintc format ["TARGET MARKER: %1  POS: %2 POS2: %3",_FireLogicChosenARRAY, getMarkerPos "",getMarkerPos _FireLogicChosenARRAY ];
_FirstFireLogic = "";
_ManyTimes = 0;


IF((count _FireLogicChosenARRAY < 1) )THEN //and !(_GROUP getVariable "RemovingInProgress")
{//Settings
	_FireLogicChosenARRAY = _group call func_CheckFireCars;
	[_group,_FireManLeader,_FireLogicChosenARRAY ] call func_p_MovingToRemoveCarsPart2; 

}
else
{// <-------------TO CREATE WAYPOINT!};

	if!(_GROUP getVariable "WaypointSet")then{[_group,_FireManLeader,_FireLogicChosenARRAY ] call func_p_MovingToRemoveCarsPart2;};  //<------WIP
};
	

//Settings END




if((count _FireLogicChosenARRAY < 1))exitwith{}; //NO WORK, ALL WORK WILL BE DONE BY OTHERS!





if(_GROUP getVariable "RemovingInProgress")then
{//TO FIX EMPTY ARRAY ERROR
	_FirstFireLogic = _FireManLeader;
}
else
{
	_FirstFireLogic = _FireLogicChosenARRAY select 0;
	
	if(speed vehicle _FireManLeader < 4)then 
	{//EXPERIMENTAL [NEEDED IF DEAD CAR IN FOREST!]
		_ManyTimes = _GROUP getVariable "TimeToFailMission";
		if((vehicle _FireManLeader ) isKindOf "Man")then
		{//CAN'T DO ANYTHING! CANCEL!
		
			
			_ManyTimes = _ManyTimes - 1;
			_GROUP setVariable ["TimeToFailMission",_ManyTimes,true];
			if(_ManyTimes < (-10))then
			{
				//ABORT MISSION
				//hint "ABORT MISSION!";
				_GROUP call func_AbortMissionFF; 
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







if(count _FireLogicChosenARRAY > 0)then{[name leader _group + format ["%1",round random 1000], getPos _FirstFireLogic, "REMOVE_FIRE"] spawn func_FireManWorkMarker;}; //FOR TESTING


//player sidechat format ["_FirstFireLogic = %1 || RemovingInProgress = %2 || name _FireManLeader = %3", _FirstFireLogic, _GROUP getVariable "RemovingInProgress", name _FireManLeader];

{
	if((_x distance getPos _FirstFireLogic) <35)then
	{
		//player groupchat format ["_FireManLeader distance _FirstFireLogic = %1",_FireManLeader distance getMarkerPos _FirstFireLogic];
		if!(_GROUP getVariable "RemovingInProgress")then
		{
			_GROUP setVariable ["RemovingInProgress",true,true];
			_GROUP spawn func_RemovingFire; //<------WIP
		}
	};
} foreach units _GROUP;






//if(TRUE)exitwith{};// <-------------WIP DEL










