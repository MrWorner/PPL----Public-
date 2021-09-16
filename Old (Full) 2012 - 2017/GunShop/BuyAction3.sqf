_Value1 = _this select 0;
_Value2 = _this select 1;
//player globalchat format ["%1",_Value1]; 
sleep 0.1;

	if(_Value1 == "FuelCan" ) then 
	{
		if(Money >= _Value2)then{  
			if!(IhaveFUELCAN)then{player globalchat "You bought: " + format ["%1",_Value1] + format [" for $%1",_Value2];Money = Money - (_Value2);IhaveFUELCAN = true;}else{player globalchat "You already have "  + format ["%1!",_Value1];};
		}else{player globalchat "You don't have enough money!";};	
	};
	
		if(_Value1 == "Candies" ) then 
	{
		if(Money >= _Value2)then{  
			if(Hunger < 100)then{Hunger = Hunger + 20; if(Hunger >100)then{hunger = 100;}; player globalchat "You bought: " + format ["%1 and you are full on %2 percent",_Value1,hunger] + format [" for $%1",_Value2];Money = Money - (_Value2);}else{player globalchat "You don't wanna eat";};
		}else{player globalchat "You don't have enough money!";};	
	};
