

isdead = 1;

_killer 	= _this select 0;
_nearVehicles  	= _this select 1;
_killerLicense  = 0;
suicided    	= false;
_murdered	= true;
_killerstring	= format["%1", _killer];

if (!(_killer call ISSE_UnitExists)) then 

{
																
(format ["[""Died"", ""%1""] spawn Isse_AddCrimeLogEntry;kopfgeld_%1 = 0;", rolestring]) call broadcast;

} 
else 
{

_killedByVehicle = false;

if (player == _killer) then 

	{

	_murdered = false;

	if(typename _nearVehicles == "STRING" and INV_hunger <= 99)exitwith{suicided = true;player globalchat "Exit99?";};

		{

		if (  (speed _x > 10) and (!(isNull(driver _x)))  ) then 

			{

			_killer		 = driver _x;
			_killedByVehicle = true;
			_vehicle         = typeof _x;
			_infos           = _vehicle call INV_getitemArray;
			_killerlicense    = (_infos select 4) select 1;
			_killerstring 	 = format["%1", _killer];
			
			};

		} forEach _nearVehicles;

	};

if(side _killer == EAST and !isPlayer _killer) exitwith

	{
player globalchat "Exit97?";
	format['["Died", "%1"] spawn Isse_AddCrimeLogEntry;kopfgeld_%1 = 0;server globalChat "%2 убит взводом охраны!"', player, name player] call broadcast;

	}; 

(format ["
[""Died"", ""%1""] spawn Isse_AddCrimeLogEntry;
if(%7 and !%5)then{server globalChat ""%3 был убит %4""};
if (%5) then {server globalChat ""%3 был сбит автомобилем под управлением  %4"";};
if(INV_hunger >= 100)exitwith{server globalChat ""%3 умер голодной смертью!""};
if(player == %8) then {[%1, %5, %6] execVM ""killer.sqf""};
", player,  _killer, name player, name _killer, _killedByVehicle, _killerLicense, _murdered, _killerstring]) call broadcast;

};

//kopfgeld_%1 = 0;
 
