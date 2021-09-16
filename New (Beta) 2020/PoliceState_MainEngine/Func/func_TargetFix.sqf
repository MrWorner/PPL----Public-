//func_TargetFix.sqf
private["_COP","_this"];
_COP = _this;
{
	//hint "func_TargetFix";
	if!(_x getVariable "Arrested")exitwith{_COP dotarget (vehicle _x); };
}foreach (_COP getvariable "ImChasing");