/*
File: fn_extsnartphone.sqf
Author: Creedcoder & Larvell
Date: 28.08.2015

Description:
	all functions of the ui are integrated here, check first line of each case
*/
private ["_display", "_contactlist", "_thenumber", "_delnumber", "_maxnumber", "_mynumber", "_messages", "_filter", "_fullmsg", "_messages_select", "_filter_select", "_contact_select", "_messagearray", "_curnumber", "_contactarray", "_contactcount", "_array", "_vwahl", "_mnum", "_rowData", "_messageIndex", "_contactlistIndex", "_admnumbers", "_newnum", "_findnum", "_newname", "_temp", "_delconnum", "_mycontacts", "_message","_target"];
params [
	["_condition",0,[0]],
	["_input", [], [[]]]
];
disableSerialization;
_display = findDisplay 17000;

_contactlist = _display displayCtrl 17004;
_thenumber = _display displayCtrl 17053;
_delnumber = _display displayCtrl 17043;
_maxnumber = _display displayCtrl 17052;
_mynumber = _display displayCtrl 17024;
_messages = _display displayCtrl 17015;
_filter = _display displayCtrl 17005;
_fullmsg = _display displayCtrl 17028;
_messages_select = lbData [17015,lbCurSel 17015];
_filter_select = lbData [17005,lbCurSel 17005];
_contact_select = lbData [17004,lbCurSel 17004];
_messagearray = player getVariable ["mymsgs",[]];
_curnumber = player getVariable ["mynumber",""];
_contactarray = player getVariable ["mycontacts",[]];
_contactcount = count _contactarray;
_messagecount = count _messagearray;

