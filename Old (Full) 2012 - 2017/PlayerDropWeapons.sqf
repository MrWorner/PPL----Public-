_pWeap = primaryWeapon player;
_sWeap = secondaryWeapon player;

//player globalchat format ["%1",_pWeap];
//player globalchat format ["%1",_sWeap];
if!(_pWeap == "")then {player action ["dropWeapon", player, _pWeap];};
if!(_sWeap == "")then {player action ["dropWeapon", player, _sWeap];};
