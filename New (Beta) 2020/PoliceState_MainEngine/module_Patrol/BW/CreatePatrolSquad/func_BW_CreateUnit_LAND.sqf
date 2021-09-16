//func_BW_CreateUnit_LAND
private["_this","_VehType","_POLICEVEHICLE","_CrewCount","_Position","_NewName","_Rname","_name","_GROUP","_x","_DRIVER","_PASSENGER",_CrewType];

_VehType = _this select 0;
_CrewCount =  (_this select 1) - 1;
_Position = _this select 2;
_CrewType =  _this select 3;

//_WepType = _this select 4;
//_BonusUnit = _this select 5;

_Rname = random 99999;
_NewName = random 99999;
_name = format ["%1", (_Rname) ] + "_CREATEAI_" + format ["%1", (_NewName) ];
_marker = createMarker [ _name, _Position ];
_marker setMarkerType "HW_Done";
_GROUP = Creategroup WEST;

player sidechat format ["func_BW_CreateUnit_LAND| Creating new police unit = %1", _VehType];
sleep 3;

//-vehicle
_POLICEVEHICLE = createVehicle [_VehType,_Position,[], 0, "NONE"];
_POLICEVEHICLE setdir 180;
//[_POLICEVEHICLE] spawn func_BW_CarAlive;
//[_POLICEVEHICLE] spawn func_BW_BWSIREN;

sleep 0.1;

//Driver
_DRIVER = _GROUP createUnit [_CrewType,getpos _POLICEVEHICLE, [], 1, "NONE"]; 
_DRIVER moveindriver _POLICEVEHICLE;
//[_DRIVER,_JOB] spawn func_BW_NOVICEPOLICE;

if(_CrewCount > 0)then
{
	sleep 0.1;
	//Crew
	for [{_x=1},{_x<=_CrewCount},{_x=_x+1}] do
	{
		_PASSENGER = _GROUP createUnit [_CrewType,getpos _POLICEVEHICLE, [], 1, "NONE"]; //RU_Policeman
		_PASSENGER moveincargo _POLICEVEHICLE;
		//[_PASSENGER,_JOB] spawn func_BW_NOVICEPOLICE;
		sleep 0.1;
	};
};
sleep 1;
deletemarker _marker;