//func_Taxi_MoveToDestinaion.sqf

private["_this", "_TaxiDriver","_Client","_Destination","_payment","_speed"];

sleep 0.2;
_Client = player;
_TaxiDriver = ObjNull;
if(_Client getVariable "TaxiPayment" > 0)then{_payment = (_Client getVariable "TaxiPayment");}else{_payment = 5;};



{
	if(vehicle player == vehicle _x and alive _x and _x == driver vehicle _x)exitwith
	{
		_TaxiDriver = _x;
	};
}foreach Array_TaxiDrivers;



if(isnull _TaxiDriver)exitwith{player sidechat "func_Taxi_MoveToDestinaion: No available taxi driver";};


while {(count (waypoints group _TaxiDriver)) > 0} do
{
	deleteWaypoint ((waypoints group _TaxiDriver) select 0);
};
_Destination = getMarkerPos ("Taxi_marker_" + name _Client);
//hintc format ["_Destination = %1 %2",_Destination,name _TaxiDriver];
_waypoint = group _TaxiDriver addwaypoint [_Destination,1];
_waypoint setwaypointtype "MOVE"; 
_waypoint = group _TaxiDriver addwaypoint [_Destination,1];
_waypoint setwaypointtype "MOVE"; 
if(_Client getVariable "TaxiDestinationWIP")exitwith{player sidechat format ["%1: Ok, moving to new position!",name _TaxiDriver];};
player sidechat format ["It's %1, let's move!",name _TaxiDriver];


_Client setVariable ["TaxiDestinationWIP",true,true];



//	_Client getVariable "TaxiDestinationPos"; 
//	_Client getVariable "TaxiPayment"; 
//	_Client setVariable ["TaxiPayment",0,true]; //TAXI MODULE CLIENT


//if(true)exitwith{};

while{((_Client in (crew (vehicle _TaxiDriver)))and(_Destination distance (vehicle _TaxiDriver) > 10))}do
{
	sleep 1;
	_Destination = getMarkerPos ("Taxi_marker_" + name _Client);
	titleText [ format ["Taximeter: %1$", _payment], "PLAIN"];
	//player sidechat format ["$%1 for taxi service", _payment];

	_speed = (speed (vehicle _TaxiDriver));
	if(_speed < 0)then{_speed = _speed * (-1)};
	_payment = _payment + (round(_speed/5))/100;
	
	
};
player sidechat format ["Please open the Action menu to make payment $%1.", _payment];
deleteMarker ("Taxi_marker_" + name _Client);
_Client setVariable ["TaxiDestinationWIP",false,true];
_Client setVariable ["TaxiPayment", ((_Client getVariable "TaxiPayment") + _payment), true];
//hintc "func_Taxi_MoveToDestinaion done!";


while{((_Client distance (vehicle _TaxiDriver) < 20))}do
{
	sleep 5;
};

if(_Client getVariable "TaxiPayment" > 0)then
{
	_Client setVariable ["WantedFor",((_Client getVariable "WantedFor") + ["Taxi service escape"]),true];
	player sidechat format ["%1: Hey! I'm calling the police!",name _TaxiDriver];
	[_Client,(position _Client),false] call func_CreateInvestigation; 
	_Client setVariable ["TaxiPayment",0,true];
};
