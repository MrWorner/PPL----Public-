//func_Step1_PoliceWave_ChooseRiskLevelArmy

private["_MarkerPosition","_formula","_this","_ChosenPoliceWaveArray"];

//RISK LEVELS:
//1: Patrol cars
//	L	Основа: Обычный полицейский транспорт: от патрульных мотоциклов до легких автомобилей. Два копа в каждой машине.
//		L	Бесплатный бонус: Внедорожник.
//			L	Вертолет: ---
//2: Patrol cars with more crew
//	L	Основа: Обычный полицейский транспорт + внедороники и мини-вэны. Полностью забиты полицейскими.
//		L	Бесплатный бонус: Мини-вэн.
//			L	Вертолет: Полицейский вертолет без доп экипажа (невооружен).
//3: SWAT, **Police helicopter**
//	L	Основа: Обычный полицейский транспорт, внедороники и мини-вэны + SWAT Бронетранспорт (не имеющий вооружение). 
//		L	Бесплатный бонус: SWAT Бронетранспорт (с вооружением).
//			L	Вертолет: SWAT вертолет с доп экипажа (вооружен пулеметом).
//4: Heavy Response Team or FBI, HRT APC, **HRT heli**
//	L	Основа: HRT транспорт (с вооружением).
//		L	Бесплатный бонус: RT Бронетранспорт (с более тяжелым вооружением).
//			L	Вертолет: HRT вертолет с доп экипажа (вооружен пулеметом).
//5: Delta Force, HRT APC, **Super Cobra**
//	L	Основа: хаммера и грузовики с пулеметами, отряды с гранатометами,.
//		L	Бесплатный бонус: RT Бронетранспорт (с более тяжелым вооружением).
//			L	Вертолет:  Delta Force боевой вертолет.
//6: Military special force (OMEGA), Deadly APC, **Apache**
//	L	Основа: OMEGA бронетранспорт (с вооружением). Полностью забиты OMEGA.
//		L	Бесплатный бонус: OMEGA Бронетранспорт (с более тяжелы



_MarkerPosition = getMarkerPos (_this select 0);
_ChosenPoliceWaveArray = _this select 1;
	
	

if(POLICE_BONUS_STAGE_Num != POLICE_RISK_LEVEL)then
{
	POLICE_BONUS_STAGE_Num = POLICE_RISK_LEVEL;
	[[0,0,1000],(((_ChosenPoliceWaveArray select 0) select 0) select (POLICE_RISK_LEVEL - 1))] spawn func_Step3_PoliceWave_Spawn_HELI;
	[_MarkerPosition,(((_ChosenPoliceWaveArray select 0) select 1) select (POLICE_RISK_LEVEL - 1))] spawn func_Step3_PoliceWave_Spawn_BONUS;
};	
	
switch (POLICE_RISK_LEVEL) do {
    case 0: 
	{ 
		//-----
	};    
	case 1: //1: PATROL
	{ 
	
		[_MarkerPosition,_ChosenPoliceWaveArray select 1] spawn func_Step3_PoliceWave_Spawn;
	};    
	case 2: //2: MORE PATROL COPS
	{ 
		
		[_MarkerPosition,_ChosenPoliceWaveArray select 2] spawn func_Step3_PoliceWave_Spawn;
	};    
	case 3: //3: SWAT
	{ 
		[_MarkerPosition,_ChosenPoliceWaveArray select 3] spawn func_Step3_PoliceWave_Spawn;
	};    
	case 4: //4: FBI (HRT)
	{ 
		[_MarkerPosition,_ChosenPoliceWaveArray select 4] spawn func_Step3_PoliceWave_Spawn;
	};    
	case 5: //5: DELTA
	{ 
		[_MarkerPosition,_ChosenPoliceWaveArray select 5] spawn func_Step3_PoliceWave_Spawn;
	};    
	case 6: //6: OMEGA
	{ 
		[_MarkerPosition,_ChosenPoliceWaveArray select 6] spawn func_Step3_PoliceWave_Spawn;
	};    
    default
	{ 
		[_MarkerPosition,_ChosenPoliceWaveArray select 7] spawn func_Step3_PoliceWave_Spawn;
	};
};