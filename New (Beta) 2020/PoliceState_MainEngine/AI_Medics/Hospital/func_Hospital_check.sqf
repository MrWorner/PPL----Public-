//func_Hospital_check.sqf
private ["_client","_decimalPlaces","_health","_PRICE","_dialog"];
_client = player;
_decimalPlaces = 2;
_health = damage _client;
Player globalchat "Checking...";
closedialog 51200;
//player sidechat format ["_health = %1",_health];
if((_health == 0))exitwith{Player globalchat "You are good, no damage found.";};


_PRICE = round (_health * 1000);
_dialog =  createdialog "DIALOG_Hospital_heal";
ctrlSetText [51301, format["Ready to pay $%1 for medical attention? ", _PRICE]];


