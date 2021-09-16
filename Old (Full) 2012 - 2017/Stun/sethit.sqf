_man	= _this select 0;
_selection	= _this select 1;
_damage		= _this select 2;
_shooter	= _this select 3;
_ammo		= _this select 4;
_nvcls		= nearestObjects [getpos _man, ["LandVehicle"], 5];

if!(alive _man)exitwith{};
if((Playerisdead)and(player == _man)) exitwith{};

//player globalchat format ["_ammo = %1",_ammo];
if(_ammo == "B_9x18_SD")exitwith{ ["hit", _shooter, _selection, _damage, _ammo, _man] execVM "stun\stun3.sqf";};
if(_ammo == "cal68_FieldPaint")exitwith{ ["hit", _shooter, _selection, _damage, _ammo, _man] execVM "stun\stun.sqf";};
if((_ammo == "d3z_ammo_shot_2")or(_ammo == "d3z_ammo_shot_pel")or(_ammo == "d3z_ammo_pel")or(_ammo == "B_12Gauge_74Slug"))exitwith{ ["hit", _shooter, _selection, _damage, _ammo, _man] execVM "stun\stun2.sqf";};



//if(player == _man and (_ammo == "cal68_50FP") )exitwith{["hit", _shooter, _selection, _damage,] execVM "stun.sqf";player globalchat "Exit15?";};

[_selection,_damage,_shooter, _nvcls,_man] Spawn 

	{

	_selection	= _this select 0;
	_damage		= _this select 1;
	_shooter	= _this select 2;
	_nvcls		= _this select 3; 
	_man        = _this select 4;
	
	
	//hintc format ["_selection = %1  _damage = %2", _selection, _damage];
 // player globalchat format ["_selection = %1  _damage = %2   _man= %3"   , _selection, _damage, _man];
 if((Playerisdead)and(player == _man)) exitwith{};
  if(_man == player)then{
   _Dam = damage player;
 DammageFix = damage player;
 DammageFix = DammageFix + _damage;
 // player sidechat format ["DammageFix= %1   _OldDam = %2   _damage= %3",DammageFix,_Dam,_damage];
 
  if((vehicle player) isKindOf "Car")then{ DammageFix = DammageFix + _damage/40;}else{ DammageFix = DammageFix + _damage;};
 if((DammageFix >= 0.9)and(alive player)and(FlashBackON))exitwith{[_shooter] execVM "dead.sqf";};
  player SetHit [_selection, DammageFix];
  player setdammage DammageFix;
  
  
  
  
  //hintc format ["%1",DammageFix];
                       };
    if(player != _man) then {_man SetHit [_selection, _damage];};
	if(_selection == "" and _damage >= 1 and !isnull _shooter and not (player == _man))then{_man setdamage 1};

	//if(alive player)exitwith{player globalchat "Exit16?";};
	
	//[_shooter, _nvcls] execVM "stun\victim.sqf";
	
	};

false