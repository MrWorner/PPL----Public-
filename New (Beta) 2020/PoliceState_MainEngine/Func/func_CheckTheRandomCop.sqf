//func_CheckTheRandomCop.sqf
private["_Susp","_x","_MarkerName", "_ChosenCop", "_CopArray","_WhoIsChasingMe"];
_Susp = _this;
_ChosenCop = ObjNull;
_WhoIsChasingMe = (_Susp getVAriable "WhoIsChasingMe");
_CopArray = [];
if(count _WhoIsChasingMe == 0)exitwith{_ChosenCop;}; //fix, maybe not needed!
if(count _WhoIsChasingMe == 1)then
{
	_ChosenCop = _WhoIsChasingMe select 0;
}
else
{
	{
		if(alive _x)then
		{
			if(vehicle _x isKindOf "Man")then
			{	
					_CopArray =  _CopArray + [_x];
			}
	
		};
	}foreach _WhoIsChasingMe;
	
	_ChosenCop = _WhoIsChasingMe select (round random ((count _WhoIsChasingMe) - 1));
};
	//if(isNull _ChosenCop)then{hintc format ["func_CheckTheRandomCop (_Susp getVAriable WhoIsChasingMe) = %1", (_Susp getVAriable "WhoIsChasingMe")];};
//hintc format ["func_CheckTheRandomCop _ChosenCop = %1",name _ChosenCop];

_ChosenCop


	