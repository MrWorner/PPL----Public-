
sleep 2;
while{true}do{
_AliveMedic = count AliveFireFighter;
_CountDead = count NotAliveCar;




if(ScoreFireTruck>0)then
{
sleep 1;

  _FireStations = [FireStation1,FireStation2];
  _FireStationsGogo = (_FireStations select (round(random 1)));
  
  _CarsAvailable = ["kpfs_uaz451_ff","firetruck"];
  _CarsGogo = (_CarsAvailable select (round(random 1)));

POS1 = getpos _FireStationsGogo; _newCAR = createVehicle [_CarsGogo,POS1,[], 0, "NONE"];

sleep 0.3;
[_newCAR] execVM "car1\FireTruck.sqf";
_GROUP = Creategroup civilian;
_DRIVER = _GROUP createUnit ["USMC_LHD_Crew_Red",getpos _newCAR, [], 1, "NONE"]; 



AliveFireFighter = AliveFireFighter + [_GROUP];
_DRIVER moveindriver _newCAR;
[_DRIVER] execVM "civ1\Alive.sqf";

_PASSENGER = _GROUP createUnit ["USMC_LHD_Crew_Yellow",getpos _newCAR, [], 0, "NONE"]; 
_PASSENGER moveincargo _newCAR;
[_PASSENGER] execVM "civ1\Alive.sqf";

[_GROUP,_newCAR, _PASSENGER] execVM "Firefighter1\LastPosition.sqf";
ScoreFireTruck = ScoreFireTruck -1;
}
else
{
_AliveMedic = count AliveFireFighter;
_CountDead = count NotAliveCar;
if(_CountDead > (_AliveMedic*3))then {ScoreFireTruck = ScoreFireTruck + 1; sleep 15;}else{sleep 10;};
};
};