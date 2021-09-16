_car= _this select 0; 
_HowLondWaited = 0;
_driver = driver _car;
[_car] execVM "car1\Alive.sqf";

sleep 5;


while{alive _car}do{
sleep 0.1;
//player sidechat format ["isNull _driver %1!", (isNull _driver)];

if((isNull _driver)and(player != _driver))then 
 {
 sleep 0.5 + random (3);
  _CarCanSound = ["Long1","Long2","Long3"];
  _CarWillSound = (_CarCanSound select (round(random 2)));
 
  _CarCanSound2 = ["Short1","Short2","Short3","Short4","Short5","Short6","Short7","Short8"];
  _CarWillSound2 = (_CarCanSound2 select (round(random 7)));
 
 _Speed = speed _car;

 if((_Speed > 30)and(isEngineOn _car) and ((_car distance player) >20))then{_car say _CarWillSound; sleep 45 + random (10); _HowLondWaited = 0; };
 if((_Speed <= 30)and(_Speed > 20)and(isEngineOn _car) and ((_car distance player) >20))then{sleep 1 + random 5;_car say _CarWillSound2; sleep 10 + random 15; _HowLondWaited = _HowLondWaited + 1; if(_HowLondWaited > 2)then{sleep 30; _HowLondWaited = 0; };};
 
 
 };





};


//nul = [this] execVM "car1\siren.sqf";