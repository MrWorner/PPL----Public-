
sleep 0.1;


_x = (nearestobjects [getpos ImUsingShop, ["Car"], 15] select 0);
//player globalchat format ["_x = %1",_x];

 if((alive _x)and!(IreadyToRepair))exitwith{	
     _CAR = TypeOF _x;
	 
	 
	 switch (_CAR) do
		{
		case  "UAZ_RU": { CurrentPrice = 950/2; };
		case  "SkodaBlue": { CurrentPrice = 560/2; };
		};
		
			
			//player globalchat format ["CurrentPrice = %1",CurrentPrice];
			_dammage = damage _x; //player globalchat format ["_dammage = %1",_dammage];
			if(_dammage == 1)then{player globalchat "Your car has no dammage!";}else{
			CurrentPrice = round ((CurrentPrice*_dammage)); 
			if(CurrentPrice < 45)then{CurrentPrice = 45 + round (random (50));};
			//player globalchat format ["CurrentPrice = %1",CurrentPrice];	
			if (!(createDialog "RepairCARready")) exitWith {hint "Dialog Error!";};
			ctrlSetText [1, format["Ready to repair for $%1? ", CurrentPrice]];
						};};



player globalchat format ["CurrentPrice = %1",CurrentPrice];
player globalchat format ["IreadyToRepair = %1",IreadyToRepair];
player globalchat format ["Money = %1",Money];
if(IreadyToRepair)exitwith{

if(Money >= CurrentPrice)then{IreadyToRepair =false; player globalchat  format ["Your car has been repaired for $%1!",CurrentPrice]; Money = Money - CurrentPrice; _x setdammage 0;}
 else{player globalchat "you don't have enough money!";};};




Player Globalchat "We can't find your car, so where is your car?";