//func_BW_CreateInvestigationByModule.sqf
private["_this","_marker","_name", "_Subject","_killer","_Search"];
//InvestagionNumber = InvestagionNumber + 1;

//_marker = createMarker [(format [["MI_%1]%2"], InvestagionNumber,_Name] ), _Position];
//_marker = createMarker [format ["[INV %1]%2", InvestagionNumber,_this select 0] , _this select 1];
_name = _this select 0;

_Search = _this select 2;

	_marker = createMarker [( _name + format [" %1", (round (random 1000))]) , _this select 1];
	_marker setMarkerType "bw_Investigation";
	//_marker setMarkerText _marker;
	BWNeedToInvestigate  = BWNeedToInvestigate  + [_marker];
	if(_Search)then{BWNeedToInvestigateSEARCH = BWNeedToInvestigateSEARCH + [_marker]; _marker setMarkerColor "ColorRed";};
	
	//player groupchat format ["Investigation marker has been created: %1",_marker];

