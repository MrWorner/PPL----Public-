_cop = _this select 0; 
_Suspect = _this select 1;
_FirstPlayer = _this select 2;
_Suspect setVariable ["Fight", true, true]; 
_x = 0;
_firstTime = true;
_STATUS = 0; // 1- you 2- enemy

_BlueScore = 0;
_RedScore = 0;
// player switchmove "AmelPercMstpSnonWnonDnon_zasah6hlava" // Получил сильнейшее повреждения
// player switchmove "AmelPercMstpSlowWrflDnon_StrokeGun" // Удар прикладом
//player switchmove "AmelPercMstpSnonWnonDnon_amaterUder3"; // Удар кулаком
// switchmove "AmelPercMstpSnonWnonDnon_zasah3hard"; // Получил повреждения
// player  switchmove "AmelPercMstpSnonWnonDnon_amaterUder1";// Удар кулаком 2
// player  switchmove "AmelPercMstpSnonWnonDnon_zasah4";// Получил повреждения
// player switchmove "AmelPercMstpSnonWnonDnon_amaterUder2";// Удар левой
// player  switchmove "AinjPpneMstpSnonWnonDnon_rolltofront"; // на земле

//player globalchat format ["%1",_Suspect];
//player globalchat format ["_cop %1",_cop];

if!(_FirstPlayer)then { _cop playmove "AmelPercMstpSlowWrflDnon_StrokeGun"; };

_Suspect attachTo [_cop,[0,1.4,0]];
 _Suspect setdir 180;
 //1.6
 
if!(_FirstPlayer)then {sleep 1.0;};
 _CopCanSay = ["Fight1","Fight2","Fight3","Fight4","Fight5","Fight6","Fight7"];
 _CopWillSay = (_CopCanSay select (round(random 6)));
 
 
 
