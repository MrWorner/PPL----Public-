//func_fight.sqf
private["_COP","_x","_this","_susp","_danger"];

_COP = _this select 0;
_susp =  _this select 1;
_danger = false;

//if(_COP distance _susp < 2.5)then
//{
	
if((_susp getvariable "GivingUp")or(_susp getvariable "Arrested")or(_susp getvariable "Stunned"))exitwith{};
	if( !(_COP getvariable "InFighting"))then
	{
		if( !(_susp getvariable "InFighting"))then
		{
			if((vehicle _susp isKindOf "Man") )then
			{
				//Punch anim
				_CHOICE = ["AmelPercMstpSnonWnonDnon_amaterUder3","AmelPercMstpSnonWnonDnon_amaterUder1","AmelPercMstpSnonWnonDnon_amaterUder2"];
				_ANIMAT = (_CHOICE select (round(random 2)));
				//Impact anim
				_CHOICE2 = ["AmelPercMstpSnonWnonDnon_zasah6hlava","AmelPercMstpSnonWnonDnon_zasah3hard","AmelPercMstpSnonWnonDnon_zasah4"];
				_ANIMAT2 = (_CHOICE2 select (round(random 2)));
				
				//hint "FIGHT BEGINS";
				_COP setVariable ["inDanger",false,true];
				_COP disableAI "MOVE";
				//_COP setVariable ["inDangerTargetPerson",ObjNull,true];
				_COP setVariable ["InFighting",true,true];
				_susp setVariable ["InFighting",true,true];
				_susp setCaptive true;
				if(_susp getVariable "Dangerous")then{_danger = true; _susp setVariable ["Dangerous",false,true];};
				removeAllWeapons _susp;	
				_susp attachTo [_COP,[0,1.4,0]];
				_susp setdir 180;			
				_COP switchmove "AmelPercMstpSlowWrflDnon_StrokeGun";
				_susp switchmove _ANIMAT;				
				sleep 1;		
				if(alive _susp)then{_susp switchmove _ANIMAT2;};
				_susp setVariable ["Stunned",true,true];		
				detach _susp;
				_COP enableAI "MOVE";
				sleep 3;
				_susp setCaptive false;
				_COP setVariable ["InFighting",false,true];
				if(alive _susp)then{_susp switchmove "AdthPsitMstpSnonWnonDnon_forgoten";};
				sleep 2;		
				[_susp, _danger] spawn func_Global_Arrest;
				//_susp spawn func_GiveUp; //TEST
				sleep ((random 60) + 3);
				if(alive _susp)then
				{	
					if!(_Susp getVAriable "Arrested")then
					{
						_susp switchmove "AinvPknlMstpSnonWnonDnon_healed_2"; 
						_susp setVariable ["OutOfControl",true,true];
						sleep 6;
						_susp setVariable ["InFighting",false,true];
					};

					_susp setVariable ["Stunned",false,true];	
				};	
			}
		}
	}
//}



//AdthPsitMstpSnonWnonDnon_forgoten
//AinvPknlMstpSnonWnonDnon_healed_2

