sleep 1;

_xx = (Player getVariable "CopsKnowMe");
player groupChat format ["CopsKnowMe: %1", _xx];
sleep 1;


_xx = Player getVariable "PlayerisWANTED";
player groupChat format ["PlayerisWANTED: %1", _xx];
sleep 1;
_xx = Player getVariable "VariableISEEHIM";
player groupChat format ["VariableISEEHIM: %1", _xx];
sleep 1;
_xx = Player getVariable "OpenFire";
player groupChat format ["OpenFire: %1", _xx];
sleep 1;
_xx = Player getVariable "RFAgo";
player groupChat format ["RFAgo: %1", _xx];
sleep 1;
_xx = Player getVariable "WhoIsGoing";
player groupChat format ["WhoIsGoing: %1", _xx];
sleep 1;
_xx = Player getVariable "GaveUp";
player groupChat format ["GaveUp: %1", _xx];
sleep 1;
_xx = Player getVariable "FightBAN";
player groupChat format ["FightBAN: %1", _xx];
sleep 1;
_xx = Player getVariable "Fight";
player groupChat format ["Fight: %1", _xx];

sleep 1;
_xx = Player getVariable "PlayerFired";
player groupChat format ["PlayerFired: %1", _xx];

sleep 1;
_xx = Player getVariable "PlayerFiredBan";
player groupChat format ["PlayerFiredBan: %1", _xx];

sleep 1;
_xx = Player getVariable "CopGoingtoArrest";
player groupChat format ["CopGoingtoArrest: %1", _xx];

sleep 1;





sleep 1;
player sidechat format ["RestrainedPeople: %1", RestrainedPeople];
sleep 1;
player globalchat format ["(Captive player): %1", (Captive player)];
sleep 1;
player sidechat format ["GiveUpChance: %1", GiveUpChance];
sleep 1;
player sidechat format ["GaveUp: %1", GaveUp];
sleep 1;
player sidechat format ["Police're chasing you: %1", ISEEHIM];
sleep 1;
player globalchat format ["LastPosGuarded: %1", LastPosGuarded];
sleep 1;
player sidechat format ["CopGoingtoArrest: %1", CopGoingtoArrest];
sleep 1;
player globalchat format ["OpenFire: %1", OpenFire];
sleep 1;
player sidechat format ["FightBAN: %1", FightBAN];
sleep 1;
player globalchat format ["Fight: %1", Fight];

_AliveMedic = count AliveMedic;
_CountDead = count NotAlive;
_AliveMedic2 = count AliveFireFighter;
_CountDead2 = count NotAliveCar;

sleep 1;
player globalchat format ["count AliveMedic: %1", _AliveMedic];
sleep 1;
player globalchat format [" count NotAlive: %1", _CountDead];
sleep 1;
player sidechat format ["count AliveFireFighter: %1", _AliveMedic2];
sleep 1;
player sidechat format ["count NotAliveCar: %1", _CountDead2];
sleep 1;

 player sidechat format ["NotAliveCar = %1", NotAliveCar];
 sleep 1;
 player sidechat format ["NotAliveCarmarker = %1", NotAliveCarmarker];

 sleep 1;
 _health = damage player;
	 player sidechat format ["_health = %1", _health];
 sleep 1; 
 
  _health2 = getDammage player ;
	 player sidechat format ["_health2 = %1", _health];
 sleep 1; 
  
    
player sidechat "END!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";

