WantedLevel = 0; //уровень розыска
WantedOps = 0; //уровень розыска специальной группы


	
[] execVM "stun\StunFIXsettings.sqf";

//** Параметры игрового мира
	ScoreAmbulance = 0;		//Скорая
	ScoreFireTruck = 0;		//Пожарная
	
	ScoreTaxi = 0;		//Пожарная
	
	ScorepOLICE = 0;		//Доступные очки на отправку полицейских сил за подозреваемым
	ScorepOLICEOps = 0;		//Доступные очки на отправку специальной группы за подозреваемым
	NotAlive = [];			//Убитые
	NotAliveNames = [];		// Убитые
	NotAliveCar = [];		//Уничтоженные машины
	NotAliveCarmarker = [];	//Маркера машин
	CarDestroyedFix = 0;	// Фикс
	AliveMedic = [];		//Кол-во медиков
	AliveFireFighter = [];	//Кол-во пожарных
	AliveTaxiGuys= [];	//Кол-во таксистов
//**

TaxiParking = [TaxiZone1,TaxiZone2,TaxiZone3];
TaxiParkingCROWDED = [];
TaxiGuysBUSY = [];
PrivateTaxi = [];
//TaxiGuysWORKnow = []; //везут уже кого-то
TaxiParkingMarkers = [];
TaxiParkingMarkersCROWDED = [];
TaxiSetMarkerActivated = false;
TaxiSetMarkerActivated2 = false;
WhoWillDrive = objNull;
TaxoMetrMoney = 0;
TaxiTeleport60 = true;


//**ФИКС для магазина
ImUsingShop = BoxDealer1;
CurrentPrice = 0;
IreadyToPay = false;
IreadyToSell = false;
IreadyToRepair = false;
CarSOLD = [];
//**

PhoneOpened = false;


//**ПАРАМЕТРЫ КОПОВ


 
//FunctionPoliceChase = compile preprocessFile "COPfile\FollowFast.sqf";
//call FunctionPoliceChase
[] execVM "COPfile\FollowFast.sqf";


//FunctionPoliceLastPos = compile preprocessFile "COPfile\LastPosition.sqf";
//call FunctionPoliceLastPos
[] execVM "COPfile\LastPosition.sqf";

//FunctionPoliceFirstContactSEARCH = compile preprocessFile "COPfile\FirstContactSEARCH.sqf";
//call FunctionPoliceFirstContactSEARCH
[] execVM "COPfile\FirstContactSEARCH.sqf";

//FunctionPoliceFirstContact = compile preprocessFile "COPfile\FirstContact.sqf";
//call FunctionPoliceFirstContact
[] execVM "COPfile\FirstContact.sqf";

//FunctionPoliceSecondContact = compile preprocessFile "COPfile\SecondContact.sqf";
//call FunctionPoliceSecondContact
[] execVM "COPfile\SecondContact.sqf";

	readyForActionStarted = false;  //Терпение копов
	RFAgo = false;					//Терпение копов
	player setVariable ["RFAgo", false, true];
	
	ISEEHIM = 0;					//Общее кол-во Вас видят
	WhoIsGoing = objNull;			//Кто идет на арест
	Player setVariable ["WhoIsGoing", objNull, true];
	SpeakFirstContactOFF =false;	// При обнаружении чтобы не болтали толпой
	CopGoingtoArrest = false;		//Идет ли кто-нибудь арестовывать подозреваемого
	OfficerDown = false;
	CivDown = false;
	LastPosGuarded = true;
	CopGroup = []; 					// регистрация полицейских груп.
	WhiteCopSay = false;
	WhiteCopSay2 = false;
	HeliSay = false;
	HeliSay2 = false;
	WhiteCopCarSay = false;

//**

//BotStun1 = [];
//BotStun2 = [];
//BotStun3 = [];
//BotDoIt = [];
StunnedpeopleFlashBang = [];
StunnedpeopleFlashBang2 = [];

SuperEffect = false;			//Эффект красно-синего экрана
ButtonON = "";					//Для драки
PressButton = false;			//Для драки



//**ПАРАМЕТРЫ ИГРОКА
WantedPeople = [player];
	


Playerisdead = false;		// Смерть главного игрока

Player setVariable ["readyForActionStarted", false, true];

