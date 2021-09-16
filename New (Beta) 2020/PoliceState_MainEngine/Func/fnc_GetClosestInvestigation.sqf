//fnc_GetClosestInvestigation 2020
private["_x", "_minDist", "_leader", "_group", "_chosen", "_list", "_curDist"];

_leader = _this select 0;
_list = _this select 1;

_minDist = -1;
_chosen = "";

{
	_curDist = getMarkerPos _x distance vehicle _leader;
	if(_curDist < _minDist || _minDist == -1)then
	{
		_minDist = _curDist;
		_chosen = _x;
	};
}foreach _list;

_chosen;