
_Man = _this select 1;

if(Otravili)exitwith{};
_pos = _this select 0;
Otravili = true;
while {(((_pos distance _Man) < 15)and(Otravili))} do {




if(GasX == 0.5)then{
"ColorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 0.0],  [0.5, 0.5, 0.5, 0.0]];
"ColorCorrections" ppEffectCommit 3;

sleep 3;
};
if(_Man == player)then{GasX = GasX - 0.057;};

_BruteHere = ["Otravlenie1","Otravlenie2","Otravlenie3","Otravlenie4","Otravlenie5","GasOtravlenieFinal"];
_BruteSay = (_BruteHere select (round(random 5)));
_Man  say3D _BruteSay;


"ColorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust[ 1, 1, 0, [-0.1, -0.52, -0.1, 0.41],[5, 0.14, -0.32, 0.6],[0.72, 4.21, 0.11, -0.1]];
"ColorCorrections" ppEffectCommit 0.4;


"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.04, 0.02, GasX, GasX];
"RadialBlur" ppEffectCommit 0.4;

sleep 0.6;

"ColorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust[ 0.36, 1, 0, [5, -5, -5, 0.1],[5, 0.56, 0.51, 0.17],[-0.01, -0.96, 5, 0]];
"ColorCorrections" ppEffectCommit 0.6;

sleep 1;

"ColorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 0.0],  [0.5, 0.5, 0.5, 0.0]];
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectCommit 1;



"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.04, 0.02, 0.1, 0.1];
"RadialBlur" ppEffectCommit 1;




sleep 1;
"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectCommit 1;

"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.24, 0.02, 0.2, 0.2];
"RadialBlur" ppEffectCommit 0.1;


//player globalchat format ["GasX = %1", GasX];
if(GasX < 0.06)exitwith{
//player globalchat "OTRAVLENIE FULL!";

 if(_Man == player)then{
 
 titleText["", "WHITE IN", 2];
	Player setVariable ["GaveUp", true, true];
	[] execVM "effect1.sqf"; 
	
	playerCanSay = ["Effect2","Effect4","Effect5","Effect10"]; 
_playerWillSay = (_playerCanSay select (round(random 2)));
playmusic _playerWillSay;
	
	};
	
if!(captive _Man)then{ _Man setcaptive true;};	



if!((_Man in RestrainedPeople)and!(_Man in Trouble))then{_Man switchmove "AdthPpneMstpSnonWnonDnon"; Trouble = Trouble + [_Man]; sleep 60;};
 if(!(_Man in RestrainedPeople)and!(playerisdead))then{_Man switchmove "AinvPknlMstpSlayWrflDnon_healed";};
	sleep 5;
	
 _Man setcaptive false;
  if(_Man == player)then{Player setVariable ["GaveUp", false, true]; CopGoingtoArrest = false;WhoIsGoing = objNull;};
 Trouble = Trouble - [_Man];
 

 
 "colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
"colorCorrections" ppEffectCommit 0.2;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.04, 0.02, 1, 1];
"RadialBlur" ppEffectCommit 0.2;
sleep 0.2;
"colorCorrections" ppEffectEnable false;
"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
"colorCorrections" ppEffectCommit 0.1;
"RadialBlur" ppEffectEnable false;
"RadialBlur" ppEffectAdjust[0.04, 0.02, 0.4, 0.4];
"RadialBlur" ppEffectCommit 0.1;
sleep 2;
//player globalchat "END!";	 
"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
"colorCorrections" ppEffectCommit 8;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.04, 0.02, 0.5, 0.5];
"RadialBlur" ppEffectCommit 8;

 };
 
 
};
sleep 1;
//player globalchat "END!";	 
"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
"colorCorrections" ppEffectCommit 8;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.04, 0.02, 0.5, 0.5];
"RadialBlur" ppEffectCommit 8;
Otravili = false;
GasX = 0.5;