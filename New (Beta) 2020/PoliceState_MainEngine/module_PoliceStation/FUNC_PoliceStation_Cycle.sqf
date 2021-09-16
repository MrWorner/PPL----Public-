//FUNC_PoliceStation_Cycle

private["_module", "_Type","_da","_marker","_ChosenPoliceStationArray","_CopsStarterCount","_needToSpawnSpecUnits"];

//https://community.bistudio.com/wiki/ArmA_2:_Vehicles
//https://community.bistudio.com/wiki/ArmA_2:_Infantry
//https://community.bistudio.com/wiki/ArmA_2_OA:_Vehicles
//https://community.bistudio.com/wiki/ArmA_2_OA:_Infantry
//http://pmc.editing.wiki/doku.php?id=arma2:class_names:acr

sleep 10;

_CopsStarterCount = Count_TotalCops;


while{PoliceStationCycle_Started}do
{
	//sleep (30 round (random 120));	
	sleep 3;	

	//player sidechat format ["POLICE_RISK_LEVEL = %1 POLICE_RISK_LEVEL_SCORE = %2, POLICE_AVAILABLE_SCORE = %3",POLICE_RISK_LEVEL, POLICE_RISK_LEVEL_SCORE, POLICE_AVAILABLE_SCORE];
	
	if( (POLICE_AVAILABLE_SCORE > 0) or (POLICE_BONUS_STAGE_Num != POLICE_RISK_LEVEL))then
	{
		
		if( LIMIT_PoliceUnits > (Count_TotalCops - Count_KilledCops))then
		{
			//[] call func_POLICE_RISK_LEVEL_UP;
			while{ (((POLICE_AVAILABLE_SCORE > 0) and ( LIMIT_PoliceUnits > (Count_TotalCops - Count_KilledCops)))or (POLICE_BONUS_STAGE_Num != POLICE_RISK_LEVEL)) }do // && 
			{
				if(count ALL_PoliceStations == 1)then
				{
					_ChosenPoliceStationArray = ALL_PoliceStations select 0;
				}
				else
				{
					_ChosenPoliceStationArray =  ALL_PoliceStations select (round(random((count ALL_PoliceStations) - 1)));			
				};
			
				switch (_ChosenPoliceStationArray select 1) do 
				{
					case "General_blue": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_General_blue] call func_Step1_PoliceWave_ChooseRiskLevelArmy; };
					case "General_camo": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_General_camo] call func_Step1_PoliceWave_ChooseRiskLevelArmy; };
					case "General_sheriff": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_General_sheriff] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					case "General_esu": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_General_esu] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					
					case "Chernarus_blue": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_Chernarus_blue] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					case "Chernarus_camo": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_Chernarus_camo] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					case "Chernarus_sheriff": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_Chernarus_esu] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					case "Chernarus_esu": { [(_ChosenPoliceStationArray select 0),PoliceWaveArray_Chernarus_sheriff] call func_Step1_PoliceWave_ChooseRiskLevelArmy;};
					
					case "Custom1": { hintc "FUNC_PoliceStation_Cycle: _ChosenPoliceStationArray Custom1"; };
					case "Custom2": { hintc "FUNC_PoliceStation_Cycle: _ChosenPoliceStationArray Custom2"; };
					case "Custom3": { hintc "FUNC_PoliceStation_Cycle: _ChosenPoliceStationArray Custom3"; };
					case "Custom4": { hintc "FUNC_PoliceStation_Cycle: _ChosenPoliceStationArray Custom4"; };
					default { hintc "FUNC_PoliceStation_Cycle: default | No station chosen to spawn units" };
				};
				//player sidechat format ["AFTER SPAWN STAGE! POLICE_RISK_LEVEL = %1 POLICE_RISK_LEVEL_SCORE = %2, POLICE_AVAILABLE_SCORE = %3",POLICE_RISK_LEVEL, POLICE_RISK_LEVEL_SCORE, POLICE_AVAILABLE_SCORE];
				//sleep 10;
				sleep 1;
			}
		}
	};
	
	[] call func_POLICE_RISK_LEVEL_UP;
};

hintc "FUNC_PoliceStation_Cycle: Cycle disabled!";