//fnc_p_FindWhoNeedsBackup
private["_group", "_suspectChosen", "_dist", "_countPoliceUnits", "_leader", "_curSuspDist","_needToChase", "_blackList"];
_group = _this;
_leader = leader _group;
_suspectChosen = ObjNull;
_dist = -1;

_blackList = _group getVariable ["SuspectBlackList",[]];	

{
	_suspect = _x;
	if( (alive _suspect) )then
	{
		//player sidechat format ["fnc_p_FindWhoNeedsBackup: _blackList: %1, leader: %2", _blackList, name (leader _group )];
		if( !(_suspect in _blackList) )then
		{
			_needToChase = false;
			_curSuspDist = vehicle _suspect distance vehicle _leader;
			if(_curSuspDist < 1500)then
			{
				_needToChase = true;
			}
			else
			{	
				//Если не близко подозреваемый, то подсчитаем кол-во копов. Стоит ли ехать на подмогу им
				_countPoliceUnits = count (_suspect getVariable ["WhoIsChasingMe", 0]);		
				if(_countPoliceUnits <= 10)then
				{//если сейчас мало его преследуют
					//Подсчитаем сколько (юнитов) полицейских групп откликнулись и едут на подмогу
					{
						if( (_x getvariable "CurrentSuspect") == _suspect)then
						{
							_countPoliceUnits  = _countPoliceUnits +  (count units _x);	
						};			
					}foreach PoliceGroups;
				};
				
				if(_countPoliceUnits <= 10)then
				{
					_needToChase = true;
				};
			};
								
			if(_needToChase)then
			{	
				//выберем самого близкого подозреваемого!
				if(_dist > _curSuspDist || _dist == -1 )then
				{
					_dist = _curSuspDist;
					_suspectChosen = _suspect;
				};
			};
		};
	};
}foreach Array_SuspectsInChase;


//player sidechat format ["fnc_p_FindWhoNeedsBackup SUSP CHOSEN: %1", _suspectChosen];

_suspectChosen;