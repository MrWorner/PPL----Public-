//func_dead_WhoKilledYOU
private["_SUBJECT", "_SIDE","_this","_x","_chasingList", "_killer","_car","_VictimSide","_KillerSIDE"];
_SUBJECT = _this select 0;
_killer = _this select 1;
_SIDE = _this select 2;
_KillerSIDE = side _killer;
//hint format ["side:%1", (side _SUBJECT)];

if( _KillerSIDE == West)exitwith{};
//if((TypeOF _killer) IN BW_SKINS)exitwith{};
if(_killer in Array_BlackWater)exitwith{};

if(_SUBJECT !=_killer)then
{
	[_killer, _SIDE] call func_WhoKilledWho;

	if(count (_killer getvariable "WhoIsChasingMe") > 0)then
	{
		if( _SIDE == "WEST")exitwith{};
		if( _SIDE == "EAST")exitwith{};
		if( _SIDE == "BW")exitwith{};
		_killer spawn func_CopSaysCIVDOWN;
	}
	else
	{
		if(count (_killer getvariable "BW_WhoIsChasingMe") > 0)then
		{
			if( _SIDE == "WEST")exitwith{};
			if( _SIDE == "EAST")exitwith{};
			if( _SIDE == "BW")exitwith{};
			_killer spawn func_BlackWaterSaysCIVDOWN;
			
		}
		else
		{
					
				
			//hint format ["_SIDE:%1", _SIDE];
			if(_SIDE == "BW")then
			{
			
				[(_killer),(position _killer),true] call func_BW_CreateInvestigation; 
				[_SUBJECT,(position _SUBJECT),false] call func_BW_CreateInvestigation; 
				
				if((random 100 > 85) )then //and ((side _killer) != Resistance)
				{
					[(_killer),(position _killer),true] call func_CreateInvestigation; 
					[_SUBJECT,(position _SUBJECT),false] call func_CreateInvestigation; 
				};		
			}
			else
			{
				if((random 100 > 55) )then //and ((side _killer) != Resistance)
				{
					[(_killer),(position _killer),true] call func_CreateInvestigation; 
					[_SUBJECT,(position _SUBJECT),false] call func_CreateInvestigation; 
				};		
			};
			
			
			if( !(_killer in Array_SuspectSide) )then //and ((side _killer) != Resistance)
			{
				Count_TotalSuspects = Count_TotalSuspects + 1;
				Array_SuspectSide = Array_SuspectSide + [_killer];
			};	

			if( _SIDE != "BW")then
			{	
				_newWantedList = (_killer getVariable "BW_WantedFor") + ["BW Murder"];
				_killer setVariable ["BW_WantedFor",_newWantedList,true];
			}
			else
			{
				_newWantedList = (_killer getVariable "BW_WantedFor") + ["Murder"];
				_killer setVariable ["BW_WantedFor",_newWantedList,true];
			};			
		};		
	};	
	

}
else
{

	_car = nearestObject [_SUBJECT,"LandVehicle"];
	//_car = ObjNull;
	//player sidechat format ["|---_killer: %1", name _killer];
	//player sidechat format ["|---_car: %1", _car];
	if!(isnull _car)then
	{
		if (  ((speed _car > 1)or(speed _car < (-1))) and (!(isNull(driver _car)))  ) then 
		{
			[_killer, _SIDE] call func_WhoKilledWho;
			_killer = driver _car;
			[_killer, _SIDE] call func_KilledByVEHICLE;
		};
	};

}