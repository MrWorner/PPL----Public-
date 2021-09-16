_group = _this select 0;
_Car = _this select 1;
_Assistant = _this select 2;
_WeHaveDestroyedCar = false;
_lock = false;
_MarkerName1 = "";
sleep 1;
_WeWillTakeIt = getpos player;

while {{alive _x} count units leader _group != 0} do {  


if!((leader _group in TaxiGuysBUSY)or(leader _group in PrivateTaxi))then{
_CountFREE = count TaxiParking;
_RANDOM = (round(random _CountFREE)) - 1;
if(_RANDOM < 0)then {_RANDOM = 0;};
 _SELECTPLACE = (TaxiParking select _RANDOM);
 //_SELECTMARKER = (TaxiParkingMarkers select _RANDOM);
TaxiGuysBUSY = TaxiGuysBUSY + [leader _group];
//_SELECTMARKER  setMarkerType "HW_Taxi3";
TaxiParkingMarkersCROWDED = TaxiParkingMarkersCROWDED + [_SELECTMARKER];
//TaxiParkingMarkers = TaxiParkingMarkers - [_SELECTMARKER];
TaxiParking = TaxiParking -[_SELECTPLACE];
TaxiParkingCROWDED = TaxiParkingCROWDED + [_SELECTPLACE];

if(TaxiTeleport60)then{(vehicle (leader leader _group)) setpos getpos _SELECTPLACE;}else
{leader leader _group domove getpos _SELECTPLACE;};



sleep 60;



//player globalchat format ["_RANDOM = %1", _RANDOM ];
//player globalchat format ["_SELECTPLACE = %1", _SELECTPLACE ];
//player globalchat format ["_SELECTMARKER = %1", _SELECTMARKER ];
//player globalchat format ["TaxiGuysBUSY = %1", TaxiGuysBUSY ];
//player sidechat format ["TaxiParking = %1", TaxiParking ];
//player sidechat format ["TaxiParkingMarkers = %1", TaxiParkingMarkers ];



};
 
 
 
 
 
 
 sleep 50;
};





AliveTaxiGuys = AliveTaxiGuys - [leader _group];

