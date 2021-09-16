_DriverTaxi = _this select 0;
_ok = createdialog "TaxiDialog2";
TaxiSetMarkerActivated2 = true;

WhoWillDrive = _DriverTaxi;



while {TaxiSetMarkerActivated2}do
{
onmapsingleclick "Map_pos = _pos; ""YourTaxiMarker2"" setmarkerpos _pos"; TaxiZakaz2 setpos getmarkerpos "YourTaxiMarker2";

};
//WaitUntil {! TaxiSetMarkerActivated};
onmapsingleclick "";
//"YourTaxiMarker2" setmarkerpos [0,0,0];