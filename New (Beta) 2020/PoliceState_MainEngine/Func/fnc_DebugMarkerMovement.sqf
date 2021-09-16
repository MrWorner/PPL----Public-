//fnc_DebugMarkerMovement.sqf
private["_pos1", "_pos2", "_mkr1"];

_pos2 = [0,0,0]; 
while {alive _this} do 
{	
	sleep 0.1;
	_pos1 = position vehicle _this; 
	if(_pos2 distance _pos1 > 40)then
	{
		_pos2 = _pos1;
		_mkr1 = createMarker [format ["M%1", random 10000], _pos1];
		_mkr1 setMarkerBrush "Solid";
		_mkr1 setMarkerShape "RECTANGLE";
		_mkr1 setMarkerColor "ColorPink";
		_mkr1 setMarkerSize [20, 20];
	};
}

