_civ = _this select 0;
_true = true;

//**Новые переменные
if(_civ != player) then{

WantedPeople = WantedPeople + [_civ];
_civ setVariable ["PlayerIsWanted", true, true];
_civ setVariable ["CopsKnowMe", [], true];

_civ setVariable ["VariableISEEHIM", 0, true];
_civ setVariable ["OpenFire", false, true];
_civ setVariable ["RFAgo", false, true];
_civ setVariable ["WhoIsGoing", objNull, true];
_civ setVariable ["GaveUp", false, true];
_civ setVariable ["FightBAN", false, true];
_civ setVariable ["Fight", false, true];
_civ setVariable ["PlayerFired", false, true];
_civ setVariable ["PlayerFiredBan", false, true];
_civ setVariable ["CopGoingtoArrest", false, true];




}else{
//player groupChat format ["_civ: %1 is added to Alive.sqf script!", (name _civ)];
};
//**

_civ addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun\stun.sqf"; [(_this select 0)] execVM "fireatwill.sqf";  [(_this select 0), (_this select 5)] execVM "stun\fired.sqf";}];
_civ addEventHandler ["handleDamage", {_this call compile preprocessfile "stun\sethit.sqf"}];	

AllRegistratedBoys= AllRegistratedBoys + [_civ];
AllRegistratedBoysWILLstun = AllRegistratedBoysWILLstun + [0];
AllRegistratedBoysOVERDOSE = AllRegistratedBoysOVERDOSE + [0];
while {_true}do
{
sleep 3;



if!(alive _civ)then{
NotAlive =NotAlive + [_civ];
WantedPeople = WantedPeople - [_civ];
_civ setVariable ["PlayerIsWanted", false, true];
_civ setVariable ["VariableISEEHIM", 0, true];
_civ setVariable ["OpenFire", false, true];
_civ setVariable ["RFAgo", false, true];
_civ setVariable ["WhoIsGoing", objNull, true];
_civ setVariable ["GaveUp", false, true];
_civ setVariable ["FightBAN", false, true];
_civ setVariable ["Fight", false, true];
_civ setVariable ["PlayerFired", false, true];
_civ setVariable ["PlayerFiredBan", false, true];
_civ setVariable ["CopGoingtoArrest", false, true];
_civ setVariable ["readyForActionStarted", false, true];


_civ setVariable ["CopsKnowMe", [], true];


_true = false;

_da = "PatientNo" + format ["%1", random 999 ];
NotAliveNames = NotAliveNames + [_da];


_marker = createMarker [_da, position _civ ];
_marker setMarkerType "HW_Cross";
  _VariableISEEHIM = (Player getVariable "VariableISEEHIM");
if(_VariableISEEHIM > 0)then {CivDown = true;};
};


};



/////nul = [this] execVM "civ1\Alive.sqf";