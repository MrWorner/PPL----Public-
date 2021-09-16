//func_failToPatrol
private["_CopLeader","_group","_x","_MarkerName"];

_group = _this;


if(_GROUP getVariable "FailToPatrol" > 10)then
{
	_GROUP setVariable ["Mission","Guard",true];
	hintc format ["Guard mission for %1 activated!",_GROUP];
}
else
{
	_GROUP setVariable ["FailToPatrol",((_GROUP getVariable "FailToPatrol") + 1),true];
};