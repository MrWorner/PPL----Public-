//func_BW_CheckCLOSESTAvailableINV.sqf
private["_AvailableInvestigationMarkers","_group","_x","_MarkerName", "_distance", "_MarkerCHosen", "_MIN_Distance","_this"];
_group = _this;
_BWLeader = vehicle leader _group;
_AvailableInvestigationMarkers = BWNeedToInvestigate ;
_MIN_Distance = 350;
_MarkerCHosen = "";
//_MarkerName = _group getvariable "CurrentInvestigationMarker";
{
	_MarkerName = _x;
	if(_MarkerName in (_group getvariable "FailedWaypointJob"))then
	{
	_AvailableInvestigationMarkers = _AvailableInvestigationMarkers - [_MarkerName];
	};
	
}foreach BWNeedToInvestigate ;

if(count _AvailableInvestigationMarkers == 0)exitwith{_MarkerCHosen;};

	{
		_distance = _BWLeader distance getMarkerPos _x;
		if(_distance < _MIN_Distance)then
		{	
			_MIN_Distance = _distance;
			_MarkerCHosen = _x;
		};
	}foreach _AvailableInvestigationMarkers;
//player globalchat format ["func_BW_CheckCLOSESTAvailableINV THE CLOSEST _MarkerCHosen = %1", _MarkerCHosen];
//hintc format ["func_BW_CheckCLOSESTAvailableINV THE CLOSEST _MarkerCHosen = %1", _MarkerCHosen];

_MarkerCHosen


	