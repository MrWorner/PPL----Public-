//func_CallTaxi

private["_this", "_TaxiDriverCHosen","_Client"];


_Client = player;
_TaxiDriverCHosen = ObjNull;
_DIstance = 999999;


{
	if(vehicle _x distance vehicle _Client < _DIstance)then
	{
		_TaxiDriverCHosen = _x;
		_DIstance = vehicle _x distance vehicle _Client;
	};
}foreach Array_TaxiDrivers;


if(isnull _TaxiDriverCHosen)exitwith{player sidechat "No available taxi driver";};


while {(count (waypoints group _TaxiDriverCHosen)) > 0} do
{
	deleteWaypoint ((waypoints group _TaxiDriverCHosen) select 0);
};

_waypoint = group _TaxiDriverCHosen addwaypoint [position _Client,5];
_waypoint setwaypointtype "MOVE"; 
_waypoint = group _TaxiDriverCHosen addwaypoint [position _Client,5];
_waypoint setwaypointtype "MOVE"; 

player sidechat format ["It's %1, I'm moving to your location!",name _TaxiDriverCHosen];