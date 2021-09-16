//func_CreateRandomPatrolUnits
private["_count","_TotalScore","_Position","_SelectedArray","_RandomNubmer"];
_SelectedType = _this;

_RandomNubmer = 0;
sleep 3;

_count = count PatrolLocation;
player sidechat "func_CreateRandomPatrolUnits| Creating patrol units";
sleep 1;
if(_count < 3)exitwith{hintc format ["func_CreateRandomPatrolUnits | Please place minimum 3 patrol points. You placed only = %1", _count];};


_TotalScore =  round(_count / 3);
//player sidechat format ["func_CreateRandomPatrolUnits| _TotalScore = %1", _TotalScore];



if(_SelectedType == "General")exitwith
{
	while{(_TotalScore > 0)}do
	{
		_TotalScore = _TotalScore - 1;
		_RandomNubmer = round(random (count PatrolLocation  - 1));
		_Position = (PatrolLocation select _RandomNubmer);
		[_Position, PoliceWaveArray_General_blue] call func_Step1_PoliceWave_ChooseRiskLevelArmy; 
		sleep 0.1;
	};
};

if(_SelectedType == "Chernarus")exitwith
{
	while{(_TotalScore > 0)}do
	{
		_TotalScore = _TotalScore - 1;
		_RandomNubmer = round(random (count PatrolLocation  - 1));
		_Position =  (PatrolLocation select _RandomNubmer);
		[_Position, PoliceWaveArray_Chernarus_blue] call func_Step1_PoliceWave_ChooseRiskLevelArmy;	
		sleep 0.1;
	};
};




//sleep 1;
//player sidechat format ["func_CreateRandomPatrolUnits| Creation completed!", _TotalScore];