//func_SirenInduvidualSound.sqf

private["_SUBJECT","_this","_GROUP","_SirenWillUseA","_SirenWillUseB","_SirenWillUseC", "_RandomNumb"];
_SUBJECT = _this;
_SirenWillUseA = "Siren1A";
_SirenWillUseB = "Siren1B";
_SirenWillUseC = "Siren1C";

//Sirent
sleep 0.01;
if(count SirenSoundA_Array < 1)then{ SirenSoundA_Array = SirenSoundA_ArrayRESERVE; SirenSoundB_Array = SirenSoundB_ArrayRESERVE; SirenSoundC_Array = SirenSoundC_ArrayRESERVE;};
//hintc format ["SirenSoundA_Array = %1",SirenSoundA_Array];
_RandomNumb = (round(random ((count SirenSoundA_Array) -1)));

_SirenWillUseA = (SirenSoundA_Array select _RandomNumb);
SirenSoundA_Array = SirenSoundA_Array - [_SirenWillUseA];
_SUBJECT setVariable ["SirenA",_SirenWillUseA,true];

_SirenWillUseB = (SirenSoundB_Array select _RandomNumb);
SirenSoundB_Array = SirenSoundB_Array - [_SirenWillUseB];
_SUBJECT setVariable ["SirenB",_SirenWillUseB,true];

_SirenWillUseC = (SirenSoundC_Array select _RandomNumb);
SirenSoundC_Array = SirenSoundC_Array - [_SirenWillUseC];
_SUBJECT setVariable ["SirenC",_SirenWillUseC,true];


//Sirent END
