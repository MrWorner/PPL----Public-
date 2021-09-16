//fnc_LostFormation 2020
private["_leader","_group","_hello"];
_group = _this;
_leader = leader _group;
	
if(_group getvariable "LostFormation")then
{						
	{	
		_hello = _x getVariable "SayHello";
		if( !_hello )then{_x setVariable ["SayHello",true,true];};	
		
		if(vehicle _x isKIndOf "Man")then
		{			
			[_x] allowGetIn true;
			doStop _x;//??FIX
		};
		//else		
		//{
			//(vehicle _x) setFuel 1;//FUEL 2020
		//};
		
		_x setDamage 0;//HEAL 2020
		
		_x doFollow _leader; 
		
	} forEach units _group;
	_group setVariable ["LostFormation",false,true];
	player globalchat format ["|---func_LostFormation: LOST FORMATION %1! Reset", _group];
}