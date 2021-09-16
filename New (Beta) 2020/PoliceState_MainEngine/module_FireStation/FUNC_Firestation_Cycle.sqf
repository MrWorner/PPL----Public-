//FUNC_Firestation_Cycle

private["_ChosenStationArray","_AliveFirefighters","_WorkNeedsFirefighters"];


sleep 10;



while{FirestationCycle_Started}do
{
	_AliveFirefighters = Count_TotalFirefighters - Count_KilledFirefighters;
	_WorkNeedsFirefighters = Count_TOTAL_DESTROYED_CARS - Firefighter_TOTAL_WorkDoneCount;
	//sleep (30 round (random 120));	
	sleep 3;	

	//player sidechat format ["FUNC_Firestation_Cycle = %1 %2  _WorkNeedsFirefighters = %3  _AliveFirefighters = %4",(_WorkNeedsFirefighters > (_AliveFirefighters*3)), (LIMIT_FirefighterUnits > _AliveFirefighters), _WorkNeedsFirefighters, _AliveFirefighters];
	
		if( (_WorkNeedsFirefighters > (_AliveFirefighters*4))and(LIMIT_FirefighterUnits > _AliveFirefighters))then
		{
			while{ ( (_WorkNeedsFirefighters > (_AliveFirefighters*4))and(LIMIT_FirefighterUnits > _AliveFirefighters)) }do 
			{
				if(count FireStationArray == 1)then
				{
					_ChosenStationArray = FireStationArray select 0;
				}
				else
				{
					_ChosenStationArray =  FireStationArray select (round(random((count FireStationArray) - 1)));			
				};			
				_ChosenStationArray spawn func_FirefighterWave_Spawn; //<-----------------------------		
				//sleep 10;
				sleep 5;
				_AliveFirefighters = Count_TotalFirefighters - Count_KilledFirefighters;
				_WorkNeedsFirefighters = Count_TOTAL_DESTROYED_CARS - Firefighter_TOTAL_WorkDoneCount;
			}
		}
	
};

hintc "FUNC_Firestation_Cycle: Cycle disabled!";