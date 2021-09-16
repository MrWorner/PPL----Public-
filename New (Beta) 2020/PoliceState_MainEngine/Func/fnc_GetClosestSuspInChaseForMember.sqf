//fnc_GetClosestSuspInChaseForMember 2020
private["_x", "_minDist", "_cop", "_group", "_chosenSusp", "_suspArray", "_curDist"];

_cop = _this;
_minDist = -1;
_chosenSusp = ObjNull;
_suspArray = ObjNull;

{
	_suspArray = _x getVariable "ImChasing";
	{
		_curDist = vehicle _x distance vehicle _cop;
		if(_curDist < _minDist || _minDist == -1)then
		{
			_minDist = _curDist;
			_chosenSusp = _x;
		};
	}foreach _suspArray;
}foreach units group _cop;

// if(CopOutside == _cop)then
// {
	// dostop CopOutside;
	//hintc format ["CopOutside _chosenSusp = %1 (fnc_GetClosestSuspInChaseForMember)",_chosenSusp];
// };


//player globalchat hintc format ["_chosenSusp = %1 _minDist = %2 _cop = %3",_chosenSusp, _minDist, _cop];
//hintc format ["_chosenSusp = %1 _minDist = %2 _cop = %3",_chosenSusp, _minDist, _cop];
_chosenSusp;