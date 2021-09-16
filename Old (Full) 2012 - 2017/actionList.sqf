_role = player;

//action1 = _role addaction ["Зачехлить оружие","noscript.sqf",'["animation", "holsterrifle"] execVM "holsterscript.sqf";',1,false,true,"",'player hasweapon "Saiga12K" or player hasweapon "Huntingrifle"'];


//** Сдаться
	action1 =  _role addaction ["<t color=""#ffa800"">" + "Give Up" + "</t>","noscript.sqf",'[] execVM "PlayerGiveUp.sqf";',1,true,true,"",'alive player and GiveUpChance and (Player getVariable "VariableISEEHIM")  > 0 and !(Player getVariable "GaveUp") and !(Player getVariable "Fight") and !(player in RestrainedPeople) and {getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player == 0 and !(Playerisdead)'];
	action2 =  _role addaction ["<t color=""#ffa800"">" + "Drop weapons" + "</t>","noscript.sqf",'[] execVM "PlayerDropWeapons.sqf";',1,true,true,"",'alive player and GiveUpChance and (Player getVariable "VariableISEEHIM") > 0 and !(Player getVariable "GaveUp") and !(Player getVariable "Fight") and !(player in RestrainedPeople) and {getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons player > 0 and !(Playerisdead)'];
//**

//** Действия над противником
	action5 =  _role addaction ["<t color=""#e80000"">" + "Snap Neck" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1); [_x] execVM "SnapNeck.sqf";"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1);((_x in Trouble)and(_x != player)and !(player in RestrainedPeople)and !(player in Trouble) and !(isNull _x) and(alive _x))'];
	action6 =  _role addaction ["<t color=""#107c0e"">" + "Restrain" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1); [_x] execVM "RestrainBySuspect.sqf";"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1);((_x in Trouble)and(_x != player)and !(isNull _x)and !(_x in RestrainedPeople)and !(player in Trouble)and !(player in RestrainedPeople) and (alive _x))'];
	action7 =  _role addaction ["<t color=""#b11616"">" + "Fight" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1); [_x, player, true] execVM "fight.sqf";"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Man"], 3] select 1);(!(_x in Trouble) and !(Player getVariable "Fight") and(_x != player)and !(isNull _x)and !(_x in RestrainedPeople)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x))'];
//**

//** Торговля

	action8 =  _role addaction ["<t color=""#1d76ba"">" + "Gun shop" + "</t>","noscript.sqf",'["GunShop1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive WepDealer1)  and !(WepDealer1 in Trouble) and !(WepDealer1 in RestrainedPeople) and ((player distance WepDealer1) <3))'];
	action9 =  _role addaction ["<t color=""#1d76ba"">" + "Car shop" + "</t>","noscript.sqf",'["CarShop1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive CarDealer1)  and !(CarDealer1 in Trouble) and !(CarDealer1 in RestrainedPeople) and ((player distance CarDealer1) <3))'];
	
	action12 =  _role addaction ["<t color=""#1d76ba"">" + "Sell car" + "</t>","noscript.sqf",'["Sell1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive CarSellDealer1)  and !(CarSellDealer1 in Trouble) and !(CarSellDealer1 in RestrainedPeople) and ((player distance CarSellDealer1) <3))'];
	
	action13 =  _role addaction ["<t color=""#1d76ba"">" + "Shop" + "</t>","noscript.sqf",'["Gas1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive GasAssistant1)  and !(GasAssistant1 in Trouble) and !(GasAssistant1 in RestrainedPeople) and ((player distance GasAssistant1) <3))'];
	
	action15 =  _role addaction ["<t color=""#1d76ba"">" + "Repair shop" + "</t>","noscript.sqf",'["Repair1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive RepairWork1)  and !(RepairWork1 in Trouble) and !(RepairWork1 in RestrainedPeople) and ((player distance RepairWork1) <3))'];
	
	action16 =  _role addaction ["<t color=""#1d76ba"">" + "Cafe" + "</t>","noscript.sqf",'["Cafe1"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive Cafe1)  and !(Cafe1 in Trouble) and !(Cafe1 in RestrainedPeople) and ((player distance Cafe1) <3))'];
	
	action18 =  _role addaction ["<t color=""#1d76ba"">" + "Medic" + "</t>","noscript.sqf",'["Medic"] execVM "Gunshop\OpenDialog.sqf"; "";',1,true,true,"",'(!(Player getVariable "Fight") and !(player in Trouble) and !(player in RestrainedPeople) and (alive MedicWork1)  and !(MedicWork1 in Trouble) and !(MedicWork1 in RestrainedPeople) and ((player distance MedicWork1) <3))'];
//**





//


//**Действия с машиной
	action10 =  _role addaction ["<t color=""#79d3c7"">" + "Unlock" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0); playsound "Zamok"; _x lock false;"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);(!(Player getVariable "Fight") and (_x in YourCars) and !(isNull _x)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x)and (locked _x ))'];
	action11 =  _role addaction ["<t color=""#79d3c7"">" + "Lock" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0); playsound "Zamok"; _x lock true;"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);(!(Player getVariable "Fight") and (_x in YourCars) and !(isNull _x)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x)and !(locked _x ))'];
	
	action14 =  _role addaction ["<t color=""#308456"">" + "Refuel" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0); if(fuel _x > 0.85)then{player globalchat "The vehicle has enough fuel!";}else{_FUEL = (fuel _x);_FUEL = _FUEL + 0.35; _x setFuel _FUEL; player globalchat "Refueled!"; IhaveFUELCAN = false; };"";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);(!(Player getVariable "Fight") and !(isNull _x)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x)and (IhaveFUELCAN))'];
	
	action17 =  _role addaction ["<t color=""#f1f418"">" + "Take a ride" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);  [(driver _x)] execVM "TaxiGuys\ImInTaxi.sqf"; "";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);(!(Player getVariable "Fight") and !(isNull _x)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x) and (driver _x in TaxiGuysBUSY))'];
	
	//action18 =  _role addaction ["<t color=""#f1f418"">" + "Stop the car" + "</t>","noscript.sqf",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);  [(driver _x)] execVM "TaxiGuys\ImInTaxi.sqf"; _x stop true; sleep 5; _x stop false; "";',1,true,true,"",'_x = (nearestobjects [getpos player, ["Car"], 3] select 0);(!(Player getVariable "Fight") and (player in (crew _x)) and !(isNull _x)and !(player in Trouble) and !(player in RestrainedPeople) and (alive _x) and (driver _x in TaxiGuysBUSY))'];
//**