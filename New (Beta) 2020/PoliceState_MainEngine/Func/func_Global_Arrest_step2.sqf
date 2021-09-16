//func_Global_Arrest_step2
private["_Susp","_x", "_distance", "_ClosestMan", "_MIN_Distance","_WhoIsChasingMe","_BW_WhoIsChasingMe","_Driver","_Gunner","_Pilot","_Commander"];
_Susp = _this;
_MIN_Distance = 9999999;
_ClosestMan = ObjNull;
_WhoIsChasingMe = (_Susp getVAriable "WhoIsChasingMe");
_BW_WhoIsChasingMe = (_Susp getVAriable "BW_WhoIsChasingMe");
_ChosenPolice = true;

_Driver = ObjNull;
_GunnerCar = ObjNull;
_GunnerAir = ObjNull;
_Pilot =  ObjNull;
_Commander = ObjNull;




//STEP 1 POLICE OR BLACKWATER
if( count _WhoIsChasingMe < count _BW_WhoIsChasingMe)then
{
	_ChosenPolice = false;

};
//STEP 1 END

//STEP 2A1 POLICE
if(_ChosenPolice)then
{
	{
		if((alive _x) and !(_x getVAriable "ImGoingToArrest") and !(_x getvariable "inDanger"))then //and !(_x getVAriable "InFighting")
		{
		
			if( ((vehicle _x isKindOf "Air")and(_x == driver vehicle _x)) )exitwith{_Pilot = _x; };
			if( ((vehicle _x isKindOf "Air")and(_x == gunner vehicle _x)) )exitwith{_GunnerAir = _x; };
			if( ((vehicle _x isKindOf "LandVehicle")and( _x == driver vehicle _x)) )exitwith{_Driver = _x; };
			if( ((vehicle _x isKindOf "LandVehicle")and(_x == gunner vehicle _x)) )exitwith{_GunnerCar = _x; };
			if( (!(vehicle _x isKindOf "Man")and(_x == commander  vehicle _x)) )exitwith{_Commander = _x; };
			//if( (!(_x == driver vehicle _x)and!(vehicle _x == gunner vehicle _x)) )then
			//{
				
				_distance = vehicle _x distance _Susp;
				if((_distance < _MIN_Distance) and (_distance < 125))then
				{	
					_MIN_Distance = _distance;
					_ClosestMan = _x;
					//player sidechat  format [" _MIN_Distance = %1",_MIN_Distance];
						
				};
			//};
		};
	}foreach _WhoIsChasingMe;
	if(isnull _ClosestMan)then
	{
	
		if!(isnull _Commander)exitwith{_ClosestMan = _Commander;};
		if!(isnull _Driver)exitwith{_ClosestMan = _Driver;};
		if!(isnull _GunnerCar)exitwith{_ClosestMan = _GunnerCar;};
		if!(isnull _GunnerAir)exitwith{_ClosestMan = _GunnerAir;};
		if!(isnull _Pilot)exitwith{_ClosestMan = _Pilot;};
	};
	
};

if!(isnull _ClosestMan)exitwith{_ClosestMan;};
//STEP 2A1 END




if(count _BW_WhoIsChasingMe == 0)exitwith{_ClosestMan;};
//STEP 2B1 BLACKWATER
if!(_ChosenPolice)then
{
	{
		if((alive _x) and !(_x getVAriable "ImGoingToArrest")and !(_x getvariable "inDanger"))then //and !(_x getVAriable "InFighting")
		{
			if( ((vehicle _x isKindOf "Air")and(_x == driver vehicle _x)) )exitwith{_Pilot = _x; };
			if( ((vehicle _x isKindOf "Air")and(_x == gunner vehicle _x)) )exitwith{_GunnerAir = _x; };
			if( (!(vehicle _x isKindOf "Man")and(_x == commander  vehicle _x)) )exitwith{_Commander = _x; };
			if( ((vehicle _x isKindOf "LandVehicle")and( _x == driver vehicle _x)) )exitwith{_Driver = _x; };
			if( ((vehicle _x isKindOf "LandVehicle")and(_x == gunner vehicle _x)) )exitwith{_GunnerCar = _x; };
			if( ((vehicle _x isKindOf "LandVehicle")and(_x == gunner vehicle _x)) )exitwith{_GunnerCar = _x; };
				_distance = vehicle _x distance _Susp;
				if((_distance < _MIN_Distance) and (_distance < 125))then
				{	
					_MIN_Distance = _distance;
					_ClosestMan = _x;					
				};
				//hint "MAN";
		};
	}foreach _BW_WhoIsChasingMe;
	if(isnull _ClosestMan)then
	{
		if!(isnull _Commander)exitwith{_ClosestMan = _Commander;};
		if!(isnull _Driver)exitwith{_ClosestMan = _Driver;};
		if!(isnull _GunnerCar)exitwith{_ClosestMan = _GunnerCar;};
		if!(isnull _GunnerAir)exitwith{_ClosestMan = _GunnerAir;};
		if!(isnull _Pilot)exitwith{_ClosestMan = _Pilot;};
	};
	
};


if(random 100 > 70)then{[_ClosestMan,"MovingArrest"] call func_BlackWaterSAY; };

_ClosestMan
//STEP 2B1 END

	

	
//hintc format [" _ClosestMan = %1", _ClosestMan];




	