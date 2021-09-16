//func_CallPolice
private["_marker"];

player sidechat format ["You called medics!",name player];

_marker = createMarker [(name player + format ["%1",round (random 1000)]) , position player];
_marker setMarkerType "hw_medic_Heal";
Medic_PhoneCalls = Medic_PhoneCalls + [_marker];
DeadBodyMARKERS_Array = DeadBodyMARKERS_Array + [_marker];
Count_TOTAL_DEAD_BODIES = Count_TOTAL_DEAD_BODIES + 1;