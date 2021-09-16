//func_SimpleHUD.SQF

hintSilent format 
[
"-***-POLICE-***-
\nTotal = %1/%3
\nKIA = %2
\nFriendly fire = %11
\nPolice chase = %23
\nRisk Level = %25
\nAvailable points = %32
\nRisk Level Score = %26/%27
\n\n-***-SUSPECTS-***-
\nTotal = %4/%5
\nKIA = %6
\nArrested = %7
\nFriendly fire = %12
\n\n-***-BLACK WATER-***-
\nTotal = %19/%21
\nKIA = %20
\nFriendly fire = %22
\nBW chase = %24
\n\n-***-CIVILIANS-***-
\nTotal = %8/%9
\nKIA = %10
\nMedic groups = %13
\nAlive medics = %28/%29
\nMorgue work= %14/%15
\nFireman groups = %16
\nFire work= %17/%18
\nAlive firefighters = %30/%31
"
,
(Count_TotalCops - Count_KilledCops),Count_KilledCops,Count_TotalCops,
(count Array_SuspectSide), Count_TotalSuspects, Count_KilledSuspects,  Count_TotalArrested,
(Count_TotalCivs - Count_KilledCivs), Count_TotalCivs, 
Count_KilledCivs,Count_FriendlyFireCops,Count_FriendlySuspects, 
count MedicGroups, Medic_TOTAL_WorkDoneCount, Count_TOTAL_DEAD_BODIES,
count FirefighterGroups,Firefighter_TOTAL_WorkDoneCount, Count_TOTAL_DESTROYED_CARS,
(Count_TotalBW - Count_KilledBW),Count_KilledBW,Count_TotalBW,Count_FriendlyBW,
count Array_SuspectsInChase,count Array_BW_SuspectsInChase
,POLICE_RISK_LEVEL //25
,POLICE_RISK_LEVEL_SCORE,POLICE_REQ_SCORE_ToLevelUP, //26 27
(Count_TotalMedics - Count_KilledMedics),//28
Count_TotalMedics,//29
(Count_TotalFirefighters - Count_KilledFirefighters),//30
Count_TotalFirefighters,//31
POLICE_AVAILABLE_SCORE//32
];