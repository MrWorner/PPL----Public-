//func_CallPolice

//private["_this", "_TaxiDriverCHosen","_Client"];

player sidechat format ["You called the police!",name player];
["CalledByPhone",position player, true] call func_CreateInvestigationByModule;