//fnc_ChooseClosestTarget.sqf
private["_COP","_x", "_this","_distance","_speed","_checkPerson","_NewTarget","_NewTargetsArray","_MINDistance", "_weaponRange", "_NewTargetsArrayLandVehicle"];
_COP = _this;
_NewTarget= ObjNull;
_NewTargetsArray = [];
_NewTargetsArrayLandVehicle = [];
_MINDistance = 9999;

if(primaryWeapon _COP != "")then
{
	//_weaponRange = getNumber (configFile >> "CfgWeapons" >> (primaryWeapon _COP) >> "midRange");//NEW 2020
	_weaponRange = getNumber (configFile >> "CfgWeapons" >> (primaryWeapon _COP) >> "maxRange");//NEW 2020
	//_weaponRange = _weaponRange + 50;//- 100
}
else
{
	if(secondaryWeapon _COP != "")then
	{
		_weaponRange = getNumber (configFile >> "CfgWeapons" >> (secondaryWeapon _COP) >> "maxRange");//NEW 2020
	}
	else
	{
		_weaponRange = 0;//будет наверное без оружия бежать биться руками
	};
};

//hintsilent format [" midRange = %1", _weaponRange];

// _hasHarmfulAmmo = count (magazines currentWeapon _COP select 
// {

	// _ammo = getText (configfile >> "CfgMagazines" >> _x >> "ammo");
	// _hit = getNumber (configfile >> "CfgAmmo" >> _ammo >> "hit");
	// _hit > 0

// }) > 0;


//if(_COP ammo currentWeapon _COP == 0)exitwith
//if(count magazines _COP == 0)exitwith
// if(true)exitwith
// {
	// player sidechat format ["ZERO _magCount = %1", Player];
	// _NewTarget;
// };


//player sidechat format ["func_ChooseClosestTarget _COP = %1", _COP];
{
	if(alive _x)then
	{
		if(_x getvariable "Dangerous")then
		{	
			if(!(_x getvariable "Stunned"))then
			{
				//if( (vehicle _x distance vehicle _COP) < _COP getvariable "ShootDistance")then
				if( (vehicle _x distance vehicle _COP) < _weaponRange)then
				{
					if(!(lineIntersects [eyePos vehicle   _COP, eyePos vehicle   _x, vehicle _COP, vehicle _x]))then				
					{
						if(!(terrainIntersectASL  [eyePos vehicle _COP, eyePos vehicle _x]))then
						{		
							//if(true)exitwith{_NewTarget = _x; _COP dofire vehicle _x;};//EXPERIMENTAL
								_NewTargetsArray = _NewTargetsArray + [_x];										
						};			
					};	
				};
			};
		};
	};
}foreach (_COP getvariable "ImChasing");


if(count _NewTargetsArray!= 0)then
{
	{//**NEW CAR OR MAN
		
		if!((vehicle _x) isKindOf "Man")then
		{
			_NewTargetsArray = _NewTargetsArray - [_x];
			if( gunner vehicle _x == _x or driver vehicle _x == _x or (commander vehicle _x == _x) )then{_NewTargetsArrayLandVehicle = _NewTargetsArrayLandVehicle + [_x];};
			
		};		
	}//**NEW CAR OR MAN END
	foreach _NewTargetsArray;
	
	if(count _NewTargetsArray < 1)then
	{//CHOOSE FROM VEHICLE ENEMY IF NO ON FOOT
		_NewTargetsArray = _NewTargetsArrayLandVehicle;
	};
	
	{			
		if(_MINDistance > vehicle _x distance vehicle _COP)then
		{
			_MINDistance = vehicle  _x distance vehicle _COP;
			_NewTarget = _x;		
			//player sidechat format ["_MINDistance = %1 name = %2, count _NewTargetsArray = %3", _MINDistance,name  _x, count _NewTargetsArray];
		};		
	}
	foreach _NewTargetsArray;
	
	//hintc format ["_COP = %3;  _NewTargetsArray = %1 _MINDistance = %2 meters", count _NewTargetsArray, _MINDistance,name _COP];
	//hint format ["(driver vehicle _x == _x) = %1 %2", (driver vehicle _NewTarget == _NewTarget), _NewTarget];
	//_COP setVariable ["inDanger",true,true];
};

//player sidechat format ["_NewTarget = %1 _MINDistance = %2", name _NewTarget, _MINDistance];
_NewTarget;