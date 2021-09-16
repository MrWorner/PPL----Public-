_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
sleep 5 + random 5;
 if!(alive _Suspect) exitwith{};
 _MySpeed = speed _Suspect;
if!((_MySpeed<19) and !((vehicle _Suspect) isKindOf "Car")  and !(_Suspect in RestrainedPeople)) exitwith{};
if!(WhiteCopSay)then{
WhiteCopSay = true;
_CopWillSay = "";
if(_Voice == 1)then{
 _CopCanSay = ["ARREST_PLAYER_01","ARREST_PLAYER_03","FIGHT_01","FIGHT_02","FIGHT_03","FIGHT_04","FIGHT_05","FIGHT_06","INTIMIDATE_01","INTIMIDATE_02","INTIMIDATE_03","INTIMIDATE_04","TARGET_01","TARGET_02","TARGET_03","TARGET_04","TARGET_05"];
 _CopWillSay = (_CopCanSay select (round(random 15)));
 };
 
if(_Voice == 2)then{
 _CopCanSay = ["Cop2ARREST_PLAYER_01","Cop2ARREST_PLAYER_02","Cop2ARREST_PLAYER_03","Cop2FIGHT_01","Cop2FIGHT_02","Cop2FIGHT_03","Cop2FIGHT_04","Cop2FIGHT_05","Cop2FIGHT_06","Cop2INTIMIDATE_01","Cop2INTIMIDATE_02","Cop2INTIMIDATE_03","Cop2TARGET_01","Cop2TARGET_02","Cop2TARGET_03","Cop2TARGET_04","Cop2TARGET_05","Cop2TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 17)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3ARREST_PLAYER_01","cop3ARREST_PLAYER_02","cop3ARREST_PLAYER_03","cop3FIGHT_01","cop3FIGHT_02","cop3FIGHT_03","cop3FIGHT_04","cop3FIGHT_05","cop3FIGHT_06","cop3INTIMIDATE_01","cop3INTIMIDATE_02","cop3INTIMIDATE_03","cop3INTIMIDATE_04","cop3INTIMIDATE_05","cop3TARGET_01","cop3TARGET_02","cop3TARGET_03","cop3TARGET_04","cop3TARGET_05","cop3TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4ARREST_PLAYER_01","cop4ARREST_PLAYER_02","cop4ARREST_PLAYER_03","cop4FIGHT_01","cop4FIGHT_02","cop4FIGHT_03","cop4FIGHT_04","cop4FIGHT_05","cop4FIGHT_06","cop4INTIMIDATE_01","cop4INTIMIDATE_02","cop4INTIMIDATE_03","cop4INTIMIDATE_04","cop4INTIMIDATE_05","cop4TARGET_01","cop4TARGET_02","cop4TARGET_03","cop4TARGET_04","cop4TARGET_05","cop4TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5ARREST_PLAYER_01","cop5ARREST_PLAYER_02","cop5ARREST_PLAYER_03","cop5FIGHT_01","cop5FIGHT_02","cop5FIGHT_03","cop5FIGHT_04","cop5FIGHT_05","cop5FIGHT_06","cop5INTIMIDATE_01","cop5INTIMIDATE_02","cop5INTIMIDATE_03","cop5INTIMIDATE_04","cop5INTIMIDATE_05","cop5TARGET_01","cop5TARGET_02","cop5TARGET_03","cop5TARGET_04","cop5TARGET_05","cop5TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6ARREST_PLAYER_01","cop6ARREST_PLAYER_02","cop6ARREST_PLAYER_03","cop6FIGHT_01","cop6FIGHT_02","cop6FIGHT_03","cop6FIGHT_04","cop6FIGHT_05","cop6FIGHT_06","cop6INTIMIDATE_01","cop6INTIMIDATE_02","cop6INTIMIDATE_03","cop6INTIMIDATE_04","cop6INTIMIDATE_05","cop6TARGET_01","cop6TARGET_02","cop6TARGET_03","cop6TARGET_04","cop6TARGET_05","cop6TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7ARREST_PLAYER_01","cop7ARREST_PLAYER_02","cop7ARREST_PLAYER_03","cop7FIGHT_01","cop7FIGHT_02","cop7FIGHT_03","cop7FIGHT_04","cop7FIGHT_05","cop7FIGHT_06","cop7INTIMIDATE_01","cop7INTIMIDATE_02","cop7INTIMIDATE_03","cop7INTIMIDATE_04","cop7INTIMIDATE_05","cop7TARGET_01","cop7TARGET_02","cop7TARGET_03","cop7TARGET_04","cop7TARGET_05","cop7TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8ARREST_PLAYER_01","cop8ARREST_PLAYER_02","cop8ARREST_PLAYER_03","cop8FIGHT_01","cop8FIGHT_02","cop8FIGHT_03","cop8FIGHT_04","cop8FIGHT_05","cop8FIGHT_06","cop8INTIMIDATE_01","cop8INTIMIDATE_02","cop8INTIMIDATE_03","cop8INTIMIDATE_04","cop8INTIMIDATE_05","cop8TARGET_01","cop8TARGET_02","cop8TARGET_03","cop8TARGET_04","cop8TARGET_05","cop8TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9ARREST_PLAYER_01","cop9ARREST_PLAYER_02","cop9ARREST_PLAYER_03","cop9FIGHT_01","cop9FIGHT_02","cop9FIGHT_03","cop9FIGHT_04","cop9FIGHT_05","cop9FIGHT_06","cop9INTIMIDATE_01","cop9INTIMIDATE_02","cop9INTIMIDATE_03","cop9INTIMIDATE_04","cop9INTIMIDATE_05","cop9TARGET_01","cop9TARGET_02","cop9TARGET_03","cop9TARGET_04","cop9TARGET_05","cop9TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10ARREST_PLAYER_01","cop10ARREST_PLAYER_02","cop10ARREST_PLAYER_03","cop10FIGHT_01","cop10FIGHT_02","cop10FIGHT_03","cop10FIGHT_04","cop10FIGHT_05","cop10FIGHT_06","cop10INTIMIDATE_01","cop10INTIMIDATE_02","cop10INTIMIDATE_03","cop10INTIMIDATE_04","cop10INTIMIDATE_05","cop10TARGET_01","cop10TARGET_02","cop10TARGET_03","cop10TARGET_04","cop10TARGET_05","cop10TARGET_06"];
 _CopWillSay = (_CopCanSay select (round(random 19)));

						};
 
 
 
 

_cop  say3D _CopWillSay;

_rNumber = random 5 + 3;
sleep _rNumber;

WhiteCopSay = false;
};