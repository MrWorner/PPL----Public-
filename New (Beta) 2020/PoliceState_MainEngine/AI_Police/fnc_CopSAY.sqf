//fnc_CopSAY 2020
private["_COP","_this","_WhatToSay"];
_COP = _this select 0;
_WhatToSay = _this select 1;


//player sidechat format ["_WhatToSay = %1",_WhatToSay];
switch (_WhatToSay) do 
{
	case "CivDown": 
	{
		if (random 100 > 25)then{if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_CivDown;};};
	};		
	
	case "OfficerDown": 
	{
		if (random 100 > 25)then{if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_OfficerDown;};};
	};	

	case "Injured": 
	{ 
		//VoiceCopBanMin = false;
		
		if(random 100 > 75)then
		{
			if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_Injured;};
		};
	};
	
	
	
	case "ReactBang": 
	{ 
		if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_ReactBang;};
	};	
	case "ReactGas": 
	{ 
		if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_ReactGas;};
	};	
	case "ReactRubber": 
	{ 
		if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_Rubber;};
	};	
	case "Stunned": 
	{ 
		if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_Stunned;};
	};
	
	
	
	default 
	{ 
		if(VoiceCopBanMin)exitwith{};
		VoiceCopBanMin = true;
		//hint "VoiceCopBanMin";
		[] spawn 
		{
			sleep VoiceTalkAlotSec;
			VoiceCopBanMin = false;
		};

		switch (_WhatToSay) do 
		{
			case "DropGun": 
			{ 
				_COP call func_CopSay_DropGun;
			};
			case "Beep": //2020
			{
				_COP call fnc_CopSay_Beep;
			};
			case "FirstContact": 
			{
				_COP call func_CopSay_FirstContact;
			};	
			case "HandsUp": 
			{
				_COP call func_CopSay_HandsUp;
			};	
			case "StopRunning": 
			{
				_COP call func_CopSay_StopRunning;
			};	
			case "Surrounded": 
			{
				_COP call func_CopSay_Surrounded;
			};	
			case "GetOut_Man": 
			{
				_COP call func_CopSay_GetOut_Man;
			};	
			case "GetOut_Veh": 
			{
				_COP call func_CopSay_GetOut_Veh;
			};	
			case "PullOver_Man": 
			{
				_COP call func_CopSay_PullOver_Man;
			};	
			case "PullOver_Veh": 
			{
				_COP call func_CopSay_PullOver_Veh;
			};	
			case "SuspShooting": 
			{
				if(vehicle _COP isKindOf "Man")then{_COP call func_CopSay_SuspShooting;};
			};	
			case "PleaseLeave": 
			{
				_COP call func_CopSay_PleaseLeave;
			};	
			case "ShowID": 
			{
				_COP call func_CopSay_ShowID;
			};	
			case "ThankCOOP": 
			{
				_COP call func_CopSay_ThankCOOP;
			};	
			case "Arrested": 
			{
				_COP call func_CopSay_Arrested;
			};	
			case "MovingArrest": 
			{
				_COP call func_CopSay_MovingArrest;
			};	
			case "DontSeeHim": 
			{
				_COP call func_CopSay_DontSeeHim;
			};	
			case "WhoCalledPolice": 
			{
				_COP call func_CopSay_WhoCalledPolice;
			};
			case "Gun_Heli": 
			{
				_COP call func_CopSay_HeliGUNS;
			};
			case "Stop_Heli": 
			{
				_COP call func_CopSay_HeliSTOP;
			};			
			default { hint "func_CopSAY default" };
		};
	
	
	};
};


	


