
_cop = _this select 0;
_Voice = _this select 1;
_CopWillSay = "";
sleep 0.1;
if(_Voice == 1)then{
_CopCanSay = ["OFFICER_DOWN_01","OFFICER_DOWN_02","OFFICER_DOWN_03","FALL_BACK_01","FALL_BACK_02","FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));
};


if(_Voice == 2)then{
_CopCanSay = ["Cop2OFFICER_DOWN_01","Cop2OFFICER_DOWN_02","Cop2OFFICER_DOWN_03","Cop2FALL_BACK_01","Cop2FALL_BACK_02","Cop2FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 3)then{
_CopCanSay = ["cop3OFFICER_DOWN_01","cop3OFFICER_DOWN_02","cop3OFFICER_DOWN_03","cop3FALL_BACK_01","cop3FALL_BACK_02","cop3FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 4)then{
_CopCanSay = ["cop4OFFICER_DOWN_01","cop4OFFICER_DOWN_02","cop4OFFICER_DOWN_03","cop4FALL_BACK_01","cop4FALL_BACK_02","cop4FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 5)then{
_CopCanSay = ["cop5OFFICER_DOWN_01","cop5OFFICER_DOWN_02","cop5OFFICER_DOWN_03","cop5FALL_BACK_01","cop5FALL_BACK_02","cop5FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 6)then{
_CopCanSay = ["cop6OFFICER_DOWN_01","cop6OFFICER_DOWN_02","cop6FALL_BACK_01","cop6FALL_BACK_02","cop6FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 4)));

						};

if(_Voice == 7)then{
_CopCanSay = ["cop7OFFICER_DOWN_01","cop7OFFICER_DOWN_02","cop7OFFICER_DOWN_03","cop7FALL_BACK_01","cop7FALL_BACK_02","cop7FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 8)then{
_CopCanSay = ["cop8OFFICER_DOWN_01","cop8OFFICER_DOWN_02","cop8OFFICER_DOWN_03","cop8FALL_BACK_01","cop8FALL_BACK_02","cop8FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 9)then{
_CopCanSay = ["cop9OFFICER_DOWN_01","cop9OFFICER_DOWN_02","cop9OFFICER_DOWN_03","cop9FALL_BACK_01","cop9FALL_BACK_02","cop9FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};

if(_Voice == 10)then{
_CopCanSay = ["cop10OFFICER_DOWN_01","cop10OFFICER_DOWN_02","cop10OFFICER_DOWN_03","cop10FALL_BACK_01","cop10FALL_BACK_02","cop10FALL_BACK_03"];
_CopWillSay = (_CopCanSay select (round(random 5)));

						};


 if!((vehicle _cop) isKindOf "Car")then {_cop  say3D _CopWillSay;};
