//func_Prison_SimpleTeleport.sqf

private["_Susp","_this","_timer"];
_Susp = _this select 0;
_ArrestType = _this select 1;
_timer = 60;


while{((_Susp getvariable "Arrested")and(alive _Susp))}do
{
//player sidechat format ["count playableUnits = %1", count playableUnits];
	sleep 1;	
	_timer = _timer - 1;
	if(_Susp == Player)then{titleText [ format ["%1 second(s) UNTIL EVACUATION TO LOCAL PRISON", _timer], "PLAIN"];};
	if(_timer < 1)exitwith
	{
		if(_ArrestType == West)then
		{
			Player globalchat format ["Suspect %1 was evacuated to local prison",name _Susp];
		}
		else
		{
			Player globalchat format ["Suspect %1 was evacuated to local BlackWater prison",name _Susp];
		};
		
		
		_Susp removeAllEventHandlers "killed";
		_Susp removeAllEventHandlers "HandleDamage";
		_Susp removeAllEventHandlers "fired";		
		DeleteMarker (_Susp getvariable "MyMarkerName");
		Array_ArrestedGuys = Array_ArrestedGuys - [_Susp];
		if(_Susp != Player)then{deletevehicle _Susp;}else
		{
			if(count playableUnits > 1)then
			{
				{
					_x groupChat "I'm a playable unit.";
					if(player != _x)exitwith
					{
						selectPlayer _x;
						deletevehicle _Susp;
					};
				} forEach playableUnits;
			}
			else
			{
				endMission "END1";
			};
			
				
		};
		
	};

};