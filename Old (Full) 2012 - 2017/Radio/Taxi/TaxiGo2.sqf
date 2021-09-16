//Player setpos map_pos;
_Cent = 0;
_JackAss = 0;
_TaxiMoving = true;
//Player globalchat format ["%1", WhoWillDrive ];
//Player globalchat format ["%1",  (vehicle WhoWillDrive ) ];
vehicle WhoWillDrive lock false;
//Player action ["getin", (vehicle WhoWillDrive )];

TaxiSetMarkerActivated2 = false;


Closedialog 0;
TaxoMetrMoney = 3;

if(Money >= 3)then{Money = Money - 3;
PrivateTaxi = PrivateTaxi + [leader group WhoWillDrive];
TaxiGuysBUSY = TaxiGuysBUSY - [leader group WhoWillDrive];




     Player moveInCargo (vehicle WhoWillDrive );
	 _wp = group WhoWillDrive addWaypoint [position TaxiZakaz2, 0]; 
	 _wp = group WhoWillDrive addWaypoint [position TaxiZakaz2, 1]; 
    [group WhoWillDrive, 0] setWaypointType "MOVE"; 
    [group WhoWillDrive, 1] setWaypointType "MOVE"; 
	//WhoWillDrive domove getpos TaxiZakaz2;
	}else{_TaxiMoving = false; _JackAss = 1; };

while{((player in (crew (vehicle WhoWillDrive)))and(_TaxiMoving))}do
{
_MySpeed = speed vehicle WhoWillDrive;
_Cent = _Cent + (_MySpeed/35);
if(Money < 1)then{_TaxiMoving = false;};
if(_Cent > 9)then{TaxoMetrMoney = TaxoMetrMoney + 1; _Cent = _Cent - 10; Money = Money - 1;};

titletext[format["Price for ride: $%1",TaxoMetrMoney], "PLAIN DOWN"];

if((WhoWillDrive distance TaxiZakaz2) < 12)then{_TaxiMoving = false; WhoWillDrive stop true; TaxiZakaz2 setpos getpos AllMarkersHere; "YourTaxiMarker2" setmarkerpos getpos AllMarkersHere;};
sleep 1;
};

if((Money < 1)or(_JackAss == 1))then{Player sidechat "You don't have enough money, GET OUT!";
	
	player domove getpos player;
	deleteWaypoint [group WhoWillDrive, 0];
	deleteWaypoint [group WhoWillDrive, 1];
	deleteWaypoint [group WhoWillDrive, 2];
	TaxiZakaz2 setpos getpos AllMarkersHere; "YourTaxiMarker2" setmarkerpos getpos AllMarkersHere;
	
}else{

Player sidechat "Taxi service have completed your order.";
Player sidechat format ["you paid $%1 for taxi service.", TaxoMetrMoney ];
};

while{((player in (crew (vehicle WhoWillDrive))))}do
{
sleep 1;
PrivateTaxi = PrivateTaxi - [leader group WhoWillDrive];
};
WhoWillDrive stop false;
vehicle WhoWillDrive lock true;