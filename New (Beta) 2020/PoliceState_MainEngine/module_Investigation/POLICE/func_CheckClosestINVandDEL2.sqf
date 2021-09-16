//func_CheckClosestINVandDEL2.sqf
private["_this","_x","_MarkerName"];
_MarkerName = _this;

{
	if(GetMarkerPos _MarkerName distance GetMarkerPos _x < 53)then
	{
		NeedToInvestigate = NeedToInvestigate - [_x];
		NeedToInvestigateSEARCH = NeedToInvestigateSEARCH - [_x];
		_x call func_RemoveInvJobFromPolice;
		//player sidechat format ["INV marker deleted, because it was close to other marker: %1", _x];
		DeleteMarker _x;
	};
}foreach NeedToInvestigate;



	