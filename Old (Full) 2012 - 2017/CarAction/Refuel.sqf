
sleep 0.1;



_x = (nearestobjects [getpos ImUsingShop, ["Car"], 27] select 0);
//player globalchat format ["_Ready = %1",_Ready];

 if((_x in YourCars)and!(IreadyToPay))exitwith{
	if((fuel _x) > 0.85)then{player globalchat "The vehicle has enough fuel!";}else
		{
		_FUEL = (fuel _x);
		
		CurrentPrice = round  ((1 - _FUEL)*50);
	
		
	
		
		if (!(createDialog "PayForFuel")) exitWith {hint "Dialog Error!";};
			ctrlSetText [1, format["Ready to pay $%1?", CurrentPrice]];
			
		//player globalchat format ["CurrentPrice = $%1",CurrentPrice];
		};
						};




if(IreadyToPay)exitwith{
if(Money >= CurrentPrice)then{IreadyToPay =false;   player globalchat  format ["You paid $%1 for full fuel!",CurrentPrice]; Money = Money - CurrentPrice; _x setfuel 1; }
else
{Player Globalchat "You don't have enough money!"; IreadyToPay = false;};};



Player Globalchat "We can't find your car, so where is your car?";