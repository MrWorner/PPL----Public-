//func_CheckFireCars.sqf
private["_AvailableFireLogics","_group","_x","_DeadCarFireLogic", "_distance", "_CHosenARRAYFireLogic", "_MIN_Distance","_CcountFFUnits","_Leader","_this","_Count"];
_group = _this;
_Leader = vehicle leader _group;
_AvailableFireLogics = LogicEffectFireArray;
_MIN_Distance = 9999999;
_CHosenARRAYFireLogic = [];
_CcountFFUnits = 0;  //Not group, every man
_ClosestFire = "";

//** TO ELIMINATE ALL ALREADY USED BY OTHER GROUPS
{
	_DeadCarFireLogic = _x;
	if(_DeadCarFireLogic in (_group getvariable "FailedWaypointJob"))then
	{
		_AvailableFireLogics = _AvailableFireLogics - [_DeadCarFireLogic];
	}
	else
	{
		{
			if(_DeadCarFireLogic in (_x getvariable "CurrentFireObjects"))then
			{		
					_AvailableFireLogics = _AvailableFireLogics - [_DeadCarFireLogic];		
			};
			
		}foreach FirefighterGroups;
	
	};
}foreach LogicEffectFireArray ;
//** TO ELIMINATE ALL ALREADY USED BY OTHER GROUPS END


//hintc format ["func_CheckFireCars _AvailableFireLogics = %1", _AvailableFireLogics];




if(count _AvailableFireLogics == 0)exitwith{_CHosenARRAYFireLogic;};
	
	
//** TO GET CLOSEST FIRE	
{
	_distance = _Leader distance getPos _x;
	if(_distance < _MIN_Distance)then
	{	
		_MIN_Distance = _distance;
		_ClosestFire = _x
	};
}foreach _AvailableFireLogics;
_AvailableFireLogics = _AvailableFireLogics - [_ClosestFire];
_CHosenARRAYFireLogic = _CHosenARRAYFireLogic + [_ClosestFire];
//** TO GET CLOSEST Fire END
	
	

//** TO GET 3 MORE Fire	NEAR THE CLOSEST FIRE
_Count = 1;
{

	if(_Count < 6)then
	{	
		_distance = getPos _ClosestFire distance getPos _x;
		if(_distance < 100)then
		{	
			_CHosenARRAYFireLogic = _CHosenARRAYFireLogic + [_x];
			//player groupchat format ["ADDED to _CHosenARRAYFireLogic = %1", _x];
			_Count = _Count + 1;
		};
	};
}foreach _AvailableFireLogics;
//** TO GET 3 MORE Fire NEAR THE CLOSEST FIRE END

	
//hintc format ["func_CheckFireCars END: _CHosenARRAYFireLogic = %1", _CHosenARRAYFireLogic];

//player sidechat  format ["NeedToInvestigate = %1", NeedToInvestigate];



_group setVariable ["CurrentFireObjects",_CHosenARRAYFireLogic,true];
_CHosenARRAYFireLogic


	