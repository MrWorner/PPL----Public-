//fnc_AllGetOut.sqf 2020
private["_SUBJECT","_this","_ENEMY"];
_SUBJECT = _this;

if!(vehicle _SUBJECT isKindOf "Air")then
{
	{
		if(_x != gunner vehicle _x && _x != commander vehicle _x )then
		{
			[_x] allowGetIn false; 
			_x setVariable ["GetIn",false,true];	
			//sleep random 3;
			moveOut _x;
			sleep 1;
			doStop _x;			
		};		
	}foreach crew vehicle _SUBJECT 
}

// if(_SUBJECT != driver vehicle _SUBJECT)then
// {
	// if(_SUBJECT != gunner vehicle _SUBJECT)then
	// {
		// if!(vehicle _SUBJECT isKindOf "Air")then
		// {
			// [_SUBJECT] allowGetIn false; 
			// _SUBJECT setVariable ["GetIn",false,true];	
		// }
	// }
// }
