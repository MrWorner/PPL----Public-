//fnc_CreateDebugMarker
private["_pos", "_mkr"];

_pos = _this select 0;
_color = _this select 1; 

_mkr = createMarker [format ["M%1", random 1000], _pos];
_mkr setMarkerBrush "Solid";
_mkr setMarkerShape "ELLIPSE";
_mkr setMarkerColor _color;
_mkr setMarkerSize [10, 10];
