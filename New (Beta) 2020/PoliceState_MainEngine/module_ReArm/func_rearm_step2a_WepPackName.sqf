//func_rearm_step2a_WepPackName
private ["_Subject","_MyWepRole","_this","_WepPackName","_found"];


_Subject = _this select 0;
_WepPackName = _this select 1;
_WepClasses = [];
_found = false ;



if(_WepPackName != "")then
{
	{
		if( _WepPackName == (_X select 0))exitwith
		{
			_WepClasses = _x select 2;
		};
	}foreach GLOBAL_WepPack_RH
}
else
{
	{
		
		{
			if( (TypeOf _Subject) in (_X select 1))exitwith
			{
				_WepPackName = _x select 0;
				_WepClasses = _x select 2;
				_found = true;
				
			};
		}foreach GLOBAL_WepPack_RH;
		if(_found)exitwith{};
	}foreach GLOBAL_WepPack_RH;
	
	
	if!(_found)then
	{
		
		switch (side _Subject) do 
		{
			case East: { _WepPackName = "EAST DEFAULT"; _WepClasses = [0,60,2,70,3,100]; hint "func_rearm_step2a_WepPackName DEFAULT PACK FOR: EAST";};
			case West: { _WepPackName = "WEST DEFAULT"; _WepClasses = [0,70,1,50,2,40,3,100]; hint "func_rearm_step2a_WepPackName DEFAULT PACK FOR: WEST";};
			case Resistance: { _WepPackName = "BW DEFAULT"; _WepClasses = [7,10,2,25,3,100]; hint "func_rearm_step2a_WepPackName DEFAULT PACK FOR: BW";};
			default { hintc "func_rearm_step2a_WepPackName: default" };
		};
		//_WepClasses = [0,70,1,50,2,40,3,100];
	};
	
};



_WepArray = [_WepPackName,_WepClasses];
_WepArray //RETURN!



///////////////////////////////////
// [
	// "WEAPON PACK NAME",
	// [
		// "CDF_MAN","US_MAN"
	// ],
	// [
	//	class wep
		// 0,1,2,5,6,8
	// ],
	// wep_array //weps for current men class names
// ]




