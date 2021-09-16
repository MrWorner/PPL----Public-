_shooter	= _this select 0;

 _DispachCanSay = ["AdthPercMstpSlowWrflDnon_r09","AdthPercMrunSlowWrflDf_A4short","AdthPercMstpSnonWnonDnon_binocular","AdthPercMstpSrasWrflDb_8_forgoten"];
 _DispachWillSay = (_DispachCanSay select (round(random 3)));
 Playerisdead = true;
  _DispachCanSay2 = ["Effect14","Effect9","Effect1"];
 _DispachWillSay2= (_DispachCanSay2 select (round(random 2)));
 	Trouble = Trouble + [player];
 player setdammage 0.9;
 player setcaptive false;
player enableSimulation true;
1 fadeSound 0;
 titleText["", "WHITE IN", 1];
 [] execVM "effect1End.sqf";
 
 if!((vehicle player) isKindOf "Car") then {player switchmove _DispachWillSay; }
 else
 {player switchmove "KIA_Landrover_Cargo02"; (vehicle player) lock true};
 
playmusic _DispachWillSay2;
setacctime 0.1;
sleep 0.8;
setacctime 0.2;
 titleText["", "BLACK OUT", 1.0];
 "colorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false; 
sleep 1.5;

_da = "PatientNo" + format ["%1", random 999 ];
_marker = createMarker [_da, position _shooter ];
_marker setMarkerType "HW_Murder";


player enableSimulation false;
 if((vehicle player) isKindOf "Car") then {player switchmove "KIA_Landrover_Cargo02"; };
 titleText["", "BLACK IN", 0.1];
player exec "camera.sqs";
	
Playerisdead2 = true;
 sleep 0.2;
setacctime 0.0001;
//["AdthPercMstpSlowWrflDnon_r09","AdthPercMrunSlowWrflDf_A4short","AdthPercMstpSnonWnonDnon_binocular","AdthPercMstpSrasWrflDb_8_forgoten"]