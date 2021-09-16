//func_TaxiOpenedMap

private["_this", "_Dialog","_marker","_MarkerName"];




_Dialog = createdialog "DIALOG_ModuleTaxi_Map";
if (!(_Dialog)) exitWith {hintc "func_TaxiOpenedMap DIALOG_ModuleTaxi_Map: Dialog Error!";};
_MarkerName =  "Taxi_marker_" + name player;
_marker = createMarkerLocal [_MarkerName, position ObJnull];
_marker setmarkerType "HW_Taxi3";
while {alive player and !(Var_TaxiOrderFinished)}do
{
	onmapsingleclick "Map_pos = _pos; (""Taxi_marker_"" + name player) setmarkerpos _pos";
};
Var_TaxiOrderFinished = false;
onmapsingleclick "";


//player setVariable ["TaxiDestinationPos",GetMarkerPos _MarkerName,true]; 


//[] spawn func_Taxi_MoveToDestinaion;

