//fnc_CanSeeTarget 2020
private["_this","_canSee","_target","_subj"];
_subj =  _this select 0;
_target = _this select 1;
_canSee = false;

if(!(lineIntersects [eyePos vehicle _subj, eyePos vehicle _target, vehicle _subj, vehicle _target]))then
{
	if(!(terrainIntersectASL  [eyePos vehicle _subj, eyePos vehicle _target]))then
	{
		_canSee = true;
	};
};

_canSee