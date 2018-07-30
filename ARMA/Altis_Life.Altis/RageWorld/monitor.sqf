waitUntil {!(isNull (findDisplay 46))};
systemChat format["Willkommen Bei Libra-Gaming.eu"];
[] spawn {
 sleep 5;
 disableSerialization;
 _rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
 while {true} do {
  sleep 10;
  _count = {_x getvariable["onDuty", false]} count allPlayers;
  _rscLayer cutRsc["osefStatusBar","PLAIN"];
  ((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["Nationalgarde: %1 | Zivilisten: %2 | Sanitäter: %3 | AAC: %4", west countSide allPlayers, (civilian countSide allPlayers) - _count , independent countSide allPlayers, _count];
 };
};
//Fix by Creedcoder
