//func_PlayerKeyControls.sqf
//https://community.bistudio.com/wiki/DIK_KeyCodes
//https://forums.bistudio.com/topic/111590-keyboard-ui-number-codes/

 private["_this","_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

//player sidechat format ["func_PlayerKeyControls KeyPressed = %1", _this select 1];

if(_shift)then
{
	if( _dikCode == 23)then //SHIFT + I
	{ //Phone (Alpha version)
		_Dialog = createdialog "DIALOG_PlayerInventory";
		if (!(_Dialog)) exitWith {hintc "func_PlayerKeyControls DIALOG_PlayerInventory: Dialog Error!";};
		[] call func_fill_DIALOG_PlayerInventory;
		_handled = true;
	};
	
	if( _dikCode == 24)then //SHIFT + O
	{ //Available actions Dialog
		_Dialog = createdialog "DIALOG_ActionsWindow";
		if (!(_Dialog)) exitWith {hintc "func_PlayerKeyControls DIALOG_ActionsWindow: Dialog Error!";};
		[] call func_fill_DIALOG_ActionsWindow;
		_handled = true;
	};
};
		
		
_handled;  