//fnc_PoliceSpeak.sqf
private["_COP","_Suspect","_this","_speakBan", "_copOnFoot", "_useCarMegaphone", "_noDriver"];

_COP = _this select 0;


_copOnFoot = vehicle _COP isKindOf "Man";
if(!_copOnFoot)then 
{
	if( (driver vehicle _COP) != _COP)then
	{
		_useCarMegaphone = false;
		_noDriver = isnull (driver vehicle _COP);
		if(gunner vehicle _COP == _COP)then
		{ 
			if( !(_noDriver) )exitwith{};//ВЫЙТИ ИЗ СКРИПТА, ЕСЛИ ЕСТЬ ВОДИТЕЛЬ. ОН БУДЕТ БОЛЬТАТЬ ЗА ВСЕХ
			_useCarMegaphone = true;
		}
		else
		{
			if(commander vehicle _COP == _COP)then
			{ 
				if( !(_noDriver) )exitwith{};//ВЫЙТИ ИЗ СКРИПТА, ЕСЛИ ЕСТЬ ВОДИТЕЛЬ. ОН БУДЕТ БОЛЬТАТЬ ЗА ВСЕХ
				_useCarMegaphone = true;
			};
		};
		
		if(!_useCarMegaphone)exitwith{};//ВЫЙТИ ИЗ СКРИПТА, ЕСЛИ ЕСТЬ ВОДИТЕЛЬ ИЛИ ЭТО ПАССАЖИР
	}
};


_Suspect = _this select 1;

if((_COP getvariable "SayHello"))exitwith// and (vehicle _COP isKindOf "Man")
{ 
	_COP setVariable ["SayHello",false,true];
	_COP setVariable ["SpeakBan",((round random 10)),true];
	if!(_Suspect getvariable "CopSaidHello")then
	{
		_Suspect setVariable ["CopSaidHello",true,true]; 
		//_COP globalchat format ["COP says [THIS IS THE POLICE!] to %1",name _Suspect];	
		if!(_Suspect getvariable "GivingUp")then
		{
			if(vehicle _COP isKindOf "Man")then
			{
				[_COP,"FirstContact"] call fnc_CopSAY;
			}
			else
			{
				[_COP,"Beep"] call fnc_CopSAY;
			};		
			_Suspect reveal _COP;//2020
		};
		//if(_Suspect distance _COP < 120)then{[_Suspect,false] spawn fnc_SurrenderOrFight;};
		[_Suspect, true, _COP] spawn fnc_MoraleReaction;
		//------------------_COP spawn func_useGrenade; //NEW FEATURE
		//---------if(primaryWeapon _COP in LESS_LETHAL_GL)then{_COP spawn func_UseGrenadeLauncher;}; //NEW FEATURE						
	}
};

_speakBan = _COP getvariable "SpeakBan";
if(_speakBan > COP_SPEAK_TIMEOUT)exitwith{_COP setVariable ["SpeakBan",(_speakBan - 1),true]; };
_COP setVariable ["SpeakBan",(4 + (round random 10)),true];
if((random 100) < COP_SPEAK_CHANCE_TO_SAY) exitwith //SPEAK MORE
{
	//sleep (random 10);
	//player sidechat "BINGO";
	//cop veh civ man = no say

	if(!(alive _Suspect) or !(_Suspect in (_COP getvariable "ImChasing")))exitwith{};
	
	if!(_Suspect getVariable "GivingUp")then
	{
		if!((_Suspect getVariable "Stunned"))then
		{	
			if!( vehicle _Suspect isKindOf "Man")then
			{
				if( speed vehicle _Suspect > 10)then
				{
					if( vehicle _COP isKindOf "Man")then 
					{
						//_COP globalchat format ["COP says [STOP THE VEHICLE!] to %1",name _Suspect];
						[_COP,"PullOver_Man"] call fnc_CopSAY;
					}
					else
					{
						//_COP globalchat format ["POLICE CAR says [STOP THE VEHICLE!] to %1",name _Suspect];				
						[driver vehicle _COP,"PullOver_Veh"] call fnc_CopSAY;
					}
				}
				else
				{
					if( vehicle _COP isKindOf "Man")then 
					{
						//_COP globalchat format ["COP says [GET OUT OF THE VEHICLE!] to %1",name _Suspect];
						[_COP,"GetOut_Man"] call fnc_CopSAY;
					}
					else
					{
						//_COP globalchat format ["POLICE CAR says [GET OUT OF THE VEHICLE!!] to %1",name _Suspect];
						[driver vehicle _COP,"GetOut_Veh"] call fnc_CopSAY;
					}
				}
			}
			else
			{
				if(_copOnFoot)then
				{
					if(_Suspect call fnc_CheckArmed )then
					{
						//_COP globalchat format ["COP says [PUT YOUR WEAPON DOWN!] to %1",name _Suspect];
						[_COP,"DropGun"] call fnc_CopSAY;
					}
					else
					{
						if( speed _Suspect > 5)then
						{
							//_COP globalchat format ["COP says [STOP RUNNING!] to %1",name _Suspect];
							[_COP,"StopRunning"] call fnc_CopSAY;
						}
						else
						{
							//if!(_Suspect getVariable "GivingUp")then //DONT SAY ANYTHING IF SUSP SURRENDERS
							//{
								//_COP globalchat format ["COP says [HANDS UP!] to %1",name _Suspect];
								[_COP,"HandsUp"] call fnc_CopSAY;
							//}
						}
					}
				}
				else
				{
					if( vehicle _COP isKindOf "Air")then
					{
						if(_Suspect call fnc_CheckArmed)then
						{
							[driver vehicle _COP,"Gun_Heli"] call fnc_CopSAY;
						}
						else
						{
							[driver vehicle _COP,"Stop_Heli"] call fnc_CopSAY;
						}
					}
				}
			};	
			//_COP globalchat format ["COP [PRESSURE WITH VOICE!] SPEAKING To %1", _Suspect];
			[_Suspect,true,_COP] spawn fnc_MoraleReaction;			
		}	
	}	
};
if(!(alive _Suspect) or !(_Suspect in (_COP getvariable "ImChasing")))exitwith{};// EXITWITH FIX !EXPERIMENTAL!
//_COP globalchat format ["COP [PRESSURE!] To %1", _Suspect];
[_Suspect,false,_COP] spawn fnc_MoraleReaction;

//here no saying

