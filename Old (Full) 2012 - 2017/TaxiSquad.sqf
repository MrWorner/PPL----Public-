
sleep 2;
while{true}do{
_AliveMedic = count AliveFireFighter;
_CountDead = count NotAliveCar;




if(ScoreTaxi>0)then
{
sleep 1;

  _TaxiShops = [TaxiShopPos];
  _TaxiShopsGogo = (_TaxiShops select (round(random 0)));
  
  _CarsAvailable = ["GLT_M300_ST","GLT_M300_LT"];
  _CarsGogo = (_CarsAvailable select (round(random 1)));

POS1 = getpos _TaxiShopsGogo; _newCAR = createVehicle [_CarsGogo,POS1,[], 0, "NONE"];

sleep 0.3;
[_newCAR] execVM "car1\Alive.sqf";
_newCAR lock true;
_GROUP = Creategroup civilian;
_DRIVER = _GROUP createUnit ["RU_Villager4",getpos _newCAR, [], 1, "NONE"]; 



AliveTaxiGuys = AliveTaxiGuys + [leader _GROUP];
_DRIVER moveindriver _newCAR;
[_DRIVER] execVM "civ1\Alive.sqf";

[leader _GROUP,_newCAR, _DRIVER] execVM "TaxiGuys\LastPosition.sqf";
ScoreTaxi = ScoreTaxi -1;
}
else
{
_AliveTaxiGuys = count AliveTaxiGuys;
if(2 > (_AliveTaxiGuys))then {ScoreTaxi = ScoreTaxi + 1; sleep 3;}else{sleep 60;};
};
};