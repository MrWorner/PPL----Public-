//FUNC_siren_step1_registration=
//{
private["_this"];
_this setVariable ["SirenMethod_CODE",1,true];
if(TypeOf _this in DB_PoliceCars_V)exitwith{_this setVariable ["SirenMethod","DB_PoliceCars_V",true];};	//Villas
if(TypeOf _this in AmbulanceWave_Cars_Vilas)exitwith{_this setVariable ["SirenMethod","DB_PoliceCars_V",true];};//Villas
if(TypeOf _this in FiretruckWave_Cars_Vilas)exitwith{_this setVariable ["SirenMethod","DB_PoliceCars_V",true];};//Villas
// if(TypeOf _this in DB_Firetrucks_V)exitwith{_this setVariable ["SirenMethod","DB_Firetrucks_V",true];};	//Villas
// if(TypeOf _this in DB_Ambulances_V)exitwith{_this setVariable ["SirenMethod","DB_Ambulances_V",true];};	//Villas
if(TypeOf _this in DB_PoliceCars_hcp)exitwith{_this setVariable ["SirenMethod","DB_PoliceCars_hcp",true]; };	//hcpookie (BRDM)
if(TypeOf _this in DB_PoliceCars_KaC)exitwith{_this setVariable ["SirenMethod","DB_PoliceCars_KaC",true]; };	//Killerc22_and_Coldfuse (USA cars)


_this setVariable ["SirenMethod","MyMethod",true];
_this setVariable ["SirenMethod_CODE",1,true];
