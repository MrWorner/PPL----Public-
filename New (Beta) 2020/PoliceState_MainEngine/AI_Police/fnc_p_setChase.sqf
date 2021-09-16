//fnc_p_setChase.sqf 2020
private["_cop","_susp"];
_cop = _this select 0;
_susp = _this select 1;


_cop setVariable ["ImChasing",(_cop getvariable "ImChasing") + [_susp],true];
_susp setVariable ["WhoIsChasingMe",(_susp getvariable "WhoIsChasingMe") + [_cop],true];//NEW
_susp setVariable ["PoliceChaseInProgress",(_susp getvariable "PoliceChaseInProgress") + 1,true];			
if!(_susp in Array_SuspectsInChase)then{Array_SuspectsInChase = Array_SuspectsInChase + [_susp]};