//fnc_DomoveAllGroupMembers 2020
private["_group", "_pos"];
_group = _this select 0;
_pos = _this select 1;

{
	if( (vehicle _x isKindOf "Man") )then
	{
		[_x, _pos] call fnc_DoMove;
	}
	else
	{
		if( _x == (driver (vehicle _x)) )then
		{
			[_x, _pos] call fnc_DoMove;
		}
	}
}foreach units _group;