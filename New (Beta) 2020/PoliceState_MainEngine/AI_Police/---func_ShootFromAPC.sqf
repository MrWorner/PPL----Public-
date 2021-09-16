//func_ShootFromAPC
private["_COP","_target", "_this"];
_COP = _this select 0;
_target =  _COP getVariable "inDangerTargetPerson";;


if(isnull _target)exitwith{};

_COP setVariable ["APC_GUNNER", true,true];

	while{_target == (_COP getVariable "inDangerTargetPerson") and alive _COP}do{
if (_COP aimedAtTarget [_target] > 0)then
{ 	hint "DADADA1";
	_COP commandFire vehicle _target;
	_COP fireAtTarget [vehicle _target];
	_COP doFire vehicle _target;
};
};
_COP setVariable ["APC_GUNNER", false,true];