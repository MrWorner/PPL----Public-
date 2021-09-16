_cop = _this select 0;
_Voice = _this select 1;
_CopWillSay = "";
sleep 0.1;

if(_Voice == 1)then{
 _CopCanSay = ["PED_SHOT_01","PED_SHOT_02","PED_SHOT_03","PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 5)));
 };
 
 
if(_Voice == 2)then{
 _CopCanSay = ["cop2PED_SHOT_01","cop2PED_SHOT_02","cop2PED_SHOT_03"];
_CopWillSay = (_CopCanSay select (round(random 2)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3PED_SHOT_01","cop3PED_SHOT_02","cop3PED_SHOT_03","cop3PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4PED_SHOT_01","cop4PED_SHOT_02","cop4PED_SHOT_03","cop4PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5PED_SHOT_01","cop5PED_SHOT_02","cop5PED_SHOT_03","cop5PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6PED_SHOT_01","cop6PED_SHOT_02","cop6PED_SHOT_03","cop6PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7PED_SHOT_01","cop7PED_SHOT_02","cop7PED_SHOT_03","cop7PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8PED_SHOT_01","cop8PED_SHOT_02","cop8PED_SHOT_03","cop8PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9PED_SHOT_01","cop9PED_SHOT_02","cop9PED_SHOT_03","cop9PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10PED_SHOT_01","cop10PED_SHOT_02","cop10PED_SHOT_03","cop10PED_SHOT_04"];
_CopWillSay = (_CopCanSay select (round(random 3)));

						};
 
 
 
 
 
 
 
 
 
 
 
 
 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;};
