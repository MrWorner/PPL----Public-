//func_BW_CreateRandomPatrolUnits
private["_count","_TotalScore","_CrewCount","_Position","_VehType","_SelectedArray","_Chance","_RandomNubmer"];
_SelectedArray = [];
_VehType = "";
_RandomNubmer = 0;
_CrewCount = 0;
sleep 3;

_count = count BWPatrolLocation ;
player sidechat "func_BW_CreateRandomPatrolUnits| Creating patrol units";
//player sidechat  format ["func_BW_CreateRandomPatrolUnits| Total patrol points = %1", _count];
sleep 1;
if(_count < 3)exitwith{hintc format ["func_BW_CreateRandomPatrolUnits | Please place minimum 3 patrol points. You placed only = %1", _count];};


_TotalScore =  round(_count / 3);
player sidechat format ["func_BW_CreateRandomPatrolUnits| _TotalScore = %1", _TotalScore];






while{(_TotalScore > 0)}do
{

	_TotalScore = _TotalScore - 1;
	_Chance = random 100;
	if(_Chance > 15)then
	{
		_RandomNubmer = round(random (count Addon_PoliceCars_Level_1 - 1));
		_SelectedArray = Addon_PoliceCars_Level_1 select _RandomNubmer;
		_VehType = _SelectedArray select 0;
		_CrewCount = 2;
	}
	else
	{
		_RandomNubmer = round(random (count Addon_PoliceCars_Level_0  - 1));
		_SelectedArray = Addon_PoliceCars_Level_0 select _RandomNubmer;
		_VehType = _SelectedArray select 0;
		_CrewCount = 1;
	};
	
	
	
	
	//_VehType = _SelectedArray select 0;
	//_CrewCount = _SelectedArray select 1;
	_RandomNubmer = round(random (count BWPatrolLocation   - 1));
	_Position = getMarkerPos (BWPatrolLocation  select _RandomNubmer);
	//_CrewType = "RU_Policeman";
	_CrewType = "CDF_Soldier_Militia";
	sleep 0.1;
	//hintc format ["_SelectedArray = %1 | _VehType = %2 | _CrewCount = %3 | _Position = %4 | _CrewType = %5 | BWPatrolLocation  = | _RandomNubmer = %6",_SelectedArray,_VehType,_CrewCount,_Position,_CrewType, _RandomNubmer];
	[_VehType,_CrewCount,_Position,_CrewType] spawn func_BW_CreateUnit_LAND;
};

sleep 1;
player sidechat format ["func_BW_CreateRandomPatrolUnits| Creation completed!", _TotalScore];