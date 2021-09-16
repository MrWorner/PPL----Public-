_Value1 = _this select 0;
_Value2 = _this select 1;
_Value3 = _this select 2;
//player globalchat format ["%1",_Value1]; 
sleep 0.1;


		if(Money >= _Value2)then{  
			if(Hunger < 100)then{Hunger = Hunger + _Value3; if(Hunger >100)then{hunger = 100;}; player globalchat "You bought: " + format ["%1 for $%3 and you are full on %2 percent",_Value1,hunger,_Value2];Money = Money - (_Value2); sleep 2; playsound "Burp";}else{player globalchat "You don't wanna eat";};
		}else{player globalchat "You don't have enough money!";};	

