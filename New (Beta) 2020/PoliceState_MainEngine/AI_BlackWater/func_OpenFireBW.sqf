//func_OpenFireBW.sqf
private["_BW","_x", "_this","_distance","_OpenFire","_CanStillShootTheTarget","_InDanger"];
_BW = _this;
_x = _BW getVariable "inDangerTargetPerson";
_InDanger = _BW getvariable "inDanger";

if!(_InDanger)then
{
	_x = _BW call func_ChooseClosestTargetBW; 
	_BW setVariable ["inDangerTargetPerson",_x,true];
	_CanStillShootTheTarget = true;
	if(player == _BW)then{player globalchat format ["NEW TARGET TO SHOOT: %1", name _x]; hint format ["NEW TARGET TO SHOOT: %1", name _x];};
}
else
{
	_x = _BW getVariable "inDangerTargetPerson"; 
	_CanStillShootTheTarget = [_BW,_x] call func_ChooseClosestTargetCHECKBW;
	if!((vehicle _x) isKindOf "Man")then{_BW setVariable ["inDanger",false,true];};
};


if(isnull _x)exitwith{};
if!(_CanStillShootTheTarget)exitwith
{
	if(player == _BW)then{player globalchat format ["CANT SHOOT YOUR TARGET!!!!!", name _x];}; 
	_BW setVariable ["inDanger",false,true];
	_BW setVariable ["inDangerTargetPerson",ObjNull,true];
};


if!(((vehicle _BW isKindOf "Air")and(_BW == driver vehicle _BW))or(_BW == gunner vehicle _BW))then{[_BW] allowGetIn false; _BW setVariable ["GetIn",false,true];};
			 
	_BW reveal _x; 		
	dostop _BW;
	_BW dofire (vehicle _x);
		_BW commandFire vehicle _x;
		_BW fireAtTarget [vehicle _x];

	if!(_InDanger)then
	{	
		_BW setVariable ["inDanger",true,true];
		_BW setVariable ["inDangerTargetPerson",_x,true];
	};
	
