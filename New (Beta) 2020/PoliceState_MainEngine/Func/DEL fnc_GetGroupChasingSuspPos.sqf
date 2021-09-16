//fnc_GetGroupChasingSuspPos 2020
private["_x", "_group", "_chosenSusp", "_suspArray", "_pos"];

_group = _this ;
_chosenSusp = ObjNull;
_pos = [];
{
	_suspArray = _x getVariable "ImChasing";
	if(count _suspArray > 0)exitwith
	{
		_chosenSusp = _suspArray select 0;
	};
}foreach units _group;
_pos = getpos vehicle _chosenSusp;

//player globalchat format ["FIXED POS (fnc_GetGroupChasingSuspPos) = %1 _chosenSusp = %2",_pos, name _chosenSusp];
_pos;