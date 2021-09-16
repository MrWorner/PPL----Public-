//FUNC_siren_step2_activation=
//[_COP,2] call FUNC_siren_step2_activation;
//ACTIVATION IN: func_PoliceSCAN, 

private["_this","_Vehicle","_Code","_CurrentVehicleCode"];

_Driver = _this select 0;
if(driver vehicle _Driver != _Driver)exitwith{};
//hintc "DRIVER!";
_Vehicle = vehicle _Driver;
_Code = _this select 1;
_CurrentVehicleCode = _Vehicle getVariable "SirenMethod_CODE";



switch (_Vehicle getVariable "SirenMethod") do {
    case "DB_PoliceCars_V": 
	{ 
		if(_Code == 3 && _CurrentVehicleCode != 3)then
		{		
			_Vehicle animate ["syrena", 1]; //police_sirens_n
			_Vehicle animate ["syrena2", 0]; //police_sirens_l
			_Vehicle animate ["syrena3", 0]; //police_sirens_k
			null = _Vehicle execVM "\vilas_cpl_core\police_sirens_n.sqf";		
			_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
			_Vehicle animate ["kogut_znika",1];
			//player sidechat "SIREN ACTIVATED!";
		 
		}
		else
		{
			if(_Code == 2 && _CurrentVehicleCode != 2)then
			{
				_Vehicle animate ["kogut_znika",1];
				_Vehicle animate ["syrena", 0]; //police_sirens_n
				_Vehicle animate ["syrena2", 0]; //police_sirens_l
				_Vehicle animate ["syrena3", 0]; //police_sirens_k
				null = _Vehicle execVM "\vilas_cpl_core\police_sirens_l.sqf";	
				_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
				//player sidechat "SIREN NOT ACTIVATED!";
			}
			else
			{//CODE 1
				if(_Code == 1 && _CurrentVehicleCode != 1)then
				{
					_Vehicle animate ["kogut_znika",0];
					_Vehicle animate ["syrena", 0]; 
					_Vehicle animate ["syrena2", 0]; 
					_Vehicle animate ["syrena3", 0]; 
					_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
					//player sidechat "!!!!SIREN DEACTIVATED!";
				}
			}	
		}
	};
    case "DB_PoliceCars_hcp": //hcpookie (BRDM)
	{ 
	
		if(_Code == 3  && _CurrentVehicleCode != 3)then
		{
			//_Vehicle animate ["policesirenswitch",1]; 
			//_Vehicle execVM "\BRDM2IMP\data\scripts\policesiren.sqf";
			_Vehicle animate ["policelightsswitch",1]; 
			_Vehicle animate ["policelightsswitch_dashlight",0]; 
			null =  _Vehicle execVM "\BRDM2IMP\data\scripts\policelights.sqf";
			_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
		}
		else
		{
			if(_Code == 2  && _CurrentVehicleCode != 2)then
			{
				//_Vehicle animate ["policesirenswitch",0]; 
				//_Vehicle execVM "\BRDM2IMP\data\scripts\policesiren.sqf";
				_Vehicle animate ["policelightsswitch",1]; 
				_Vehicle animate ["policelightsswitch_dashlight",0]; 
				null =  _Vehicle execVM "\BRDM2IMP\data\scripts\policelights.sqf";
				_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
				//hintc format ["_Vehicle %1", _Vehicle];			
			}
			else
			{//CODE 1
				if(_Code == 1 && _CurrentVehicleCode != 1)then
				{
					//_Vehicle animate ["policesirenswitch",0]; 
					//_Vehicle execVM "\BRDM2IMP\data\scripts\policesiren.sqf";
					_Vehicle animate ["policelightsswitch",0]; 
					_Vehicle animate ["policelightsswitch_dashlight",1]; 
					_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
				};
			}	
		}	
	};
    case "DB_PoliceCars_KaC"://Killerc22_and_Coldfuse (USA cars)
	{ 
		if(_Code == 3  && _CurrentVehicleCode != 3)then
		{
			_Vehicle animate ["policeSirens",1]; 
			_Vehicle animate ["policeLightbar",1];
			_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
		}
		else
		{
			if(_Code == 2 && _CurrentVehicleCode != 2)then
			{
				_Vehicle animate ["policeSirens",0]; 
				_Vehicle animate ["policeLightbar",1];
				_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
			}
			else
			{//CODE 1
				if(_Code == 1 && _CurrentVehicleCode != 1)then
				{
					_Vehicle animate ["policeSirens",0]; 
					_Vehicle animate ["policeLightbar",0];
					_Vehicle setVariable ["SirenMethod_CODE",_Code,true];
				};
			}	
		}		
	};
    //case "DB_PoliceCars_TCG": 
	//{ 
	// Car1 animate ["ani_lights",0.1];
	// Car1 animate ["ani_siren",0.1];

	//};
    default {  };//hintc "FUNC_siren_step2_activation: default"
};

