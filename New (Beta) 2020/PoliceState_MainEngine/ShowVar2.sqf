//0-9 SECOND
private["_sleepTime","_Looping","_Looping_sleepTime"];

_sleepTime = 0.1;
_Looping = true;
_Looping_sleepTime = 1;

//if(true)exitwith{hintc "ShowVar2";};
if(true)exitwith{};

player groupchat "|=>>> SHOWVAR2 ACTIVATED";
sleep _sleepTime;
//player groupchat format ["|(WW)=>>> Array_CopsSide: %1", Array_CopsSide];





if(ShowVar2)then{ShowVar2 = false}else{ShowVar2 = true};
player groupchat "|(WW)=>>> -----------------------------";
while{(_Looping && ShowVar2)}do
{
player groupchat format ["|(WW2)=>>> Me PoliceChaseInProgress: %1", (Me getvariable "PoliceChaseInProgress")];
sleep _Looping_sleepTime;
player groupchat "|(WW2)=>>> -----------------------------LOOP";


}


//HINT FORMAT [" %1 ", ];
