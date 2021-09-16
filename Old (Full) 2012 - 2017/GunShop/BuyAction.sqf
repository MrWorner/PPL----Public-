_Value1 = _this select 1;
sleep 0.1;
if(ImUsingShop == BoxDealer1)then{
{
	if(_Value1 == (_x select 1) ) then 
	{
		if(Money >= _x select 2)then{ player globalchat "You bought: " + format ["%1",(_x select 1)] + format [" for $%1",(_x select 2)]; 
			if("GUN" == _x select 3)then {ImUsingShop addWeaponCargo [(_x select 0), 1];};
			if("MAG" == _x select 3)then {ImUsingShop addMagazineCargo [(_x select 0), 1];};
			Money = Money - (_x select 2);
		}else{player globalchat "No money, no guns!";};	
	};
} forEach WeaponList1;
};