
//FUNC_MakeWantedByBlackWaterGROUP =
//{
private["_module", "_THIS", "_objects","_x","_grp"];

_module = _this select 0;
_objects = synchronizedObjects _module;

{
	_grp = _x;
	{
		waitUntil {(_x getVariable ["AI_FULLYSET", false])};
		if!(_x in Array_SuspectSide)then
		{
		Count_TotalSuspects = Count_TotalSuspects + 1;
		Array_SuspectSide = Array_SuspectSide + [_x];
		};
		
		_x setVariable ["BW_WantedFor",( (_x GetVariable "BW_WantedFor") + ["Old Arrest warrant"]),true];
	}foreach units group _grp;
}foreach _objects;

//};
