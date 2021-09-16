//func_BW_LostFormation
private["_BWLeader","_group","_x","_this"];
_group = _this;
_BWLeader = leader _group;
	
if(_group getvariable "LostFormation")then
{						
	{		
		_x setVariable ["SayHello",true,true];
		_x doFollow  _BWLeader; 
		if(vehicle _x isKIndOf "Man")then{[_x] allowGetIn true;};
	} forEach units _group ;
	
	_group setVariable ["LostFormation",false,true];
	_group setVariable ["PatrolOutOfTime",0,true];
	//player globalchat format ["|---func_BW_LostFormation: LOST FORMATION %1! Reset", _group];
	
}