//func_MedicWorkMarker FOR TESTING
if!(OnlineMarkers)exitwith{};
private["_NAME","_POS","_this","_marker","_TEXT","_result"];

_NAME = _this select 0;
_POS = _this select 1;
_TEXT= _this select 2;

_result = true;
//hintc format ["_POS = %1 %2 %3",_POS,_NAME,_TEXT];
_result = _POS call func_calc_CheckEqualPos;

if(_result)exitwith{};
_marker = createMarker [_NAME, _POS];



switch (_TEXT) do 
{
		
	case "REMOVE_CORP": 
	{  
		_marker setMarkerType "HW_medic_RemoveCorp2";
		//_marker setMarkerColor "ColorWhite";
	};		
	case "": 
	{  
		_marker setMarkerType "HW_medic_Heal";
		//_marker setMarkerColor "Default";
	};	
	case "": 
	{  
		_marker setMarkerType "HW_medic_Heal2";
		//_marker setMarkerColor "Default";
	};		
		
	default 
	{ 
		hint "default !func_MedicWorkMarker.SQF!";
		_marker setMarkerType "Marker";
		//_marker setMarkerColor "Default";
	};
};


///_marker setMarkerColor "ColorWhite";
///_marker setMarkerText _TEXT;
sleep 5;
deleteMarker _marker;