Player setVariable ["PlayerIsWanted", true, true];// Статус розыска игрока
Player setVariable ["VariableISEEHIM", 0, true];
Player setVariable ["OpenFire", false, true];
Player setVariable ["RFAgo", false, true];
Player setVariable ["WhoIsGoing", objNull, true];
Player setVariable ["GaveUp", false, true];
Player setVariable ["FightBAN", false, true];
Player setVariable ["Fight", false, true];
Player setVariable ["PlayerFired", false, true];
Player setVariable ["PlayerFiredBan", false, true];
Player setVariable ["CopGoingtoArrest", false, true];

Player setVariable ["CopsKnowMe", [], true];
//**
	
	
	
	IhaveFUELCAN = false;
	IhaveMEDKIT = false;
	IhaveLOCKPICK = false;
	
	EmptyArray= [];
	

	
	GiveUpChance = true;		//Шанс поднять руки	
	GaveUp = false;				// Сдался

	OpenFire = false;			//Красный огонь
	Fight = false;				//В драке
	FightBAN = false;			//Бан драки
	
	Player setVariable ["FightBAN", false, true];

	
	PlayerFired = false;		//Игрок стрелял по копам

	
	PlayerFiredBan = false;		//Бан стрельбы

	
	Playerisdead2 = false;		//Нужно для управление камерой
	FlashBackON = true;			//Опция отвечает за флешбэки
	DammageFix = (damage player);//Для фикса здоровья

	Otravili = false;			//Отравление от газа НАЧАТЬ
	GasX = 0.5;					//Индекс газа
	StunMuch = 0;				//Выдержка на стун
	StunOverDose = 0;			//Болевой порог достигнут (передозировка) // Более болезненый стун
	stunEffectON = false;		//Эффект стана
	stunEffectON2 = false;		// эффект стана 2
	Alreadystunned = false;		// Уже застунен
	
	TiredToFight = 0;           //коэф усталости ;)
	
	YourCars = [];				//У вас есть ключи от этой машины
	
	//player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun\stun.sqf";[player] execVM "fireatwill.sqf";  [(_this select 0), (_this select 5)] execVM "stun\fired.sqf";}];
	//player addEventHandler ["handleDamage", {_this call compile preprocessfile "stun\sethit.sqf"}];	
//**



	

	Trouble = [];              // Массив для баланса стуна. Те кто на данный момент застунен *****/-////
	
	AllRegistratedBoys= [];
	AllRegistratedBoysWILLstun = [];
    AllRegistratedBoysOVERDOSE = [];
	RestrainedPeople = [];	 //Кто связан

//**Индикаторы
	Money= 0;
	Hunger = 100;
	Wanted = 0;
	BlackWaterWanted = 0;
//**

[] execVM "FNC_HUD.sqf";
//sleep random 1;
[] execVM "FunctionBattle.sqf";
//sleep random 1;
[] execVM "hunger.sqf";	
//sleep random 1;
[] execVM "DynMusic.sqf";
//sleep random 1; 
[] execVM "AmbulanceSquad.sqf";		
//sleep random 1;
[] execVM "FireTruckSquad.sqf";	

[] execVM "TaxiSquad.sqf";	

//sleep random 1;	
[] execVM "GunShop\AllWeaponsForSell.sqf";
[] execVM "GunShop\AllCarsForSell.sqf";
//sleep random 1;
[] execVM "actionList.sqf";		



	
[] execVM "CarAction\FarCar.sqf";	


//[] execVM "OnlineCHECK.sqf";

sleep 2;
///** Запустить скрипт заранее созданых персонажей!
{  
	if(side _x == Civilian)then
	{[_x] execVM "civ1\Alive.sqf"; };
	
	if(side _x == West)then
	{
	_Random = round((random 9)) + 1;
	//player globalchat format ["_x = %1", (name _x)];
    [_x,_Random] spawn FunctionPoliceFirstContactSEARCH; 
	};
	sleep 0.03;
} forEach allUnits;

sleep 3;
{  

	[_x] execVM "car1\Alive.sqf";
	sleep 0.1;
} forEach vehicles;

//**

//sleep 1;
//**Опустошить колонки


//[] execVM "SetFuelZero.sqf";	
//((position this) nearestObject 264942) setFuelCargo 0
//**

[] execVM "TaxiGuys\TaxiTeleport60.sqf";
{
[_x] execVM "TaxiGuys\CreateTaxiMarkers.sqf";	
sleep 0.3;
} forEach TaxiParking;