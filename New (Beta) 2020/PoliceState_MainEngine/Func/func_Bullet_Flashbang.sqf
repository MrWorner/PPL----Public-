//func_Bullet_Flashbang.sqf
private["_x","_this","_pos","_PeopleNearby","_PeopleNearbyAdded","_GasGrenade"];
_pos = getpos _this;
_PeopleNearby = [];

while{!isNull _this}do
{  
	_pos = getpos _this;
	sleep 0.1;	
};
	
_PeopleNearby = _pos nearEntities [ ["Man"], 20];

{
	if(side _x != west and !(_x in Array_BlackWater))then
	{
		_x spawn func_FlashbangStun;
	};										
}foreach _PeopleNearby;
