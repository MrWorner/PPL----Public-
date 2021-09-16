//func_CheckAndRemoveBadMarker
private["_x","_MarkerName","_this","_count"];
_count = 0;
_MarkerName = _this;
	
{
	if(_MarkerName in (_x getvariable "FailedWaypointJob"))then
	{
		_count = _count + 1;		
	};
}foreach PoliceGroups;


if(_count > 2)then
{
	NeedToInvestigate = NeedToInvestigate - [_MarkerName];
	NeedToInvestigateSEARCH = NeedToInvestigateSEARCH - [_MarkerName];
	_MarkerName call func_RemoveInvJobFromPolice;
	player sidechat format ["MARKER WAS REMOVED, MARKER NAME: %1", _MarkerName];
	titleText [ format ["MARKER WAS REMOVED, MARKER NAME: %1", _MarkerName], "PLAIN"];
	DeleteMarker _MarkerName;
};


