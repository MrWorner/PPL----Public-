//func_CreateInvestigation.sqf
private["_this","_marker","_name", "_Subject","_killer","_Search"];
//InvestagionNumber = InvestagionNumber + 1;

//_marker = createMarker [(format [["MI_%1]%2"], InvestagionNumber,_Name] ), _Position];
//_marker = createMarker [format ["[INV %1]%2", InvestagionNumber,_this select 0] , _this select 1];
_killer = _this select 0;
_name = format ["[INV]%1",name _killer];
_Search = _this select 2;
if(_name in NeedToInvestigate)then
{
	_name setMarkerPos (_this select 1);
	//player groupchat format ["Investigation marker has been moved to new position: %1",_name];
}
else
{
	_marker = createMarker [ _name, _this select 1];
	_marker setMarkerType "HW_Investigation";
	//_marker setMarkerText _marker;
	NeedToInvestigate = NeedToInvestigate + [_marker];
	if(_Search)then{NeedToInvestigateSEARCH = NeedToInvestigateSEARCH + [_marker]; _marker setMarkerColor "ColorRed";};
	
	//player groupchat format ["Investigation marker has been created: %1",_marker];
};
