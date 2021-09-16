_xx = ObjNul;
_x = ObjNul;
_x2 = ObjNul;
sleep 3;
//player globalchat "started";
while{false}do{

 player globalchat format ["YourCars = %1", _x];
   	{
	   
    	if(((_x distance player) > 10)and !(locked _x) and (alive _x))then{
		_xx = _x;
		player globalchat format ["_xx =%1",_xx];


		 {
		 _x2 = _x;
		sleep 0.1;
		if((side _x2 == Civilian)and(alive _x2) and (_x2 isKindOf "Man") and (alive _xx)and((_x2 distance _xx) > 100))then{
		 		player globalchat format ["_x2 = %1", _x2];
	   	 
		 _wp = (group x2)  addWaypoint [position _xx, 0];
		 [(group x2), 0] setWaypointType "GETIN NEAREST";
		 sleep 20;
		 
		 //_x2 domove getpos CarPosDealer1;
		 sleep 5;
		};
		}forEach allUnits;
        sleep 0.1;

																		};

	} forEach YourCars;
	
sleep 2;
};




//and((driver _xx) == ObjNul)


