_group = _this select 0;
_Car = _this select 1;
_Assistant = _this select 2;
_WeHaveDestroyedCar = false;
_lock = false;
_MarkerName1 = "";
sleep 1;
_WeWillTakeIt = getpos player;

while {{alive _x} count units _group != 0} do {  

sleep 0.5;
_CountDead = count NotAliveCar;

if(_CountDead > (0 + CarDestroyedFix))then{ _WeHaveDestroyedCar=true; _MarkerName1 = NotAliveCarmarker select 0;   NotAliveCarmarker = NotAliveCarmarker - [_MarkerName1]; _WeWillTakeIt = NotAliveCar select CarDestroyedFix; CarDestroyedFix = CarDestroyedFix +1; }; //player globalchat "Приняли вызов!.";


//player globalchat format ["_MarkerName1? = %1",_MarkerName1];
//player globalchat format ["_WeWillTakeIt? = %1",_WeWillTakeIt];
//***** Стоять на месте, никаких сообщений не поступали.
if!(_WeHaveDestroyedCar)then
{

	
	
    //player globalchat "Нету сообщений об убийстве.";
	sleep 7;
};
//**

//*******
if((_WeHaveDestroyedCar)and!(_lock))then
{ 
    _lock = true;
    // player globalchat "Выехали";
     deleteWaypoint [_group, 1];
     deleteWaypoint [_group, 0];
	 _wp = _group addWaypoint [_WeWillTakeIt, 0]; 
	 _wp = _group addWaypoint [_WeWillTakeIt, 1]; 
    [_group, 0] setWaypointType "GETOUT"; 
    [_group, 1] setWaypointType "GETOUT"; 
	
	leader _group domove _WeWillTakeIt;

	while{_WeHaveDestroyedCar}do
	{
	leader _group domove _WeWillTakeIt;
    sleep 10;
	
	if((leader _group distance _WeWillTakeIt) <30)then
	{
	  
	 // player globalchat "Добрались!";
	   _Speed = speed _car;
	   
	   if(_Speed<20)then{
	   [_Assistant] orderGetIn false;	
	   [leader _group] orderGetIn false;
	   leader _group action ["getOut", _Car];
	   _Assistant action ["getOut", _Car];
	   sleep 10;
        
		deleteMarker _MarkerName1;
		  //player globalchat "Маркер удален!";
	   for [{_xx=1},{_xx<=3},{_xx=_xx+1}] do{
	   
	   leader _group switchmove "RepairingKneel";
	   _Assistant switchmove "RepairingKneel";
	   sleep 10;
	   };


		_objects = nearestObjects[_WeWillTakeIt, ["LandVehicle"], 50];
        {
    if (damage _x == 1) then {
        deleteVehicle _x;
    };
        } forEach _objects;
		
		
	   sleep 1;
	   
	   deleteWaypoint [_group, 1];
       deleteWaypoint [_group, 0];
	   _wp = _group addWaypoint [_Car, 0]; 
	   [_group, 0] setWaypointType "GETIN"; 
       _wp = _group addWaypoint [getpos _Car, 1]; 
	   [_group, 1] setWaypointType "GETIN";
	   _Assistant domove getpos _Car;
	   leader _group domove getpos _Car;
	     	[_Assistant] orderGetIn true;	
	        [leader _group] orderGetIn true;
	   sleep 4;
	   leader _group action ["getInDriver", _Car];
	   _Assistant action ["GetInCargo", _Car];
	   sleep 15;
	   _WeHaveDestroyedCar=false;
	  if(_CountDead == CarDestroyedFix)then {CarDestroyedFix = 0; NotAliveCar = []; };
	  //player globalchat "ready1!!!";
	  	 
       };
	
	 
	};
    };	
	_lock = false;
};


};



AliveFireFighter = AliveFireFighter - [_group];