switch (_condition) do {
	case 1: {
		//Menü Start
		_array = [17019,17020,17029,17030,17036,17037,17021,17022,17023,17031,17033,17034,17035,17039,17041,17042,17043,17054];
		{
			ctrlshow [_x,false];
		} foreach _array;
		if((player getVariable["cop_level", 0]) < 5) then {ctrlshow[17045,false];};
		_vwahl = _curnumber select [0,4];
		_mnum = _curnumber select [4,10];
		_mynumber ctrlSetText format["%1 - %2", _vwahl, _mnum];

		lbClear _filter;
		_filter lbAdd "Alle";
		_filter lbSetData[(lbSize _filter)-1,"all"];
		_filter lbAdd "Zivilisten";
		_filter lbSetData[(lbSize _filter)-1,"civ"];
		_filter lbAdd "Nationalgarde";
		_filter lbSetData[(lbSize _filter)-1,"cop"];
		_filter lbAdd "Notarzt";
		_filter lbSetData[(lbSize _filter)-1,"med"];
		_filter lbSetCurSel 0;

		lbClear _messages;
		{
			if((_x select 3) == 0) then {
				_rowData = [_x select 0, _x select 1, _x select 2, _x select 3, _x select 4];
			} else {
				_rowData = [_x select 0, "Nummer unterdrückt", "Unbekannt", _x select 3, _x select 4];
			};
			_messageIndex = _messages lbAdd format["%1     /     %2...",_rowData select 2,([_rowData select 4,40] call KRON_StrLeft)];
			_messages lbSetData [_messageIndex,str(_rowData)];
		}forEach _messagearray;
	};
	case 2: {
		//Fill Contacts
		_maxnumber ctrlSetText format["Kontakte: %1 / 50", _contactcount];

		lbClear _contactlist;
		{
			if((_filter_select == "civ") && ((_x select 0) select [0,4] == "0815")) then {
				_contactlistIndex = _contactlist lbAdd (_x select 1);
				_contactlist lbSetData [_contactlistIndex,(_x select 0)];
			};
			if((_filter_select == "cop") && ((_x select 0) select [0,4] == "0110")) then {
				_contactlistIndex = _contactlist lbAdd (_x select 1);
				_contactlist lbSetData [_contactlistIndex,(_x select 0)];
			};
			if((_filter_select == "med") && ((_x select 0) select [0,4] == "0112")) then {
				_contactlistIndex = _contactlist lbAdd (_x select 1);
				_contactlist lbSetData [_contactlistIndex,(_x select 0)];
			};
			if(_filter_select == "all") then {
				_contactlistIndex = _contactlist lbAdd (_x select 1);
				_contactlist lbSetData [_contactlistIndex,(_x select 0)];
			};
		} forEach _contactarray;
		if((_filter_select == "all") && ((player getVariable ["admin_level", 0]) > 0)) then {
			_contactlistIndex = _contactlist lbAdd "--  ONLINE PLAYERS --";
			_contactlist lbSetData [_contactlistIndex,"Admin Spinner..."];
			{
				_admnumbers = _x getVariable ["mynumber", ""];
				_contactlistIndex = _contactlist lbAdd (name _x);
				_contactlist lbSetData [_contactlistIndex,_admnumbers];
			} foreach (allPlayers - [player]);
		};
	};
	case 3: {
		//Contact Select
		_thenumber ctrlSetText format["%1", _contact_select ];
		_delnumber ctrlSetText format["%1", _contact_select ];
	};
	case 4: {
		//Add Contact
		if(_contactcount == 50) exitWith{hint "Die Kontaktliste ist bereits voll";};
		_newnum = ctrlText 17034;
		_newname = "none";
		{
			_findnum = _x getVariable ["mynumber",""];
			if(_findnum == _newnum) exitWith {
				_newname = name _x;
			};
		} foreach  (allPlayers - [player]);
		if(_newname == "none") exitWith {hint "Es wurde kein Kontakt gefunden";};
		_temp = [_contactarray, _newnum] call BIS_fnc_findInPairs;
		if(_temp >= 0) then {
			[_contactarray, _newnum, _newname] call BIS_fnc_setToPairs;
			hint format["Kontakt aktualisiert %1 mit der Nummer %2 hinzugefügt",_newname,_newnum];
		} else {
			_contactarray pushBack [_newnum, _newname];
			player setVariable["mycontacts",_contactarray, true];
			hint format["Kontakt %1 mit der Nummer %2 hinzugefügt",_newname,_newnum];
		};
		[2] call life_fnc_extsmartphone;
	};
	case 5: {
		//Del Contact
		_delconnum = ctrlText 17043;
		_temp = [_contactarray,_delconnum] call BIS_fnc_findInPairs;
		if(_temp >= 0) then {
			_contactarray deleteAt _temp;
			player setVariable["mycontacts",_contactarray, true];
			hint format["Kontakt %1 wurde entfernt",_delconnum];
		} else {
			Hint "Kontakt konnte nicht gefunden werden";
		};
		[2] call life_fnc_extsmartphone;
	};
	case 6: {
		//Manage Contacs
		_array = [17029,17030,17036,17037,17031,17033,17034,17035,17039,17041,17042,17043];
		{
			if(ctrlVisible _x) then {
				ctrlshow [_x,false];
			} else {
				ctrlshow [_x,true];
			};
		} foreach _array;
	};
	case 7: {
		//Show Message
		_message = call compile _messages_select;
		_fullmsg ctrlSetText format["Nachricht von %1 / %2: %3", _message select 1,_message select 2, _message select 4];
	};
	case 8: {
		//Send Message not direct
		if(count allPlayers > 1) then {
		_anonym = 0;
		_messagetosend = ctrlText _fullmsg;
		_messagelength = count(toArray _messagetosend);
		if(_messagelength == 0) exitWith {hint "Du hast keine Nachricht eingegeben...";};
		if(_messagelength > 1900) exitWith {hint format["Die eingegebene Nachricht ist zu lang: %1 Zeichen von 1900",_messagelength];}; //bei länge über 1960 zeichen funktioniert die rscedit nicht mehr korrekt
		_cleanmessage = toArray _messagetosend,
		{
			if(_x == 34) then {
				_cleanmessage set [_forEachIndex, 39];
			};
		} forEach _cleanmessage;
		_messagetosend = toString _cleanmessage;
		_target = {
			_return = objNull;
			_findnum = _x getVariable ["mynumber",""];
			if(_findnum == _contact_select) exitWith {_return = _x; _return};
			_return
		} foreach  (allPlayers - [player]);
		if(isNull _target) exitWith {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
		[10,[_contact_select, _curnumber,profilename,_anonym,_messagetosend]] remoteExec ["life_fnc_extsmartphone",_target];
		hint "Nachricht wurde gesendet";}
		else {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
	};
	case 9: {
		//Send Message direct
		if(_messagecount < 1) exitWith {hint "Du hast keine Nachrichten im Verlauf"};
		if(count allPlayers > 1) then {
		_anonym = 0;
		_messagetosend = ctrlText _fullmsg;
		_messagelength = count(toArray _messagetosend);
		if(_messagelength == 0) exitWith {hint "Du hast keine Nachricht eingegeben...";};
		if(_messagelength > 1900) exitWith {hint format["Die eingegebene Nachricht ist zu lang: %1 Zeichen von 1900",_messagelength];}; //bei länge über 1960 zeichen funktioniert die rscedit nicht mehr korrekt
		_message = call compile _messages_select;
		_messagetonumber = _message select 1;
		_cleanmessage = toArray _messagetosend,
		{
			if(_x == 34) then {
				_cleanmessage set [_forEachIndex, 39];
			};
		} forEach _cleanmessage;
		_messagetosend = toString _cleanmessage;
		_target = {
			_return = objNull;
			_findnum = _x getVariable ["mynumber",""];
			if(_findnum == _messagetonumber) exitWith {_return = _x; _return};
			_return
		} foreach  (allPlayers - [player]);
		if(isNull _target) exitWith {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
		[10,[_messagetonumber, _curnumber, profilename, _anonym, _messagetosend]] remoteExec ["life_fnc_extsmartphone",_target];
		hint "Nachricht wurde gesendet";}
		else {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
	};
	case 10: {
		//Recive Message
		_input params [
		["_numberTarget", "",[""]],
		["_numberSender", "",[""]],
		["_nameSender", "",[""]],
		["_anonym", 0, [0]],
		["_message","",[""]]
		];

		//[_numberTarget, _numberSender, profilename, _nameSender, _anonym, _message] remoteExec ["life_fnc_insertMessage",2];
		//true spawn REDIS_fnc_save;

		_messagearray pushBack [_numberTarget, _numberSender, _nameSender, _anonym, _message];
		while {count _messagearray > 10} do {
			_messagearray deleteAt 0;
		};
		player setVariable ["mymsgs", _messagearray];
		if("ItemRadio" in assignedItems player) then {
		hintSilent "Du hast eine neue Nachricht erhalten, schau auf dein Handy";
		playSound "newmessage";
		_messagetosend = ctrlText _fullmsg;
		[1] call life_fnc_extsmartphone;
		_fullmsg ctrlSetText _messagetosend;
		};
	};
	case 11: {
		//Show and Hide Help
		_array = [17019,17020,17021,17022,17054];
		{
			if(ctrlVisible _x) then {
				ctrlshow [_x,false];
			} else {
				ctrlshow [_x,true];
			};
		} foreach _array;
	};
	case 12: {
		//Send Message Anonym
		if(count allPlayers > 1) then {
		_anonymnum = ctrlText 17051;
		_anonym = 1;
		_messagetosend = ctrlText _fullmsg;
		_messagelength = count(toArray _messagetosend);
		if(_messagelength == 0) exitWith {hint "Du hast keine Nachricht eingegeben...";};
		if(_messagelength > 1900) exitWith {hint format["Die eingegebene Nachricht ist zu lang: %1 Zeichen von 1900",_messagelength];}; //bei länge über 1960 zeichen funktioniert die rscedit nicht mehr korrekt
		_target = {
			_return = objNull;
			_findnum = _x getVariable ["mynumber",""];
			if(_findnum == _anonymnum) exitWith {_return = _x; _return};
			_return
		} foreach  (allPlayers - [player]);
		if(isNull _target) exitWith {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
		[10,[_anonymnum, _curnumber,profilename,_anonym,_messagetosend]] remoteExec ["life_fnc_extsmartphone",_target];
		hint "Nachricht wurde gesendet";}
		else {hint "Der Kontakt scheint nicht erreichbar zu sein.";};
	};
	case 13: {
		//delete all messages
		if(_messagecount < 1) exitWith {hint "Du hast keine Nachrichten im Verlauf"};
		//[_curnumber] remoteExec ["life_fnc_deleteMessage",2];
		//true spawn REDIS_fnc_save;
		player setVariable ["mymsgs", []];
		[1] call life_fnc_extsmartphone;
	};
};
