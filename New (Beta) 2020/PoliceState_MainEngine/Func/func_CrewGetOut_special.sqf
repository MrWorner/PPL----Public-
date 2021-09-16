//func_CrewGetOut_special.sqf 2020
private["_SUBJECT","_this","_ENEMY"];
_SUBJECT = _this;

if!(vehicle _SUBJECT isKindOf "Air")then
{
	if(_SUBJECT != gunner vehicle _SUBJECT && _SUBJECT != commander vehicle _SUBJECT )then
	{
		[_SUBJECT] allowGetIn false; 
		_SUBJECT setVariable ["GetIn",false,true];	
	}
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
