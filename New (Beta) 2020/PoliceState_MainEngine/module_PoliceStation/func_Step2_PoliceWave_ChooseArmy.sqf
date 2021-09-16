//func_Step2_PoliceWave_ChooseArmy
private["_UnitsArray","_this","_NegativeCostAlloved","_ArmySizeExtra","_AllowedToChoose"];

_UnitsArray = _this;
_AllowedToChoose = [];
_NegativeCostAlloved = true; ///SHOULD BE USED GLOBAL VARIABLE
{
	_Cost = _x select 0;
	//_ArmySize = ((_x select 3) + (_x select 4));
	_ArmySize = ((_x select 3) select 0) + ((_x select 3) select 1) + ((_x select 3) select 2) + ((_x select 3) select 3);
	
	if((count (_x select 6)) == 0)then
	{
		_ArmySizeExtra = 0;
	}
	else
	{
		_ArmySizeExtra = ((count (_x select 6)) / 2);
	};
	// hintc format ["func_Step2_PoliceWave_ChooseArmy: _Cost = %1 POLICE_AVAILABLE_SCORE = %2",_Cost, POLICE_AVAILABLE_SCORE];
	if( ((_Cost <= POLICE_AVAILABLE_SCORE) OR (_NegativeCostAlloved)) )then //<----------- NEGATIVE COST ALLOVED!
	{
		if( LIMIT_PoliceUnits > ((_ArmySize + _ArmySizeExtra) + (Count_TotalCops - Count_KilledCops)))then
		{
			_AllowedToChoose = _AllowedToChoose + [_x];
			//player sidechat format ["!ADDED: %1",_x];
		}
		else
		{
			//player sidechat format ["NOT ADDED: %1",_x];
		};
	};


}foreach _UnitsArray;
//hintc format ["func_Step2_PoliceWave_ChooseArmy: _AllowedToChoose = %1 ",_AllowedToChoose];
_AllowedToChoose;