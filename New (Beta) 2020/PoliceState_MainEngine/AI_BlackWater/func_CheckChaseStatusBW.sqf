//func_CheckChaseStatusBW.sqf
private["_BW","_Suspect","_this","_Search"];


_BW = _this select 0;
_Suspect = _this select 1;
_Search = false;


if(_Suspect distance _BW > 675)then
{
	
	_BW setVariable ["ImChasing",(_BW getvariable "ImChasing") - [_Suspect],true];
	_Suspect setVariable ["BW_WhoIsChasingMe",(_Suspect getvariable "BW_WhoIsChasingMe") - [_BW],true];//NEW
	_Suspect setVariable ["BW_ChaseInProgress",(_Suspect getvariable "BW_ChaseInProgress") - 1,true];
	player groupchat format ["%1 [escaped from] %2, STILL CHASING: %3",_Suspect,_BW,(_Suspect getvariable "BW_ChaseInProgress")];
	//if(_Suspect getvariable "BW_ChaseInProgress" != count (_Suspect getvariable "WhoIsChasingMe"))then{hint format ["ERROR 01: BW_ChaseInProgress= %1; WhoIsChasingMe = %2 ",(_Suspect getvariable "BW_ChaseInProgress"),count (_Suspect getvariable "WhoIsChasingMe")];};
	if((count (_Suspect getvariable "BW_WhoIsChasingMe") < 1) and (alive _Suspect))then
	{
		if(vehicle _Suspect isKindOf "Man")then{_Search = true;};
		[_Suspect,(position _Suspect),_Search] call func_BW_CreateInvestigation; 
		Array_BW_SuspectsInChase = Array_BW_SuspectsInChase - [_Suspect];
		_Suspect setVariable ["BW_SaidHello",false,true];
	};
}
else
{
	if(_Suspect getvariable "Arrested")then
	{
		
		_Suspect setVariable ["BW_ChaseInProgress",0,true];
		_Suspect setVariable ["BW_WantedFor",[],true];
		_BW setVariable ["ImChasing",(_BW getvariable "ImChasing") - [_Suspect],true];
		_Suspect setVariable ["BW_WhoIsChasingMe",(_Suspect getvariable "BW_WhoIsChasingMe") - [_BW],true];//NEW
		if(count (_Suspect getvariable "BW_WhoIsChasingMe") == 0)then{player groupchat format ["%1 [arrested, chase end] ",_Suspect]; Array_BW_SuspectsInChase = Array_BW_SuspectsInChase - [_Suspect]; 
		_Suspect setVariable ["BW_SaidHello",false,true];};
	}
	else
	{
		if(count (_Suspect getvariable "BW_WantedFor") == 0)then
		{
			_BW setVariable ["ImChasing",(_BW getvariable "ImChasing") - [_Suspect],true];
			_Suspect setVariable ["BW_WhoIsChasingMe",(_Suspect getvariable "BW_WhoIsChasingMe") - [_BW],true];//NEW
			_Suspect setVariable ["BW_ChaseInProgress",0,true];
			//hint format ["%1 [not wanted, chase end?]  %2, ",_Suspect,_BW];
			if(count (_Suspect getvariable "BW_WhoIsChasingMe") == 0)then{player groupchat format ["%1 [not wanted, chase end]",_Suspect]; Array_BW_SuspectsInChase = Array_BW_SuspectsInChase - [_Suspect]; _Suspect setVariable ["BW_SaidHello",false,true];};
		}
	
	}
	
	
	//else
	//{
	//	if!(alive _Suspect)then
	//	{
	//	_BW setVariable ["ImChasing",(_BW getvariable "ImChasing") - [_Suspect],true];		
	//	hint format ["%1 [Suspect is dead, chase end]  %2, ",_Suspect,_BW];
	//	}
	
	//};

}