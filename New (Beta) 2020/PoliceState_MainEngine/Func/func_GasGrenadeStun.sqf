//func_GasGrenadeStun.sqf
private ["_Subject","_this","_grenade","_pos","_posion","_danger"];

_Subject = _this select 0;
_grenade = _this select 1;
_danger = false;
_posion = 0;
//hint "1";
//_SUBJECT setVariable ["CS_GAS",false,true];
//_SUBJECT setVariable ["Poisoning_CS",0,true];
while{(!isNull _grenade)and(alive _Subject)}do
{
	//_pos =  getpos _grenade;
	if((_Subject distance _grenade < 35)and(_Subject isKindOf "Man"))then
	{
		_posion = _posion + 1;
		//player groupchat format ["func_GasGrenadeStun CS STUN _posion %1",_posion];	
		if(_posion > 4)then
		{
			//player sidechat format ["%1: Damn gas, I need to do something!",name _Subject];	
			
			if (random 100 > 95)then
			{
				if!(_Subject getVariable "Stunned")then
				{
					[_Subject,"ReactGas"] call func_SuspSAY;
				};
			
			};			
			
			if(_posion > 10)then
			{
				if!(_Subject getVariable "Stunned")then
				{
					_Subject setVariable ["Stunned",true,true];
					if(_Subject getVariable "Dangerous")then{_danger = true; _Subject setVariable ["Dangerous",false,true];};
					[_Subject, _danger] spawn func_Global_Arrest;
					while{(!isNull _grenade)and(alive _Subject)}do
					{
					if(!(_Subject getVariable "Arrested"))then{_Subject switchmove "AinvPknlMstpSlayWrflDnon_healed";};
					//player sidechat format ["%1: I can't breathe! I can't see!",name _Subject];
					if (random 100 > 60)then{[_Subject,"ReactGas"] call func_SuspSAY;};
					_Subject setVariable ["Morale",(_Subject getVariable "Morale") - 5,true];	
					sleep 5;
					};
					_Subject setVariable ["Stunned",false,true];
				};
			};
		};
	};
sleep 1;
};
//hint "2";