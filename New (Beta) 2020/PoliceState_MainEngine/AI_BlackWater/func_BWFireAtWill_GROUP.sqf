//func_BWFireAtWill_GROUP
private["_BWunit","_x", "_this","_distance","_speed","_checkPerson"];
_distance = 0;
_speed = 0;
_group = _this;


if(SHOWTMessageLVL2)then{player globalchat format ["|---FIRE AT WILL (BlackWater): LOADED!", player];};// MESSAGE LVL2
while{(count units _group > 0)}do
{
sleep 0.1;

	{
		if(alive _x)then
		{
			_BWunit = _x;	
			if(count (_BWunit getvariable "ImChasing") > 0)then
			{	
				_BWunit call func_EnemyCloseBW;		
				_BWunit call func_OpenFireBW;
			}
			else
			{
				if!(_BWunit getvariable "GetIn")then
				{
					[_BWunit] allowGetIn true; _BWunit setVariable ["GetIn",true,true];
				}
			};
		};
	}
	foreach units _group;



};