_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
_cop setUnitPos "up"; 
_cop setCombatMode "blue";
_group1 setBehaviour "AWARE";
_CopWillSay = "";
_CopWillSay2 = "";
sleep 5 + random 5;
if !((vehicle _Suspect) isKindOf "Car") exitwith{};
 if!(alive _Suspect) exitwith{};
if(!(WhiteCopSay)and !((vehicle _cop) isKindOf "Car"))then{
WhiteCopSay = true;


if(_Voice == 1)then{
 _CopCanSay = ["GET_OUT_OF_CAR_SHOUT_01","GET_OUT_OF_CAR_SHOUT_02","GET_OUT_OF_CAR_SHOUT_03","GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));
 };
 

if(_Voice == 2)then{
 _CopCanSay = ["Cop2GET_OUT_OF_CAR_SHOUT_01","Cop2GET_OUT_OF_CAR_SHOUT_02","Cop2GET_OUT_OF_CAR_SHOUT_03","Cop2GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3GET_OUT_OF_CAR_SHOUT_01","cop3GET_OUT_OF_CAR_SHOUT_02","cop3GET_OUT_OF_CAR_SHOUT_03","cop3GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4GET_OUT_OF_CAR_SHOUT_01","cop4GET_OUT_OF_CAR_SHOUT_02","cop4GET_OUT_OF_CAR_SHOUT_03","cop4GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5GET_OUT_OF_CAR_SHOUT_01","cop5GET_OUT_OF_CAR_SHOUT_02","cop5GET_OUT_OF_CAR_SHOUT_03","cop5GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6GET_OUT_OF_CAR_SHOUT_01","cop6GET_OUT_OF_CAR_SHOUT_02","cop6GET_OUT_OF_CAR_SHOUT_03"];
 _CopWillSay = (_CopCanSay select (round(random 2)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7GET_OUT_OF_CAR_SHOUT_01","cop7GET_OUT_OF_CAR_SHOUT_02","cop7GET_OUT_OF_CAR_SHOUT_03","cop7GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8GET_OUT_OF_CAR_SHOUT_01","cop8GET_OUT_OF_CAR_SHOUT_02","cop8GET_OUT_OF_CAR_SHOUT_03","cop8GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9GET_OUT_OF_CAR_SHOUT_01","cop9GET_OUT_OF_CAR_SHOUT_02","cop9GET_OUT_OF_CAR_SHOUT_03","cop9GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10GET_OUT_OF_CAR_SHOUT_01","cop10GET_OUT_OF_CAR_SHOUT_02","cop10GET_OUT_OF_CAR_SHOUT_03","cop10GET_OUT_OF_CAR_SHOUT_04"];
 _CopWillSay = (_CopCanSay select (round(random 3)));

						};
 

 _cop  say3D _CopWillSay;
 
_rNumber = random 5 + 3;
sleep _rNumber;
WhiteCopSay = false;
};

if !((vehicle _Suspect) isKindOf "Car") exitwith{};
if(!(WhiteCopCarSay)and ((vehicle _cop) isKindOf "Car"))then{
WhiteCopCarSay = true;

if(_Voice == 1)then{
 _CopCanSay = ["GET_OUT_OF_CAR_MEGAPHONE_01","GET_OUT_OF_CAR_MEGAPHONE_02","GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 2)));
 };

 
if(_Voice == 2)then{
 _CopCanSay = ["Cop2GET_OUT_OF_CAR_MEGAPHONE_02","Cop2GET_OUT_OF_CAR_MEGAPHONE_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3GET_OUT_OF_CAR_MEGAPHONE_02","cop3GET_OUT_OF_CAR_MEGAPHONE_01","cop3GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4GET_OUT_OF_CAR_MEGAPHONE_02","cop4GET_OUT_OF_CAR_MEGAPHONE_01","cop4GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5GET_OUT_OF_CAR_MEGAPHONE_02","cop5GET_OUT_OF_CAR_MEGAPHONE_01","cop5GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6GET_OUT_OF_CAR_MEGAPHONE_02","cop6GET_OUT_OF_CAR_MEGAPHONE_01","cop6GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7GET_OUT_OF_CAR_MEGAPHONE_02","cop7GET_OUT_OF_CAR_MEGAPHONE_01","cop7GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8GET_OUT_OF_CAR_MEGAPHONE_02","cop8GET_OUT_OF_CAR_MEGAPHONE_01","cop8GET_OUT_OF_CAR_MEGAPHONE_03"];
 _CopWillSay = (_CopCanSay select (round(random 2)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9GET_OUT_OF_CAR_MEGAPHONE_02","cop9GET_OUT_OF_CAR_MEGAPHONE_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10GET_OUT_OF_CAR_MEGAPHONE_02","cop10GET_OUT_OF_CAR_MEGAPHONE_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};
 
 
 
 if(_Voice == 1)then{
 _CopCanSay2 = ["PULL_OVER_01","PULL_OVER_02","PULL_OVER_03","PULL_OVER_WARNING_01","PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));
 };
 

if(_Voice == 2)then{
 _CopCanSay2 = ["Cop2PULL_OVER_01","Cop2PULL_OVER_02","Cop2PULL_OVER_03","Cop2PULL_OVER_WARNING_01","Cop2PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 3)then{
 _CopCanSay2 = ["cop3PULL_OVER_01","cop3PULL_OVER_02","cop3PULL_OVER_03","cop3PULL_OVER_WARNING_01","cop3PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 4)then{
 _CopCanSay2 = ["cop4PULL_OVER_01","cop4PULL_OVER_02","cop4PULL_OVER_03","cop4PULL_OVER_WARNING_01","cop4PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 5)then{
 _CopCanSay2 = ["cop5PULL_OVER_01","cop5PULL_OVER_02","cop5PULL_OVER_03","cop5PULL_OVER_WARNING_01","cop5PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 6)then{
 _CopCanSay2 = ["cop6PULL_OVER_01","cop6PULL_OVER_02","cop6PULL_OVER_WARNING_01","cop6PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 3)));

						};

if(_Voice == 7)then{
 _CopCanSay2 = ["cop7PULL_OVER_01","cop7PULL_OVER_02","cop7PULL_OVER_03","cop7PULL_OVER_WARNING_01","cop7PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 8)then{
 _CopCanSay2 = ["cop8PULL_OVER_01","cop8PULL_OVER_02","cop8PULL_OVER_03","cop8PULL_OVER_WARNING_01","cop8PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 9)then{
 _CopCanSay2 = ["cop9PULL_OVER_01","cop9PULL_OVER_02","cop9PULL_OVER_03","cop9PULL_OVER_WARNING_01","cop9PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};

if(_Voice == 10)then{
 _CopCanSay2 = ["cop10PULL_OVER_01","cop10PULL_OVER_02","cop10PULL_OVER_03","cop10PULL_OVER_WARNING_01","cop10PULL_OVER_WARNING_02"];
 _CopWillSay2 = (_CopCanSay2 select (round(random 4)));

						};
 
 
 
 _MySpeed2 = speed vehicle _Suspect;
 if!(_MySpeed2>15)then{_cop  say3D _CopWillSay;}else{_cop  say3D _CopWillSay2;};
 
 
 
_rNumber = random 5 + 5;
sleep _rNumber;
WhiteCopCarSay = false;
};

