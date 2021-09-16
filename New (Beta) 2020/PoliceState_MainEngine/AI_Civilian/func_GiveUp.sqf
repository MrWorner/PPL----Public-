//func_GiveUp.sqf
private["_susp","_this","_danger"];
_susp = _this;
_danger = false;
if(_susp getVariable "GivingUp")exitwith{};
//if(player == _susp)exitwith{};

_susp call func_DropWeapons;
removeAllweapons _susp;
_susp setVariable ["GivingUp",true,true];
if(_susp getVariable "Dangerous")then{_danger = true; _susp setVariable ["Dangerous",false,true];};
//------_susp setVariable ["OutOfControl",false,true];
_susp setVariable ["InFighting",true,true];		
_susp disableAI "MOVE";
_susp disableAI "ANIM";
_susp setUnitPos "Up";
_susp disableAI "FSM";


waitUntil {sleep 1; !(_susp getVariable "Stunned") };
[_susp] allowGetIn false;
while{!( vehicle _susp isKindOf "Man")}do
{
	sleep 1;
	if(speed (vehicle _susp) < 15 )then{_susp action ["getOut", vehicle _susp];};
};	
//waitUntil {sleep 1; ( vehicle _susp isKindOf "Man") };


_susp action ["Surrender", _susp];

_susp globalchat format ["SUSPECT says [I GIVE UP!] %1",name _susp];
//hint format ["SUSPECT says [I GIVE UP!] %1",name _susp];
//if((random 100)<60)then
//{
if((random 100)< (35))then{sleep (random 5);[_susp,"GiveUp"] call func_SuspSAY;};

//};
[_susp,_danger] spawn func_Global_Arrest;
//(_Susp getVariable "MyMarkerName") setMarkerType "HW_Important1";