//func_markers.sqf
private["_x","_marker","_subj"];
if(SHOWTMessageLVL2)then{player globalchat format ["|---func_markers: LOADED!", player];};// MESSAGE LVL2
if!(OnlineMarkers)exitwith{player globalchat format ["|---func_markers: TURNED OFF!", player];};
[] spawn func_CycleMarkers;
sleep 1;
while{(OnlineMarkers)}do
{

	{
		_subj = _x;
		_marker = _subj getVariable "MyMarkerName";
		IF!(alive _subj)THEN
		{
			
			//UnitsWIthMarkers = UnitsWIthMarkers - [_x];
			if!(isnil "_marker")then{_marker SETMARKERPOS GETPOS _subj;};
			//_marker setMarkerType "HW_DeadBody";
			if(isnil "_subj")then{DeleteMarker _marker;};
		}
		ELSE
		{	
			_marker SETMARKERPOS GETPOS _subj;		
		};
		
		
		
		
			switch ( (side _subj) ) do 
		{
		
			case west: 
			{  
					//WIP CAR MARKERS
					//if!(vehicle _subj isKindOf "LandVehice")then
					//{
					//	if()
					//	_marker setMarkerType "HW_car_SWATvan";
					//	_marker setMarkerColor "ColorBlue";
					//}
					//else
					//{
						_marker setMarkerType "HW_Man_PoliceOfficer";
					//	_marker setMarkerColor "Default";
					//}
				
			};
			case east: 
			{
				
				
				if(count (_subj getVariable "WantedFor") > 0)then
				{
					
					if(_subj getVAriable "GivingUp")then
					{
						_marker setMarkerType "HW_Man_SurrenderFLAG";
					}
					else
					{
						if(_subj getVAriable "Dangerous")then
						{						
							_marker setMarkerType "HW_Man_Red";
						}
						else
						{
							_marker setMarkerType "HW_Man_Orange";
						}
					};
					
					
				}
				else
				{
					_marker setMarkerType "HW_Man_Yellow";
				};
				
				
				
				
			};
			case Resistance: 				
			{  
				_marker setMarkerType "HW_Man_BlackWater";
				
				//if((TypeOF _subj == "Ard_PMC_2")or(TypeOF _subj == "Ard_PMC_4")or(TypeOF _subj == "Ard_PMC_1"))then
				//{
				//	_marker setMarkerType "HW_BWagent";
				//}
				
			};
			case Civilian: 				
			{  
				if(alive _subj)then
				{
					if(_subj getVAriable "Arrested")then
					{
						_marker setMarkerType "HW_Man_Grey";
					}
					else
					{
						switch (TypeOF _subj) do 
						{
							case "RU_Doctor": {_marker setMarkerType "HW_Man_Medic";};	
							case "TK_CIV_Worker01_EP1": {_marker setMarkerType "HW_Man_Firefighter";};		
							default { _marker setMarkerType "HW_Man_Green2";};
						}
					}			
				};
				//else
				//{
				//	_marker setMarkerType "Destroy";
				//};
				//player sidechat format ["_subj = %1",name _subj];
			};
			default 
			{ 
				if!(isNil "_marker")then{_marker setMarkerType "HW_Man_Grey";};		
			};
			
		};	
		
		
	}foreach UnitsWIthMarkers;

	SLEEP 3;
};

{
	_marker =_x select 1;
	DeleteMarker _marker;
}foreach UnitsWIthMarkers;
UnitsWIthMarkers = [];
RegisteredUnitsWIthMarkers = [];