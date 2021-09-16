//func_UseGrenadeLauncher.sqf
private["_SUBJECT","_Suspect","_this","_pWeap","_count","_GrenadeLauncher", "_result"];

_SUBJECT = _this;

_result = true;
_pWeap = primaryWeapon _SUBJECT;
if(SHOWTMessageLVL2)then{player globalchat format ["|---func_UseGrenadeLauncher: LOADED!", player];};// MESSAGE LVL2
switch (_pWeap) do 
	{
					
		case "M79_EP1": 
		{  
			_GrenadeLauncher = "M79_EP1";
		};
		
						
		case "M32_EP1": 
		{  
			_GrenadeLauncher = "M32_EP1";
		};
		
						
		case "MK13_EP1": 
		{  
			_GrenadeLauncher = "MK13_EP1";
		};

		default 
		{ 
		hintc format ["default !func_UseGrenadeLauncher.SQF! _pWeap = %1", _pWeap];
		_GrenadeLauncher = "";
		};
	};

	
_count = _SUBJECT ammo _GrenadeLauncher;
while{(alive _Subject) and (count (_Subject getvariable "ImChasing") > 0) and (_count>0)}do
{

	if(_SUBJECT getvariable "inDanger")then
	{

		if(random 100 < 10)then
		{
			while{((_SUBJECT ammo _GrenadeLauncher) > 1)}do
			{
				dostop _SUBJECT;
				_SUBJECT fire _GrenadeLauncher;
				sleep 0.1;
				//hintc "FIRE 2";
			};
		};
		dostop _SUBJECT;
		_SUBJECT fire _GrenadeLauncher;
		//hint "FIRE 1";
	
	}
	else
	{

		if( ((random 100) - (count (_Subject getvariable "ImChasing"))) < 10 )then
		{
			 if!(((_Subject getvariable "ImChasing") select 0) getVariable "GivingUp")then
			 {
				dostop _SUBJECT;
				_SUBJECT fire _GrenadeLauncher;
					
			 };			
		};	
	};
	
	_count = _SUBJECT ammo _GrenadeLauncher;
	if(_count == 0)then
	{
		sleep 3;
		_count = _SUBJECT ammo _GrenadeLauncher;
	}
	else
	{
		sleep 2;
	};

	
		
};

//hintc "EXIT";






//player globalchat "m79!!!";