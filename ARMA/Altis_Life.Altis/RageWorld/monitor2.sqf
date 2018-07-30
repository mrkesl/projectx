waitUntil {!(isNull (findDisplay 46))};
_cash = "";
_bank = "";
[] spawn {
 sleep 5;
 disableSerialization;
  _rscLayer = "osefStatusBar2" call BIS_fnc_rscLayer;
 while {true} do {
  sleep 10;
  _count = 0;
  {
   if (_x getvariable["onDuty", false]) then {
    _count = _count + 1;
   };
  } foreach playableunits;
  _rscLayer cutRsc["osefStatusBar2","PLAIN"];
  _cash = [(player getvariable["cash",0])] call life_fnc_numberText;
  _bank = [(player getvariable["bankacc",0])] call life_fnc_numberText;
  ((uiNamespace getVariable "osefStatusBar2")displayCtrl 1001)ctrlSetText format["Bargeld: %1 | Bankkonto: %2",_cash ,_bank];
 };
};
//Fix by Creedcoder
