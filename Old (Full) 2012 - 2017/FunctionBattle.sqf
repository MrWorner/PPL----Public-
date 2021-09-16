
waitUntil { player == player };
//copsArray = [];
//{ copsArray = copsArray + [_x] } forEach allUnits;
if (!isDedicated) then {
    sleep 1;
    waitUntil { !(isNull player) };
    (findDisplay 46) displayAddEventHandler ["keyDown", "_this call functionName_keyDown"];
};



functionName_keyDown = 
{
  private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
  _ctrl = _this select 0;
  _dikCode = _this select 1;
  _shift = _this select 2;
  _ctrlKey = _this select 3;
  _alt = _this select 4;
  
  _handled = false;
 
 
 if (Playerisdead2) then
  {
  player exec "camera.sqs";
  setacctime 0.0001;
  };
 
 
 
 if (!_shift && !_ctrlKey && !_alt && !PressButton) then
  {
    if (_dikCode == 0x19) then //P
    {
	 
	 if!(PhoneOpened)then{PhoneOpened = true; ["Phone"] execVM "gunshop\openDialog.sqf";}else{PhoneOpened = false;closedialog 0;};
      _handled = true;
    };
  };
 
  if (!_shift && !_ctrlKey && !_alt && PressButton) then
  {

    if (_dikCode == 0x11) then
    {
		ButtonON =  "W";
		//player globalchat "w pressed";
		PressButton = false;
      _handled = true;
    };
	if (_dikCode == 0x10) then
    {
		ButtonON =  "Q";
		//player globalchat "q pressed";
		PressButton = false;
      _handled = true;
    };
	if (_dikCode == 0x12) then
    {
		ButtonON =  "E";
		//player globalchat "e pressed";
		PressButton = false;
      _handled = true;
    };
	if (_dikCode == 0x39) then
    {
		ButtonON =  "SPACE";
		//player globalchat "SPACE pressed";
		PressButton = false;
      _handled = true;
    };
	
	
	if (_dikCode == 0x16) then
    {
		ButtonON =  "U";
		//player globalchat "U pressed";
		PressButton = false;
      _handled = true;
    };
	
	if (_dikCode == 0x25) then
    {
		ButtonON =  "K";
		//player globalchat "K pressed";
		PressButton = false;
      _handled = true;
    };
	
	if (_dikCode == 0x17) then
    {
		ButtonON =  "I";
		//player globalchat "I pressed";
		PressButton = false;
      _handled = true;
    };
	
	
	
	if (_dikCode == 0x2C) then
    {
		ButtonON =  "Z";
		//player globalchat "Z pressed";
		PressButton = false;
      _handled = true;
    };
	
	if (_dikCode == 0x1E) then
    {
		ButtonON =  "A";
		//player globalchat "A pressed";
		PressButton = false;
      _handled = true;
    };
		if (_dikCode == 0x23) then
    {
		ButtonON =  "H";
		//player globalchat "H pressed";
		PressButton = false;
      _handled = true;
    };
	
	
	
	if ((_dikCode != 0x23)and(_dikCode != 0x1E)and(_dikCode != 0x2C)and(_dikCode != 0x39)and(_dikCode != 0x12)and(_dikCode != 0x10)and(_dikCode != 0x11)and(_dikCode != 0x17)and(_dikCode != 0x25)and(_dikCode != 0x16)) then
    {
	ButtonON =  "SHIT";
		//player globalchat "SHIT pressed";
		PressButton = false;
      _handled = true;
	
	};
	
	
  };

  _handled;  
};