//func_KilledByVEHICLE
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer","_SIDE","_PoliceChase","_BlackWaterChase" ];

_killer = _this select 0;
_SIDE = _this select 1;
//hintc format ["_SIDE = %1",_SIDE];


if( side _killer == West)exitwith{};
if((TypeOF _killer) IN BW_SKINS)exitwith{};
if!(alive _killer)exitwith{};
if(side _killer == Civilian and _killer != player )then{hintc "func_KilledByVEHICLE: Civilian killer!"};

_PoliceChase = count (_killer getvariable ["WhoIsChasingMe",[]]) > 0;
_BlackWaterChase =  count (_killer getvariable ["BW_WhoIsChasingMe",[]]) > 0;
_newWantedList = (_killer getVariable "WantedFor") + ["Killing with a vehicle"];
_killer setVariable ["WantedFor",_newWantedList,true];

if(_PoliceChase)then
{
	if!(_killer getVariable "Dangerous")then
	{
		_killer setVariable ["Dangerous",true,true]; 
	};	
	if(_SIDE == "Civ")then{_killer spawn func_CopSaysCIVDOWN; };
}
else
{
	if(_BlackWaterChase)then
	{
		if!(_killer getVariable "BW_Dangerous")then
		{
			_killer setVariable ["BW_Dangerous",true,true]; 
		};
		if(_SIDE == "Civ")then{_killer spawn func_BWSaysCIVDOWN; };
	};

};





if(!_PoliceChase and !_BlackWaterChase)then
{
	if(random 100 > 55)then
	{
		[(_killer),(position _killer),true] call func_CreateInvestigation; 
		//[_SUBJECT,(position _SUBJECT),false] call func_CreateInvestigation; 
		//_killer setVariable ["Dangerous",true,true]; 
	};
	
	if!(_killer in Array_SuspectSide)then
	{
		Count_TotalSuspects = Count_TotalSuspects + 1;
		Array_SuspectSide = Array_SuspectSide + [_killer];
	};
	
	if(_SIDE == "BW")then
	{
		_newWantedList = (_killer getVariable "BW_WantedFor") + ["Killing with a vehicle"];
		_killer setVariable ["BW_WantedFor",_newWantedList,true];
	};
}



