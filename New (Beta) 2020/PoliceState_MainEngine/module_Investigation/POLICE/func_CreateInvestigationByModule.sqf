//func_CreateInvestigationByModule.sqf
private["_marker","_name", "_Subject","_killer","_Search"];
//InvestagionNumber = InvestagionNumber + 1;

//_marker = createMarker [(format [["MI_%1]%2"], InvestagionNumber,_Name] ), _Position];
//_marker = createMarker [format ["[INV %1]%2", InvestagionNumber,_this select 0] , _this select 1];
//_name = _this select 0;
_name = "invM_";

_Search = _this select 2;

_marker = createMarker [( _name + format [" %1", (round (random 1000))]) , _this select 1];
_marker setMarkerType "HW_Investigation";
//_marker setMarkerText _marker;
NeedToInvestigate = NeedToInvestigate + [_marker];
if(_Search)then{NeedToInvestigateSEARCH = NeedToInvestigateSEARCH + [_marker]; _marker setMarkerColor "ColorRed";};

//player groupchat format ["Investigation marker has been created: %1",_marker];

