//func_position_Difference_btw2
private["_this","_Man1","_Man2","_NS","_WE","_TotalDifference","_RUN1","_RUN2","_RUNoption1or2"];

_Man1 = _this select 0;
_Man2 = _this select 1;
_RUNoptionENABLED = false;

_Test1 = "WEST";
_WE = true;
//WEST - TRUE
//EAST +

_Test2 = "SOUTH";
_NS = true;
//NORTH - TRUE
//SOUTH +

_RUN1 = 200 + (RANDOM 100);
_RUN2 = 200 + (RANDOM 100);




_TotalDifference = [(position _Man1 select 0) - (position _Man2 select 0), (position _Man1 select 1) - (position _Man2 select 1)];

if(_TotalDifference select 0 < 0)then{_WE = false; _Test1 = "EAST"; _RUN1 = (-200) - (RANDOM 100); };
if(_TotalDifference select 1 < 0)then{_NS = false; _Test2 = "NORTH"; _RUN2 = (-200) - (RANDOM 100);};


if((RANDOM 100) > 50)then
{

	if((RANDOM 100) > 50)then
	{
		_RUN1 = 0;
	}
	else
	{
		_RUN2 = 0;
	};
};

//hintc format ["%1       %2      %3", (_Test2 + " " + _Test1), _TotalDifference select 0, _TotalDifference select 1];



//ME<_---
//WEST -
//EAST +

//ME<_---
//SOUTH -
//NORTH +

_SUBJECT setspeedMode "full";
_SUBJECT domove [(getpos _x select 0)+(_RUN1),(getpos _x select 1)+(_RUN2)];

