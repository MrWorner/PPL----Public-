FunctionPoliceFirstContact =
{
/// nul = [this] call FunctionPoliceFirstContact;

_cop = _this select 0;
_Voice = _this select 1;
_CopWillSay = "";



_active = true;
[_cop] execVM "BeginBehaviour.sqf";

nul = [_cop] execVM "DorA.sqf";
while{(_active)and(alive _cop)}do{

sleep 0.2;

if(count WantedPeople > 0)then{
{
_Knowledge =  _cop knowsAbout _x;
_Knowledge2 =  _cop knowsAbout vehicle _x;
if(!(_cop in (_x getVariable "CopsKnowMe"))and(((_Knowledge > 0.99)or(_Knowledge2 > 0.25))or((_Knowledge > 0.50) and !(_x in RestrainedPeople) and({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _x>0))))then{
if(_Voice == 1)then{
 _CopCanSay = ["FirstContact1","FirstContact2","FirstContact3","FirstContact4"];
 _CopWillSay = (_CopCanSay select (round(random 3)));
 };
 
 
 
if(_Voice == 2)then{
  _CopCanSay = ["Cop2DRAW_GUN_01","Cop2DRAW_GUN_02","Cop2DRAW_GUN_03","Cop2DRAW_GUN_04","Cop2DRAW_GUN_05","Cop2DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 3)then{
  _CopCanSay = ["cop3DRAW_GUN_01","cop3DRAW_GUN_02","cop3DRAW_GUN_03","cop3DRAW_GUN_04","cop3DRAW_GUN_05","cop3DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 4)then{
  _CopCanSay = ["cop4DRAW_GUN_01","cop4DRAW_GUN_02","cop4DRAW_GUN_03","cop4DRAW_GUN_04","cop4DRAW_GUN_05","cop4DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 5)then{
  _CopCanSay = ["cop5DRAW_GUN_01","cop5DRAW_GUN_02","cop5DRAW_GUN_03","cop5DRAW_GUN_04","cop5DRAW_GUN_05","cop5DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 6)then{
  _CopCanSay = ["cop6DRAW_GUN_01","cop6DRAW_GUN_02","cop6DRAW_GUN_03","cop6DRAW_GUN_04","cop6DRAW_GUN_05","cop6DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 7)then{
  _CopCanSay = ["cop7DRAW_GUN_01","cop7DRAW_GUN_02","cop7DRAW_GUN_03","cop7DRAW_GUN_04","cop7DRAW_GUN_05","cop7DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 8)then{
  _CopCanSay = ["cop8DRAW_GUN_01","cop8DRAW_GUN_02","cop8DRAW_GUN_03","cop8DRAW_GUN_04","cop8DRAW_GUN_05","cop8DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 9)then{
  _CopCanSay = ["cop9DRAW_GUN_01","cop9DRAW_GUN_02","cop9DRAW_GUN_03","cop9DRAW_GUN_04","cop9DRAW_GUN_05","cop9DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 10)then{
  _CopCanSay = ["cop10DRAW_GUN_01","cop10DRAW_GUN_02","cop10DRAW_GUN_03","cop10DRAW_GUN_04","cop10DRAW_GUN_05","cop10DRAW_GUN_06"];
 _CopWillSay = (_CopCanSay select (round(random 5)));

						};

 
 
 
 
 //if(Playerisdead) exitwith{};
 
 while{(_cop in RestrainedPeople)}do{sleep 5;};
 
 if(!((vehicle _cop) isKindOf "Car")and!(SpeakFirstContactOFF))then {_cop  say3D _CopWillSay;  _cop dotarget _x; SpeakFirstContactOFF = true; };
 _active = false;
 //_cop domove getpos _x;

 _Variable = (_x getVariable "CopsKnowMe") + [_cop];
 _x setVariable ["CopsKnowMe", _Variable, true];

 [_cop,_Voice,_x] spawn FunctionPoliceChase;
 [_x] execVM "ReadyForActions.sqf";
 sleep 1;
 SpeakFirstContactOFF = false;
 };

} forEach WantedPeople;
};
};
}