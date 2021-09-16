//FUNC_BWSecondMan.sqf

private["_SecondMan", "_Enemy", "_this"];

_Enemy = _this;
_SecondMan = ObjNull;



_ArrayOfPeople = getpos _Enemy nearEntities [["Man"], 40];
{
	if(_x in Array_BlackWater)then
	{
		if(isnull _SecondMan)then
		{
			if
			(
			!(_x getVariable "Tresspassing_GuardMan_1")and
			!(_x getVariable "Tresspassing_GuardMan_2")and
			(count(_x getvariable "ImChasing") == 0)and
			(_x knowsAbout (vehicle _Enemy) > 0.1)and
			!(lineIntersects [eyePos vehicle _x, eyePos vehicle _Enemy, vehicle _x, vehicle _Enemy])and
			!(terrainIntersectASL  [eyePos vehicle _x, eyePos vehicle _Enemy])
			)
			then
			{
				_x setVariable ["Tresspassing_GuardMan_2",true,true];
				_SecondMan = _x;	
			};
		}
	};
} forEach _ArrayOfPeople;

_SecondMan;

