_Value1 = _this select 1;
sleep 0.1;
if(ImUsingShop == CarPosDealer1)then{
{
	if(_Value1 == (_x select 1) ) then 
	{
		if(Money >= _x select 2)then{ player globalchat "You bought: " + format ["%1",(_x select 1)] + format [" for $%1",(_x select 2)];
			_NewCar = (_x select 0) createVehicle (position ImUsingShop);
			[_NewCar] execVM "CarAction\AddKeys.sqf";
			[_NewCar] execVM "car1\Alive.sqf";
			Money = Money - (_x select 2);
		}else{player globalchat "No money, no cars!";};	
	};
} forEach CarList1;
};