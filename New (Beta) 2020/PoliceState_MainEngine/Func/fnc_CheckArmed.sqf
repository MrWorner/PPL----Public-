//fnc_CheckArmed 2020
private["_person"];

_person = _this;
_armed = false;


if!(primaryWeapon _person in INVENTORY_NOT_A_WEAPON_EXCEPTION) exitwith {
	_armed = true;
	_armed;//RETURN
	//hint format ["1 _armed= %1", _armed];
};

if!(secondaryWeapon _person in INVENTORY_NOT_A_WEAPON_EXCEPTION) exitwith {
	_armed = true;
	_armed;//RETURN
	//hint format ["2 _armed= %1", _armed];
};


// if !({_x in INVENTORY_NOT_A_WEAPON_EXCEPTION} foreach (weapons _person)) exitwith {
	// _armed = true;
	// _armed;//RETURN
	// hint format ["3 _armed= %1", _armed];
// };


//hint format ["4 _armed= %1 %2", _armed, primaryWeapon _person];
// if !({_x in INVENTORY_NOT_A_MAGAZINE_EXCEPTION} foreach (magazines _person)) then {
	// _armed = true;
// };
_armed;//RETURN
