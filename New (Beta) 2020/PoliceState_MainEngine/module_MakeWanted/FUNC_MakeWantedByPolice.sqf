
//FUNC_MakeWantedByPolice =
//{
private["_module", "_THIS", "_objects","_x"];

_module = _this select 0;
_objects = synchronizedObjects _module;

{
	waitUntil {(_x getVariable ["AI_FULLYSET", false])};
	if!(_x in Array_SuspectSide)then
	{
		Count_TotalSuspects = Count_TotalSuspects + 1;
		Array_SuspectSide = Array_SuspectSide + [_x];
	};
	
	_x setVariable ["WantedFor",( (_x GetVariable "WantedFor") + ["Old Arrest warrant"]),true];
}foreach _objects;

//};
