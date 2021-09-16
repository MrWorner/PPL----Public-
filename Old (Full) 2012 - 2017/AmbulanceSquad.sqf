
sleep 2;
while{true}do{

_AliveMedic = count AliveMedic;
_CountDead = count NotAlive;




if(ScoreAmbulance>0)then
{


  _Hospitals = [Hospital3,Hospital3,Hospital3];
  _HospitalsGogo = (_Hospitals select (round(random 2)));

POS1 = getpos _HospitalsGogo; _newCAR = createVehicle ["kpfs_uaz451_ambulance",POS1,[], 0, "NONE"];
[_newCAR] execVM "car1\ambulance.sqf";
_GROUP = Creategroup civilian;
_DRIVER = _GROUP createUnit ["RU_Doctor",getpos _newCAR, [], 1, "NONE"]; 

AliveMedic = AliveMedic + [_GROUP];
_DRIVER moveindriver _newCAR;
[_DRIVER] execVM "civ1\Alive.sqf";

_PASSENGER = _GROUP createUnit ["RU_Doctor",getpos _newCAR, [], 0, "NONE"]; 
_PASSENGER moveincargo _newCAR;
[_PASSENGER] execVM "civ1\Alive.sqf";

[_GROUP,_newCAR, _PASSENGER] execVM "medic1\LastPosition.sqf";
ScoreAmbulance = ScoreAmbulance -1;
}
else
{
_AliveMedic = count AliveMedic;
_CountDead = count NotAlive;
if(_CountDead > (_AliveMedic*3))then {ScoreAmbulance = ScoreAmbulance + 1; sleep 15;}else{sleep 120;};
};
};