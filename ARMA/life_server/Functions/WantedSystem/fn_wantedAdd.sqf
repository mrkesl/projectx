/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	Edit: Creedcoder

	Description:
	Adds or appends a unit to the wanted list.
*/
params [
	["_uid", "", [""]],
	["_name", "", [""]],
	["_type", "", [""]],
	["_customBounty", -1, [0]]
];
private["_index","_data","_crimes","_val","_pastCrimes","_query","_queryResult"];
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

switch(_type) do
{
	case "187V": {_type = ["Überfahren mit Todesfolge",15000]};
	case "187": {_type = ["Mord",100000]};
	case "901": {_type = ["Gefängnisflucht",50000]};
	case "261": {_type = ["Raub",50000]};
	case "261A": {_type = ["Versuchter Raub",15000]};
	case "215": {_type = ["Versuchter Autodiebstahl",12500]};
	case "213": {_type = ["Verwenden illegaler Sprengstoff",100000]};
	case "211": {_type = ["Raub/Diebstahl",50000]};
	case "207": {_type = ["Entführung",50000]};
	case "207A": {_type = ["Versuchte Entführung",25000]};
	case "390": {_type = ["Fahren unter Alkohol",15000]};
	case "487": {_type = ["Autodiebstahl",25000]};
	case "488": {_type = ["Diebstahl",15000]};
	case "480": {_type = ["Fahrerflucht",15000]};
	case "481": {_type = ["Drogenbesitz",50000]};
	case "482": {_type = ["Versuchter Drogenhandel",27500]};
	case "483": {_type = ["Drogenhandel",55000]};
	case "503": {_type = ["Handel mit exotischen Gütern",55000]};
	case "1": {_type = ["Fahren ohne Führerschein",1500]};
	case "2": {_type = ["Versuchter Diebstahl Fahrzeugs",12500]};
	case "3": {_type = ["Diebstahl/Führen e.fremden Zivilfahrzeugs",25000]};
	case "4": {_type = ["Fahren ohne Licht",1000]};
	case "5": {_type = ["Überhöhte Geschwindigkeit 10-30km/h zu schnell",10000]};
	case "6": {_type = ["Überhöhte Geschwindigkeit > 30km/h zu schnell",25000]};
	case "7": {_type = ["Versuchter Diebstahl e.Staatsfahrzeugs",25000]};
	case "8": {_type = ["Diebstahl von Staatsfahrzeugen",40000]};
	case "9": {_type = ["Landen in einer Flugverbotszone",100000]};
	case "10": {_type = ["Fahren von illegalen Fahrzeugen",70000]};
	case "11": {_type = ["Unfallverursacher/Fahrerflucht nach Unfall",15000]};
	case "12": {_type = ["Fahrerflucht vor der Nationalgarde",30000]};
	case "13": {_type = ["Überfahren eines anderen Spielers",15000]};
	case "14": {_type = ["Illegale Strassensperren",10000]};
	case "15": {_type = ["Widerstand gegen die Staatsgewalt",50000]};
	case "16": {_type = ["Nicht befolgen e.pol.Anordnung",5000]};
	case "17": {_type = ["Beamtenbeleidigung",15000]};
	case "18": {_type = ["Belästigung eines Gardisten",8000]};
	case "19": {_type = ["Betreten der pol.Sperrzone",30000]};
	case "20": {_type = ["Töten eines Gardisten",150000]};
	case "21": {_type = ["Beschuss auf Nationalgarde/Sanitäter/Eigentum",100000]};
	case "22": {_type = ["Zerstörung von Staatseigentum",75000]};
	case "23": {_type = ["Drogendelikte",50000]};
	case "24": {_type = ["Waffenbesitz ohne Lizenz",20000]};
	case "25": {_type = ["Mit gez.Waffe durch Stadt",10000]};
	case "26": {_type = ["Besitz einer verbotenen Waffe",75000]};
	case "27": {_type = ["Schusswaffengebrauch innerhalb Stadt",50000]};
	case "28": {_type = ["Geiselnahme",50000]};
	case "29": {_type = ["Überfall auf Personen/Fahrzeuge",50000]};
	case "30": {_type = ["Bankraub",200000]};
	case "31": {_type = ["Mord",100000]};
	case "32": {_type = ["Aufstand",35000]};
	case "33": {_type = ["Angriff durch Rebellen",55000]};
	case "34": {_type = ["Angriff/Belagerung von Hauptstädten",55000]};
	case "35": {_type = ["Vers.Landung in einer Flugverbotszone",15000]};
	case "36": {_type = ["Fliegen/Schweben unterhalb 150m ü.Stadt",10000]};
	case "37": {_type = ["Ausbruch aus dem Gefaengnis",50000]};
	case "38": {_type = ["Fliegen ohne Fluglizenz",12000]};
	case "39": {_type = ["Dauerhaft störendes Hupen",10000]};
	case "40": {_type = ["Handel mit exotischen Gütern",55000]};
	case "41": {_type = ["Strafe $1000",1000]};
	case "42": {_type = ["Strafe $10000",10000]};
	case "43": {_type = ["Strafe $100000",100000]};
	case "44": {_type = ["Strafe $1000000 (z.B. trolling)",1000000]};
	case "120S": {_type = ["Überhöhte Geschwindigkeit",10000]};
	case "120H": {_type = ["Wiederholte Geschwindigkeitsübertretung",25000]};
	case "120WL": {_type = ["Fahren ohne Führerschein",1500]};
	case "120FS": {_type = ["Extremes Rasen",25000]};

	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};

[_uid, [_type], 4] call db_fnc_listadd;
