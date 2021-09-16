//func_FlashbangStun.sqf
private ["_Subject","_this"];

_Subject = _this;

//player sidechat format ["%1: Flashbang, son of bitch!",name _Subject];	
[_Subject,"ReactBang"] call func_SuspSAY;
_Subject setVariable ["Morale",(_Subject getVariable "Morale") - 25,true];
if!(_Subject getVariable "Stunned")then
{
	_Subject setVariable ["Stunned",true,true];
	_ANIM= ["AmelPercMstpSnonWnonDnon_zasah6hlava","AmelPercMstpSnonWnonDnon_zasah3hard"];
	_ANIMChosen = (_ANIM select (round(random 1)));
	if(!(_Subject getVariable "Arrested")and(_Subject isKindOf "Man"))then{_Subject switchmove _ANIMChosen;};

	sleep 5;
			
	//
	//_SUBJECT switchmove _ANIMChosen;
	_Subject setVariable ["Stunned",false,true];
};









