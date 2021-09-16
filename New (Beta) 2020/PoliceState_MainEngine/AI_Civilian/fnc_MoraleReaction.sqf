
//
//Максимальная мораль может быть более 100
//мораль должна со временем понижаться




//fnc_MoraleReaction.sqf 2020
private["_x","_this","_susp","_morale","_curMorale","_NeedToSay","_friends","_pressure","_COP", "_howManyChasing", "_friend", "_randomPressure", "_wait"];

_susp = _this select 0;
_NeedToSay = _this select 1;
_COP = _this select 2;

_friends =  (units group _susp);


_howManyChasing = _susp getVariable "PoliceChaseInProgress";


{//foreach _friends;
	_friend = _x;
	if(_howManyChasing > 0)then
	{
		if(_friend distance _susp < 70)then//if(_x distance _susp < 50)then
		{
			if(!(_friend getVariable "GivingUp"))then
			{
				if(!(_friend getVariable "InFighting"))then
				{
					_curMorale = _friend getVariable "Morale";
					_morale	= _curMorale;				
					_morale = _morale + ((count _friends - 1) * MORALE_BONUS_FRIENDS);//бонусная мораль от кол-во друзей
					//ЕСЛИ КТО ТО ВООРУЖЕН, ТО НЕПЛОХОЙ БОНУС!
					{
						if(_x call fnc_CheckArmed)then{_morale = _morale + MORALE_BONUS_WEAPONS};				
					}foreach _friends;
					//ЕСЛИ КТО ТО ВООРУЖЕН, ТО НЕПЛОХОЙ БОНУС!
					if((_friend getVariable "Dangerous"))then{_morale = _morale + MORALE_BONUS_DANGEROUS};
					if(!(vehicle _friend isKindOf "Man"))then{_morale = _morale + MORALE_BONUS_InVehicvle};
										
					_pressure =  _howManyChasing * MORALE_PRESURE_BY_COP;
					_randomPressure = round (random _pressure);
					
					
					if(_morale > _randomPressure)then
					{//RESIST! DO NOT GIVE UP!						
						
						
						if(_NeedToSay)then//КОП НАДАВИЛ, МИНУС МОРАЛЬ
						{
							
							if(_friend == _susp)then
							{
							
								_friend setVariable ["Morale",(_curMorale - MORALE_PRESURE_MINUS_MORAL_TARGET),true];//мораль пошатнулась	
								//player globalchat format ["fnc_MoraleReaction: %1 (morale def: %4) VS %2/%3(max pressure)",_morale,_randomPressure, _pressure, _curMorale];								
								_friend dowatch _COP;
								if(_friend getVariable "CanSaySomething")then
								{
									if(SUSP_SPEAK_CHANCE_TO_SAY_NO > random 100)then									
									{
										_friend setVariable ["CanSaySomething",false,true]; 								
										_friend spawn 
										{
											sleep 2.5; 
											[_this,"No"] call func_SuspSAY; 
											sleep 3;
											_this setVariable ["CanSaySomething",true,true];
										};
									};																		
								};																		
							}
							else
							{
								_friend setVariable ["Morale",(_curMorale - MORALE_PRESURE_MINUS_MORAL_FRIEND),true];//мораль пошатнулась
							};	
						}
											
						// if((vehicle _friend isKindOf "Man"))then
						// {
							
						// }
						// else
						// {
						
						// };									
					}
					else
					{//SURRENDER!
						if((vehicle _friend isKindOf "Man"))then
						{
								[_friend] allowGetIn false;
								removeAllweapons _friend;
								_friend dowatch (_cop);	
								_friend spawn func_GiveUp;								
						}
						else
						{//если в тачке
							if(//сдаться если нет водителя или скорость почти нулевая
								( (speed vehicle _friend > -3) and (speed vehicle _friend < 3) ) ||
								( driver vehicle _friend == objNull)
							)then
							{
								[_friend] allowGetIn false;
								removeAllweapons _friend;
								_friend dowatch (_cop);	
								_friend spawn func_GiveUp;
							};
						};
						
					};									
				};//if(!(_friend getVariable "InFighting"))then
			};//if(!(_friend getVariable "GivingUp"))then		
		};//!Fighting
	};//!Surrender
}foreach _friends;