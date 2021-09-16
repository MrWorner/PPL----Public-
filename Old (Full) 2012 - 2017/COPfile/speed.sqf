_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
_CopWillSay = "";

sleep 5 + random 5;
 if!(alive _Suspect) exitwith{};
_MySpeed = speed _Suspect;
if!((_MySpeed>19) and !((vehicle _Suspect) isKindOf "Car") and !(_Suspect in RestrainedPeople)) exitwith{};
if!(WhiteCopSay)then{
WhiteCopSay = true;

if(_Voice == 1)then{
 _CopCanSay = ["CHASE_SOLO_01","CHASE_SOLO_02","CHASE_SOLO_03","CHASE_SOLO_04","CHASE_SOLO_05","CHASE_SOLO_06","CHASE_SOLO_07","CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));
  };
  
  
if(_Voice == 2)then{
 _CopCanSay = ["Cop2CHASE_SOLO_01","Cop2CHASE_SOLO_02","Cop2CHASE_SOLO_03","Cop2CHASE_SOLO_04","Cop2CHASE_SOLO_05","Cop2CHASE_SOLO_06","Cop2CHASE_SOLO_07","Cop2CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3CHASE_SOLO_01","cop3CHASE_SOLO_02","cop3CHASE_SOLO_03","cop3CHASE_SOLO_04","cop3CHASE_SOLO_05","cop3CHASE_SOLO_06","cop3CHASE_SOLO_07","cop3CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4CHASE_SOLO_01","cop4CHASE_SOLO_02","cop4CHASE_SOLO_03","cop4CHASE_SOLO_04","cop4CHASE_SOLO_05","cop4CHASE_SOLO_06","cop4CHASE_SOLO_07","cop4CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5CHASE_SOLO_01","cop5CHASE_SOLO_02","cop5CHASE_SOLO_03","cop5CHASE_SOLO_04","cop5CHASE_SOLO_05","cop5CHASE_SOLO_06","cop5CHASE_SOLO_07","cop5CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["cop6CHASE_SOLO_01","cop6CHASE_SOLO_02","cop6CHASE_SOLO_03","cop6CHASE_SOLO_04","cop6CHASE_SOLO_05","cop6CHASE_SOLO_06","cop6CHASE_SOLO_07","cop6CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7CHASE_SOLO_01","cop7CHASE_SOLO_02","cop7CHASE_SOLO_03","cop7CHASE_SOLO_04","cop7CHASE_SOLO_05","cop7CHASE_SOLO_06","cop7CHASE_SOLO_07","cop7CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8CHASE_SOLO_01","cop8CHASE_SOLO_02","cop8CHASE_SOLO_03","cop8CHASE_SOLO_04","cop8CHASE_SOLO_05","cop8CHASE_SOLO_06","cop8CHASE_SOLO_07","cop8CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9CHASE_SOLO_01","cop9CHASE_SOLO_02","cop9CHASE_SOLO_03","cop9CHASE_SOLO_04","cop9CHASE_SOLO_05","cop9CHASE_SOLO_06","cop9CHASE_SOLO_07","cop9CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10CHASE_SOLO_01","cop10CHASE_SOLO_02","cop10CHASE_SOLO_03","cop10CHASE_SOLO_04","cop10CHASE_SOLO_05","cop10CHASE_SOLO_06","cop10CHASE_SOLO_07","cop10CHASE_SOLO_08"];
 _CopWillSay = (_CopCanSay select (round(random 7)));

						};
  
  
  
  
  
  
  
  
  
  

  _cop  say3D _CopWillSay;

_rNumber = random 5 + 5;
sleep _rNumber;

WhiteCopSay = false;
};