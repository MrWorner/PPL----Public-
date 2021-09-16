//func_OutOfControlBW
private["_x","_Points","_BW","_susp"];

if(SHOWTMessageLVL2)then{player globalchat format ["|---FUNC_OutOfControl: LOADED!", player];};// MESSAGE LVL2
while{ENABLE_BW_AI}do
{
	sleep 2;
	{
		_susp = _x;
		if( (_susp getvariable "BW_ChaseInProgress") > 0)then
		{
			if!(_susp getvariable "BW_OutOfControl")then
			{
				_Points = 0;
				if(_susp getvariable "BW_OutOfControPoints" > 0)then
				{
					_Points=_Points + 0.2 + 0.05* (_susp getvariable "BW_ChaseInProgress");
					if((speed _susp > 22) )then{_Points = _Points + 8;}; // If move
					_susp setVariable ["BW_OutOfControPoints",(_susp getvariable "BW_OutOfControPoints") - _Points,true];
					player globalchat  format ["FUNC_OutOfControl.sqf: MAN = %1; Points left: %2",_susp, _susp getvariable "BW_OutOfControPoints"];
				}
				else
				{
					if!( _susp getvariable "GivingUp")then{_susp setVariable ["BW_OutOfControl",true,true];};
					if( !(_susp getvariable "BW_Dangerous") and (speed _susp > 10) )then{_susp setVariable ["BW_Dangerous",true,true];};
					player globalchat  format ["FUNC_OutOfControl.sqf: WARNING! OUT OF CONTROL = TRUE!! MAN = %1;",_susp];
					//hint "OUT OF CONTROL!";
				};
			}
		}
	} forEach Array_SuspectSide;

};

