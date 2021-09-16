//func_WhoKilledWho
private["_killer", "_VictimSIDE_str","_this","_NeededSCORE"];

_killer = _this select 0;
_VictimSIDE_str = _this select 1;
//player sidechat format [" side _killer = %1 _VictimSIDE_str = %2", side _killer, _VictimSIDE_str];
if(_killer in Array_BlackWater or _killer in Array_CopsSide)exitwith{};

switch (_VictimSIDE_str) do {
    case "BW": 
	{ 
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + 0.3;
		POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + 0.3;
		BW_RISK_LEVEL_SCORE = BW_RISK_LEVEL_SCORE + 3;
	};    
	case "WEST": 
	{ 
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + 1;
		POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + 1;
	};    
	case "EAST": 
	{ 
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + 0.2;
		POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + 0.2;
	};    
	case "RES": 
	{ 
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + 0.2;
		POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + 0.2;
	};    
	case "CIV": 
	{ 
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE + 1;
		POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE + 1;
	};     
    default { hintc "default func_WhoKilledWho _VictimSIDE_str" };
};


