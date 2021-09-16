//func_BW_RemoveInvJobFromPolice
private["_MarkerCHosen","_this","_NewChosenMarker","_GROUP","_x"];
_NewChosenMarker = "";
_MarkerCHosen = _this;
{
	if( (_x getvariable "CurrentInvestigationMarker") == _MarkerCHosen)then
	{
		_GROUP = _x;
		_BWLeader = leader _GROUP;
		if(count BWNeedToInvestigate  > 0)then
		{	
			if(BWNeedToInvestigate  select 0 == "")then
			{
				hintc format ["BWNeedToInvestigate  = %1 FIXED!!!!", BWNeedToInvestigate ];
				BWNeedToInvestigate  = [];
				_GROUP setVariable ["CurrentInvestigationMarker","",true];
				_GROUP call func_BW_GivePatrolMission;
			}
			else
			{
				_NewChosenMarker = _GROUP call func_BW_CheckAvailableINV;
				if(_NewChosenMarker == "")then
				{
					_GROUP setVariable ["CurrentInvestigationMarker","",true];
					 _GROUP call func_BW_GivePatrolMission;
				}
				else
				{
					[_GROUP,_BWLeader,_NewChosenMarker ] call func_BW_p_InvestigationInProgressPart2;
					
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
}foreach BWGroups;