//FUNC_siren_step2_activationG=
//_GROUP call FUNC_siren_step2_activationG;
//ACTIVATION IN: func_MainPatrolCheck 

private["_this","_Vehicle","_Code","_CurrentVehicleCode","_GROUP"];

_GROUP = _this;
_Driver = ObjNull;
_Code = 1;
{
	if(driver vehicle _x == _x)exitwith{_Driver = _x;};
}foreach units _GROUP;

if(isnull _Driver)exitwith{};

switch (_GROUP getVariable "WhatGroupIsDoing") do 
{
    case "Backup": 
	{ 
		_Code = 3;
	};
	
    case "func_p_InvestigationInProgress": 
	{ 
		_Code = 2;
	};
	
    case "func_p_PassiveGuardian": 
	{ 
		_Code = 1;
	};
	
    case "InChase": 
	{ 
		_Code = 3;
	};	
	
	
	
	
	
    case "func_p_MovingToRemoveCorpses": 
	{ 
		_Code = 2;
	};	
    case "func_BackToHospital": 
	{ 
		_Code = 1;
	};	
    case "MoveToHeal": 
	{ 
		_Code = 2;
	};
	
	
	
    case "func_p_MovingToRemoveCars": 
	{ 
		_Code = 2;
	};	
    case "func_BackToFireStation": 
	{ 
		_Code = 1;
	};	
    case "MoveToCall": 
	{ 
		_Code = 2;
	};
  

	
    default {  _Code = 1; };//hintc format ["FUNC_siren_step2_activationG WhatGroupIsDoing: default: WhatGroupIsDoing: %1", _GROUP getVariable "WhatGroupIsDoing"];
};


[_Driver,_Code] call FUNC_siren_step2_activation;
