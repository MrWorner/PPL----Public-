//func_CheckTheRandomBW.sqf
private["_Susp","_x","_MarkerName", "_ChosenBW", "_BWArray","_WhoIsChasingMe"];
_Susp = _this;
_ChosenBW = ObjNull;
_WhoIsChasingMe = (_Susp getVAriable "BW_WhoIsChasingMe");
_BWArray = [];
if(count _WhoIsChasingMe == 0)exitwith{_ChosenBW;}; //fix, maybe not needed!
if(count _WhoIsChasingMe == 1)then
{
	_ChosenBW = _WhoIsChasingMe select 0;
}
else
{
	{
		if(alive _x)then
		{
			if(vehicle _x isKindOf "Man")then
			{	
					_BWArray =  _BWArray + [_x];
			}
	
		};
	}foreach _WhoIsChasingMe;
	
	_ChosenBW = _WhoIsChasingMe select (round random ((count _WhoIsChasingMe) - 1));
};
	//if(isNull _ChosenBW)then{hintc format ["func_CheckTheRandomBW (_Susp getVAriable WhoIsChasingMe) = %1", (_Susp getVAriable "WhoIsChasingMe")];};
//hintc format ["func_CheckTheRandomBW _ChosenBW = %1",name _ChosenBW];

_ChosenBW


	