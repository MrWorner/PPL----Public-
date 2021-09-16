//func_BW_calc_CheckEqualPos
private["_this","_Array2","_result"];
_result = false;
_Array2 = _this;

if(0 == _Array2 select 0 )then
{
	if(0 == _Array2 select 1 )then
	{
		if(0 == _Array2 select 2 )then
		{
			_result = true; //FAKE COORDINATES! MEANS ERROR
			//hint format ["_result = %1", _calc];
		}
	}
};


_result