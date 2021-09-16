//func_useGrenade.sqf
private ["_Subject","_this","_grenade","_Magz","_result"];

_Subject = _this;
_Magz = magazines _SUBJECT;
_result =false;
//LESS_LETHAL_GRENADES
//if(SHOWTMessageLVL2)then{player globalchat format ["|---func_useGrenade: LOADED!", player];};// MESSAGE LVL2

{
	if(_x in _Magz)then{_result = true; };
}foreach LESS_LETHAL_GRENADES;
	if!(_result)exitwith{};
sleep 5;
while{(_result) and (alive _Subject) and (count (_Subject getvariable "ImChasing") > 0)}do
{



	if( ((random 100) - (count (_Subject getvariable "ImChasing"))) < 10)then
	{
		if (_Subject distance ((_Subject getvariable "ImChasing") select 0) < 100)then
		{
			if!(((_Subject getvariable "ImChasing") select 0) getVariable "GivingUp")then
			{
		
				if("SmokeShell" in _Magz)then
				{
					//_SUBJECT dowatch _Enemy;
					_SUBJECT fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
					dostop _SUBJECT;
					//player globalchat format ["SmokeShell GRENADE IS OUT!",_Subject];
					//hintc format ["SmokeShell GRENADE IS OUT!",_Subject];
				}
				else
				{
					if("RAB_L111A1" in _Magz)then
					{
						//_SUBJECT dowatch _Enemy;
						_SUBJECT fire ["RAB_ThrowMuzzle","RAB_ThrowMuzzle","RAB_L111A1"];
						dostop _SUBJECT;
						//player globalchat format ["RAB_L111A1 GRENADE IS OUT!",_Subject];
						//hintc  format ["RAB_L111A1 GRENADE IS OUT!",_Subject];
					}
					else
					{
						if("HandGrenade_West" in _Magz)then
						{
							//_SUBJECT dowatch _Enemy;
							//_SUBJECT fire ["HandGrenadeMuzzle","GrenadeHandTimedWest","HandGrenade_West"];
							_SUBJECT fire ["HandGrenadeMuzzle","","HandGrenade_West"];
							dostop _SUBJECT;
							//player globalchat format ["HandGrenade_West GRENADE IS OUT!",_Subject];
							//hintc format ["HandGrenade_West GRENADE IS OUT!",_Subject];
						};
					};
				};
			};
		};
	};
	
	_Magz = magazines _SUBJECT;
	sleep 5;
	_result = false;
	
	{	
		if(_x in _Magz)then{_result = true;};
	}foreach LESS_LETHAL_GRENADES
 
};
 
//{
//}foreach LESS_LETHAL_GRENADES