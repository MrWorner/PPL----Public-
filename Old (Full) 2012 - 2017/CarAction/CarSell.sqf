
sleep 0.1;


_x = (nearestobjects [getpos ImUsingShop, ["Car"], 15] select 0);
//player globalchat format ["_x = %1",_x];

 if((alive _x)and!(IreadyToSell))exitwith{	
     _CAR = TypeOF _x;
	 
	 
	 switch (_CAR) do
		{
		case  "UAZ_RU": { CurrentPrice = 950;};
		case  "SkodaBlue": { CurrentPrice = 560; };
		};
		
			
			//player globalchat format ["CurrentPrice = %1",CurrentPrice];
			_dammage = 1 - damage _x; //player globalchat format ["_dammage = %1",_dammage];
			_fuel = round (fuel _x * 20);  // player globalchat format ["_fuel = %1",_fuel];
			CurrentPrice = round ((CurrentPrice*_dammage/5) + _fuel); 
			//player globalchat format ["CurrentPrice = %1",CurrentPrice];	
			if (!(createDialog "SellCARready")) exitWith {hint "Dialog Error!";};
			ctrlSetText [1, format["Ready to sell for $%1? (Including fuel for $%2)", CurrentPrice,_fuel]];
						};




if(IreadyToSell)exitwith{ IreadyToSell =false; player globalchat  format ["You sold your car for $%1!",CurrentPrice]; Money = Money + CurrentPrice; CarSOLD = CarSOLD + [_x]; deletevehicle _x;};




Player Globalchat "We can't find your car, so where is your car?";