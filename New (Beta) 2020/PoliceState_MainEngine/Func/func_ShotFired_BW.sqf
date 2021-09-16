//func_ShotFired_BW
private["_SUBJECT","_x","_this","_Points","_ammotype","_bullet""_timenow","_pos","_PeopleNearby","_PeopleNearbyAdded","_GasGrenade"];
_SUBJECT = _this select 0;
//_weapon = _this Select 1;
_Bullettype = _this Select 4;
_ammotype = _this select 5;
_bullet2 = nearestObject [_SUBJECT , _Bullettype];




if(_Bullettype in BulletType_Gas)then 
{
	_bullet2 spawn func_Bullet_Gas;
}
else
{
	if(_Bullettype in BulletType_FB)then
	{
		_bullet2 spawn func_Bullet_Flashbang;
	};
};


