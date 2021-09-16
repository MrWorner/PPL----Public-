sleep 0.1;
_ok = createdialog "TaxiDialog";
TaxiSetMarkerActivated = true;
while {TaxiSetMarkerActivated}do
{
onmapsingleclick "Map_pos = _pos; ""YourTaxiMarker"" setmarkerpos _pos"; TaxiZakaz setpos getpos _pos;

};
//WaitUntil {! TaxiSetMarkerActivated};
onmapsingleclick "";
//"YourTaxiMarker" setmarkerpos [0,0,0];

