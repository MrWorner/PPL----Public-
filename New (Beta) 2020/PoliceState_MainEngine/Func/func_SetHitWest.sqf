//func_SetHitWest
private ["_Subject","_this","_selection","_damage","_Shooter","_ammo","_StunType","_StunPower","_ammo2"];

_Subject = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_Shooter = _this select 3;
_ammo = _this select 4;
_ammo2 = _this select 4;

//player globalchat format ["func_SetHit _Shooter =  %1  ", _Shooter];
if(_Shooter != _Subject)then
{
	//if(!FriendlyFireRES and side _Subject == side _Shooter and format["%1",side _Subject] == "resistance")exitwith{};
	//if(!FriendlyFireEAST and side _Subject == side _Shooter and format["%1",side _Subject] == "EAST")exitwith{};
	//if(!FriendlyFireWEST and side _Subject == side _Shooter and format["%1",side _Subject] == "WEST")exitwith{};
	//if(!FriendlyFireCIV and side _Subject == side _Shooter and format["%1",side _Subject] == "civilian")exitwith{};
	if(side _Subject == side _Shooter)exitwith{}; //LITE VERSION
};
//player globalchat format ["func_SetHit _ammo2 =  %1  ", _ammo2];


	if ((_ammo in LESS_LETHAL_AMMO)AND((_SUBJECT getVariable "StaminaCur") > (-800)))THEN
	{
		if (_selection == "")then 
		{
			//_Subject globalchat format ["begin %1 (_SUBJECT getVariable StaminaCur)",(_SUBJECT getVariable "StaminaCur")];
			_StunType = (ServerLogic getVariable _ammo) select 1; //  [10,"gas"]
			_StunPower = (ServerLogic getVariable _ammo) select 0;
			 _SUBJECT setVariable ["StaminaCur",(_SUBJECT getVariable "StaminaCur") - _StunPower,true];
			if((_Subject getVariable "Stunned")or(_Subject getVariable "Arrested"))then
			{
				//_Subject globalchat format ["%1: SO FUCKING HURT!", name _Subject];
				_Subject setVariable ["Morale",(_SUBJECT getVariable "Morale") - 5,true];
				if(random 100 < 30)then{_Subject call func_DropWeapons;};
				[_Subject,"ReactRubber"] call fnc_CopSAY;
			}
			else
			{	
				if((_SUBJECT getVariable "StaminaCur") < 0)then
				{
					[_Subject,_StunType]  spawn func_StunWest;				
				}
				else
				{
					//_Subject globalchat format ["%1 OUCH!", name _Subject];
					[_Subject,"ReactRubber"] call fnc_CopSAY;
					if(random 100 < 20)then{_Subject call func_DropWeapons;};
				};
				
			};
		};

	}
	else
	{
		IF((_ammo2 == "GrenadeHandTimedWest")or(_ammo2 == "G_40mm_HE"))EXITWITH{};
		if (_selection == "")then 
		{
			//if( side _Subject == West)then
			//{	
			if(_ammo2 != "")then
			{
				[_Subject,"Injured"] call fnc_CopSAY;
			};
			//};
		};
		_damage
	};


//if(!FriendlyFireRES and side _Subject == side _Shooter and format["%1",side _Subject] == "resistance")exitwith{};
//if(!FriendlyFireEAST and side _Subject == side _Shooter and format["%1",side _Subject] == "EAST")exitwith{};
//if(!FriendlyFireWEST and side _Subject == side _Shooter and format["%1",side _Subject] == "WEST")exitwith{};
//if(!FriendlyFireCIV and side _Subject == side _Shooter and format["%1",side _Subject] == "civilian")exitwith{};


