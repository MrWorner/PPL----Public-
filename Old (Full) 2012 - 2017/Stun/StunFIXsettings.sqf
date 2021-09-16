
////OFFLINE
while{(playerisdead)}do
{
random 2;

if((player in Trouble)and!(Player getVariable "GaveUp")and!(player in RestrainedPeople))then{
Trouble = Trouble - [player];
Player setVariable ["FightBan", true, true];
Player setVariable ["GaveUp", false, true];
WhoIsGoing = objNull;	
player globalchat "fixed!";
//if(captive player)then{player setcaptive true;};
sleep 3;
Player setVariable ["FightBan", false, true];

};


};