//func_ChooseClosestTarget.sqf
private["_BW","_x", "_this","_distance","_speed","_checkPerson","_NewTarget","_NewTargetsArray","_MINDistance"];
_BW = _this;
_NewTarget= ObjNull;
_NewTargetsArray = [];
_NewTargetsArrayLandVehicle = [];
_MINDistance = 9999;
//player sidechat format ["func_ChooseClosestTarget _BW = %1", _BW];
{
	if(alive _x)then
	{
		if(_x getvariable "BW_Dangerous")then
		{	
			if(!(_x getvariable "Stunned"))then
			{
				if( (vehicle _x distance vehicle _BW) < _BW getvariable "ShootDistance")then
				{
					if(!(lineIntersects [eyePos vehicle   _BW, eyePos vehicle   _x, vehicle _BW, vehicle _x]))then				
					{
						if(!(terrainIntersectASL  [eyePos vehicle _BW, eyePos vehicle _x]))then
						{		
							//if(true)exitwith{_NewTarget = _x; _BW dofire vehicle _x;};//EXPERIMENTAL
								_NewTargetsArray = _NewTargetsArray + [_x];
													
						};			
					};	
				};
			};
		};
	};
//if(true)exitwith{};
}foreach (_BW getvariable "ImChasing");

//if(true)exitwith{ _NewTarget};

if(count _NewTargetsArray!= 0)then
{
	
	
	{//**NEW CAR OR MAN
		
		if!((vehicle _x) isKindOf "Man")then
		{
			_NewTargetsArray = _NewTargetsArray - [_x];
			if( (gunner vehicle _x == _x) or  (driver vehicle _x == _x))then{_NewTargetsArrayLandVehicle = _NewTargetsArrayLandVehicle + [_x];};
			
		};		
	}//**NEW CAR OR MAN END
	foreach _NewTargetsArray;
	
	
	if(count _NewTargetsArray < 1)then
	{//CHOOSE FROM VEHICLE ENEMY IF NO ON FOOT
		_NewTargetsArray = _NewTargetsArrayLandVehicle;
	};
	
	{
			
		if(_MINDistance > vehicle _x distance vehicle _BW)then
		{
			_MINDistance = vehicle  _x distance vehicle _BW;
			_NewTarget = _x;		
			//player sidechat format ["_MINDistance = %1 name = %2, count _NewTargetsArray = %3", _MINDistance,name  _x, count _NewTargetsArray];
		};		
	}
	foreach _NewTargetsArray;
	
	
	
	//hintc format ["_BW = %3;  _NewTargetsArray = %1 _MINDistance = %2 meters", count _NewTargetsArray, _MINDistance,name _BW];
	//hint format ["(driver vehicle _x == _x) = %1 %2", (driver vehicle _NewTarget == _NewTarget), _NewTarget];
	
	//_BW setVariable ["inDanger",true,true];
}
else
{
_BW setVariable ["inDanger",false,true];
};


//player sidechat format ["_NewTarget = %1",name _NewTarget];

_NewTarget