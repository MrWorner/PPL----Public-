//fnc_Sel_click.sqf //LIST BOX

//_ROW = lbCurSel 2101;
//if(isNil{_ROW})then{ _ROW = 0;};
//_ID = (lbCurSel 1500);
//player sidechat 
//f(isNil{_ID })then{ _ID = 0;};

//hint format["%1",lbText _ID];

//buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] spawn FUNC_OpenGunSHOP;"];

_ROW = lbCurSel 50201;//--- get the current index selected of the list
if(isNil{_ROW})then{ _ROW = 0;};//--- check if no row has been selected

switch(_ROW)do{
    case 0 :{    _TODISPLAY     = "RAZ";};
    case 1 :{    _TODISPLAY    = "DVA";};
    case 2 :{    _TODISPLAY    = "TRI";};
	default {  _TODISPLAY     = "ZERO ZERO!!!!";};
};

player sidechat format ["fnc_Sel_click: _TODISPLAY %1 _ROW %2 lbData %3",_TODISPLAY , _ROW, (lbData [50201, (lbCurSel 50201)])];//LIST BOX