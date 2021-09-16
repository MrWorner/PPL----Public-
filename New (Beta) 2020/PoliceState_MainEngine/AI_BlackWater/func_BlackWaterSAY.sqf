//func_BlackWaterSAY.sqf
private["_BW","_this","_WhatToSay"];
_BW = _this select 0;
_WhatToSay = _this select 1;


//player sidechat format ["_WhatToSay = %1",_WhatToSay];
switch (_WhatToSay) do 
{
	case "CivDown": 
	{
		if (random 100 > 25)then{if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_CivDown;};};
	};		
	
	case "OfficerDown": 
	{
		if (random 100 > 25)then{if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_OfficerDown;};};
	};	

	case "Injured": 
	{ 
		hintc "func_BlackWaterSAY.sqf: Injured DISABLED!";
		//if(random 100 > 75)then
		//{
		//	if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_Injured;};
		//};
	};
	
	
	
	case "ReactBang": 
	{ 
		if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_ReactBang;};
	};	
	case "ReactGas": 
	{ 
		if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_ReactGas;};
	};	
	case "ReactRubber": 
	{ 
		if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_Rubber;};
	};	
	case "Stunned": 
	{ 
		if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_Stunned;};
	};
	case "PleaseLeave": 
	{
		_BW call func_BWSay_PleaseLeave;
	};			
	case "PleaseLeave2": 
	{
		_BW call func_BWSay_PleaseLeave2;
	};	
	case "PleaseLeave3": 
	{
		_BW call func_BWSay_PleaseLeave3;
	};	
	case "PleaseLeave3": 
	{
		_BW call func_BWSay_PleaseLeave3;
	};	
	case "PleaseLeaveSecond": 
	{
		_BW call func_BWSay_PleaseLeaveSecond;
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
				_BW call func_BWSay_DropGun;
			};
			case "FirstContact": 
			{
				_BW call func_BWSay_FirstContact;
			};	
			case "HandsUp": 
			{
				_BW call func_BWSay_HandsUp;
			};	
			case "StopRunning": 
			{
				_BW call func_BWSay_StopRunning;
			};	
			case "Surrounded": 
			{
				hintc "func_BlackWaterSAY.sqf: Surrounded DISABLED!";
			};	
			case "GetOut_Man": 
			{
				hintc "func_BlackWaterSAY.sqf: GetOut_Man DISABLED!";
			};	
			case "GetOut_Veh": 
			{
				hintc "func_BlackWaterSAY.sqf: GetOut_Veh DISABLED!";
			};	
			case "PullOver_Man": 
			{
				hintc "func_BlackWaterSAY.sqf: PullOver_Man DISABLED!";
			};	
			case "PullOver_Veh": 
			{
				hintc "func_BlackWaterSAY.sqf: PullOver_Veh DISABLED!";
			};	
			case "SuspShooting": 
			{
				if(vehicle _BW isKindOf "Man")then{_BW call func_BWSay_SuspShooting;};
			};	
			case "ShowID": 
			{
				hintc "func_BlackWaterSAY.sqf: ShowID DISABLED!";
			};	
			case "ThankCOOP": 
			{
				hintc "func_BlackWaterSAY.sqf: ThankCOOP DISABLED!";
			};	
			case "Arrested": 
			{
				hintc "func_BlackWaterSAY.sqf: Arrested DISABLED!";
			};	
			case "MovingArrest": 
			{
				_BW call func_BWSay_MovingArrest;
			};	
			case "DontSeeHim": 
			{
				hintc "func_BlackWaterSAY.sqf: DontSeeHim DISABLED!";
			};	
			case "WhoCalledBW": 
			{
				hintc "func_BlackWaterSAY.sqf: WhoCalledBW DISABLED!";
			};
			case "Gun_Heli": 
			{
				hintc "func_BlackWaterSAY.sqf: Gun_Heli DISABLED!";
			};
			case "Stop_Heli": 
			{
				hintc "func_BlackWaterSAY.sqf: Stop_Heli DISABLED!";
			};			
			default { hint "func_BWSAY default" };
		};
	
	
	};
};


	


