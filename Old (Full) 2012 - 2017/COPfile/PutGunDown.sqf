_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
_CopWillSay = "";
sleep 5 + random 5;
 if!(alive _Suspect) exitwith{};
if!( (alive _Suspect) and !(_Suspect in RestrainedPeople) and !((vehicle _Suspect) isKindOf "Car") and ({getNumber (configFile/"CfgWeapons"/_x/"type") in [1,2,4,5]} count weapons _Suspect>0)) exitwith{};
if!(WhiteCopSay)then{
WhiteCopSay = true;
if(_Voice == 1)then{
 _CopCanSay = ["SPOT_GUN_01","SPOT_GUN_02","SPOT_GUN_03","SPOT_GUN_04","SPOT_WEAPON_01","SPOT_WEAPON_02","SPOT_WEAPON_03","SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));
  };
  
  
if(_Voice == 2)then{
 _CopCanSay = ["Cop2SPOT_GUN_01","Cop2SPOT_GUN_02","Cop2SPOT_GUN_03","Cop2SPOT_GUN_04","Cop2SPOT_WEAPON_01","Cop2SPOT_WEAPON_02","Cop2SPOT_WEAPON_03","Cop2SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3SPOT_GUN_01","cop3SPOT_GUN_02","cop3SPOT_GUN_03","cop3SPOT_GUN_04","cop3SPOT_WEAPON_01","cop3SPOT_WEAPON_02","cop3SPOT_WEAPON_03","cop3SPOT_WEAPON_04","cop3SPOT_WEAPON_05"];
 _CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4SPOT_GUN_01","cop4SPOT_GUN_02","cop4SPOT_GUN_03","cop4SPOT_GUN_04","cop4SPOT_WEAPON_01","cop4SPOT_WEAPON_02","cop4SPOT_WEAPON_03","cop4SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5SPOT_GUN_01","cop5SPOT_GUN_02","cop5SPOT_GUN_03","cop5SPOT_GUN_04","cop5SPOT_WEAPON_01","cop5SPOT_WEAPON_02","cop5SPOT_WEAPON_03","cop5SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6SPOT_GUN_01","cop6SPOT_GUN_02","cop6SPOT_GUN_03","cop6SPOT_GUN_04","cop6SPOT_WEAPON_01","cop6SPOT_WEAPON_02","cop6SPOT_WEAPON_03","cop6SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7SPOT_GUN_01","cop7SPOT_GUN_02","cop7SPOT_GUN_03","cop7SPOT_GUN_04","cop7SPOT_WEAPON_01","cop7SPOT_WEAPON_02","cop7SPOT_WEAPON_03","cop7SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8SPOT_GUN_01","cop8SPOT_GUN_02","cop8SPOT_GUN_03","cop8SPOT_GUN_04","cop8SPOT_WEAPON_01","cop8SPOT_WEAPON_02","cop8SPOT_WEAPON_03","cop8SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9SPOT_GUN_01","cop9SPOT_GUN_02","cop9SPOT_GUN_03","cop9SPOT_GUN_04","cop9SPOT_WEAPON_01","cop9SPOT_WEAPON_02","cop9SPOT_WEAPON_03","cop9SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10SPOT_GUN_01","cop10SPOT_GUN_02","cop10SPOT_GUN_03","cop10SPOT_GUN_04","cop10SPOT_WEAPON_01","cop10SPOT_WEAPON_02","cop10SPOT_WEAPON_03","cop10SPOT_WEAPON_04"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};
  
  
  
  

  _cop  say3D _CopWillSay;

sleep 5;
WhiteCopSay = false;

_VariableISEEHIM = (_Suspect getVariable "VariableISEEHIM");
if(_VariableISEEHIM > 5)then {[_cop,_Voice,_Suspect] execVM "COPfile\Surrounded.sqf";};
};