//func_Bullet_Gas.sqf
private["_x","_this","_pos","_PeopleNearby","_PeopleNearbyAdded"];
_pos = getpos _this;

_PeopleNearby = [];
_PeopleNearbyAdded = [];

while{!isNull _this}do
{  
	_pos = getpos _this;
	sleep 1;	
	_PeopleNearby = _pos nearEntities [ ["Man"], 35];
	{
		if!(_x in _PeopleNearbyAdded)then
		{
			_PeopleNearbyAdded = _PeopleNearbyAdded + [_x];
			if(side _x != west and !(_x in Array_BlackWater))then
			{
				[_x,_this] spawn func_GasGrenadeStun;
			};		
		};								
	}foreach _PeopleNearby;
	
};
