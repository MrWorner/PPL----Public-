_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
_CopWillSay = "";

sleep 5 + random 5;
 if!(alive _Suspect) exitwith{};
 _VariableISEEHIM = (_Suspect getVariable "VariableISEEHIM");
if!((_VariableISEEHIM > 3)  and !(_Suspect in RestrainedPeople)and(_Voice == 6)) exitwith {};
if!(WhiteCopSay2)then{
WhiteCopSay2 = true;

if(_Voice == 1)then{
 _CopCanSay = ["SURROUNDED_01","SURROUNDED_02","SURROUNDED_03","SURROUNDED_04","SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));
 };



if(_Voice == 2)then{
 _CopCanSay = ["Cop2SURROUNDED_01","Cop2SURROUNDED_02","Cop2SURROUNDED_03","Cop2SURROUNDED_04","Cop2SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3SURROUNDED_01","cop3SURROUNDED_02","cop3SURROUNDED_03","cop3SURROUNDED_04","cop3SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4SURROUNDED_01","cop4SURROUNDED_02","cop4SURROUNDED_03","cop4SURROUNDED_04","cop4SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 5)then{
_CopCanSay = ["cop5SURROUNDED_01","cop5SURROUNDED_02","cop5SURROUNDED_03","cop5SURROUNDED_04","cop5SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 6)then{


						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7SURROUNDED_01","cop7SURROUNDED_02","cop7SURROUNDED_03","cop7SURROUNDED_04","cop7SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 8)then{
_CopCanSay = ["cop8SURROUNDED_01","cop8SURROUNDED_02","cop8SURROUNDED_03","cop8SURROUNDED_04","cop8SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9SURROUNDED_01","cop9SURROUNDED_02","cop9SURROUNDED_03","cop9SURROUNDED_04","cop9SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10SURROUNDED_01","cop10SURROUNDED_02","cop10SURROUNDED_03","cop10SURROUNDED_04","cop10SURROUNDED_05"];
 _CopWillSay = (_CopCanSay select (round(random 4)));

						};








 if(!((vehicle _cop) isKindOf "Car")and(_Voice != 6))then {_cop  say3D _CopWillSay;};

_rNumber = random 5 + 20;
sleep _rNumber;

WhiteCopSay2 = false;
};