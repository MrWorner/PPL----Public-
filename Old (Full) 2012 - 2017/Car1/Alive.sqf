_car = _this select 0;
_true = true;
_name = "CarNumber" + format ["%1", (random 999) ];

while {_true}do
{
sleep 5;



if(!(alive _car)and!(_car in CarSOLD))then{
NotAliveCar =NotAliveCar + [position _car];
NotAliveCarmarker =NotAliveCarmarker + [_name];
_marker = createMarker [ _name, position _car ];
_marker setMarkerType "HW_CarInFire";


_true = false;
};


};



/////nul = [this] execVM "car1\Alive.sqf";