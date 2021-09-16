_cop = _this select 0;
_Voice = _this select 1;
_Suspect = _this select 2;
_CopWillSay = "";
_DispachWillSay = "";


 _DispachCanSay = ["b1_OrderedRestrain_male_1","b1_OrderedRestrain_male_2","b1_OrderedRestrain_male_3","b2_OrderedRestrain_male_1","b2_OrderedRestrain_male_2","b2_OrderedRestrain_male_3","r1_OrderedRestrain_male_1","r1_OrderedRestrain_male_2","r1_OrderedRestrain_male_3","r2_OrderedRestrain_male_1","r2_OrderedRestrain_male_2","r2_OrderedRestrain_male_3"    ,"b1_OrderedRestrain_suspect_1","b1_OrderedRestrain_suspect_2","r1_OrderedRestrain_suspect_1","r1_OrderedRestrain_suspect_2","r2_OrderedRestrain_suspect_1","r2_OrderedRestrain_suspect_2","b2_OrderedRestrain_suspect_1","b2_OrderedRestrain_suspect_2"];               
 _DispachWillSay = (_DispachCanSay select (round(random 19)));

sleep 0.1;
if((_Suspect getVariable "CopGoingtoArrest")and!(_Suspect in RestrainedPeople))then{_cop say _DispachWillSay;};
_z = 6;
while{(alive _cop)and(_Suspect getVariable "CopGoingtoArrest")and!(_Suspect in RestrainedPeople)and(alive _Suspect)}do
{
 if(_z > 1) then {_cop domove getpos _Suspect; _z = 3;};
 
 sleep 1;
 _z = _z - 0.5;
  if(((vehicle _cop) isKindOf "Car"))exitwith{_Suspect setVariable ["CopGoingtoArrest", false, true];};
 
if((_cop distance _Suspect) < 3)then
   {

   
if((_Suspect getVariable "Fight")or!(_Suspect getVariable "GaveUp")and!(_cop in Trouble)and!(_cop in RestrainedPeople))exitwith{_Suspect setVariable ["CopGoingtoArrest", false, true];};
   RestrainedPeople = RestrainedPeople + [_Suspect]; 

_cop attachto [_Suspect,[0,-0.9,0]];
_cop setdir 0;
_Suspect switchmove "civilsitting";
removeallweapons _Suspect;
_cop switchmove "AinvPknlMstpSnonWrflDnon_medic";
sleep 1;
   playsound "cuffed";
sleep 2;
_cop switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
sleep 1;
_cop switchmove "asd";
detach _cop;
_Suspect setcaptive true;
_Suspect setVariable ["CopGoingtoArrest", false, true]; 
_Suspect setVariable ["GaveUp", false, true];
_Suspect setVariable ["PlayerisWANTED", false, true];
WantedPeople = WantedPeople - [_Suspect];

if(_Voice == 1)then{
 _CopCanSay = ["ARREST_PED_02","ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));
 };
 
if(_Voice == 2)then{
 _CopCanSay = ["Cop2ARREST_PED_02","Cop2ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 3)then{
 _CopCanSay = ["cop3ARREST_PED_02","cop3ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 4)then{
 _CopCanSay = ["cop4ARREST_PED_02","cop4ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 5)then{
 _CopCanSay = ["cop5ARREST_PED_02","cop5ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 6)then{
 _CopCanSay = ["Cop6ARREST_PLAYER_02","Cop6ARREST_PLAYER_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 7)then{
 _CopCanSay = ["cop7ARREST_PED_02","cop7ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 8)then{
 _CopCanSay = ["cop8ARREST_PED_02","cop8ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 9)then{
 _CopCanSay = ["cop9ARREST_PED_02","cop9ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};

if(_Voice == 10)then{
 _CopCanSay = ["cop10ARREST_PED_02","cop10ARREST_PED_01"];
 _CopWillSay = (_CopCanSay select (round(random 1)));

						};


 _cop  say3D _CopWillSay;
  
   };




};

_Suspect setVariable ["CopGoingtoArrest", false, true];