_art         = _this select 0;
_StunMuchLocal = 0;
_StunOverDose = 0;
if (_art == "fired") then 

{
			
_ammo   = _this select 1;
_wep	= _this select 2;  
_bullet = nearestObject  [getpos player, _ammo];


if(_ammo != "cal68_50FP")exitwith{};

};


if (_art == "hit") then 

{
_shooter   = _this select 1;
_selection = _this select 2;
_damage    = _this select 3;
_Ammo    = _this select 4;
_Man  = _this select 5;






	
	
	
//**Стан сработал
	if(!(_man in Trouble)and!(playerisdead)) then
	{
	Trouble = Trouble + [_man];
	
	 _ManCanSay = ["ld_ReactedInjuryIntense_1","ld_ReactedInjuryIntense_2","ld_ReactedInjuryIntense_3","ld_ReactedInjuryIntense_4","b1_ReactedTaser_2","ld_ReactedInjuryIntense_5","ld_ReactedInjuryIntense_6"];
     _ManWillSay = (_ManCanSay select (round(random 5)));
 
 
	if((vehicle _man) isKindOf "Car")exitwith{
	if(player == _Man)then{[] execVM "stun\StunEffect.sqf";};
	};
	
	//["AdthPercMstpSlowWrflDnon_r06","AdthPercMstpSlowWrflDnon_r10","AdthPercMstpSlowWrflDnon_r12","AdthPercMstpSlowWrflDnon_r13","AdthPknlMstpSlowWlnrDnon_binocular"]
		
		if(player == _Man)then{[] execVM "stun\StunEffectShotgun.sqf";
		Player setVariable ["GaveUp", true, true];
		 };
		 _Man  say3D _ManWillSay;
		
		//** Бросить пушки при тройной передозировке
		_weapons = weapons _man;
		if ((count _weapons > 0)) then 
		{											
			{_man action ["dropWeapon", _man, _x]} forEach _weapons;																		
		
		sleep 2;
		removeallweapons _man;
		};

	    //**
		if!(captive _man)then{ _man setcaptive true;};
		
			if(!(_Man in RestrainedPeople)and(_Man in Trouble)and!(playerisdead))then{ if(player == _Man)then{titleText["", "WHITE IN", 2];};  _man switchmove "AdthPercMstpSlowWrflDnon_r12";};
			sleep 8;
			if(!(_Man in RestrainedPeople)and(_Man in Trouble)and!(playerisdead))then{_man switchmove "AinvPknlMstpSlayWrflDnon_healed";};
		
		sleep 5;
		
		if(!(_Man in RestrainedPeople)and(_Man in Trouble))then{
		_man setcaptive false;
		if(player == _Man)then{Player setVariable ["GaveUp", false, true];
	    WhoIsGoing = objNull;
		
		CopGoingtoArrest = false;
		};
		Trouble = Trouble - [_Man];
	     
		 };
	};
		
};

