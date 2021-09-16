//fnc_PoliceGroup_TargetManager.sqf 2020
private["_x", "_this", "_group"];
_distance = 0;

if(SHOWTMessageLVL2)then{player globalchat format ["|---fnc_PoliceGroup_TargetManager: LOADED!", player];};// MESSAGE LVL2
while{(true)}do
{
	sleep 0;
	{
		_group = _x;
		{
			if(alive _x)then
			{
				
				if(count (_x getvariable "ImChasing") > 0)then
				{
					_x call fnc_EnemyClose;		
					_x call fnc_OpenFire;
					//if(_COP == gunner (vehicle _COP))then{[_COP] call func_ShootFromAPC;};	
				}
				else
				{
					//!!! ВОЗМОЖНО ПОТРЕБУЕТСЯ УБРАТЬ КУДА ТО
					if!(_x getvariable "GetIn")then
					{
						[_x] allowGetIn true; _x setVariable ["GetIn",true,true];
					}
				};
			};
		}foreach units _group;
	}foreach PoliceGroups;
}
//hintc "END!";