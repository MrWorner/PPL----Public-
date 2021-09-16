_group = _this select 0;

_Lock = false;
_Lock2 = false;
_Lock3 = false;
_Lock4 = false;
_TheirCar = "Skoda";
sleep 1;

if(_group in CopGroup )exitwith{};
CopGroup = CopGroup + [_group];


while {{alive _x} count units _group != 0} do {  

sleep 0.5;


//***** Стоять на месте, никаких сообщений не поступали.
if((LastPosGuarded)and(ISEEHIM == 0)and!(player in RestrainedPeople))then
{
    if!(_Lock3)then{
   _wp = _group addWaypoint [position leader _group, 0];
    [_group, 0] setWaypointType "MOVE";

	//player globalchat "Стоять на месте, никаких сообщений не поступали.";
	_Lock3 = true;
    _Lock4 = false;
	if((leader _group distance player) >300)then{sleep 7;};
	};	
};
//**

//*******
if(!(LastPosGuarded)and(ISEEHIM == 0)and!(player in RestrainedPeople))then
{
    if(!(_Lock4)or(_Lock4))then{
    _wp = _group addWaypoint [position LastPos, 0];
    [_group, 0] setWaypointType "MOVE";

	//player globalchat "Бегу смотреть позицию подозреваемого, он где-то там . Все спокойно";
	_Lock3 = false;
    _Lock4 = true;
	if((leader _group distance player) >300)then{sleep 7;};
	}
};	
	


///****Подтверждение что подозреваемого нету на последней точке
if(((leader _group distance LastPos) <50)and!(LastPosGuarded)) then {LastPosGuarded= true; }; //player globalchat "Точка чиста!";
  
//**Чтобы не тратить время попросту
//if((ISEEHIM == 0)and((leader _group distance player) >350))then{sleep 5;};
  

  
//*****Ехать на помощь
  if((ISEEHIM > 0)and(alive player)and!(player in RestrainedPeople)and((leader _group distance player) >300))then
{



   _wp = _group addWaypoint [position player, 0];
    [_group, 0] setWaypointType "MOVE";

		//player globalchat "Ехать на помощь";
	sleep 15;
};



	if(((leader _group distance player) <100) and !(player in RestrainedPeople)and(ISEEHIM > 0)and!((vehicle player) isKindOf "Car"))then
	{ 

   DOSTOP leader _group;
   deleteWaypoint [_group, 1];
   deleteWaypoint [_group, 0];
	_wp = _group addWaypoint [position vehicle leader _group, 0]; 
	_wp = _group addWaypoint [position vehicle leader _group, 1]; 
	[_group, 0] setWaypointType "MOVE"; 
   [_group, 1] setWaypointType "MOVE"; 
	//player globalchat "Выходим";
    sleep 10;
	}; 
	
	_MySpeed2 = speed vehicle player;
if(((leader _group distance player) <100) and (_MySpeed2<25) and !(player in RestrainedPeople)and(ISEEHIM > 0)and((vehicle player) isKindOf "Car"))then
	{ 
  
  
     DOSTOP leader _group;
     deleteWaypoint [_group, 0];
	 deleteWaypoint [_group, 1];
	_wp = _group addWaypoint [position vehicle leader _group, 0]; 
	_wp = _group addWaypoint [position vehicle leader _group, 1]; 
	[_group, 0] setWaypointType "MOVE"; 
	[_group, 1] setWaypointType "MOVE"; 
	//player globalchat "Разгружаемся";
	_GoWithoutCar = true;
    sleep 10;
	};  

};











//[_grp, 2] setWaypointType "GETOUT";


//g1 = group this; nul = [g1] execVM "follow2.sqf"

 // if( ((leader _group) distance player) <5)then{leader _group action ["getout", vehicle leader _group];};
   //if( ((leader _group) distance player) <30)then{  [_group, 0] setWaypointType "GETOUT"; player globalchat "assda";_group addWaypoint [position player, 0];};

//http://community.bistudio.com/wiki/combatMode
// http://community.bistudio.com/wiki/setCombatMode

// http://community.bistudio.com/wiki/addWaypoint

// leader _group action ["getout", vehicle leader _group];