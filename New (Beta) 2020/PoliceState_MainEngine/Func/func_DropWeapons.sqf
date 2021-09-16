//func_DropWeapons
private ["_Subject","_this","_Mags","_Weps","_box","_x","_WEPHOLDER"];

_Subject = _this;


_Weps = (weapons _SUBJECT) - NON_LETHAL_ITEMS;
_Mags = magazines _SUBJECT;



//if (count (_Weps+_Mags)>0) then 
if (count (_Weps)>0) then 
{
	//player sidechat format ["%1 lost his weapons!",name _SUBJECT];
	_WEPHOLDER = createVehicle ["WeaponHolder", _SUBJECT modelToWorld [0,0.8,0], [], 0.5, "CAN_COLLIDE"];
	{
		_SUBJECT removeWeapon _x;
		_WEPHOLDER ADDWEAPONCARGO [_x, 1]; 
	} forEach _Weps;
};