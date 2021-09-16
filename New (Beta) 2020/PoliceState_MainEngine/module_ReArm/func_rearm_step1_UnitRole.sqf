//func_rearm_step1_UnitRole.sqf

//_WepRole =
//[
	//"" //IGNORE means ALL WEAPONS AVAILABLE
	//"GeneralCop"
	//"SWAT_blue"
	//"SWAT_camo"
	//"SWAT_sheriff"
	//"SWAT_esu"
	//"HRT_black"
	//"HRT_green"
	//"Delta_1"
	//"Delta_2"
	//"OMEGA"
	
	//"EAST"
	
	//"BW"
//,
	//[	[0,1,2,3], [70,50,50,50] ]   //1 array = wep   2 array = chance		//NEED TO PROCESS
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
	//[] EMPTY
//,	//IGNORE means ALL POSSIBLE WEAPONS
	//0 //"Usual_weapons"
	//1 //"Unusual_weapons"
	//2 //"Rare_weapons"
	//3 //"Legendary_weapons"
	//4	//"" //NEED TO PROCESS
//];
//_Subject setVariable ["MyWepRole",["",[0,1,2,3],4]];

private ["_Subject","_MyWepRole","_WepPack_array","_WepClass_raw","_WepLevel","_WepClass_chosen","_WepPackName"];

_Subject = _this;
_MyWepPack_NAME_ByUSER = (_Subject getVariable ["MyWepPack_NAME_ByUSER",""]);
_MyWepRole = count (_Subject getVariable ["MyWepRole",[]]);

//hintc format ["_Subject = %1 %2 %3",_Subject, _MyWepPack_NAME_ByUSER, _MyWepRole];//<---------- DEL
//if(true)exitwith{};//<---------- DEL

if( ( _MyWepRole  == 0) )then
{
	if(_MyWepPack_NAME_ByUSER != "")then
	{
		_WepPack_array = [_Subject, _MyWepPack_NAME_ByUSER] call func_rearm_step2a_WepPackName; 
	}
	else
	{
		_WepPack_array = [_Subject, ""] call func_rearm_step2a_WepPackName; 
	};
	
	_WepPackName = _WepPack_array select 0;
	_WepClass_raw = _WepPack_array select 1;
	_WepClass_chosen = _WepClass_raw call func_rearm_step2b_WepClass;	

	_WepLevel = [] call func_rearm_step2c_WepLevel; 
}
else 
{//WIP
	// if(_MyWepRole select 0 == "")then
	// {
		// _WepPack_array = _Subject call func_rearm_step2a_WepPackName;
		// _WepPackName = _WepPack_array select 0;
	// }
	// else
	// {
		// _WepPackName = _MyWepRole select 0;
	// };
	
	// if(count (_MyWepRole select 1) == 0)then
	// {
		// _WepClass_raw = _WepPack_array select 1;
	// };
	// _WepClass_chosen = _WepClass_raw call func_rearm_step2b_WepClass;	//<----- WIP
	
	// if(_MyWepRole select 2 == 4)then
	// {
		// _WepLevel = [] call func_rearm_step2c_WepLevel;
	// }
	// else
	// {
		// _WepLevel = _MyWepRole select 2;
	// };
};
//_Subject getVariable ["MyWepPack_NAME_ByUSER",_WepPackName]; //? NOT NEEDED
//hintc format ["_Subject = %1 %2 %3",_Subject,_WepPackName,  _WepClass_chosen, _WepLevel];//<---------- DEL

	

//In the future will be CASE SWITCH
if(true)then
{
	[_Subject, _WepPackName, _WepClass_chosen, _WepLevel] call func_rearm_step3_REARM;	
}
else
{
	 //<----- Add Weapons VANILLA
};
