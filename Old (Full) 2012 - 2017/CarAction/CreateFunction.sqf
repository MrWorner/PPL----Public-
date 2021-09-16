INV_CreateVehicle = 

{

private ["_classname", "_position","_dir"];
_classname = _this select 0;
_logic	   = _this select 1;

call compile format ['

newvehicle = _classname createVehicle %4; 
newvehicle setpos %4; 
newvehicle setdir %5; 
newvehicle setVehicleInit "
this setVehicleVarName ""vehicle_%1_%2""; 
vehicle_%1_%2 = this; 
clearWeaponCargo this; 
clearMagazineCargo this;
"; 
processInitCommands;
INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2]; 
"INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];if (""%3"" != """") then {[""CreatedVehicle"", vehicle_%1_%2, typeOf vehicle_%1_%2, %4] execVM ""%3"";};" call broadcast;
', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];

if(typeof newvehicle == "vwgolf" and iscopCLR) then

	{

	format['%1 setobjectTexture [0, "%2"];', newvehicle, "images\vwgolfcop.jpg"] call ISSE_pub_execPstr; 
	updateskins = updateskins + [newvehicle]; publicvariable "updateskins";

	};

};