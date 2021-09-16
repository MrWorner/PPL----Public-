_human= _this select 0;


_human addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun\stun.sqf";  [(_this select 0), (_this select 5)] execVM "stun\fired.sqf";}];
_human addEventHandler ["handleDamage", {_this call compile preprocessfile "stun\sethit.sqf"}];

AllRegistratedBoys= AllRegistratedBoys + [_human];
AllRegistratedBoysWILLstun = AllRegistratedBoysWILLstun + [0];
AllRegistratedBoysOVERDOSE = AllRegistratedBoysOVERDOSE + [0];


sleep 3 + random 3;

while{alive _human}do{
sleep random 3;
};

NotAlive =NotAlive + [_human];
//_element = (NotAlive select 0);

_da = "PatientNo" + format ["%1", random 999 ];
NotAliveNames = NotAliveNames + [_da];


_marker = createMarker [_da, position _human ];
_marker setMarkerType "HW_Cross";

//player globalchat format ["name = %1",_da];
// _NotAliveName = NotAliveNames select 0; 
//player globalchat format ["_NotAliveName = %1",_NotAliveName];


//nul = [_cop] execVM "DorA.sqf";