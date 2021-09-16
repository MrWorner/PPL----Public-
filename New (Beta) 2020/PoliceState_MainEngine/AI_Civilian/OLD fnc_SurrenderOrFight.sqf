//fnc_SurrenderOrFight
private["_x","_this","_susp","_morale","_NeedToSay","_result","_friends","_friendsRealTime","_pressure","_COP", "_addMore"];

_susp = _this select 0;

_NeedToSay = _this select 1;
_COP = _this select 2;
_addMore = 0;

_friends =  (units group _susp);
{
	if(_x getVariable "PoliceChaseInProgress" > 0)then
	{
		if(_x distance _susp < 30)then
		{
			if(!(_x getVariable "GivingUp")and!(_x getVariable "InFighting"))then
			{
				_morale = _x getVariable "Morale";
				//ADDINITON POWER
				_friendsRealTime =  (units group _x);
				_friendsPower = ((count _friendsRealTime) - 1)*10;	
				_morale = _morale + _friendsPower;
				 if(_x call fnc_CheckArmed)then{_morale = _morale + 10};
				 if((_x getVariable "Dangerous"))then{_morale = _morale + 15};
				 
				 //ADDINITON COPS
				 _pressure = 30;
				 if(_NeedToSay)then{_pressure = _pressure + 20;}; 			 
				 _pressure = _pressure + (2*(_x getVariable "PoliceChaseInProgress"));
				
				 _result = round(random _pressure);
				sleep (random 1);
				if(_morale > _result)then
				{//say NO!
					//_x globalchat format ["SUSPECT says [NO, FUCK YOU!] %1",name _x];
					//_x setVariable ["Morale",_result,true];
					if(_NeedToSay)then
					{
						_x setVariable ["Morale",(( _x getVariable "Morale") - 1),true];
						if((random 100)<40)then
						{
							if(!(vehicle _x isKindOf "Man")and(speed vehicle _x < 20))then
							{
								[_x] allowGetIn false;
								_x spawn func_AllowGetIn;
							};
						};
						//if((random 100)<50)then{
						if(_susp != _x)then{_addMore = 10;}
						else
						{
							if( (count _friendsRealTime < 3)and( (_x getVariable "PoliceChaseInProgress") > 2))then
							{
								_addMore = (-50) - (10*(_x getVariable "PoliceChaseInProgress"));
							}
							else
							{
								_addMore = 0 - (5*(_x getVariable "PoliceChaseInProgress"));
							};	
						};
						if((random 100)> (80 + _addMore))then{ //SPEAK MORE!
							//hint format ["SUSPECT says [NO, FUCK YOU!] to %1",name _x];
							if(_x getVariable "CanSaySomething")then
							{
								_x setVariable ["CanSaySomething",false,true]; 
								[_x,"No"] call func_SuspSAY;
								_x spawn 
								{
									sleep 3;
									_this setVariable ["CanSaySomething",true,true];
								};
							};
					
							if((random 100)<25)then{_x domove getPosATL (vehicle (_cop))};///RAGE NEW!!!!!!!!!
						};							
					};
							_x LookAt (position (_cop));
							_x dowatch (_cop);						
				}
				else
				{//Give up
					//if(!(vehicle _x isKindOf "Man")and(speed (vehicle _x) )
					if(!(vehicle _x isKindOf "Man"))then
					{
						//if(player != _x)then
						//{
							[_x] allowGetIn false;
							removeAllweapons _x;
							_x dowatch (_cop);
							//_x LookAt (_cop);
						//};						
					};
					//else
					//{		
					_x spawn func_GiveUp;
			
					//};
					//_x setVariable ["Morale",0,true];
				};
				 
				// _x globalchat format ["SUSP [MORALE!= %2]  %1",name _x,_result];
				 //_x globalchat  format ["_morale(NEED) = %1 _result(FINAL) = %2 pressure(CHANCE)= %3 Susp Name=%4",_morale, _result, _pressure, name _x];
				 //_x globalchat  format ["%1 -> %2 <- %3 |%4",_morale, _result, _pressure, name _x];   <---
			}
		};
	};//else{}; //hint "cops does not see the suspect to make pressure!";
}
foreach _friends;

_morale = _susp getVariable "Morale";
player globalchat format ["_morale = %1",_morale];