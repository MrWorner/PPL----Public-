//fnc_Cmb_changed.sqf	//COMBO BOX

_ROW = lbCurSel 50202;//--- get the current index selected of the combo
//lbClear 50201;//--- clear listbox
if(isNil{_ROW})then{ _ROW = 0;};//--- check if no row has been selected

switch(_ROW)do{
    case 0 :{    _TODISPLAY     = "I'm Br";};
    case 1 :{    _TODISPLAY    = "I'm god";};
    case 2 :{    _TODISPLAY    = "I'm someone";};
	default {  _TODISPLAY     = "ZERO!";};
};
//lbAdd[50201,_TODISPLAY select 1];//-- ADD INFO

player globalchat format ["fnc_Cmb_changed: _TODISPLAY %1 _ROW %2 lbData %3",_TODISPLAY , _ROW, (lbData [50202, (lbCurSel 50202)])]; //COMBO BOX

//{
//	_index = lbAdd [50201, _x];		
//	lbSetData [50201, _index, _x];
//} forEach ["Dirty", "Harry", "Br"];