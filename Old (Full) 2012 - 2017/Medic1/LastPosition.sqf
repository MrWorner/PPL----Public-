_group = _this select 0;
_Car = _this select 1;
_Assistant = _this select 2;
_WeHaveDeadBody = false;
_WeWillTakeIt = player;
_lock = false;
_NotAliveName = "";
sleep 1;



while {{alive _x} count units _group != 0} do {  

sleep 0.5;

_CountDead = count NotAlive;
if(_CountDead > 0)then{_WeHaveDeadBody=true; _NotAliveName = NotAliveNames select 0;  NotAliveNames = NotAliveNames - [_NotAliveName]; _WeWillTakeIt = NotAlive select 0;  NotAlive = NotAlive - [_WeWillTakeIt]; }; //player globalchat "Приняли вызов!.";


//player globalchat format ["_NotAliveName? = %1",_NotAliveName];

//***** Стоять на месте, никаких сообщений не поступали.
if!(_WeHaveDeadBody)then
{
  // _wp = _group addWaypoint [position leader _group, 0];
    //[_group, 0] setWaypointType "MOVE";
	
	
    //player globalchat "Нету сообщений об убийстве.";
	sleep 7;
};
//**

//*******
if((_WeHaveDeadBody)and!(_lock))then
{ 
    _lock = true;
    // player globalchat "Выехали";
     deleteWaypoint [_group, 1];
     deleteWaypoint [_group, 0];
	 _wp = _group addWaypoint [position _WeWillTakeIt, 0]; 
	 _wp = _group addWaypoint [position _WeWillTakeIt, 1]; 
    [_group, 0] setWaypointType "GETOUT"; 
    [_group, 1] setWaypointType "GETOUT"; 
	
	leader _group domove getpos _WeWillTakeIt;

	while{_WeHaveDeadBody}do
	{
	leader _group domove getpos _WeWillTakeIt;
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
       sleep 2;
	  // leader _group attachto [_WeWillTakeIt,[-0.1,-0.2,0]];
	  //  _Assistant attachto [_WeWillTakeIt,[+0.1,+0.3,0]];
		//_Assistant setdir 90;
		//leader _group setdir 180;
	  // leader _group switchmove "AinvPknlMstpSnonWrflDnon_medic";
	   //_Assistant switchmove "AinvPknlMstpSnonWrflDnon_medic";
	   
	   leader _group  attachto [_WeWillTakeIt,[-0.3,-0.2,0]]; 
	   _Assistant attachto [_WeWillTakeIt,[+0.1,0,0]]; 
	   _Assistant setdir 180; leader _group  setdir 180; 
	   _Assistant switchmove "AinvPknlMstpSnonWrflDnon_medic"; 
	   leader _group  switchmove "AinvPknlMstpSnonWrflDr_medic2";

	   sleep 10;

	   leader _group switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
	   _Assistant switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
	   sleep 1;
       detach  leader _group;
	    detach _Assistant;
	   _Deadbody = "Body" createVehicle (position _WeWillTakeIt);
	    deleteMarker _NotAliveName;
	   deleteVehicle _WeWillTakeIt;
	   sleep 1;
	   leader _group attachto [_Deadbody,[-0.3,-0.2,0]];
	    _Assistant attachto [_Deadbody,[+0.7,0.0,0]];
		_Assistant setdir 20;
		leader _group setdir 310;
	   leader _group switchmove "AinvPknlMstpSnonWrflDr_medic2","AinvPknlMstpSnonWrflDr_medic0";
	   _Assistant switchmove "AinvPknlMstpSnonWrflDnon_medic";
	
	   
	   
	   
	   
	   sleep 10;

	   leader _group switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
	   _Assistant switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
	   sleep 1;
       detach  leader _group;
	    detach _Assistant;
	   deleteVehicle _Deadbody;
	 
	   
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
	   _WeHaveDeadBody=false;
	  
       };
	
	 
	};
    };	
	_lock = false;
};


};



AliveMedic = AliveMedic - [_group];

