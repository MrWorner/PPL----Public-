//func_StunWest
private ["_Subject","_this","_StunType"];
_Subject = _this select 0;
_StunType = _this select 1;
_dangerous = false;
//**pain threshold
// Shotgun = 60
// PepperGun = 10
// Taser = 100
// Rubber pistol = 25
// Gas grenade = 10 per sec
// Flashbang = 100
// Tranquilizer rifle = 100 (90sec)
// 0 > Stamina = Stun; -50 > Stamina = heavy Stun

//_Subject switchmove "AinvPknlMstpSlayWrflDnon_healed"; //Обычный стун PepperGun
//_Subject switchmove "AdthPsitMstpSnonWnonDnon_forgoten"; //Сильнейший стун
//_Subject switchmove "AinvPknlMstpSlayWrflDnon_healed2"; //Обычный стун Shotgun  (либо после стуна медленный подьем)
//_Subject switchmove "AdthPercMstpSlowWrflDnon_r12"; //Обычный стун тайзер



//if(_Subject getVariable "Stunned")exitwith{};



//Subject globalchat format ["%1 is screaming because of pain", name _Subject];
//_Subject globalchat format ["%1 (_Subject getVariable StaminaCur)",(_Subject getVariable "StaminaCur")];

if!(vehicle _Subject iskindOf "Man")exitwith{_Subject setVariable ["Morale",(_Subject getVariable "Morale") - 6,true];};




_Subject setVariable ["Stunned",true,true];	
IF((_Subject getVariable "StaminaCur") < (-50))then
{//HEAVY STUN

	[_Subject,"Stunned"] call fnc_CopSAY;
	_Subject call func_DropWeapons;
	_dangerous = false;
	 _Subject setVariable ["Morale",(_Subject getVariable "Morale") - 10,true];
	if((alive _Subject))then{_Subject switchmove "AdthPsitMstpSnonWnonDnon_forgoten";};
	sleep 2;

	sleep ((random 60) + 3);
	if((alive _Subject)and!(_Subject getVariable "Arrested"))then{_Subject switchmove "AinvPknlMstpSnonWnonDnon_healed_2";};
}
else
{//STUN
	
	[_Subject,"Stunned"] call fnc_CopSAY;
	_Subject setVariable ["Morale",(_Subject getVariable "Morale") - 3,true];
	if((alive _Subject))then{_Subject switchmove "AinvPknlMstpSnonWnonDnon_healed_2";};
	sleep 2;
	
};




if(alive _Subject)then
{	
	//if!(_Subject getVariable "Arrested")then
	//{
		
	//	sleep 4;
	////	_Subject setVariable ["OutOfControl",true,true];
	//	_Subject setVariable ["InFighting",false,true];
	//	if(_dangerous)then{_SUBJECT setVariable ["inDanger",true,true]; };
	//};
	_Subject setVariable ["Stunned",false,true];
	
};	