//func_Global_Arrest_Finalstep3
private["_Susp","_this","_Man"];

_Susp = _this select 0;
_Man = _this select 1;


if!(vehicle _Man isKindOf "Man")then{_Man action ["getOut", vehicle _Man];};
//player sidechat format ["func_Global_Arrest| FINAL PHASE! ARRESTING = %1",_Man];
_Man setVariable ["InFighting",true,true];
Array_ArrestedGuys = Array_ArrestedGuys + [_Susp];
Array_SuspectSide = Array_SuspectSide - [_Susp];
Count_TotalArrested = Count_TotalArrested + 1;

removeAllweapons _Susp;
_Susp setVariable ["Arrested",true,true];
_Susp setVariable ["Dangerous",false,true];
_Susp setVariable ["BW_Dangerous",false,true];
_Susp setVariable ["OutOfControl",false,true];
_Susp setVariable ["BW_OutOfControl",false,true];
_Susp switchmove "civilsitting";
_Susp disableAI "MOVE";
_Man disableAI "MOVE";
_Susp disableAI "FSM";
_Susp setCaptive true;
_Susp setVariable ["WantedFor",[],true];
_Susp setVariable ["BW_WantedFor",[],true];
_Man attachto [_Susp,[0,-0.9,0]];
_Man setdir 0;
_Man switchmove "AinvPknlMstpSnonWrflDnon_medic";
[_Susp] joinSilent grpNull;		
//[_Susp] allowGetIn true;					
//------------------[_Man] allowGetIn true;	
(group _Man) setVariable ["LostFormation",true,true];// <----- NOT NEEDED?					
sleep 3;
if(alive _Man)then
{
	_Man switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
	if(_Man in Array_CopsSide)then{if(random 100 > 70)then{[_Man,"Arrested"] call fnc_CopSAY;};};
};						
//hint "Suspect arrested!";
detach _Man;
[_Susp,(side _Man)] call func_Prison_Main;



