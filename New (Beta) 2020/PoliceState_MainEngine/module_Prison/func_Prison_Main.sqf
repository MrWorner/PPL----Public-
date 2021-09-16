//func_Prison_Main.sqf 
//MAIN ENGINE TO CHOOSE WHAT TO DO WITH PRISONER
private["_Susp","_this"];
_Susp = _this select 0;
_ArrestType = _this select 1;


if!(isnil "PrisonMod_SimpleTeleport")exitwith{[_Susp,_ArrestType] spawn func_Prison_SimpleTeleport;};