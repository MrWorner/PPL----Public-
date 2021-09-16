//func_Step3_PoliceWave_Spawn_BONUS
private["_PositionMarker","_this","_NewName","_name","_marker","_GROUP","_POLICECAR","_DRIVER","_PASSENGER","_x","_CHOSEN_UnitsArray","_CHOSEN_POLICECAR","_CHOSEN_DriversSize","_CHOSEN_DefaultSkin_CrewSize","_CHOSEN_RandomTrueFalse","_CHOSEN_DriverSkin","_CHOSEN_CrewSkin","_CHOSEN_BaseCOST","_CHOSEN_AdditonCrewArray","_MyCount","_y","_Police_RiskLevel_BonusScore","_i"];

_PositionMarker = _this select 0;
_CHOSEN_UnitsArray = _this select 1;

if((count _CHOSEN_UnitsArray) == 0)exitwith{ hintc "func_Step3_PoliceWave_Spawn_BONUS: Army not chosen: Not enough resources OR Limit units OR EMPTY!"};

// hintc format ["func_Step3_PoliceWave_Spawn _UnitsArray = %1",count _UnitsArray];

_CHOSEN_BaseCOST = _CHOSEN_UnitsArray select 0;
_Police_RiskLevel_BonusScore = _CHOSEN_UnitsArray select 1;
_CHOSEN_POLICECAR = _CHOSEN_UnitsArray select 2;


//player sidechat format ["func_Step3_PoliceWave_Spawn_BONUS = %1",_CHOSEN_POLICECAR];

_CHOSEN_DriversSize = (_CHOSEN_UnitsArray select 3) select 0;
_CHOSEN_CrewSize = (_CHOSEN_UnitsArray select 3) select 1;
_CHOSEN_GunnerSize = (_CHOSEN_UnitsArray select 3) select 2;
_CHOSEN_CommanderSize = (_CHOSEN_UnitsArray select 3) select 3;

_CHOSEN_DriverSkin = _CHOSEN_UnitsArray select 4;
_CHOSEN_CrewSkin = _CHOSEN_UnitsArray select 5;
_CHOSEN_AdditonCrewArray = _CHOSEN_UnitsArray select 6;

//POLICE_AVAILABLE_SCORE = POLICE_AVAILABLE_SCORE - _CHOSEN_BaseCOST;

//if(true)exitwith{hintc format ["func_Step3_PoliceWave_Spawn: SPAWN!!! _CHOSEN_POLICECAR = %1 _CHOSEN_UnitsArray = %2",_CHOSEN_POLICECAR, _CHOSEN_UnitsArray, POLICE_AVAILABLE_SCORE];};


_NewName = random 99999;
_name = format ["_CREATE_AI_%1", _NewName];
_marker = createMarker [ _name,  _PositionMarker ];
_marker setMarkerType "HW_Done";

_GROUP = Creategroup WEST;
	
_POLICECAR = createVehicle [_CHOSEN_POLICECAR, _PositionMarker,[], 0, "NONE"];
_POLICECAR setdir 180;
_POLICECAR call func_VehicleRegistration;

sleep 0.1;

_DRIVER = _GROUP createUnit [_CHOSEN_DriverSkin, _POLICECAR, [], 1, "NONE"];
_DRIVER call func_DefaultSET; 
_DRIVER moveindriver _POLICECAR;
_DRIVER setVariable ["Police_RiskLevel_BonusScore",_Police_RiskLevel_BonusScore,true];

sleep 0.1;

for [{_x=1},{_x<=_CHOSEN_CrewSize},{_x=_x+1}] do
{
		_PASSENGER = _GROUP createUnit [_CHOSEN_CrewSkin, _POLICECAR, [], 1, "NONE"]; //
		_PASSENGER moveincargo _POLICECAR;
		_PASSENGER call func_DefaultSET;
		_PASSENGER setVariable ["Police_RiskLevel_BonusScore",_Police_RiskLevel_BonusScore,true];
		sleep 0.1;
};
sleep 0.1;

for [{_x=1},{_x<=_CHOSEN_GunnerSize},{_x=_x+1}] do
{
		_PASSENGER = _GROUP createUnit [_CHOSEN_CrewSkin, _POLICECAR, [], 1, "NONE"]; //
		_PASSENGER moveinGunner _POLICECAR;
		_PASSENGER call func_DefaultSET;
		_PASSENGER setVariable ["Police_RiskLevel_BonusScore",_Police_RiskLevel_BonusScore,true];
		sleep 0.1;
};

if(_CHOSEN_CommanderSize > 0)then
{
		_PASSENGER = _GROUP createUnit [_CHOSEN_CrewSkin, _POLICECAR, [], 1, "NONE"]; //
		_PASSENGER moveinCommander _POLICECAR;
		_PASSENGER call func_DefaultSET;
		_PASSENGER setVariable ["Police_RiskLevel_BonusScore",_Police_RiskLevel_BonusScore,true];
};

sleep 0.1;

_MyCount = count _CHOSEN_AdditonCrewArray;
if(_MyCount > 0)then
{
	_MyCount = _MyCount / 2;
	_y = 0;
	for [{_x=1},{_x<=_MyCount},{_x=_x+1}] do
	{
			if( (_CHOSEN_AdditonCrewArray select (_y+1)) >= (random 100))then
			{
				_CHOSEN_CrewSkin = _CHOSEN_AdditonCrewArray select _y;
			}
			else
			{
				_CHOSEN_CrewSkin =  _CHOSEN_UnitsArray select 5;
			};
			_PASSENGER = _GROUP createUnit [_CHOSEN_CrewSkin, _POLICECAR, [], 1, "NONE"];
			_PASSENGER moveincargo _POLICECAR;
			_PASSENGER call func_DefaultSET;
			_PASSENGER setVariable ["Police_RiskLevel_BonusScore",_Police_RiskLevel_BonusScore,true];
			_y = _y + 2;
			sleep 0.1;
	};
};


sleep 0.1;

if(count (_CHOSEN_UnitsArray select 7) > 0)then
{
	for [{_i=0}, {_i < count (_CHOSEN_UnitsArray select 7)}, {_i = _i + 2}] do 
	{
		{
			//hintc format ["i=%1, %2 | %3",_i,((_CHOSEN_UnitsArray select 7) select _i),((_CHOSEN_UnitsArray select 7) select (_i+1))];
			if(typeOf _x == ((_CHOSEN_UnitsArray select 7) select _i))then
			{
				_x setIdentity ((_CHOSEN_UnitsArray select 7) select (_i+1));
			};
			sleep 0.1;
		}foreach units _GROUP;
	};
};



//player sidechat format ["func_Step3_PoliceWave_Spawn: Risk level %1, units are spawning! _CHOSEN_UnitsArray: %2",POLICE_RISK_LEVEL, _CHOSEN_UnitsArray];
sleep 1;
deletemarker _marker;