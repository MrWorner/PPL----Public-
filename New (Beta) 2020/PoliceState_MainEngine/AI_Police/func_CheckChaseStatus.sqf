//func_CheckChaseStatus.sqf
private["_COP","_Suspect","_this","_Search"];

_COP = _this select 0;
_Suspect = _this select 1;
_Search = false;

//player sidechat format ["_Suspect = %1",_Suspect];
if(_Suspect distance _COP > 675)then//675
{
	_COP setVariable ["ImChasing",(_COP getvariable "ImChasing") - [_Suspect],true];
	_Suspect setVariable ["WhoIsChasingMe",(_Suspect getvariable "WhoIsChasingMe") - [_COP],true];//NEW
	_Suspect setVariable ["PoliceChaseInProgress",(_Suspect getvariable "PoliceChaseInProgress") - 1,true];
	player groupchat format ["%1 [escaped from] %2, STILL CHASING: %3",_Suspect,_COP,(_Suspect getvariable "PoliceChaseInProgress")];
	//if(_Suspect getvariable "PoliceChaseInProgress" != count (_Suspect getvariable "WhoIsChasingMe"))then{hint format ["ERROR 01: PoliceChaseInProgress= %1; WhoIsChasingMe = %2 ",(_Suspect getvariable "PoliceChaseInProgress"),count (_Suspect getvariable "WhoIsChasingMe")];};
	if((count (_Suspect getvariable "WhoIsChasingMe") < 1) and (alive _Suspect))then
	{
		if(vehicle _Suspect isKindOf "Man")then{_Search = true;};
		[_Suspect,(position _Suspect),_Search] call func_CreateInvestigation; 
		Array_SuspectsInChase = Array_SuspectsInChase - [_Suspect];
		_Suspect setVariable ["CopSaidHello",false,true];
	};
}
else
{
	if(_Suspect getvariable "Arrested")then
	{		
		_Suspect setVariable ["PoliceChaseInProgress",0,true];
		_Suspect setVariable ["WantedFor",[],true];
		_COP setVariable ["ImChasing",(_COP getvariable "ImChasing") - [_Suspect],true];
		_Suspect setVariable ["WhoIsChasingMe",(_Suspect getvariable "WhoIsChasingMe") - [_COP],true];//NEW
		if(count (_Suspect getvariable "WhoIsChasingMe") == 0)then{player groupchat format ["%1 [arrested, chase end] ",_Suspect]; Array_SuspectsInChase = Array_SuspectsInChase - [_Suspect]; 
		_Suspect setVariable ["CopSaidHello",false,true];};
	}
	else
	{
		if(count (_Suspect getvariable "WantedFor") == 0)then
		{
			_COP setVariable ["ImChasing",(_COP getvariable "ImChasing") - [_Suspect],true];
			_Suspect setVariable ["WhoIsChasingMe",(_Suspect getvariable "WhoIsChasingMe") - [_COP],true];//NEW
			_Suspect setVariable ["PoliceChaseInProgress",0,true];
			//hint format ["%1 [not wanted, chase end?]  %2, ",_Suspect,_COP];
			if(count (_Suspect getvariable "WhoIsChasingMe") == 0)then{player groupchat format ["%1 [not wanted, chase end]",_Suspect]; Array_SuspectsInChase = Array_SuspectsInChase - [_Suspect]; _Suspect setVariable ["CopSaidHello",false,true];};
		}
	}
	//else
	//{
	//	if!(alive _Suspect)then
	//	{
	//	_COP setVariable ["ImChasing",(_COP getvariable "ImChasing") - [_Suspect],true];		
	//	hint format ["%1 [Suspect is dead, chase end]  %2, ",_Suspect,_COP];
	//	}
	
	//};
}