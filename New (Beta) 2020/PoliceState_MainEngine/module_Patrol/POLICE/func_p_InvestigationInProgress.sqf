//func_p_InvestigationInProgress.sqf
private["_CopLeader","_group","_x","_MarkerCHosen","_randomMarker", "_waypoint","_AvailableInvestigationMarker"];
_group = _this;
_CopLeader = leader _group;
_MarkerCHosen = _group getvariable ["CurrentInvestigationMarker",""];
//player setpos getmarkerpos _MarkerCHosen;
//hintc format ["TARGET MARKER: %1  POS: %2 POS2: %3",_MarkerCHosen, getMarkerPos "",getMarkerPos _MarkerCHosen ];



IF(_MarkerCHosen == "")THEN
{//Settings

IF(_group getVariable "PeaceWaypointCreated")THEN{_GROUP setVariable ["PeaceWaypointCreated",false,true];};

	_MarkerCHosen = _group call func_CheckAvailableINV;

	if(_MarkerCHosen == "")exitwith{ _group call func_GivePatrolMission;}; //hintc "ERROR: func_p_InvestigationInProgress marker EMPTY, means no available free markers. Need to do patrol job";

	[_group,_CopLeader,_MarkerCHosen ] call func_p_InvestigationInProgressPart2;

	
	
};//Settings END


if(_MarkerCHosen == "")exitwith{};// EXITWITH FIX !EXPERIMENTAL!



if(vehicle _CopLeader distance getMarkerPos _MarkerCHosen < 200)then 
{//EXPERIMENTAL [NEEDED IF CRIME SCENE IN FOREST!]
	
	if(speed vehicle _CopLeader < 20)then
	{
		{
			if!(((vehicle _x isKindOf "Air")and(_x == driver vehicle _x))or(_x == gunner vehicle _x))then
			{
				[_x] allowGetIn false; 
			};
		}foreach units _GROUP;
	};

};//EXPERIMENTAL 

if(vehicle _CopLeader distance getMarkerPos _MarkerCHosen < _group getvariable "DistanceSize")then
{
	if(_MarkerCHosen in NeedToInvestigateSEARCH)then
	{//SEARCH
		if(_group getvariable "investigationTimer" > 20)then   //DEF: 9
		{
			
			//player globalchat format ["|---func_p_InvestigationInProgress: Mission completed, INVESTIGATION (TIMER) COMPLETED for %1 TARGET MARKER: %2", _group,_MarkerCHosen];
			//player sidechat format ["|---func_p_InvestigationInProgress: Investigation marker (TIMER) was removed %1",_MarkerCHosen];	
			NeedToInvestigate = NeedToInvestigate - [_MarkerCHosen];
			NeedToInvestigateSEARCH = NeedToInvestigateSEARCH - [_MarkerCHosen];
			_MarkerCHosen call func_RemoveInvJobFromPolice;
			_MarkerCHosen call func_CheckClosestINVandDEL2;
			DeleteMarker _MarkerCHosen;
			_MarkerCHosen = _group call func_CheckAvailableINV;
			if!((_MarkerCHosen == ""))then
			{
				_group setvariable ["CurrentInvestigationMarker",_MarkerCHosen];
				[_group,_CopLeader,_MarkerCHosen ] call func_p_InvestigationInProgressPart2;
			};
			
		}
		else
		{
			_GROUP setVariable ["investigationTimer",((_group getvariable "investigationTimer") + 1),true];
			_group setVariable ["DistanceSize", ((_group getvariable "DistanceSize") + 15),true];
			//_group setSpeedMode "LIMITED";
			_group setFormation "LINE";
			//if(_group getvariable "investigationTimer" > 5)then{ _group setBehaviour "AWARE";}else{ _group setBehaviour "COMBAT";};
			
			{
				if!(((vehicle _x isKindOf "Air")and(_x == driver vehicle _x))or(_x == gunner vehicle _x))then
				{
					[_x] allowGetIn false; 
				};
			}foreach units _GROUP;
			
			 _waypoint = _group addwaypoint[getmarkerpos _MarkerCHosen,5*(_group getvariable "investigationTimer")]; 
			 //_waypoint = _group addwaypoint[getmarkerpos _MarkerCHosen,5]; //!!!!!!!!!!! need to test
			 _waypoint setwaypointtype"SAD";

		};
	
	}
	else
	{//NO SEARCH
		NeedToInvestigate = NeedToInvestigate - [_MarkerCHosen];
		_MarkerCHosen call func_RemoveInvJobFromPolice;
		_MarkerCHosen call func_CheckClosestINVandDEL;
		//player globalchat format ["|---func_p_InvestigationInProgress: Mission completed, INVESTIGATION COMPLETED for %1 TARGET MARKER: %2", _group,_MarkerCHosen];
		//player sidechat format ["|---func_p_InvestigationInProgress: Investigation marker was removed %1",_MarkerCHosen];
		DeleteMarker _MarkerCHosen;
		_MarkerCHosen = _group call func_CheckAvailableINV;
		
		if!((_MarkerCHosen == ""))then
		{
			_group setvariable ["CurrentInvestigationMarker",_MarkerCHosen];
			[_group,_CopLeader,_MarkerCHosen ] call func_p_InvestigationInProgressPart2;
		};
	};
	
	
	
	
	
}
else
{		
	if(speed vehicle _CopLeader < 3)then
	{
		if(vehicle _CopLeader distance getMarkerPos _MarkerCHosen < 150)then
		{
			_group setVariable ["DistanceSize", ((_group getvariable "DistanceSize") + 5),true];
		}
		else
		{
			if(_group getvariable "PatrolOutOfTime" > 24)then
			{
				_group setVariable ["PatrolOutOfTime",0,true];
				_group setVariable ["DistanceSize",25,true];										
				_group setVariable ["LostFormation",true,true];
				_group setVariable ["FailedWaypointJob",(_group getvariable "FailedWaypointJob") + [_MarkerCHosen],true];
				_group setVariable ["CurrentInvestigationMarker","",true];
				_MarkerCHosen call func_CheckAndRemoveBadMarker;
				player globalchat format ["|---func_p_InvestigationInProgress: Mission FAILED for %1 TARGET MARKER: %2. Investigation was banned for current group!", _group,_MarkerCHosen];
				//titleText [ format ["|---func_p_InvestigationInProgress: Mission FAILED for %1 TARGET MARKER: %2. Investigation was banned for current group!", _group,_MarkerCHosen], "PLAIN"];	

				{				
					[_x] allowGetIn true; 				
				}foreach units _GROUP;				
			}
			else
			{
				if(_group getvariable "PatrolOutOfTime" > 22)then
				{
					if(vehicle _CopLeader distance getMarkerPos _MarkerCHosen < 1500)
					then
					{
						{			
							[_x] allowGetIn false;						
						}foreach units _GROUP;
					};
					{			
						[_x] domove getMarkerpos _MarkerCHosen;			
						//player globalchat format ["|---func_p_InvestigationInProgress: DOMOVE %1 TARGET MARKER: %2", _group,_MarkerCHosen];					
					}foreach units _GROUP;
				};
				_group setVariable ["PatrolOutOfTime",((_group getvariable "PatrolOutOfTime") + 1),true];
			};
		
		};
	}
	else
	{
	_group setVariable ["PatrolOutOfTime",0,true];
	};
	
	
	_group call func_LostFormation;	
						
	
};


[name leader _group + format ["%1",round random 1000], getMarkerPos _MarkerCHosen, "INVESTIGATING"] spawn func_CopWorkMarker; //FOR TESTING






