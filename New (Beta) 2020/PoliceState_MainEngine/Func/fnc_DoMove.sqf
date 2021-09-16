//fnc_DoMove 2020
private["_this","_posA","_posB","_GetA","_GetB","_target","_subj", "_move", "_timeOut", "_limit"];
_subj =  _this select 0;
_target = _this select 1;

if( (vehicle _subj isKindOf "Man") )then // && (leader (group (vehicle _subj)) == _subj
//if(not alive player)then
{

	if(speed vehicle _subj < 1 && speed vehicle _subj > -1)then
	{
		_subj DoMove getPosATL (vehicle _target);
	}
	else
	{
		_subj moveTo getPosATL (vehicle _target);
	};	
	//_subj domove getPosATL (vehicle _target);
}
else
{
	//if(vehicle _subj != driver vehicle _subj)then{hintc "ERROR fnc_DoMove"};
	_move = false;
	//isnull (gunner vehicle _subj) && isnull (commander vehicle _subj) && not alive player
	
	_posA = (getpos (vehicle _target)) select 0;
	_GetA = (_subj getVariable "DoMovePos") select 0;

	if(_posA != _GetA)then //ЕСЛИ ПОЗИЦИИ НЕ СОВПАДАЮТ С ЗАДАННОЙ ПО X
	{
		//_subj setVariable ["SuspPos",getpos _target];
		_posB = (getpos (vehicle _target)) select 1;
		_subj setVariable ["DoMovePos",[_posA,_posB],true];
		_move = true;
		//player globalchat format ["_posA = %1 _GetA = %1",_posA, _GetA];
	}
	else
	{
		_posB = (getpos (vehicle _target)) select 1;
		_GetB = (_subj getVariable "DoMovePos") select 1;
		if(_posB != _GetB)then  //ЕСЛИ ПОЗИЦИИ НЕ СОВПАДАЮТ С ЗАДАННОЙ ПО Y
		{
			_subj setVariable ["DoMovePos",[_posA,_posB],true];
			_move = true;
		}
		else  
		{
			//---ЕСЛИ СКОРОСТЬ НУЛЕВАЯ, ТО ЗАСТАВИТЬ ДВИГАТЬСЯ! (вроде фикс)		
			if(speed vehicle _subj < 4 && speed vehicle _subj > -4)then
			{
				_timeOut = _subj getVariable ["DoMoveTimeOut", 0];
				if(_timeOut == 0) then
				{
					_move = true;
					_subj setVariable ["DoMoveTimeOut", 6];//sec timeout										
					////////////Player globalchat format ["ЕСЛИ СКОРОСТЬ НУЛЕВАЯ, ТО ЗАСТАВИТЬ ДВИГАТЬСЯ! (вроде фикс): %1. MOVING TO CLOSEST SUSP %2", _subj, name _target];
				}
				else
				{					
					_subj setVariable ["DoMoveTimeOut", (_timeOut - 1)];
				};
			};		
			//---ЕСЛИ СКОРОСТЬ НУЛЕВАЯ, ТО ЗАСТАВИТЬ ДВИГАТЬСЯ! (вроде фикс)					
		};
	};

	//НУЖНО ОГРАНИЧИТЬ КОЛ-ВО ПРИКАЗОВ. ИНАЧЕ ВОДИЛА ТУПИТЬ БУДЕТ ИЗ-ЗА ПЕРЕБОР ПРИКАЗОВ в 1 сек!
	if(_move)then
	{		
		_limit = _subj getVariable ["DoMoveLimit", 0];
		if(_limit == 0) then
		{
			//_subj domove getPos (vehicle _target);
			_subj setVariable ["DoMoveLimit", 4];//sec timeout												
		}
		else
		{
			_move = false;
			_subj setVariable ["DoMoveLimit", (_limit - 1)];
		};
	};
	
	//player globalchat format ["_pos = %1",_pos];
	if(_move)then
	{
		vehicle _subj domove getPos (vehicle _target);	
		//Player globalchat format ["fnc_DoMove %1 POLICE CAR IS MOVING TO %2!", _subj, _target];
		// _subj moveTo getPosATL (vehicle _target);	
	}
}
