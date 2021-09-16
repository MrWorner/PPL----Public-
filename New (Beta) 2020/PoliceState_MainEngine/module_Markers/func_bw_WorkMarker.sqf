//func_bw_WorkMarker FOR TESTING

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
		
	case "CHASING": 
	{  
		_marker setMarkerType "BW_Target";
	};		
	case "BACKUP": 
	{  
		_marker setMarkerType "BW_TargetSupport";
	};	
	case "DISMISS": 
	{  
		_marker setMarkerType "BW_GoGuard_yellow";
	};		
	case "INVESTIGATING": 
	{  
		_marker setMarkerType "HW_GoInvestigate_Green";
	};		
	case "No Patrol Points": 
	{  
		_marker setMarkerType "BW_GoGuard";
	};		
	case "PATROLING": 
	{  
		_marker setMarkerType "BW_GoGuard_Blue";
	};		
	case "GUARDIAN": 
	{  
		_marker setMarkerType "BW_GoGuard_Green";
	};		
	default 
	{ 
		hint "default !func_bw_WorkMarker.SQF!";
		_marker setMarkerType "Marker";
	};
};


///_marker setMarkerColor "ColorWhite";
///_marker setMarkerText _TEXT;
sleep 5;
deleteMarker _marker;



