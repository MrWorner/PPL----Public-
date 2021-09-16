//fnc_UnstuckHelper 2020
private["_group", "_ban", "_pos", "_job", "_2Chance", "_lastChance", "_susp", "_list", "_patrolM", "_investM"];
_group = _this;
_ban = true;



//---SOLUTION 1: NO FUEL
{
	if( !(vehicle _x isKindOf "Man") )then
	{
		if(fuel vehicle _x == 0)exitwith
		{//no fuel
			_ban = false;
			(vehicle _x) setFuel 1;
			//hintc format ["fnc_UnstuckHelper: STUCK: %1, SOLUTION 1: NO FUEL! PROBLEM SOLVED!",name leader _group];
			player sidechat format ["fnc_UnstuckHelper: STUCK: %1, SOLUTION 1: NO FUEL! PROBLEM SOLVED!",name leader _group];
			
			// _TESTMARKER = createMarker ["Marker1", position (vehicle _x)];
			// _TESTMARKER setMarkerType "Dot";
			// _TESTMARKER setMarkerColor "Red";
			
		};
	};
}foreach units _group;

//---SOLUTION 2: NO DRIVER
if(_ban)then
{
	{
		if( !(vehicle _x isKindOf "Man") )then
		{
			if( isNull (driver (vehicle _x)) )exitwith
			{
				_ban = false;
				_x assignAsDriver (vehicle _x);
				//hintc format ["fnc_UnstuckHelper: STUCK: %1, SOLUTION 2: NO DRIVER! PROBLEM SOLVED!",name leader _group];
				player sidechat format ["fnc_UnstuckHelper: STUCK: %1, SOLUTION 2: NO DRIVER! PROBLEM SOLVED!",name leader _group];
			};
		};	
	}foreach units _group
};

//---SOLUTION 3: NO WAY
if(_ban)then
{
	_job = _group getVariable "WhatGroupIsDoing";
	player globalchat format ["fnc_UnstuckHelper: STUCK: %1, _job = %2",name leader _group, _job];
	
	switch (_job) do 
	{
		case "Backup": 
		{ 
			_susp = _group getVariable "CurrentSuspect";
			_2Chance = _group getVariable ["BanBackupSecondChance", ObjNull];		
			if(_2Chance == _susp)then
			{//ПРОВЕРЬ дали ли последний шанс
				_lastChance = _group getVariable ["BanBackupLastChance", ObjNull];
				if(_lastChance != _susp)then
				{//ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)
					_group setVariable ["BanBackupLastChance", _susp];
					_group setVariable["TimeToFailTask", 15];
					_group setVariable ["LostFormation",true,true];		
					//(leader _group) spawn fnc_AllGetOut;
					//[_group, _susp] call fnc_DomoveAllGroupMembers;				
					{
						if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
						{
							[_x] allowGetIn false; 
							_x domove getpos _susp;
						};
					}foreach units _group;
							
					//hintc format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)",name leader _group];
					player sidechat format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!) Backup",name leader _group];					
					_ban = false;
				};
			}		
			else
			{//дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!
				_group setVariable ["BanBackupSecondChance", _susp];
				//----hintc format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!",name leader _group];
				player sidechat format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE Backup!",name leader _group];
				[_group, _susp] call fnc_DomoveAllGroupMembers;
				_group setVariable["TimeToFailTask", 10];
				_group setVariable ["LostFormation",true,true];
				_ban = false;
			};
		};		
		case "Patrol": 
		{ 
			_patrolM = _group getVariable "PatrolMarker";
			_2Chance = _group getVariable ["BanPatrolSecondChance", ""];		
			if(_2Chance == _patrolM)then
			{//ПРОВЕРЬ дали ли последний шанс
				_lastChance = _group getVariable ["BanPatrolLastChance", ""];
				if(_lastChance != _patrolM)then
				{//ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)
					_group setVariable ["BanPatrolLastChance", _patrolM];
					_group setVariable["TimeToFailTask", 15];
					_group setVariable ["LostFormation",true,true];		
					//(leader _group) spawn fnc_AllGetOut;
					//[_group, _patrolM] call fnc_DomoveAllGroupMembers;				
					{
						if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
						{
							[_x] allowGetIn false; 
							_x domove getMarkerpos _patrolM;
						};
					}foreach units _group;
							
					//hintc format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)",name leader _group];
					player sidechat format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!) patrol",name leader _group];
					_ban = false;
				};
			}
			else
			{//дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!
				_group setVariable ["BanPatrolSecondChance", _patrolM];
				//----hintc format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!",name leader _group];
				player sidechat format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE patrol!",name leader _group];
				{
					if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
					{
						_x domove getMarkerpos _patrolM;
					};
				}foreach units _group;
				_group setVariable["TimeToFailTask", 10];
				_group setVariable ["LostFormation",true,true];
				_ban = false;
				
			};
		};
		case "Investigate": 
		{ 
			_investM = _group getVariable "InvestigationM";
			_2Chance = _group getVariable ["BanInvestSecondChance", ""];		
			if(_2Chance == _investM)then
			{//ПРОВЕРЬ дали ли последний шанс
				_lastChance = _group getVariable ["BanInvestLastChance", ""];
				if(_lastChance != _investM)then
				{//ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)
					_group setVariable ["BanInvestLastChance", _investM];
					_group setVariable["TimeToFailTask", 15];
					_group setVariable ["LostFormation",true,true];		
					//(leader _group) spawn fnc_AllGetOut;
					//[_group, _investM] call fnc_DomoveAllGroupMembers;				
					{
						if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
						{
							[_x] allowGetIn false; 
							_x domove getMarkerpos _investM;
						};
					}foreach units _group;
							
					//hintc format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!)",name leader _group];
					player sidechat format ["fnc_UnstuckHelper: STUCK: %1, ДАЕМ ТРЕТИЙ ШАНС (выйти из машины и вперед!) patrol",name leader _group];
					_ban = false;
				};
			}
			else
			{//дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!
				_group setVariable ["BanInvestSecondChance", _investM];
				//----hintc format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE!",name leader _group];
				player sidechat format ["fnc_UnstuckHelper: STUCK: %1, дать второй шанс. ПЫТАЕМСЯ ИСПРАВИТЬ ЧЕРЕЗ DOMOVE patrol!",name leader _group];
				{
					if(	!(	!(vehicle _x isKindOf "Man")and((_x == commander vehicle _x)or(_x == gunner vehicle _x))	) )then
					{
						_x domove getMarkerpos _investM;
					};
				}foreach units _group;
				_group setVariable["TimeToFailTask", 10];
				_group setVariable ["LostFormation",true,true];
				_ban = false;
				
			};
		};
		default 
		{ 
			hintc format ["fnc_UnstuckHelper: Unknown _job = %1", _job];		
		};
	};
};

