//func_fixStuckArrays.sqf
private["_CurrentCop","_x", "_chasingList","_count1","_count2","_count3"];

if(SHOWTMessageLVL2)then{player globalchat format ["|---func_fixStuckArrays: LOADED!", player];};
while{true}do
{
_count1 = 0;
_count2 = 0;
_count3 = 0;
sleep 10;

//sleep 1;
//player sidechat "CLEAN ARRAYS! 3";
//sleep 1;
//player sidechat "CLEAN ARRAYS! 2";
//sleep 1;
//player sidechat "CLEAN ARRAYS! 1";
//sleep 1;
//player sidechat "CLEAN ARRAYS! START!!!";
	{
		if!(alive _x)then
		{
			//Hint "ERROR: COP DOES NOT EXIT!";
			Array_CopsSide = Array_CopsSide - [_x];
		}
		else
		{
			_CurrentCop = _x;
			//player globalchat format ["CHECKING %1", _CurrentCop];
			{
				if!(alive _x)then 
				{
				 //hint format ["DELETING= %1", _x];
				_CurrentCop setVariable ["ImChasing",(_CurrentCop getvariable "ImChasing") - [_x],true];
				_count1 = _count1 + 1;
				};
				if(_count1 > 0)then{_count2 = _count2 + 1; _count3 = _count3 + _count1; _count1 = 0};
			}foreach(_CurrentCop getvariable "ImChasing");
		}
	}foreach Array_CopsSide;
	//hint format ["FIXED COPS = %1; ERRORS = %2", _count2,_count3];
	
	{
		if!(alive _x)then 
		{
			Array_SuspectsInChase = Array_SuspectsInChase - [_x];
		}
		else
		{
		
			if( count (_x getvariable "WhoIsChasingMe") == 0)then
			{		
			Array_SuspectsInChase = Array_SuspectsInChase - [_x];		
			}
			else
			{
				_susp = _x;
				{
					if!(alive _x)then 
					{
						_susp setVariable ["WhoIsChasingMe",(_susp getvariable "WhoIsChasingMe") - [_x],true];
					};
				}
				foreach (_susp getvariable "WhoIsChasingMe");
	
			
			};
		}
	}foreach Array_SuspectsInChase;
	//hintSilent format ["Cops(%1) VS Susp(%2) VS Civ(%3) VS INS(%4) VS ARRESTED(%5) | Friendly FIRE= Cops:%6, Susps:%7 POLICE CHASE:%8 Need to Investigate:%9",count Array_CopsSide, count Array_SuspectSide, count Array_ThirdForce , count Array_CivilainSide, count Array_ArrestedGuys , Count_FriendlyFireCops ,Count_FriendlySuspects,count Array_SuspectsInChase, count NeedToInvestigate];	
	[] call func_SimpleHUD;	
}