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

//**Поиск по базе
_z = 0;
_zTrue = 0;
//player sidechat format ["_Man: %1", _Man];

{
	if(_x == _Man)then
	{
		_Chislo = AllRegistratedBoys select _z;
		_zTrue = _z;
	};
	_z = _z + 1;
}foreach AllRegistratedBoys;
//**


//AllRegistratedBoysOVERDOSE



// Игрок и Бот
if(alive _Man)then{

	if(_Man == player)then
	{
	StunMuch = StunMuch + 1;
	_StunMuchLocal = StunMuch;
	[] execVM "stun\StunEffect2.sqf";
	}
	else
	{
	_StunMuchLocal = AllRegistratedBoysWILLstun select _zTrue;
	_StunOverDose = AllRegistratedBoysOVERDOSE select _zTrue;
	_StunMuchLocal = _StunMuchLocal + 1;
	AllRegistratedBoysWILLstun set [_zTrue, _StunMuchLocal];
	};

	

//player sidechat format ["AllRegistratedBoys: %1", AllRegistratedBoys];
//player sidechat format ["AllRegistratedBoysWILLstun: %1", AllRegistratedBoysWILLstun];
//player sidechat format ["AllRegistratedBoysOVERDOSE: %1", AllRegistratedBoysOVERDOSE];
//player globalchat format ["Trouble: %1", Trouble];
//player globalchat format ["playerisdead: %1", playerisdead];
//player globalchat format ["_Man in Trouble: %1", (_Man in Trouble)];
//player globalchat format ["_StunMuchLocal: %1", (_StunMuchLocal)];
//**Стан сработал
	if((_StunMuchLocal >7)and!(_Man in Trouble)and!(playerisdead)) then
	{
	Trouble = Trouble + [_Man];
	
	 _ManCanSay = ["b1_ReactedPepper_1","b1_ReactedPepper_2","b1_ReactedPepper_3","b1_ReactedTaser_1","b1_ReactedTaser_2","b1_ReactedTaser_3","r1_ReactedPepper_1","r1_ReactedPepper_2","r2_ReactedSting_1"];
     _ManWillSay = (_ManCanSay select (round(random 8)));
 
    //** В тачке
		if((vehicle _Man) isKindOf "Car")exitwith
		{	


		if(player == _man)then { 	StunOverDose = StunOverDose + 0.2; _StunOverDose = StunOverDose; [] execVM "stun\StunEffect3.sqf";};
	    if(player != _man)then { 	_StunOverDose = _StunOverDose + 0.2; AllRegistratedBoysOVERDOSE set [_zTrue, _StunOverDose];};
		sleep 1;
		Trouble = Trouble - [_Man];
		};
	//**
	     if(player == _man)then { _StunOverDose = StunOverDose;};

		if(player == _man)then {if!(_StunOverDose > 3)then{[] execVM "stun\StunEffect.sqf";};}; //включения эффекта
		if(player == _man)then {Player setVariable ["GaveUp", false, true]; StunOverDose = StunOverDose + 1; _StunOverDose = StunOverDose;};
		if(player != _man)then {_StunOverDose = _StunOverDose + 1; AllRegistratedBoysOVERDOSE set [_zTrue, _StunOverDose];};
		 _Man  say3D _ManWillSay;
		
	//** Бросить пушки при тройной передозировке
	    _weapons = weapons _man;
		if ((count _weapons > 0)and(_StunOverDose >2)) then 
		{											
			{_man action ["dropWeapon", _man, _x]} forEach _weapons;																		
		
		sleep 2;
		removeallweapons _man;
		};
	//**
	  
		if!(captive _man)then{ _man setcaptive true;};
		
		
		//**Главные изменения при сильнейшей передозировке!
		if(_StunOverDose > 3)then{
		if(_StunOverDose > 4)then{
			
		
        		
		if(player == _man)then {titleText["", "WHITE IN", 2];[] execVM "effect1.sqf"; __manCanSay = ["Effect2","Effect4","Effect5","Effect10"]; __manWillSay = (__manCanSay select (round(random 2)));playmusic __manWillSay;};
		if(!(_man in RestrainedPeople)and(_man in Trouble)and!(playerisdead))then{_man switchmove "AdthPpneMstpSnonWnonDnon"; sleep 60;};
	}
	else
	{
			if(!(_man in RestrainedPeople)and(_man in Trouble)and!(playerisdead))then{ if(player == _man)then {titleText["", "WHITE IN", 2];  __manCanSay = ["Effect2","Effect4","Effect5","Effect10"]; __manWillSay = (__manCanSay select (round(random 2)));playmusic __manWillSay;};_man switchmove "AdthPsitMstpSnonWnonDnon_forgoten";};
			sleep 30;
			if(!(_man in RestrainedPeople)and(_man in Trouble)and!(playerisdead))then{_man switchmove "AinvPknlMstpSlayWrflDnon_healed";};
	};
		
		}
		else
		{if(!(_man in RestrainedPeople)and(_man in Trouble)and!(playerisdead))then{_man switchmove "AinvPknlMstpSlayWrflDnon_healed";};}; //обынчое попадание	
		
		
		if((_man != player)and!(_man in RestrainedPeople))then{_man switchmove "AinvPknlMstpSlayWrflDnon_healed";};
		sleep 5;
		
		//**ПРоверка на арест и установить нужные переменные на стандарт
		if(!(player in RestrainedPeople)and(_Man in Trouble))then
		{
		_man setcaptive false;
		if(player == _man)then {Player setVariable ["GaveUp", false, true];
		WhoIsGoing = objNull;
		CopGoingtoArrest = false;};
		Trouble = Trouble - [_Man];
	     };
	};
//*** Стан для игрока конец	
};



		
};
