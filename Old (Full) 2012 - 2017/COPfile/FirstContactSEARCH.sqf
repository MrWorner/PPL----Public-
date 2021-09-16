
sleep 0.1;


FunctionPoliceFirstContactSEARCH =
{

  //private["_cop", "_Voice", "_CopWillSay", "_copGrp", "_active", "_x"];
_cop = _this select 0;
_Voice = _this select 1;
_CopWillSay = "";

_active = true;
sleep 1;  
_copGrp = group _cop;

nul = [_cop] execVM "DorA.sqf"; [_copGrp] spawn FunctionPoliceLastPos;
//player sidechat format ["_cop = %1",(name _cop)];
//player sidechat format ["_copGrp = %1",(_copGrp)];
wanted = wanted + 1;
//player sidechat format ["Total police in the game = %1",(wanted)];


while{(_active)and(alive _cop)}do{

sleep 0.2;


if(count WantedPeople > 0)then{
{
_Knowledge =  _cop knowsAbout _x;
_Knowledge2 =  _cop knowsAbout vehicle _x;


if((!(_cop in (_x getVariable "CopsKnowMe"))and((_cop distance _x) <450))and(((_Knowledge > 0.99)or(_Knowledge2 > 0.25))or((_Knowledge > 0.50) and !(_x in RestrainedPeople) and({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _x>0))))then{
 
 
 switch (_Voice) do
{
 
case 1:{
 _CopCanSay = ["FirstContact1","FirstContact2","FirstContact3","FirstContact4"];
 _CopWillSay = (_CopCanSay select (round(random 3)));
                         };

case 2:{
  _CopCanSay = ["Cop2DRAW_GUN_01","Cop2DRAW_GUN_02","Cop2DRAW_GUN_03","Cop2DRAW_GUN_04","Cop2DRAW_GUN_05","Cop2DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 3:{

  _CopCanSay = ["cop3DRAW_GUN_01","cop3DRAW_GUN_02","cop3DRAW_GUN_03","cop3DRAW_GUN_04","cop3DRAW_GUN_05","cop3DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 4:{

  _CopCanSay = ["cop4DRAW_GUN_01","cop4DRAW_GUN_02","cop4DRAW_GUN_03","cop4DRAW_GUN_04","cop4DRAW_GUN_05","cop4DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));


						};

case 5:{
  _CopCanSay = ["cop5DRAW_GUN_01","cop5DRAW_GUN_02","cop5DRAW_GUN_03","cop5DRAW_GUN_04","cop5DRAW_GUN_05","cop5DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 6:{
  _CopCanSay = ["cop6DRAW_GUN_01","cop6DRAW_GUN_02","cop6DRAW_GUN_03","cop6DRAW_GUN_04","cop6DRAW_GUN_05","cop6DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 7:{
  _CopCanSay = ["cop7DRAW_GUN_01","cop7DRAW_GUN_02","cop7DRAW_GUN_03","cop7DRAW_GUN_04","cop7DRAW_GUN_05","cop7DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 8:{
  _CopCanSay = ["cop8DRAW_GUN_01","cop8DRAW_GUN_02","cop8DRAW_GUN_03","cop8DRAW_GUN_04","cop8DRAW_GUN_05","cop8DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 9:{
  _CopCanSay = ["cop9DRAW_GUN_01","cop9DRAW_GUN_02","cop9DRAW_GUN_03","cop9DRAW_GUN_04","cop9DRAW_GUN_05","cop9DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

case 10:{
  _CopCanSay = ["cop10DRAW_GUN_01","cop10DRAW_GUN_02","cop10DRAW_GUN_03","cop10DRAW_GUN_04","cop10DRAW_GUN_05","cop10DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};
};

  while{(_cop in RestrainedPeople)}do{sleep 5;};

 if(!((vehicle _cop) isKindOf "Car")and!(SpeakFirstContactOFF))then {_cop  say3D _CopWillSay;  _cop dotarget _x; SpeakFirstContactOFF = true;};

 

_Variable = (_x getVariable "CopsKnowMe") + [_cop];
 _x setVariable ["CopsKnowMe", _Variable, true];

 [_cop,_Voice,_x] spawn FunctionPoliceChase;
 
  //player Globalchat format ["_cop = %1",(name _cop)];
  // player Globalchat format ["_Voice = %1",(_Voice)];
 //player Globalchat format ["Suspect = %1",(name _x)];
 
 [_x] execVM "ReadyForActions.sqf";
  sleep 1;
 SpeakFirstContactOFF = false;
 };
} forEach WantedPeople;
};
};
}
