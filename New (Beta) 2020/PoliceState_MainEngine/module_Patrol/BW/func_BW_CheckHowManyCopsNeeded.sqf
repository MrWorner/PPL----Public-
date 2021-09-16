//func_BW_CheckHowManyCopsNeeded.sqf
private["_AvailableJobToHelp","_group","_x","_suspect", "_distance", "_SuspectChosen", "_MIN_Distance","_countPoliceUnits","_BWLeader","_this","_GroupMission"];
_group = _this;
_BWLeader = vehicle leader _group;
_AvailableJobToHelp = Array_BW_SuspectsInChase ;
_MIN_Distance = 9999999;
_SuspectChosen = ObjNull;
_countPoliceUnits = 0;  //Not group, every police officer
_GroupMission = _group getvariable "Mission";

if(_GroupMission != "PassiveGuardian")then
{
	{	
		_suspect = _x;
		{
				if( (_x getvariable "BW_ChaseSuspect") == _suspect)then
				{
					_countPoliceUnits = _countPoliceUnits + count units _x;		
					if((_countPoliceUnits > 10)and(_suspect distance _BWLeader > 1500))then
					{
						_AvailableJobToHelp = _AvailableJobToHelp - [_suspect];
					};			
				};	
		} foreach BWGroups;
		_countPoliceUnits = 0;
	} foreach Array_BW_SuspectsInChase ;
}
else
{
	{	
		_suspect = _x;
		{
			if((_suspect distance _BWLeader > 700))then
			{
				_AvailableJobToHelp = _AvailableJobToHelp - [_suspect];	
			};						
			//hint "DZZZ";
		} foreach BWGroups;
		_countPoliceUnits = 0;
	} foreach Array_BW_SuspectsInChase ;
}; 

if(count _AvailableJobToHelp == 0)then
{
	_SuspectChosen = ObjNull;
}
else
{
	{
		_distance = vehicle _BWLeader distance getPos _x;
		if(_distance < _MIN_Distance)then
		{	
			_MIN_Distance = _distance;
			_SuspectChosen = _x;		
		};
	}foreach _AvailableJobToHelp;
};

//hintc format ["_AvailableJobToHelp = %1, Array_BW_SuspectsInChase  = %2, _SuspectChosen = %3",count _AvailableJobToHelp,count Array_BW_SuspectsInChase ,name _SuspectChosen];
player globalchat format ["_AvailableJobToHelp = %1, Array_BW_SuspectsInChase  = %2, _SuspectChosen = %3",count _AvailableJobToHelp,count Array_BW_SuspectsInChase ,name _SuspectChosen];	

_SuspectChosen


	