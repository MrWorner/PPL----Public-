_Victim = _this select 0;

_Victim switchmove "civillying01";
StunnedPerson = player;
RestrainedPeople = RestrainedPeople + [_Victim];

while{((player distance _Victim) < 300)}do{sleep (5 + random 5);};
_Victim switchmove "civillying01111";
RestrainedPeople = RestrainedPeople - [_Victim];