_cop = _this select 0;
_Voice = _this select 1;
_CopWillSay = "";
sleep 0.1;
if(_Voice == 1)then{
_CopCanSay = ["DUCK_01","DUCK_02","DUCK_03","DUCK_04","TAKE_COVER_01","TAKE_COVER_02","TAKE_COVER_03","TAKE_COVER_04","TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));
};


if(_Voice == 2)then{
_CopCanSay = ["Cop2DUCK_01","Cop2DUCK_02","Cop2DUCK_03","Cop2DUCK_04","Cop2TAKE_COVER_01","Cop2TAKE_COVER_02","Cop2TAKE_COVER_03","Cop2TAKE_COVER_04","Cop2TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 3)then{
_CopCanSay = ["cop3DUCK_01","cop3DUCK_02","cop3DUCK_03","cop3DUCK_04","cop3TAKE_COVER_01","cop3TAKE_COVER_02","cop3TAKE_COVER_03","cop3TAKE_COVER_04","cop3TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 4)then{
_CopCanSay = ["cop4DUCK_01","cop4DUCK_02","cop4DUCK_03","cop4DUCK_04","cop4TAKE_COVER_01","cop4TAKE_COVER_02","cop4TAKE_COVER_03","cop4TAKE_COVER_04","cop4TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 5)then{
_CopCanSay = ["cop5DUCK_01","cop5DUCK_02","cop5DUCK_03","cop5DUCK_04","cop5TAKE_COVER_01","cop5TAKE_COVER_02","cop5TAKE_COVER_03","cop5TAKE_COVER_04","cop5TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 6)then{
_CopCanSay = ["cop6DUCK_01","cop6DUCK_02","cop6DUCK_03","cop6DUCK_04","cop6TAKE_COVER_01","cop6TAKE_COVER_02","cop6TAKE_COVER_03","cop6TAKE_COVER_04","cop6TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 7)then{
_CopCanSay = ["cop7DUCK_01","cop7DUCK_02","cop7DUCK_03","cop7DUCK_04","cop7TAKE_COVER_01","cop7TAKE_COVER_02","cop7TAKE_COVER_03","cop7TAKE_COVER_04"];
_CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 8)then{
_CopCanSay = ["cop8DUCK_01","cop8DUCK_02","cop8DUCK_03","cop8DUCK_04","cop8TAKE_COVER_01","cop8TAKE_COVER_02","cop8TAKE_COVER_03","cop8TAKE_COVER_04","cop8TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 9)then{
_CopCanSay = ["cop9DUCK_01","cop9DUCK_02","cop9DUCK_03","cop9DUCK_04","cop9TAKE_COVER_01","cop9TAKE_COVER_02","cop9TAKE_COVER_03","cop9TAKE_COVER_04","cop9TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};

if(_Voice == 10)then{
_CopCanSay = ["cop10DUCK_01","cop10DUCK_02","cop10DUCK_03","cop10DUCK_04","cop10TAKE_COVER_01","cop10TAKE_COVER_02","cop10TAKE_COVER_03","cop10TAKE_COVER_04","cop10TAKE_COVER_05"];
_CopWillSay = (_CopCanSay select (round(random 8)));

						};



 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;};
