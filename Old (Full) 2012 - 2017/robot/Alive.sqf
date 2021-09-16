_car = _this select 0;
_true = true;
_name = "CarNumber" + format ["%1", (random 999) ];

_car lock true;
while {_true}do
{
sleep 5;



if!(alive _car)then{
sleep 10;
NotAliveCar =NotAliveCar + [position _car];
NotAliveCarmarker =NotAliveCarmarker + [_name];
_marker = createMarker [ _name, position _car ];
_marker setMarkerType "HW_CarInFire";


_true = false;
};


};



/////nul = [this] execVM "robot\Alive.sqf";