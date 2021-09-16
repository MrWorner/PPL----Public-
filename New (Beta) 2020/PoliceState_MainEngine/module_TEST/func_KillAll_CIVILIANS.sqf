//func_KillAll_CIVILIANS.sqf
	{		
		_SIDE = side _x;
		player sidechat format [ "func_KillAll_CIVILIANS _SIDE = %1",_SIDE];
		if((_SIDE == Civilian)and((TypeOF _x) != "RU_Doctor"))then
		{
			if(_x != player)then{_x setdamage 1;};
			player sidechat "func_KillAll_CIVILIANS = CIVILAN KILLED!";
		}		
	} forEach allUnits;