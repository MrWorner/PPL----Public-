sleep 0.1;
	CurrentPrice = 0;
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);

if((_health == 100)and!(IreadyToRepair))exitwith{Player globalchat "You are looking good, no damage found, sir.";};
if((_health < 100)and(!(IreadyToRepair)))exitwith{
Player globalchat "Checking..";
CurrentPrice = 100 - _health;
CurrentPrice = CurrentPrice * 35;
//player globalchat format ["CurrentPrice = %1",CurrentPrice];
//player globalchat format ["IreadyToRepair = %1",IreadyToRepair];
if (!(createDialog "MedicReady")) exitWith {hint "Dialog Error!";};
ctrlSetText [1, format["Ready to pay $%1 for medical attention? ", CurrentPrice]];
};

if((_health < 100)and((IreadyToRepair)))exitwith{
Player globalchat "Healing..";
Player setdammage 0;


//player globalchat format ["CurrentPrice = %1",CurrentPrice];
//player globalchat format ["IreadyToRepair = %1",IreadyToRepair];
IreadyToRepair = false;

};