
FunctionPoliceLastPos =
{

_group = _this select 0;
_TheirCar = "Skoda";
_CopWillSay = "";
sleep 1;

if(_group in CopGroup )exitwith{};
CopGroup = CopGroup + [_group];


while {{alive _x} count units _group != 0} do {  
sleep 5 + random 5;

//** Стоять на месте, никаких сообщений не поступали.
	if((LastPosGuarded)and((Player getVariable "VariableISEEHIM") == 0)and!(player in RestrainedPeople))then
	{
		sleep random 30;	
	};
//**

//**Надо разведать!
	if(!(LastPosGuarded)and((Player getVariable "VariableISEEHIM") == 0)and!(player in RestrainedPeople))then
	{
		leader _group domove getpos LastPos;
		if(((leader _group distance LastPos) <50)and!(LastPosGuarded)and((Player getVariable "VariableISEEHIM") == 0)) then {LastPosGuarded= true; };
		
		if((leader _group distance LastPos) >3000)then{
		  _wp = _group addWaypoint [position LastPos, 0];
          [_group, 0] setWaypointType "MOVE";      
          _wp = _group addWaypoint [position LastPos, 1];
          [_group, 1] setWaypointType "MOVE";  		  
		  sleep 120;
		  };
		
	};	
//**


//**Ехать на помощь
  if(((Player getVariable "VariableISEEHIM") > 0)and(alive player)and!(player in RestrainedPeople)and((leader _group distance player) >100))then
	{
       leader _group domove getpos player;
	   [leader _group] orderGetIn true;
	   		
        {
			[_x] orderGetIn true;
            sleep 0.1;
        } forEach units _group;
		
		if((leader _group distance player) >3000)then{
		  _wp = _group addWaypoint [getpos player, 0];
          [_group, 0] setWaypointType "MOVE"; 
           _wp = _group addWaypoint [getpos player, 1];
          [_group, 1] setWaypointType "MOVE"; 
           sleep 120;  		  
		  };
		
		
	};
//**

//**Выйти зарубить подозреваемого!
	if(((leader _group distance player) <60) and !(player in RestrainedPeople)and((Player getVariable "VariableISEEHIM") > 0)and!((vehicle player) isKindOf "Car"))then
	{ 
	
	_TheirCar = vehicle leader _group; _CopSpeed = speed (vehicle (leader _group));
	if(((leader _group) isKindOf "Car")and(_CopSpeed < 20))then
		DOSTOP leader _group;
		sleep 1;
		leader _group action ["getOut", (_TheirCar)];
        [leader _group] orderGetIn false;
		
        {
			_x action ["getOut", (_TheirCar)];
			[_x] orderGetIn false;
            sleep 1.5;
			_x domove getpos player;
        } forEach units _group;
		
		
	}; 
//**


	
//_MySpeed2 = speed vehicle player;
//if(((leader _group distance player) <100) and (_MySpeed2<25) and !(player in RestrainedPeople)and((Player getVariable "VariableISEEHIM") > 0)and((vehicle player) isKindOf "Car"))then
//	{ 
  
  
 //    DOSTOP leader _group;
 //    deleteWaypoint [_group, 0];
//	 deleteWaypoint [_group, 1];
//	_wp = _group addWaypoint [position vehicle leader _group, 0]; 
//	_wp = _group addWaypoint [position vehicle leader _group, 1]; 
//	[_group, 0] setWaypointType "Unload"; 
//	[_group, 1] setWaypointType "Unload"; 
//	//player globalchat "Разгружаемся";
//	_GoWithoutCar = true;
 //   sleep 10;
//	};  

};




//	if(!(LastPosGuarded)and((Player getVariable "VariableISEEHIM") == 0)and!(player in RestrainedPeople))then
//	{
//		 _wp = _group addWaypoint [position leader _group, 0];
//    [_group, 0] setWaypointType "MOVE";
//	};	





//[_grp, 2] setWaypointType "GETOUT";


//g1 = group this; nul = [g1] execVM "follow2.sqf"

 // if( ((leader _group) distance player) <5)then{leader _group action ["getout", vehicle leader _group];};
   //if( ((leader _group) distance player) <30)then{  [_group, 0] setWaypointType "GETOUT"; player globalchat "assda";_group addWaypoint [position player, 0];};

//http://community.bistudio.com/wiki/combatMode
// http://community.bistudio.com/wiki/setCombatMode

// http://community.bistudio.com/wiki/addWaypoint

// leader _group action ["getout", vehicle leader _group];
}