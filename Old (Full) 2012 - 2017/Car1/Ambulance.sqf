_car= _this select 0; 
_HowLondWaited = 0;
_driver = driver _car;
[_car] execVM "car1\Alive.sqf";

sleep 0.2;

while{alive _car}do{

if!((isNull _driver)and(player != _driver))then 
 {
 sleep 0.5 + random (3);
  _CarCanSound = ["ambulance"];
 // _CarWillSound = (_CarCanSound select (round(random 0)));
   _CarWillSound = "ambulance";
 
  _CarCanSound2 = ["Short4","Short5"];
  _CarWillSound2 = (_CarCanSound2 select (round(random 1)));
 
 _Speed = speed _car;
 if((_Speed > 20)and(isEngineOn _car))then{_car say _CarWillSound; sleep 25 + random (10); _HowLondWaited = 0;};
 if((_Speed <= 20)and(_Speed > 5)and(isEngineOn _car))then{sleep 1 + random 5;_car say _CarWillSound2; sleep 10 + random 15; _HowLondWaited = _HowLondWaited + 1; if(_HowLondWaited > 2)then{sleep 30; _HowLondWaited = 0;};};
 
 
 };





};


//nul = [this] execVM "car1\siren.sqf";