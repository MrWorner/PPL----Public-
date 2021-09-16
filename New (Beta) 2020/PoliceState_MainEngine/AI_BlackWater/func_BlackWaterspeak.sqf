//func_BWspeak.sqf
private["_BW","_Suspect","_this","_speakBan","_randNumb","_randNumbNeeded","_WhatShouldSay","_numb"];

_BW = _this select 0;
_Suspect = _this select 1;


//hello

//armed+
//running+
//waiting+

//car susp moving+
//car susp waiting+
//car BW car susp moving?
//car BW car susp waiting?

//_BW setVariable ["SpeakBan",0,true]; //Speak ban | 0 - can say something, max delay 4 *2.5 sec = 10 sec
//_BW setVariable ["SayHello",true,true]; //Speak first time ban | false = ban until chase end


if((_BW getvariable "SayHello") and (vehicle _BW isKindOf "Man"))exitwith
{ 
	_BW setVariable ["SayHello",false,true];
	_BW setVariable ["SpeakBan",((round random 20)),true];
	if!(_Suspect getvariable "BW_SaidHello")then
	{
		_Suspect setVariable ["BW_SaidHello",true,true]; 
		//if((vehicle _BW isKindOf "Man")&&(vehicle _Suspect isKindOf "Man"))then
		//{
				//_BW globalchat format ["BW says [THIS IS THE BW!] to %1",name _Suspect];	
				if!(_Suspect getvariable "GivingUp")then{[_BW,"FirstContact"] call func_BlackWaterSAY;};
				
				//if(_Suspect distance _BW < 120)then{[_Suspect,false] spawn fnc_SurrenderOrFight_BW;};
				[_Suspect,false,_BW] spawn fnc_SurrenderOrFight_BW;
				_BW spawn func_useGrenade; //NEW FEATURE
				//hintc "HELLO!";
				if(primaryWeapon _BW in LESS_LETHAL_GL)then{_BW spawn func_UseGrenadeLauncher;}; //NEW FEATURE
				
				
		//};
	};
};



_speakBan = _BW getvariable "SpeakBan";
if(_speakBan > COP_SPEAK_TIMEOUT)exitwith{_BW setVariable ["SpeakBan",(_speakBan - 1),true]; };
_BW setVariable ["SpeakBan",(4 + (round random 20)),true];




//if((random 100) < 25) exitwith
if((random 100) < COP_SPEAK_CHANCE_TO_SAY) exitwith //SPEAK MORE
{

sleep (random 10);//NEW v3b



	//player sidechat "BINGO";
	//BW veh civ man = no say

	
	if(!(alive _Suspect) or !(_Suspect in (_BW getvariable "ImChasing")))exitwith{};
	if!(_Suspect getVariable "GivingUp")then
	{
		if!((_Suspect getVariable "Stunned"))then
		{	
			if!( vehicle _Suspect isKindOf "Man")then
			{
				if( speed vehicle _Suspect > 10)then
				{
					if( vehicle _BW isKindOf "Man")then 
					{
						//_BW globalchat format ["BW says [STOP THE VEHICLE!] to %1",name _Suspect];
						//_WhatShouldSay = "m_stopVeh";
						[_BW,"PullOver_Man"] call func_BlackWaterSAY;
					}
					else
					{
						//_BW globalchat format ["BW CAR says [STOP THE VEHICLE!] to %1",name _Suspect];
						//_WhatShouldSay = "v_stopVeh";
						
						[driver vehicle _BW,"PullOver_Veh"] call func_BlackWaterSAY;
					}
				}
				else
				{
					if( vehicle _BW isKindOf "Man")then 
					{
						//_BW globalchat format ["BW says [GET OUT OF THE VEHICLE!] to %1",name _Suspect];
						//_WhatShouldSay = "m_getoVeh";
						[_BW,"GetOut_Man"] call func_BlackWaterSAY;
					}
					else
					{
						//_BW globalchat format ["BW CAR says [GET OUT OF THE VEHICLE!!] to %1",name _Suspect];
						//_WhatShouldSay = "v_getoVeh";
						[driver vehicle _BW,"GetOut_Veh"] call func_BlackWaterSAY;
					}
				};
			}
			else
			{
				if( vehicle _BW isKindOf "Man")then
				{
					if(_Suspect call fnc_CheckArmed )then
					{
						//_BW globalchat format ["BW says [PUT YOUR WEAPON DOWN!] to %1",name _Suspect];
						//_WhatShouldSay = "m_dropG";
						[_BW,"DropGun"] call func_BlackWaterSAY;
					}
					else
					{
						if( speed _Suspect > 5)then
						{
							//_BW globalchat format ["BW says [STOP RUNNING!] to %1",name _Suspect];
							//_WhatShouldSay = "m_stopR";
							[_BW,"StopRunning"] call func_BlackWaterSAY;
						}
						else
						{
							//if!(_Suspect getVariable "GivingUp")then //DONT SAY ANYTHING IF SUSP SURRENDERS
							//{
								//_BW globalchat format ["BW says [HANDS UP!] to %1",name _Suspect];
								//_WhatShouldSay = "m_hands";
								[_BW,"HandsUp"] call func_BlackWaterSAY;
							//}
						};
					};
				}
				else
				{
					if( vehicle _BW isKindOf "Air")then
					{
						if(_Suspect call fnc_CheckArmed)then
						{
							[driver vehicle _BW,"Gun_Heli"] call func_BlackWaterSAY;
						}
						else
						{
							[driver vehicle _BW,"Stop_Heli"] call func_BlackWaterSAY;
						};
					};
				};
			};
		};
	};

	//_BW globalchat format ["BW [PRESSURE WITH VOICE!] SPEAKING To %1", _Suspect];
	[_Suspect,true,_BW] spawn fnc_SurrenderOrFight_BW;
};
//_BW globalchat format ["BW [PRESSURE!] To %1", _Suspect];
[_Suspect,false,_BW] spawn fnc_SurrenderOrFight_BW;

//here no saying