if(_ban)then
{
	switch (_job) do 
	{
		case "Backup": 
		{ 
			[getMarkerPos _patrolM, "ColorRed"] call fnc_CreateDebugMarker;
			_list = _group getVariable ["SuspectBlackList",[]];		
			_list =  _list + [_susp];
			_group setVariable ["SuspectBlackList",_list,true];	
			_group setVariable ["CurrentSuspect",ObjNull,true];
			//hintc format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 backup",name leader _group, name _susp];
			player groupchat format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 backup",name leader _group, name _susp];
		};
		case "Patrol": 
		{ 
			[getMarkerPos _patrolM, "ColorYellow"] call fnc_CreateDebugMarker;
			_list = _group getVariable ["PatrolBlackList",[]];		
			_list =  _list + [_patrolM];
			_group setVariable ["PatrolBlackList",_list,true];	
			_group setVariable ["PatrolMarker","",true];
			//hintc format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 Patrol",name leader _group,  _patrolM];
			player groupchat format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 Patrol",name leader _group,  _patrolM];
		};
		case "Investigate": 
		{ 
			[getMarkerPos _investM, "ColorOrange"] call fnc_CreateDebugMarker;
			_list = _group getVariable ["InvestBlackList",[]];		
			_list =  _list + [_investM];
			_group setVariable ["InvestBlackList",_list,true];	
			_group setVariable ["InvestigationM","",true];
			//hintc format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 Investigate",name leader _group,  _investM];
			player groupchat format ["fnc_UnstuckHelper: STUCK: %1, BANNED: %2 Investigate",name leader _group,  _investM];
		};	
		default 
		{ 
			hintc format ["fnc_UnstuckHelper: Unknown BAN _job = %1", _job];		
		};
	};
	[getpos leader _group, "ColorBlue"] call fnc_CreateDebugMarker;
};
//player groupchat format ["fnc_UnstuckHelper: STUCK: %1, _ban: %2",name leader _group, _ban];
_ban;
