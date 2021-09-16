//fnc_police_OutOfControlManager
private["_Points","_this","_susp", "_Points"];

_susp = _this;
_Points = _susp getvariable "OutOfControPoints";

if(_Points > 0)then
{
	if(vehicle _susp isKindOf "Man")then
	{
		if(speed vehicle _susp > 5)then
		{
			_Points = _Points - 5;
		}
		else
		{
			_Points = _Points - 1;
		};
		//if((speed _susp > 22) )then{_Points = _Points - 5;}; // If move
		_susp setVariable ["OutOfControPoints",_Points,true];
		//hintsilent format ["_Points= %1", _Points];
	};
		
}
else
{
	_susp setVariable ["OutOfControl",true,true];
	//hint "OUT OF CONTROL!";
};
