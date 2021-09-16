//func_BW_CheckAvailableINV.sqf
private["_AvailableInvestigationMarkers","_group","_x","_MarkerName", "_distance", "_MarkerCHosen", "_MIN_Distance","_countPoliceUnits","_BWLeader","_this"];
_group = _this;
_BWLeader = vehicle leader _group;
_AvailableInvestigationMarkers = BWNeedToInvestigate ;
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
		if(getMarkerPos _MarkerName distance _BWLeader > 500)then
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
				
			}foreach BWGroups;
			_countPoliceUnits = 0;
		};
	};
	
	
}foreach BWNeedToInvestigate ;
//hintc format ["func_BW_CheckAvailableINV _AvailableInvestigationMarkers = %1", _AvailableInvestigationMarkers];
if(count _AvailableInvestigationMarkers == 0)exitwith{_MarkerCHosen;};
	{
		_distance = _BWLeader distance getMarkerPos _x;
		if(_distance < _MIN_Distance)then
		{	
			_MIN_Distance = _distance;
			_MarkerCHosen = _x;
		};
	}foreach _AvailableInvestigationMarkers;

//hintc format ["func_BW_CheckAvailableINV _MarkerCHosen = %1", _MarkerCHosen];

//player sidechat  format ["BWNeedToInvestigate  = %1", BWNeedToInvestigate ];
_MarkerCHosen


	