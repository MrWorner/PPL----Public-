WantedLevel = 0; //������� �������
WantedOps = 0; //������� ������� ����������� ������


	
[] execVM "stun\StunFIXsettings.sqf";

//** ��������� �������� ����
	ScoreAmbulance = 0;		//������
	ScoreFireTruck = 0;		//��������
	
	ScoreTaxi = 0;		//��������
	
	ScorepOLICE = 0;		//��������� ���� �� �������� ����������� ��� �� �������������
	ScorepOLICEOps = 0;		//��������� ���� �� �������� ����������� ������ �� �������������
	NotAlive = [];			//������
	NotAliveNames = [];		// ������
	NotAliveCar = [];		//������������ ������
	NotAliveCarmarker = [];	//������� �����
	CarDestroyedFix = 0;	// ����
	AliveMedic = [];		//���-�� �������
	AliveFireFighter = [];	//���-�� ��������
	AliveTaxiGuys= [];	//���-�� ���������
//**

TaxiParking = [TaxiZone1,TaxiZone2,TaxiZone3];
TaxiParkingCROWDED = [];
TaxiGuysBUSY = [];
PrivateTaxi = [];
//TaxiGuysWORKnow = []; //����� ��� ����-��
TaxiParkingMarkers = [];
TaxiParkingMarkersCROWDED = [];
TaxiSetMarkerActivated = false;
TaxiSetMarkerActivated2 = false;
WhoWillDrive = objNull;
TaxoMetrMoney = 0;
TaxiTeleport60 = true;


//**���� ��� ��������
ImUsingShop = BoxDealer1;
CurrentPrice = 0;
IreadyToPay = false;
IreadyToSell = false;
IreadyToRepair = false;
CarSOLD = [];
//**

PhoneOpened = false;


//**��������� �����


 
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

	readyForActionStarted = false;  //�������� �����
	RFAgo = false;					//�������� �����
	player setVariable ["RFAgo", false, true];
	
	ISEEHIM = 0;					//����� ���-�� ��� �����
	WhoIsGoing = objNull;			//��� ���� �� �����
	Player setVariable ["WhoIsGoing", objNull, true];
	SpeakFirstContactOFF =false;	// ��� ����������� ����� �� ������� ������
	CopGoingtoArrest = false;		//���� �� ���-������ ������������ ��������������
	OfficerDown = false;
	CivDown = false;
	LastPosGuarded = true;
	CopGroup = []; 					// ����������� ����������� ����.
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

SuperEffect = false;			//������ ������-������ ������
ButtonON = "";					//��� �����
PressButton = false;			//��� �����



//**��������� ������
WantedPeople = [player];
	


Playerisdead = false;		// ������ �������� ������

Player setVariable ["readyForActionStarted", false, true];

Player setVariable ["PlayerIsWanted", true, true];// ������ ������� ������
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
	

	
	GiveUpChance = true;		//���� ������� ����	
	GaveUp = false;				// ������

	OpenFire = false;			//������� �����
	Fight = false;				//� �����
	FightBAN = false;			//��� �����
	
	Player setVariable ["FightBAN", false, true];

	
	PlayerFired = false;		//����� ������� �� �����

	
	PlayerFiredBan = false;		//��� ��������

	
	Playerisdead2 = false;		//����� ��� ���������� �������
	FlashBackON = true;			//����� �������� �� ��������
	DammageFix = (damage player);//��� ����� ��������

	Otravili = false;			//���������� �� ���� ������
	GasX = 0.5;					//������ ����
	StunMuch = 0;				//�������� �� ����
	StunOverDose = 0;			//������� ����� ��������� (�������������) // ����� ���������� ����
	stunEffectON = false;		//������ �����
	stunEffectON2 = false;		// ������ ����� 2
	Alreadystunned = false;		// ��� ��������
	
	TiredToFight = 0;           //���� ��������� ;)
	
	YourCars = [];				//� ��� ���� ����� �� ���� ������
	
	//player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun\stun.sqf";[player] execVM "fireatwill.sqf";  [(_this select 0), (_this select 5)] execVM "stun\fired.sqf";}];
	//player addEventHandler ["handleDamage", {_this call compile preprocessfile "stun\sethit.sqf"}];	
//**



	

	Trouble = [];              // ������ ��� ������� �����. �� ��� �� ������ ������ �������� *****/-////
	
	AllRegistratedBoys= [];
	AllRegistratedBoysWILLstun = [];
    AllRegistratedBoysOVERDOSE = [];
	RestrainedPeople = [];	 //��� ������

//**����������
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
///** ��������� ������ ������� �������� ����������!
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
//**���������� �������


//[] execVM "SetFuelZero.sqf";	
//((position this) nearestObject 264942) setFuelCargo 0
//**

[] execVM "TaxiGuys\TaxiTeleport60.sqf";
{
[_x] execVM "TaxiGuys\CreateTaxiMarkers.sqf";	
sleep 0.3;
} forEach TaxiParking;