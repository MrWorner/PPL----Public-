_tax = _this select 0;
_CarHere = false;

_da = "MarkerNo" + format ["%1", round( random 999) ];
TaxiParkingMarkers = TaxiParkingMarkers + [_da];
_marker = createMarker [_da, getpos _tax ];
_marker setMarkerType "HW_Taxi1";


while{true}do{


	_objects = nearestObjects[_tax, ["Car"], 25];
        {
    if ((((TypeOf _x) == "GLT_M300_ST")or((TypeOf _x) == "GLT_M300_LT")) and ((_tax distance _x) < 25) )then{_marker  setMarkerType "HW_Taxi3"; sleep 5;};
        
		
		} forEach _objects;
		sleep 2;
		_marker setMarkerType "HW_Taxi1";



};