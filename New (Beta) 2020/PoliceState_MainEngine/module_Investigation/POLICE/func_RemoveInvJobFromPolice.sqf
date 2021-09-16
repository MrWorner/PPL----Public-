//func_RemoveInvJobFromPolice
private["_MarkerCHosen","_this","_NewChosenMarker","_GROUP","_x"];
_NewChosenMarker = "";
_MarkerCHosen = _this;
{
	if( (_x getvariable "CurrentInvestigationMarker") == _MarkerCHosen)then
	{
		_GROUP = _x;
		_CopLeader = leader _GROUP;
		if(count NeedToInvestigate > 0)then
		{	
			if(NeedToInvestigate select 0 == "")then
			{
				hintc format ["NeedToInvestigate = %1 FIXED!!!!", NeedToInvestigate];
				NeedToInvestigate = [];
				_GROUP setVariable ["CurrentInvestigationMarker","",true];
				_GROUP call func_GivePatrolMission;
			}
			else
			{
				_NewChosenMarker = _GROUP call func_CheckAvailableINV;
				if(_NewChosenMarker == "")then
				{
					_GROUP setVariable ["CurrentInvestigationMarker","",true];
					 _GROUP call func_GivePatrolMission;
				}
				else
				{
					[_GROUP,_CopLeader,_NewChosenMarker ] call func_p_InvestigationInProgressPart2;
					
				};								
			};
		}
		else
		{
			_GROUP setVariable ["CurrentInvestigationMarker","",true];
		};
		_GROUP setSpeedMode "NORMAL";
		_GROUP setFormation "VEE";
		_GROUP setBehaviour "AWARE";	
		//_x setVariable ["LostFormation",true,true];					
		{			
			[_x] allowGetIn true; 
		}foreach units _GROUP;
	};
}foreach PoliceGroups;