while {(_Suspect getVariable "Fight")and(alive _Suspect)and(alive _cop)and!(_Suspect getVariable "GaveUp")and!(_Suspect in Trouble) and!(_cop in Trouble) } do 
{
_CHOICE = ["AmelPercMstpSnonWnonDnon_amaterUder3","AmelPercMstpSnonWnonDnon_amaterUder1","AmelPercMstpSnonWnonDnon_amaterUder2"];
_ANIMAT = (_CHOICE select (round(random 2)));

_CHOICE2 = ["AmelPercMstpSnonWnonDnon_zasah6hlava","AmelPercMstpSnonWnonDnon_zasah3hard","AmelPercMstpSnonWnonDnon_zasah4"];
_ANIMAT2 = (_CHOICE2 select (round(random 2)));




_BUTTONCHOICE = ["Q","W","E","SPACE","U","K","I","Z","A","H"];
_BUTTONSELECTED =(_BUTTONCHOICE select (round(random 9)));

if(_Suspect == Player)then{
if((!_firstTime))then{SetAccTime (0.1 + TiredToFight);}else{SetAccTime (0.1 + TiredToFight);};};
if(_Suspect == Player)then{
hint format ["Press %1", _BUTTONSELECTED];
PressButton = true;
[] execVM "PressButton.sqf";
};
_STATUS = 0;



 _CopCanSay = ["Fight1","Fight2","Fight3","Fight4","Fight6","Fight7"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

if(!_firstTime)then{_x = 2;}else{_x = 0;};
while{(_STATUS == 0)and(_x != 3)}do
{
sleep 0.1;

if!(alive _Suspect)exitwith{};
if(_Suspect in Trouble)exitwith{_Suspect setVariable ["FightBan", false, true]; _Suspect setVariable ["Fight", false, true];detach _Suspect;};
if((ButtonON == _BUTTONSELECTED)and(_Suspect == Player)and!(PressButton)and!(_Suspect in Trouble))then{_Suspect switchmove _ANIMAT; _STATUS = 1; _x = 3;  PressButton = false; };
if(!(ButtonON == "")and(_Suspect == Player)and!(ButtonON == _BUTTONSELECTED))then{ _STATUS = 2; _x = 3; PressButton = false; };
_x = _x +1;


 _CopCanSay = ["Fight1","Fight2","Fight3","Fight4","Fight6","Fight7"];
 _CopWillSay = (_CopCanSay select (round(random 5)));
};
 if(_Suspect == Player)then{PressButton = false;
SetAccTime 1;};

_ANIMAT = (_CHOICE select (round(random 2)));
_ANIMAT2 = (_CHOICE2 select (round(random 2)));
if(_Suspect == Player)then{ButtonON = "";};
if!(alive _Suspect)exitwith{};
if(_Suspect in Trouble)exitwith{_Suspect setVariable ["FightBan", false, true]; _Suspect setVariable ["Fight", false, true];detach _Suspect; _Suspect setVariable ["FightBan", false, true];};
if(_Suspect in StunnedpeopleFlashBang)exitwith{ _Suspect setVariable ["Fight", false, true]; _Suspect setVariable ["FightBan", false, true];};

if(_Suspect == Player)then{TiredToFight = TiredToFight + 0.01;};
if((_STATUS == 0)or(_STATUS == 2))then{
if(_Suspect == Player)then{hint "Bad";};
if((_FirstPlayer)and (_firstTime))then {  _cop switchmove "AmelPercMstpSnonWnonDnon_amaterUder1";};
_RedScore = _RedScore + 1;
if(_firstTime)then{_RedScore = _RedScore + 2;};
if!(_Suspect in Trouble)then{_Suspect switchmove _ANIMAT2;};
//playsound _CopWillSay;
if(!_firstTime)then{_cop switchmove _ANIMAT;};
_firstTime = false;
};




if(_STATUS == 1)then{
hint "Good";
_BlueScore = _BlueScore+1;
_cop switchmove _ANIMAT2;
//playsound _CopWillSay;
};
_firstTime = false;


sleep 0.7;
playsound _CopWillSay;
sleep 0.3;
if(_Suspect == Player)then{SetAccTime 0.2;};

sleep 0.3;
if(_Suspect == Player)then{SetAccTime 1;};
 
sleep 0.4;




if!( alive _Suspect)exitwith{};
if(_Suspect in Trouble)exitwith{_Suspect setVariable ["FightBan", false, true];Fight = false;detach _Suspect; };
if((_RedScore > 2)and!(_Suspect in Trouble)) then { _Suspect setVariable ["Fight", false, true];  if(_Suspect == Player)then{titleText["", "WHITE IN", 2];}; _Suspect switchmove "AdthPsitMstpSnonWnonDnon_forgoten"; removeallweapons _Suspect; if(_Suspect getVariable "OpenFire")then {_Suspect setcaptive true;}; _Suspect setVariable ["GaveUp", true, true]; Trouble =Trouble + [_Suspect]; if(_Suspect == Player)then{[] execVM "effect1.sqf";}; _SuspectCanSay = ["Effect2","Effect4","Effect5","Effect10","Effect13"]; _SuspectWillSay = (_SuspectCanSay select (round(random 4))); if(_Suspect == Player)then{playmusic _SuspectWillSay;};};
if((_BlueScore > 2)and!(_Suspect in Trouble)) then { _Suspect setVariable ["Fight", false, true]; _cop switchmove "AinjPpneMstpSnonWnonDnon_rolltofront"; _cop enableSimulation false;  StunnedPerson = _cop; Trouble =Trouble + [_cop];};
};
_Suspect setVariable ["FightBan", true, true];
_Suspect setVariable ["Fight", false, true];

detach _Suspect;
if(_RedScore > 2) then {sleep 1; };
sleep 1;
_Suspect setVariable ["FightBan", false, true];

sleep 1;
if(_BlueScore > 2) then {sleep 4; if(alive _cop)then  {_cop enableSimulation true;}; };
if(_RedScore > 2) then {sleep 30;  if(!(_Suspect in RestrainedPeople)and(_Suspect in Trouble))then{_Suspect switchmove "AinvPknlMstpSnonWnonDnon_healed_2";}; sleep 4;};
if(_Suspect == Player)then{setAccTime 1;};

        if(!(_Suspect in RestrainedPeople)and(_Suspect in Trouble))then{
         _Suspect setcaptive false;
		_Suspect setVariable ["GaveUp", false, true];
		_Suspect setVariable ["WhoIsGoing", ObjNul, true];
		_Suspect setVariable ["CopGoingtoArrest", false, true];
		Trouble = Trouble - [_Suspect];
         };
if(_cop in Trouble)then{ sleep 3.3; Trouble =Trouble - [_cop];};

