//func_CheckHowManyCopsNeeded.sqf
private["_AvailableJobToHelp","_group","_x","_suspect", "_distance", "_SuspectChosen", "_MIN_Distance","_countPoliceUnits","_CopLeader","_this","_GroupMission"];
_group = _this;
_CopLeader = vehicle leader _group;
_AvailableJobToHelp = Array_SuspectsInChase;
_MIN_Distance = 9999999;
_SuspectChosen = ObjNull;
_countPoliceUnits = 0;  //Not group, every police officer
_GroupMission = _group getvariable "Mission";

if(_GroupMission != "PassiveGuardian")then
{
	{	
		_suspect = _x;
		{
				if( (_x getvariable "CurrentSuspect") == _suspect)then
				{
					_countPoliceUnits = _countPoliceUnits + count units _x;		
					if((_countPoliceUnits > 10)and(_suspect distance _CopLeader > 1500))then
					{
						_AvailableJobToHelp = _AvailableJobToHelp - [_suspect];
					};			
				};	
		} foreach PoliceGroups;
		_countPoliceUnits = 0;
	} foreach Array_SuspectsInChase;
}
else
{
	{	
		_suspect = _x;
		{
			if((_suspect distance _CopLeader > 700))then
			{
				_AvailableJobToHelp = _AvailableJobToHelp - [_suspect];	
			};						
			//hint "DZZZ";
		} foreach PoliceGroups;
		_countPoliceUnits = 0;
	} foreach Array_SuspectsInChase;
}; 

if(count _AvailableJobToHelp == 0)then
{
	_SuspectChosen = ObjNull;
}
else
{
	{
		_distance = vehicle _CopLeader distance getPos _x;
		if(_distance < _MIN_Distance)then
		{	
			_MIN_Distance = _distance;
			_SuspectChosen = _x;		
		};
	}foreach _AvailableJobToHelp;
};

//hintc format ["_AvailableJobToHelp = %1, Array_SuspectsInChase = %2, _SuspectChosen = %3",count _AvailableJobToHelp,count Array_SuspectsInChase,name _SuspectChosen];
player globalchat format ["_AvailableJobToHelp = %1, Array_SuspectsInChase = %2, _SuspectChosen = %3",count _AvailableJobToHelp,count Array_SuspectsInChase,name _SuspectChosen];	

_SuspectChosen


	