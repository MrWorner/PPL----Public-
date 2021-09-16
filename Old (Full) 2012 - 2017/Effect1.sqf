


//"RadialBlur" ppEffectAdjust[0.01, 0.01, 0.09, 0.16];
//"ColorInversion" ppEffectAdjust[0, 0.06, 0.03];

_hndl = ppEffectCreate ["ColorInversion", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [0, 0.06, 0.03];
_hndl ppEffectCommit 0.5;

_hndl2 = ppEffectCreate ["RadialBlur", 1501];
_hndl2 ppEffectEnable true;
_hndl2 ppEffectAdjust [0.01, 0.01, 0.09, 0.16];
_hndl2 ppEffectCommit 0.5;

sleep 1;
_hndl ppEffectAdjust [0, 0.00, 0.00];
_hndl ppEffectCommit 3;

_hndl2 ppEffectAdjust [0.00, 0.00, 0.00, 0.0];
_hndl2 ppEffectCommit 3;


sleep 2;
sleep 3;
ppEffectDestroy _hndl;
ppEffectDestroy _hndl2;