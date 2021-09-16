//func_ChooseClosestTargetCHECK.sqf
private["_BW","_OLDTarget", "_this","_checkPerson"];
_BW = _this select 0;
_OLDTarget= _this select 1;
_CanShoot = false;
if(isnull _OLDTarget)exitwith{};
if(alive _OLDTarget)then
{
	if(_OLDTarget in Array_SuspectSide)then
	{
		if(_OLDTarget getvariable "BW_Dangerous")then
		{	
			if(!(_OLDTarget getvariable "Stunned"))then
			{
				if( (vehicle _OLDTarget distance vehicle _BW) < _BW getvariable "ShootDistance")then
				{
					if(!(lineIntersects [eyePos vehicle   _BW, eyePos vehicle   _OLDTarget, vehicle _BW, vehicle _OLDTarget]))then				
					{
						if(!(terrainIntersectASL  [eyePos vehicle _BW, eyePos vehicle _OLDTarget]))then
						{		
							_CanShoot = true;	
							//if(player == _BW)then{player globalchat format ["OLD TARGET TO SHOOT: %1", name _x];};
						};			
					};	
				};
			};
		};
	};
};


_CanShoot