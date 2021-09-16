//FUNC_CreateRestrictedArea


private["_this","_YellolCode","_RedCode","_Position","_da","_marker","_marker2","_marker3","_Activate","_x","_RestrictedArea","_YellowTrue","_RedTrue"];
_YellolCode = _this select 0;
_RedCode = _this select 1;
_Position = _this select 2;
_Position = _Position select 0;

_da = "RestrictedArea: " + format ["%2_%1",count RestrictedAreas_array, (round (random 100))];
_marker = createMarker [_da, (getpos _Position)];
_marker setMarkerType "HW_Done";


_marker setMarkerColor "ColorRedAlpha";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [_YellolCode, _YellolCode];


_da = "RestrictedAreaDANGER: " + format ["%2_%1",count RestrictedAreas_array, (round (random 100))];
_marker2 = createMarker [_da, (getpos _Position)];
_marker2 setMarkerColor "ColorRedAlpha";
_marker2 setMarkerShape "ELLIPSE";
_marker2 setMarkerBrush "Solid";
_marker2 setMarkerSize [_RedCode, _RedCode];


_da = "RestrictedAreaLOGO: " + format ["%1",(round (random 100))];
_marker3 = createMarker [_da, (getpos _Position)];
_marker3 setMarkerType "HW_BlackWater";

_Activate = false;

RestrictedAreas_array = RestrictedAreas_array + [[_marker,_marker2,_YellolCode,_RedCode]];
if(RestrictedAreas_activated)exitwith{};
RestrictedAreas_activated = true;
while{(RestrictedAreas_activated)}do
{
_YellowTrue = false;
_RedTrue = false;

	{
		if(count (_x getVariable "BW_WantedFor") < 1)then
		{
			_suspect = _x;
			{	
				//_RestrictedArea = _x;
				_marker = _x select 0;
				_marker2 = _x select 1;
				_YellolCode = _x select 2;
				_RedCode =  _x select 3;		
				if( (_suspect distance (getmarkerpos _marker)) < _YellolCode)then
				{
					if!(_YellowTrue)then{_YellowTrue = true};
					
					if( (_suspect distance (getmarkerpos _marker2)) < _RedCode)then
					{
						if!(_RedTrue)then{_RedTrue = true};
					};
			
				};
		
				if(_RedTrue)exitwith{};
				//player sidechat format ["Area: %1 %2",_marker, name _suspect];
			}foreach RestrictedAreas_array;
				
			if(_YellowTrue)then
			{
				if(!(_x getVariable "Tresspassing_Yellow"))then{_x setVariable ["Tresspassing_Yellow",true,true]; };
			}
			else
			{
				if((_x getVariable "Tresspassing_Yellow"))then{_x setVariable ["Tresspassing_Yellow",false,true]; };
			};
			
			if(_RedTrue)then
			{
				if(!(_x getVariable "Tresspassing_Red"))then{_x setVariable ["Tresspassing_Red",true,true]; };
			}
			else
			{
				if((_x getVariable "Tresspassing_Red"))then{_x setVariable ["Tresspassing_Red",false,true]; };
			};
		};	
	}foreach Array_SuspectSide;
sleep 1;
};
//};