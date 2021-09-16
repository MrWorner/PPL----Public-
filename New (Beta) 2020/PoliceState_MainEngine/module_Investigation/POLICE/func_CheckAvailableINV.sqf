//func_CheckAvailableINV.sqf
private["_AvailableInvestigationMarkers","_group","_x","_MarkerName", "_distance", "_MarkerCHosen", "_MIN_Distance","_countPoliceUnits","_CopLeader","_this"];
_group = _this;
_CopLeader = vehicle leader _group;
_AvailableInvestigationMarkers = NeedToInvestigate;
_MIN_Distance = 9999999;
_MarkerCHosen = "";
_countPoliceUnits = 0;  //Not group, every police officer
//_MarkerName = _group getvariable "CurrentInvestigationMarker";
{
	_MarkerName = _x;
	if(_MarkerName in (_group getvariable "FailedWaypointJob"))then
	{
	_AvailableInvestigationMarkers = _AvailableInvestigationMarkers - [_MarkerName];
	}
	else
	{
		if(getMarkerPos _MarkerName distance _CopLeader > 500)then
		{
			{
				if( (_x getvariable "CurrentInvestigationMarker") == _MarkerName)then
				{
					_countPoliceUnits = _countPoliceUnits + count units _x;
					if(_countPoliceUnits > 10)then
					{
						_AvailableInvestigationMarkers = _AvailableInvestigationMarkers - [_MarkerName];
					};			
				};
				
			}foreach PoliceGroups;
			_countPoliceUnits = 0;
		};
	};
	
	
}foreach NeedToInvestigate;
//hintc format ["func_CheckAvailableINV _AvailableInvestigationMarkers = %1", _AvailableInvestigationMarkers];
if(count _AvailableInvestigationMarkers == 0)exitwith{_MarkerCHosen;};
	{
		_distance = _CopLeader distance getMarkerPos _x;
		if(_distance < _MIN_Distance)then
		{	
			_MIN_Distance = _distance;
			_MarkerCHosen = _x;
		};
	}foreach _AvailableInvestigationMarkers;

//hintc format ["func_CheckAvailableINV _MarkerCHosen = %1", _MarkerCHosen];

//player sidechat  format ["NeedToInvestigate = %1", NeedToInvestigate];
_MarkerCHosen


	