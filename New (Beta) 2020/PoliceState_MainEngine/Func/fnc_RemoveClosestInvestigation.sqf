//fnc_removeClosestInvestigation.sqf 2020
private[ "_group", "_removeRed", "_pos", "_marker", "_color"];

_group = _this select 0;
_removeRed = _this select 1;

{
	_marker = _x;
	_color = getMarkerColor _marker ;
	//hintc format ["fnc_removeClosestInvestigation: investigation _color: %1", _color];
	if( (_removeRed && _color == "ColorRed") || (_color == "Default") )then
	{
		{		
			if(vehicle _x distance GetMarkerPos _marker < 50)then
			{
				NeedToInvestigate  = NeedToInvestigate - [_marker];
				deleteMarker _marker;
				player sidechat format ["fnc_removeClosestInvestigation: investigation deleted: %1", _marker];
				//hintc format ["fnc_removeClosestInvestigation: investigation deleted: %1", _marker];
				//sleep 0.01;
			};
		
		}foreach units _group;		
	}
}foreach NeedToInvestigate;




