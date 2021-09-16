//func_FireLessLethal.sqf
private["_COP","_x","_susp","_distance"];

_COP = _this select 0;
_susp = _this select 1;

// if(currentWeapon _COP in LESS_LETHAL_ARSENAL)then
// {
if!(_COP getvariable "inDanger")then
{
	// if!(_susp getvariable "GivingUp")then
	// {
		// if!(_susp getvariable "Stunned")then
		// {
			// if!(_COP getvariable "ImGoingToArrest")then
			// {
				// if(vehicle _COP isKindOf "Man")then
				// {
					// if(vehicle _susp isKindOf "Man")then
					// {
						_COP dowatch vehicle _susp; 
						_COP dotarget vehicle _susp;
						dostop _COP;
						_COP dofire vehicle _susp; 
						//player sidechat format ["%1: LESS LETHAL, LESS LETHAL!",_COP];
					// };
				// }
			// }	
		// }
	// }
}
// }
