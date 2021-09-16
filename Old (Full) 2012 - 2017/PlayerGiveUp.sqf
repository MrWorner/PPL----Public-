
if(Player getVariable "OpenFire")then {player setcaptive true;};
Player setVariable ["OpenFire", false, true];
Player setVariable ["GaveUp", true, true];
player switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
sleep 2;
while{Player getVariable "GaveUp"}do{
sleep 0.3;
_state = animationState player; 
if!("AmovPercMstpSsurWnonDnon" == _state)then {
Player setVariable ["GaveUp", false, true];
if!(player in RestrainedPeople)then {player setcaptive false; Player setVariable ["OpenFire", true, true];};
GiveUpChance = false;
 
CopGoingtoArrest = false;};
};