#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units","_text","_data"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = getControl(2400,2407);
lbClear _list2; //Purge the list
/*
_crimes = [["Fahren ohne Licht","350","1"],["Fahren ohne Führerschein","1500","2"],["Überhöhte Geschwindigkeit","2500","3"],["Rücksichtsloses fahren","3500","4"],["Illegales Fahrzeug","10000","5"],["Überfahren mit Todesfolge","5000","6"],["Mordversuch","10000","7"],["Rape","5000","261"]];

{
	_list2 lbAdd format["%1 - $%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;
*/

_text = "Fahren ohne Führerschein $1.500";
_data = "1";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Versuchter Diebstahl e.Zivilfahrzeugs $12.500";
_data = "2";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Diebstahl/Führen e.fremden Zivilfahrzeugs $25.000";
_data = "3";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren ohne Licht $1.000";
_data = "4";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überhöhte Geschwindigkeit 10-30km/h zu schnell $10.000";
_data = "5";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überhöhte Geschwindigkeit > 30km/h zu schnell $25.000";
_data = "6";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Versuchter Diebstahl e.Staatsfahrzeugs $25.000";
_data = "7";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Diebstahl von Staatsfahrzeugen $40.000";
_data = "8";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];


_text = "Landen in einer Flugverbotszone $100.000";
_data = "9";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren von illegalen Fahrzeugen $70.000";
_data = "10";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Unfallverursacher/Fahrerflucht nach Unfall $15.000";
_data = "11";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahrerflucht vor der Nationalgarde $30.000";
_data = "12";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überfahren eines anderen Spielers $15.000";
_data = "13";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Illegale Strassensperren $10.000";
_data = "14";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Widerstand gegen die Staatsgewalt $50.000";
_data = "15";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Nicht befolgen e.pol.Anordnung $5.000";
_data = "16";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beamtenbeleidigung $15.000";
_data = "17";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Belästigung eines Gardisten $8000";
_data = "18";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Betreten der pol.Sperrzone $30.000";
_data = "19";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Töten eines Gardisten $150.000";
_data = "20";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beschuss auf Nationalgarde/Sanitäter/Eigentum $100.000";
_data = "21";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Zerstörung von Staatseigentum $75.000";
_data = "22";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogendelikte $50.000";
_data = "23";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Waffenbesitz ohne Lizenz $20.000";
_data = "24";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Mit gez.Waffe durch Stadt $10.000";
_data = "25";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Besitz einer verbotenen Waffe $75.000";
_data = "26";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Schusswaffengebrauch innerhalb Städte $50.000";
_data = "27";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Geiselnahme $50.000";
_data = "28";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überfall auf Personen/Fahrzeuge $50.000";
_data = "29";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Bankraub $200.000";
_data = "30";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Mord $100.000";
_data = "31";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Aufstand $35.000";
_data = "32";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Angriff durch Rebellen $55.000";
_data = "33";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Angriff/Belagerung von Hauptstädten $55.000";
_data = "34";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Vers.Landung in einer Flugverbotszone $15.000";
_data = "35";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fliegen/Schweben unterhalb 150m Ü.Stadt $10.000";
_data = "36";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Ausbruch aus dem Gefängnis $50.000";
_data = "37";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fliegen ohne Fluglizenz $12.000";
_data = "38";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Dauerhaft störendes Hupen $10.000";
_data = "39";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Handel mit exotischen Gütern $55.000";
_data = "40";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Strafe $1000";
_data = "41";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Strafe $10000";
_data = "42";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Strafe $100000";
_data = "43";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Strafe $1000000 (z.B. trolling)";
_data = "44";
_list2 lbAdd format["(%2) %1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];


ctrlSetText[2404,"Stelle Verbindung her..."];

if((player getVariable ["cop_level", 0]) < 3 && (player getVariable ["admin_level", 0]) == 0) then
{
	ctrlShow[2405,false];
};

[player] remoteExec ["life_fnc_wantedFetch", 2, false];
