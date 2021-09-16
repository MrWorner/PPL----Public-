/*
	@file Author: 404Games - Deadbeat  (from Version: 1.3  11/09/2012)
	@file Updated by: HarryWorner ( 07/12/2012)

*/
_Done = false;
disableSerialization;


while {true} do
{
   cutRsc ["NewHud","PLAIN"];
   _ui = uiNameSpace getVariable "NewHud";
      _MainHUD = _ui displayCtrl 3600;
   _DynamicHUD = _ui displayCtrl 3601;
   _DynamicHUD2 = _ui displayCtrl 3602;
	_DynamicHUD3 = _ui displayCtrl 3603;
	_DynamicHUD4 = _ui displayCtrl 3604;
	_DynamicHUD5 = _ui displayCtrl 3605;
	
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
	 if(Playerisdead) then {_health = 0;};
																																																																												//_health, Hunger, Wanted, Money, BlackWaterWanted
   _MainHUD ctrlSetStructuredText parseText format ["%1 <img size='1.3' image='icons\health.paa'/><br/>%2 <img size='1.3' image='icons\hunger.paa'/><br/><br/>%4 <img size='1.3' image='icons\MONEY.paa'/><br/><br/>%3 <img size='1.3' image='icons\wanted.paa'/><br/>%5 <img size='1.3' image='icons\BlackWater.paa'/>", _health, Hunger, Wanted, Money, BlackWaterWanted];
   _MainHUD ctrlCommit 0;

		
		
	//	_tempString = "";
    //    _yOffset = 0.64;
   //         _tempString = format ["%1 <img size='1.3' image='icons\OpenFire.paa'/><br/>", ""];//Open fire 
   //         _yOffset = _yOffset + 0.04;
    //    _DynamicHUD2 ctrlSetStructuredText parseText _tempString;
    //    _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
   //     _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
    //    _DynamicHUD2 ctrlSetPosition [_x, _y, 0.4, 0.65];
    //    _DynamicHUD2 ctrlCommit 0;
		
	
	if(IhaveFUELCAN)then{
		_tempString = "";
        _yOffset = 0.05; //¬€—Œ“¿
            _tempString = format ["%1 <img size='1.3' image='icons\Kanistra.paa'/><br/>", ""];//Kanistra 
            _yOffset = _yOffset + 0.04;
        _DynamicHUD3 ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.99 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD3 ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD3 ctrlCommit 0;
		_FixFUEL = true;

		};
		
		
		
		if(IhaveMEDKIT)then{
			_tempString = "";
        _yOffset = 0.05; //¬€—Œ“¿
            _tempString = format ["%1 <img size='1.3' image='icons\Medkit.paa'/><br/>", ""];//Aptechka 
            _yOffset = _yOffset + 0.04;
        _DynamicHUD4 ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.94 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD4 ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD4 ctrlCommit 0;
		};
		
		
		if(IhaveLOCKPICK)then{
			_tempString = "";
        _yOffset = 0.05; //¬€—Œ“¿
            _tempString = format ["%1 <img size='1.3' image='icons\Lockpicks.paa'/><br/>", ""];//Lockpicks 
            _yOffset = _yOffset + 0.04;
        _DynamicHUD5 ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.89 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD5 ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD5 ctrlCommit 0;
		};
		
		
		
////*********************************************************************************************

    if((Player getVariable "OpenFire")and!(player in RestrainedPeople)and((Player getVariable "PlayerIsWanted"))) then
    {
        _tempString = "";
        _yOffset = 0.54;

            _tempString = format ["%1 <img size='1.3' image='icons\OpenFire.paa'/><br/>", ""];//Open fire 
            _yOffset = _yOffset + 0.04;


        _DynamicHUD ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD ctrlCommit 0;
    };
	
	 

	  
	  if(!(Player getVariable "OpenFire")and((Player getVariable "VariableISEEHIM") > 0)and!(player in RestrainedPeople)and((Player getVariable "PlayerIsWanted"))) then
    {
        _tempString = "";
        _yOffset = 0.54;

            _tempString = format ["%1 <img size='1.5' image='icons\Spotted.paa'/><br/>", ""];//Spotted 
            _yOffset = _yOffset + 0.04;


        _DynamicHUD ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD ctrlCommit 0;
    };

	  if(!(Player getVariable "OpenFire")and((Player getVariable "VariableISEEHIM") == 0)and!(player in RestrainedPeople)and((Player getVariable "PlayerIsWanted"))) then
    {
        _tempString = "";
        _yOffset = 0.54;


			_tempString = format ["%1 <img size='1.5' image='icons\Wanted2.paa'/><br/> ", ""];//Wanted 
            _yOffset = _yOffset + 0.04;

       // player globalchat "HUD is working";
        _DynamicHUD ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD ctrlCommit 0;
    };
	
	 if(player in RestrainedPeople) then
    {
        _tempString = "";
        _yOffset = 0.54;

            _tempString = format ["%1 <img size='1.5' image='icons\Arrested.paa'/><br/>", ""];//Arrested 
            _yOffset = _yOffset + 0.04;


        _DynamicHUD ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _DynamicHUD ctrlSetPosition [_x, _y, 0.4, 0.65];
        _DynamicHUD ctrlCommit 0;
    };


    sleep 1;
};