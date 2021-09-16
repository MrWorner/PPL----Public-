//func_PoliceTestHUD.SQF
private ["_SUBJECT","_this","_GROUP"];
_SUBJECT = player;
_GROUP = group _SUBJECT;


while{(alive _SUBJECT)}do{
sleep 0.1;
hintSilent format 
[
"-***-POLICE TEST HUD-***-
\nGROUP
\%1
\%2
\%3
\ninDanger = %5
\ninDangerTargetPerson = %6
\nSpeakBan = %9
\nSayHello = %10
\nGetIn = %11
\nShootDistance = %12
\nDoMovePos = %13
\nImGoingToArrest = %7
\nImGoingToArrestPERSON = %8
\nImChasing = %4
"
,

"", //1
"",//2	_GROUP getVariable "CurrentSuspect"
"",//3	_GROUP getVariable "WhatGroupIsDoing"

_SUBJECT getVariable "ImChasing",//4
_SUBJECT getVariable "inDanger",//5
_SUBJECT getVariable "inDangerTargetPerson",//6
_SUBJECT getVariable "ImGoingToArrest",//7
_SUBJECT getVariable "ImGoingToArrestPERSON",//8
_SUBJECT getVariable "SpeakBan",//9
_SUBJECT getVariable "SayHello",//10
_SUBJECT getVariable "GetIn",//11
_SUBJECT getVariable "ShootDistance",//12
_SUBJECT getVariable "DoMovePos"//13
];

};