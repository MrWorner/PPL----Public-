//FUNC_Hospital_Cycle

private["_ChosenStationArray","_AliveMedics","_WorkNeedsMedics"];


sleep 10;



while{HospitalCycle_Started}do
{
	_AliveMedics = Count_TotalMedics - Count_KilledMedics;
	_WorkNeedsMedics = Count_TOTAL_DEAD_BODIES - Medic_TOTAL_WorkDoneCount;
	//sleep (30 round (random 120));	
	sleep 3;	

	//player sidechat format ["FUNC_Hospital_Cycle = %1 %2  _WorkNeedsMedics = %3  _AliveMedics = %4",(_WorkNeedsMedics > (_AliveMedics*3)), (LIMIT_MedicUnits > _AliveMedics), _WorkNeedsMedics, _AliveMedics];
	
		if( (_WorkNeedsMedics > (_AliveMedics*10))and(LIMIT_MedicUnits > _AliveMedics))then
		{
			while{ ( (_WorkNeedsMedics > (_AliveMedics*10))and(LIMIT_MedicUnits > _AliveMedics)) }do 
			{
				if(count HospitalArray == 1)then
				{
					_ChosenStationArray = HospitalArray select 0;
				}
				else
				{
					_ChosenStationArray =  HospitalArray select (round(random((count HospitalArray) - 1)));			
				};			
				_ChosenStationArray spawn func_MedicWave_Spawn; //<-----------------------------		
				//sleep 10;
				sleep 1;
				_AliveMedics = Count_TotalMedics - Count_KilledMedics;
				_WorkNeedsMedics = Count_TOTAL_DEAD_BODIES - Medic_TOTAL_WorkDoneCount;
			}
		}
	
};

hintc "FUNC_Hospital_Cycle: Cycle disabled!";