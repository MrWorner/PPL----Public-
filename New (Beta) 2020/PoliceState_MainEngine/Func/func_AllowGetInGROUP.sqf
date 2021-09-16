//func_AllowGetInGROUP
private["_group","_x","_this","_cond"];

_group = _this select 0;
_cond = _this select 1;
{
	[_x] allowGetIn _cond;	
} forEach units _group ;