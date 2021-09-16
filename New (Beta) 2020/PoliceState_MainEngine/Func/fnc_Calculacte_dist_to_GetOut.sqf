//fnc_Calculacte_dist_to_GetOut.sqf 2020
//PURPOSE:  Нужен если на машине коп не может добраться до минимального расстояния к подозреваемому когда можно копу выйти из машины при погони за ним в fnc_AI_PoliceChase!
private["_subj","_this","_distance"];

_subj = _this;
_distance = _subj getvariable "DISTANCE_TO_GETOUT";

if((speed (vehicle _subj) < 2) && (speed (vehicle _subj) > -2))then
{
	_distance = _distance  + 3;
	_subj setvariable ["DISTANCE_TO_GETOUT", _distance, true];
}
else
{
	if(_distance != DEF_MIN_DISTANCE_TO_GETOUT)then
	{
		_distance = DEF_MIN_DISTANCE_TO_GETOUT;
		_subj setvariable ["DISTANCE_TO_GETOUT", _distance, true];
	}
};

//player sidechat format ["_distance = %1", _distance];

_distance;