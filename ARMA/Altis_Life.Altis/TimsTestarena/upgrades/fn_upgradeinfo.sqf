private ["_display", "_vehicle", "_vehupinfos", "_counter"];
 
disableSerialization;

_counter = lbCurSel (50002);
_vehicle = found_vehicels select _counter;

_display = findDisplay 3494;
_vehupinfos = _display displayCtrl 50003;
lbClear _vehupinfos;

if ( _vehicle isKindOf "C_Van_01_transport_F") then{
_vehupinfos lbAdd"Kofferraumupgrade: 90 ==> 120.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Upgrade"];
_vehupinfos lbAdd"Preis: 20000€.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Price"];
};
if ( _vehicle isKindOf "C_Offroad_01_F") then{
_vehupinfos lbAdd"Kofferraumupgrade: 60 ==> 80.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Upgrade"];
_vehupinfos lbAdd"Preis: 15000€.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Price"];
};
if ( _vehicle isKindOf "I_Truck_02_transport_F") then{
_vehupinfos lbAdd"Kofferraumupgrade: 180 ==> 200.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Upgrade"];
_vehupinfos lbAdd"Preis: 25000€.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Price"];
};
if ( _vehicle isKindOf "O_Truck_03_transport_F") then{
_vehupinfos lbAdd"Kofferraumupgrade: 300 ==> 320.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Upgrade"];
_vehupinfos lbAdd"Preis: 30000€.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"Price"];
};

_vehupinfos lbAdd"Weitere Upgrades sind in Arbeit.";
_vehupinfos lbSetData[(lbSize _vehupinfos)-1,"None"];
_vehupinfos lbSetCurSel 0;

//hint format["Vehicle: %1", _vehicle];