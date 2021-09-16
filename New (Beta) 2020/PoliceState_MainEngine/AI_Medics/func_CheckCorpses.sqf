//func_CheckCorpses.sqf
private["_AvailableDeadBodiesMarkers","_group","_x","_DeadBodyMarker", "_distance", "_DeadBodiesCHosenARRAY", "_MIN_Distance","_CcountMedicUnits","_Leader","_this","_Count"];
_group = _this;
_Leader = vehicle leader _group;
_AvailableDeadBodiesMarkers = DeadBodyMARKERS_Array;
_MIN_Distance = 9999999;
_DeadBodiesCHosenARRAY = [];
_CcountMedicUnits = 0;  //Not group, every man
_ClosestCorpMarker = "";

//** TO ELIMINATE ALL ALREADY USED BY OTHER GROUPS
{
	_DeadBodyMarker = _x;
	if(_DeadBodyMarker in (_group getvariable "FailedWaypointJob"))then
	{
	_AvailableDeadBodiesMarkers = _AvailableDeadBodiesMarkers - [_DeadBodyMarker];
	}
	else
	{
		{
			if(_DeadBodyMarker in (_x getvariable "CurrentDeadBodies"))then
			{		
					_AvailableDeadBodiesMarkers = _AvailableDeadBodiesMarkers - [_DeadBodyMarker];		
			};
			
		}foreach MedicGroups;
	
	};
}foreach DeadBodyMARKERS_Array;
//** TO ELIMINATE ALL ALREADY USED BY OTHER GROUPS END


//hintc format ["func_CheckCorpses _AvailableDeadBodiesMarkers = %1", _AvailableDeadBodiesMarkers];




if(count _AvailableDeadBodiesMarkers == 0)exitwith{_DeadBodiesCHosenARRAY;};
	
	
//** TO GET CLOSEST CORP	
{
	_distance = _Leader distance getMarkerPos _x;
	if(_distance < _MIN_Distance)then
	{	
		_MIN_Distance = _distance;
		_ClosestCorpMarker = _x
	};
}foreach _AvailableDeadBodiesMarkers;
_AvailableDeadBodiesMarkers = _AvailableDeadBodiesMarkers - [_ClosestCorpMarker];
_DeadBodiesCHosenARRAY = _DeadBodiesCHosenARRAY + [_ClosestCorpMarker];
//** TO GET CLOSEST CORP END
	
	

//** TO GET 3 MORE CORP	NEAR THE CLOSEST BODY
_Count = 1;
{

	if(_Count < 6)then
	{	
		_distance = getMarkerPos _ClosestCorpMarker distance getMarkerPos _x;
		if(_distance < 100)then
		{	
			_DeadBodiesCHosenARRAY = _DeadBodiesCHosenARRAY + [_x];
			player groupchat format ["ADDED to _DeadBodiesCHosenARRAY = %1", _x];
			_Count = _Count + 1;
		};
	};
}foreach _AvailableDeadBodiesMarkers;
//** TO GET 3 MORE CORP NEAR THE CLOSEST BODY END

	
//hintc format ["func_CheckCorpses END: _DeadBodiesCHosenARRAY = %1", _DeadBodiesCHosenARRAY];

//player sidechat  format ["NeedToInvestigate = %1", NeedToInvestigate];



_group setVariable ["CurrentDeadBodies",_DeadBodiesCHosenARRAY,true];
_DeadBodiesCHosenARRAY


	