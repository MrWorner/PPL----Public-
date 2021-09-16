_Man = _this select 0;
_BruteHere = ["Otravlenie1","Otravlenie2","Otravlenie3","Otravlenie4","Otravlenie5","GasOtravlenieFinal"];
_BruteSay = (_BruteHere select (round(random 5)));
sleep 6;
_Man  say3D _BruteSay;
