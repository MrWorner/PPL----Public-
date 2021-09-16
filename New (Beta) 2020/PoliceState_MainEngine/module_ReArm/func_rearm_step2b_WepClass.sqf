//func_rearm_step2b_WepClass.sqf

//[0,90,1,80,2,70,3,60]
//0 //"HandGun"
//1 //"Shotgun"
//2 //"SMG"
//3 //"Assault_rifle"
//4 //"Sniper_rifle"
//5 //"Machine_gun"
//6 //"Rocket_launcher"
//7 //"Less_lethal"
//8 //"Shield"
//9 //"Extra_equipment"
//10 //"ALL" //IGNORE means ALL TYPE OF WEAPONS AVAILABLE
//11 //"" //NEED TO PROCESS

private ["_AllowedWepPack","_this","_Choice","_randomChance","_WepChanceArray","_i"];

_AllowedWepPack = _this;

_TypeWep_Array = [];
_Chance_Array = [];
_IsWeapon = true;
_Choice = 0;
_i = 0;

if(count _AllowedWepPack == 2)exitwith	//IF ONLY 1
{
	_Choice = _AllowedWepPack select 0;
};

{
	if(_IsWeapon)then
	{
		_TypeWep_Array = _TypeWep_Array + [_x];
	}
	else
	{
		_Chance_Array = _Chance_Array + [_x];	
	};
	_IsWeapon = !(_IsWeapon);
}foreach _AllowedWepPack;




{
	_randomChance = round (random 100);
	if(_x > _randomChance)exitwith
	{
		_Choice = (_TypeWep_Array select _i);
		//hintc format ["_randomChance = _Choice %1 _randomChance %2 _x %3",_Choice, _randomChance, _x];//<---------- DEL

	};
	_i = _i + 1;
}foreach _Chance_Array;

if!(_Choice in _TypeWep_Array)then{ hintc format ["func_rearm_step2b_WepClass _Choice=%1 not in _TypeWep_Array=%2", _Choice, _TypeWep_Array];};

_Choice
