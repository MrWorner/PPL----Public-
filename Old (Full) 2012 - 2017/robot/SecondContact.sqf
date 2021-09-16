_cop = _this select 0;
_active = true;
[_cop] execVM "BeginBehaviour.sqf";

while{(_active)and(alive _cop)}do{

sleep 3;
_Knowledge =  _cop knowsAbout player;
_Knowledge2 =  _cop knowsAbout vehicle player;
if(((_Knowledge > 0.01)or(_Knowledge2 > 0.01))and((_cop distance player) <2000)and!(player in RestrainedPeople))then{

  _cop domove getpos player;
 _active = false;

 
 [_cop] execVM "robot\FollowFast.sqf";
 };


};
