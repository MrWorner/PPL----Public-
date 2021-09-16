
//FUNC_DomoveToTressPasser=
//{
private["_SUBJECT", "_Enemy", "_Go"];
_SUBJECT = _this select 0;
_Enemy = _this select 1;
_Go = 0;

_SUBJECT dowatch _Enemy;
while{( !(_Enemy in WantedPeopleByBlackWater)and(alive _Enemy)and(alive _SUBJECT)and(_Enemy in TresspasserPeople) )}do
		{ 
			if((_SUBJECT distance _Enemy) <5)then
			{   
					dostop _SUBJECT;; //hint "stop";	
			}
			else
			{  
				if(_Go >= 6)then
				{ 
				_SUBJECT domove getpos _Enemy; _Go = 0;
				};
			};
		
		sleep 0.5;
		_Go = _Go +1;
		};
	//};