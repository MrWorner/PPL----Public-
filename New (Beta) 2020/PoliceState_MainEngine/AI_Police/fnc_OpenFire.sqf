//fnc_OpenFire.sqf 2020
private["_COP","_target", "_this","_OpenFire","_CanStillShootTheTarget","_InDanger", "_needToShoot","_dir", "_relative", "_GunnerOrCommander"];
_COP = _this;
//_x = _COP getVariable "inDangerTargetPerson";

_target = _COP call fnc_ChooseClosestTarget;
_InDanger = _COP getvariable "inDanger";


if( !(isNull _target) )then
{
	_needToShoot = false;
	if(!_InDanger)then
	{
		_COP setVariable ["inDanger",true,true];
		
		if(_COP getVariable "GetIn")then
		{
			_GunnerOrCommander = (!(vehicle _COP isKindOf "Man") && (_COP == gunner (vehicle _COP) || _COP == commander (vehicle _COP)));
			if( !(_GunnerOrCommander) )then
			{
				_COP setVariable ["GetIn",false,true];
				[_COP] allowGetIn false;
			};				
		};
		
		_needToShoot = true;
	}
	else
	{
		if((assignedTarget _COP != _target))then
		{
			_needToShoot = true;		
		};	
	};
	
	if(_needToShoot)then
	{
		//player globalchat format ["_needToShoot= %1 _InDanger= %2 _target= %3 _COP= %4", _needToShoot, _InDanger,name _target,name _COP];
		//player setpos getpos _COP;
		//_COP disableAI "FSM";
		//
		//_COP domove getpos (vehicle _target);
		dostop _COP;
		//_COP doWatch (vehicle _target);
		//_COP doTarget (vehicle _target);
		//_COP dofire (vehicle _target);		
				
		if(vehicle _COP isKindOf "Man")then
		{
			_COP dofire (vehicle _target);		
		}
		else
		{		
			if(_COP == gunner (vehicle _COP) || _COP == commander (vehicle _COP))then
			{
				_COP fireAtTarget [vehicle _target];
			}		
		};			
	};

	_COP reveal (vehicle _target);
	_COP suppressFor 0;//5 2 УРА СТРЕЛЯЮТ НОРМ!
}
else
{
	//hint "AAAAAAAAAAAAA";
	if(_InDanger)then
	{
		//_COP enableAI "FSM";
		//player globalchat format ["NO DANGER _InDanger= %2 _target= %3 _COP= %4", player, _InDanger,name _target,name _COP];
		///_COP doWatch objNull;
		_COP setVariable ["inDanger",false,true];
		_COP setVariable ["DoMovePos",[0,0],true];
		
	};
};