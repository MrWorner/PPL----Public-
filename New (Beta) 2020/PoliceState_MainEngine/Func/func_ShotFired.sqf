//func_ShotFired
private["_SUBJECT","_x","_this","_Points","_ammotype","_bullet""_timenow","_pos","_PeopleNearby","_PeopleNearbyAdded","_GasGrenade"];
_SUBJECT = _this select 0;
//_weapon = _this Select 1;
_Bullettype = _this Select 4;
_ammotype = _this select 5;

if(_SUBJECT getvariable "PoliceChaseInProgress" > 0)then
{

	if!("Shooting" in (_SUBJECT getvariable "WantedFor"))then
	{
		_SUBJECT setVariable ["Dangerous",true,true];
		_SUBJECT setVariable ["WantedFor",(_SUBJECT getvariable "WantedFor") + ["Shooting"],true];
		//(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_Suspect";
		//hint "SHOOTING";
	};
	
	if!(_SUBJECT getvariable "SuspShotsFired")then
	{
		
		_SUBJECT setVariable ["SuspShotsFired",true,true];
		_SUBJECT spawn func_CopSaysSHOTSFIRED;
	};
	
	
};



if(_SUBJECT getvariable "BW_ChaseInProgress" > 0)then
{

	if!("Shooting" in (_SUBJECT getvariable "WantedFor"))then
	{
		_SUBJECT setVariable ["BW_Dangerous",true,true];
		_SUBJECT setVariable ["BW_WantedFor",(_SUBJECT getvariable "BW_WantedFor") + ["Shooting"],true];
		//(_SUBJECT getVariable "MyMarkerName") setMarkerType "HW_Suspect";
		//hint "SHOOTING";
	};
	
	if!(_SUBJECT getvariable "SuspShotsFired")then
	{
	
		_SUBJECT setVariable ["SuspShotsFired",true,true];
		_SUBJECT spawn func_BlackWaterSaysSHOTSFIRED;
	};
	
	
};




_bullet2 = nearestObject [_SUBJECT , _Bullettype];

//player sidechat format ["func_ShotFired _Bullettype = %1 ",_Bullettype];


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


