
_detector = 
{
_pos = _this select 0;
_timenow = time;

	while{time < (_timenow + 10) || (!(isnull _pos))}do
	{  
	  
		sleep 1;
		if(!(isnull _pos))then
		{
			if(count(nearestObjects [_pos, ["Man"], 15]) > 0)then
			{
				//Hint "Player Detected";
				{
				   if((side _x != west)and not(_x in StunnedpeopleFlashBang2))then{[_x,_pos] execVM "stun\StunEffectGas.sqf";};
				}foreach nearestObjects [_pos, ["Man"], 15];
			}else{
				//Hint "Player Not Detected";
				{
					_unit = _x;
					_unit setVariable ["flashed",false, true];
					{
						if(_x == _unit)then
						{
							StunnedpeopleFlashBang2 = StunnedpeopleFlashBang2 - [_x];
						};
					}foreach StunnedpeopleFlashBang2;
				}foreach StunnedpeopleFlashBang2;
			};
		};
	};
};

_detectorB = 
{

sleep 1;
_pos = _this select 0;
_timenow = time;
	while{time < (_timenow + 10) || (!(isnull _pos))}do
	{   
		sleep 1;
		if(!(isnull _pos))then
		{
		

				{
				
                 if(side _x != west)then{[_x] execVM "stun\StunEffectFLashbang.sqf";};
				
				}foreach nearestObjects [_pos, ["Man"], 50];

		};
	};
};

_shooter = _this Select 0; 
_ammotype = _this Select 1;
if((_ammotype == "1Rnd_Smoke_M203") or (_ammotype == "6Rnd_Smoke_M203"))then {_ammotype = "G_40mm_Smoke"};


_bullet = nearestObject [_shooter , _ammotype];
_BPos = [];
//hintc format ["_ammotype = %1",_ammotype];
//sleep 0.1;
//hintc format ["_bullet = %1",_bullet];

while {!isNull _bullet and ((velocity _bullet)select 0 > 0.1)} do
{
	_BPos = getPos _bullet;
};
switch (_ammotype) do
{
    case "SmokeShell":
    {
	    
		[_bullet] call _detector;
    };   
	

	
	
	case "G_40mm_Smoke":
    {
		[_bullet] call _detector;
    };   
    case "RAB_L111A1":
    {

		[_bullet] call _detectorB;
	};
};


sleep 10;
