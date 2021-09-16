_cop = _this select 0;
_Suspect = _this select 1;
while {(alive _cop)and(alive _Suspect)} do {
sleep 1;

//**ѕодозреваемый близко и начинаем дратьс€
   if( ((_cop distance _Suspect) <4) and !(_Suspect in Trouble) and !(_cop in RestrainedPeople) and !(_cop in Trouble) and (alive _Suspect) and !(captive _Suspect) and !(_Suspect getVariable "GaveUp") and !(_Suspect in RestrainedPeople) and !(_Suspect getVariable "FightBAN") and !(_Suspect getVariable "Fight")  and (alive _cop) and !((vehicle _cop) isKindOf "Car") and !((vehicle player) isKindOf "Car")) then {[_cop,_Suspect,false] execVM "Fight.sqf"; sleep 5};
//**

};
