_Suspect = _this select 0;

if(player == _Suspect)then{Hintsilent "END BATTLE";};
LastPos setpos getpos _Suspect;
//"LastPos" setMarkerType "mil_circle";
"LastPos" setMarkerPos getpos _Suspect;
_Suspect setVariable ["GaveUp", false, true]; _Suspect setVariable ["OpenFire", false, true]; GiveUpChance = true; OfficerDown = false; SuperEffect = false;
LastPosGuarded = false;
StunOverDose = 0;
StunMuch = 0;
TiredToFight = 0;
_Suspect setVariable ["RFAgo", false, true];
if(_EnemyKilled)then{
setAccTime 0.2;
sleep 0.7;
setAccTime 1;
};
_score = 0;
if((rating _Suspect)<0) then {_score = rating _Suspect * (-1);};

_Suspect addRating _score;
