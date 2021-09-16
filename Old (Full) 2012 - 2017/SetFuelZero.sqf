sleep 1;
 player globalchat "Gogogog";
{ _x setFuelCargo 0;} forEach (nearestObjects [player, ["Land_Ind_FuelStation_Feed_EP1"], 500]); 