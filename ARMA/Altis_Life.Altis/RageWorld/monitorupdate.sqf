waitUntil {!(isNull (findDisplay 46))};
_cash = "";
_bank = "";
disableSerialization;
_rscLayer = "osefStatusBar2" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar2","PLAIN"];
_cash = [(player getvariable["cash",0])] call life_fnc_numberText;
_bank = [(player getvariable["bankacc",0])] call life_fnc_numberText;
((uiNamespace getVariable "osefStatusBar2")displayCtrl 1001)ctrlSetText format["Bargeld: %1 | Bankkonto: %2",_cash ,_bank];
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_count = {_x getvariable["onDuty", false]} count allPlayers;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["Nationalgarde: %1 | Zivilisten: %2 | Sanitäter: %3 | AAC: %4", west countSide allPlayers, (civilian countSide allPlayers) - _count , independent countSide allPlayers, _count];
