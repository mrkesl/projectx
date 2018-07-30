/*
	@file Title: Altis Life Bank Rob by Creedcoder
	@file Version: 1.0
	@file Name: fn_bankmission.sqf
	@file Author: Creedcoder
	@file Edit: 18.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
params[
  ["_condition",-1,[0]],
  ["_target",objNull,[objNull,grpNull]]
];

switch (_condition) do {
  case 0: {
    (group player) setVariable ["bank_task", if(((group player) getVariable["gang_name",""]) != "") then {(group player) getVariable "gang_name"} else {profileName}, true];
    [group player,
    [("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Raube die Bank aus mit allen Mitteln!","Banküberfall","Bank"],
    [12283.9,14344.7,0.566114],
    1,
    1,
    false] call BIS_fnc_taskCreate;

    [99,["Bill Lumbergh: Ich werde euch nie verraten wie ihr am besten in die Bank kommt!","PLAIN DOWN"]] remoteExec ["cutText", group player, false];
    uiSleep 5;
    [99,[format["%1: Das werden wir mal sehen. He he!", name (units(group player) call BIS_fnc_selectRandom)],"PLAIN DOWN"]] remoteExec ["cutText", group player, false];

    [group player,
    [("BANK_FOLTER" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Foltere Bill Lumbergh, den Bank Angestellten, mit einer Autobattrie oder Kneifzange!","Der Bank Angestellte","Bank Angestellter"],
    getposATL bank_angestellter,
    1,
    2,
    true,
	"interact"] call BIS_fnc_taskCreate;

    {
      bank_angestellter addAction ["Foltere Bill", {
        bank_angestellter setDamage 0.5;
        [99,["Bill Lumbergh: Ahhhhhh...ok ok...ihr braucht einen Code um in die Bank zu kommen. Hier könnt ihr den Laptop vom Sicherheitschef finden.","PLAIN DOWN"]] remoteExec ["cutText", group player, false];
        uiSleep 5;
        [99,[format["%1: Das war ja einfach. Du Weichei!", name (units(group player) call BIS_fnc_selectRandom)],"PLAIN DOWN"]] remoteExec ["cutText", group player, false];
        [("BANK_FOLTER" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [1] call life_fnc_bankmission;
      },nil,1.5,true,true,"","([('BANK_FOLTER' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", group player];
  };
  case 1: {
    _laptop = [bank_laptop_1, bank_laptop_2, bank_laptop_3, bank_laptop_4, bank_laptop_5] call BIS_fnc_selectRandom;
    [group player,
    [("BANK_CODE" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Besorge den Code für die Bank Tür!","Der Zugangscode","Laptop"],
    getposATL _laptop,
    1,
    3,
    true,
	"download"] call BIS_fnc_taskCreate;
    [2,_laptop] remoteExec ["life_fnc_bankmission", group player, false];
  };
  case 2: {
    _target addAction ["Hacke Laptop", {
      [("BANK_CODE" + ((group player) getVariable "bank_task")),["Besorge den Code für die Bank Tür!<br/><br/>Der Code lautet: " + str round random(99999) +"","Der Zugangscode","Laptop"]] call BIS_fnc_taskSetDescription;
      [("BANK_CODE" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
      (_this select 0) removeAction (_this select 2);
      [10,["Nummer unterdrückt", "Nummer unterdrückt", "Bill Lumbergh", 0, "Hey ich bin's noch mal...ihr braucht noch eine Keycard vom Sicherheitschef für den Tresorraum. Er sollte sich in der Disco in Kavala aufhalten....."]] remoteExec ["life_fnc_extsmartphone",group player];
      [3] call life_fnc_bankmission;
    },nil,1.5,true,true,"","([('BANK_CODE' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
  };
  case 3: {
    [group player,
    [("BANK_KEYCARD" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Besorge dir die Keycard vom Sicherheitschef in der Kavala Disco!","Der Sicherheitschef","Sicherheitschef"],
    getposATL bank_security,
    1,
    4,
    true,
	"meet"] call BIS_fnc_taskCreate;

    {
      bank_security addAction ["Klaue die Keycard", {
        if !(bank_security getVariable ["keycard", true]) exitWith {
          [99,["Peter Gibbons: Hey hast du zufällig meine Keycard gesehen? Ich such die schon seit Stunden!","PLAIN DOWN"]] remoteExec ["cutText", group player, false];
          uiSleep 5;
          [99,[format["%1: Ähhh nein......", name (units(group player) call BIS_fnc_selectRandom)],"PLAIN DOWN"]] remoteExec ["cutText", group player, false];
          uiSleep 5;
          [99,[format["%1: Scheiße uns kam jemand zuvor!", name (units(group player) call BIS_fnc_selectRandom)],"PLAIN DOWN"]] remoteExec ["cutText", group player, false];
          uiSleep 5;
          [99,["Peter Gibbons: Himmel Arsch und Zwirn! Der Bank Manager wird mich umbringen!","PLAIN DOWN"]] remoteExec ["cutText", group player, false];
          [("BANK_RAUB" + ((group player) getVariable "bank_task")),"CANCELED",true] call BIS_fnc_taskSetState;
        };
        [99,["Peter Gibbons: Hey was rämpelst du mich an! Hau ab!","PLAIN DOWN"]] remoteExec ["cutText", group player, false];
        uiSleep 5;
        [99,[format["%1: Oh sorry war nicht mit Absicht...", name player],"PLAIN DOWN"]] remoteExec ["cutText", group player, false];
        [("BANK_KEYCARD" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [4] call life_fnc_bankmission;
        [12] remoteExec ["life_fnc_bankmission", 2, false];
        bank_security setVariable ["keycard", false, true];
      },nil,1.5,true,true,"","([('BANK_KEYCARD' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", group player];
  };
  case 4: {
    [group player,
    [("BANK_DOME" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Gebe den Code vom Laptop am Terminal ein!","Gebe den Code ein","Bank Terminal"],
    getposATL bank_terminal_1,
    1,
    2,
    true,
	"intel"] call BIS_fnc_taskCreate;

    {
      bank_terminal_1 addAction ["Gebe den Code ein", {
        [("BANK_DOME" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [format["Ich habe beobachtet wie '%1' versucht die Bank auszurauben bitte kommen sie schnell!", if(((group player) getVariable["gang_name",""]) != "") then {(group player) getVariable "gang_name"} else {profileName}],"Anonym",1] remoteExec ["TON_fnc_clientMessage", west, false];
        [5] call life_fnc_bankmission;
        [11,bank_dome] spawn life_fnc_bankmission;
      },nil,1.5,true,true,"","([('BANK_DOME' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", group player];
  };
  case 5: {
    [group player,
    [("BANK_TRESORRAUM" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Benutze die Keycard um den Tresorraum zu öffnen!","Benutze die Keycard","Tresor Terminal"],
    getposATL bank_terminal_2,
    1,
    2,
    true,
	"interact"] call BIS_fnc_taskCreate;

    {
      bank_terminal_2 addAction ["Benutze die Keycard", {
        [("BANK_TRESORRAUM" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [6] call life_fnc_bankmission;
        [11,bank_bunker] spawn life_fnc_bankmission;
      },nil,1.5,true,true,"","([('BANK_TRESORRAUM' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", group player];
  };
  case 6: {
    [group player,
    [("BANK_TRESOR" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Jag das Scheißteil in die Luft!","Spreng den Tresor!","Tresor"],
    getposATL bank_tresor,
    1,
    2,
    true,
	"destroy"] call BIS_fnc_taskCreate;

    {
      bank_tresor addAction ["Bring den Sprengstoff an!", {
        [("BANK_TRESOR" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [13,group player] remoteExec ["life_fnc_bankmission", 2, false];
      },nil,1.5,true,true,"","([('BANK_TRESOR' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", group player];
  };
  case 7: {
    [_target,
    [("BANK_TRESOR_AUSRAUBEN" + (_target getVariable "bank_task")),("BANK_RAUB" + (_target getVariable "bank_task"))],
    ["Schnapp dir die Kohle!","Hol die Beute!","Beute"],
    getposATL bank_tresor,
    1,
    2,
    true,
	"default"] call BIS_fnc_taskCreate;

    {
      bank_tresor addAction ["Nehm die Beute", {
        [("BANK_TRESOR_AUSRAUBEN" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [8] call life_fnc_bankmission;
      },nil,1.5,true,true,"","([('BANK_TRESOR_AUSRAUBEN' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned'"];
    } remoteExec ["bis_fnc_call", _target];
  };
  case 8: {
    (group player) setVariable ["bank_count", {bank_tresor distance _x < 500} count units(group player), true]; //COUNTER DER SPIELER
    _units = [];
    {
      if(bank_tresor distance _x < 500) then {
        _units pushBack _x;
      };
      nil;
    } count units(group player);
    (group player) setVariable ["bank_units", _units, true]; //COUNTER DER SPIELER
    [group player,
    [("BANK_ENDE" + ((group player) getVariable "bank_task")),("BANK_RAUB" + ((group player) getVariable "bank_task"))],
    ["Bringt eure Beute gemeinsam zu Geldwäscher.<br/><br/>Aber nicht sterben! Das reduziert deinen Anteil!","Sicher das Geld!","Geldwäscher"],
    getposATL bank_ende,
    1,
    2,
    true,
	"run"] call BIS_fnc_taskCreate;

    {
      bank_EH = player addEventHandler ["killed", {
        (group player) setVariable ["bank_count",((group player) getVariable ["bank_count",0]) - 1, true];
        (group player) setVariable ["bank_units",((group player) getVariable ["bank_units",[]]) - [_this select 0], true];
        if(count ((group player) getVariable ["bank_units",[]]) <= 0) then {
          [("BANK_RAUB" + ((group player) getVariable "bank_task")),"FAILED",true] call BIS_fnc_taskSetState;
        };
        player removeEventHandler ["killed",bank_EH];
        bank_EH = nil;
      }];
      bank_ende addAction ["Bitch take my Money!", {
        [("BANK_ENDE" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        [("BANK_RAUB" + ((group player) getVariable "bank_task")),"SUCCEEDED",true] call BIS_fnc_taskSetState;
        (_this select 0) removeAction (_this select 2);
        [9] call life_fnc_bankmission;
      },nil,1.5,true,true,"","([('BANK_ENDE' + ((group player) getVariable 'bank_task'))] call BIS_fnc_taskState) == 'Assigned' && player in ((group player) getVariable ['bank_units',[]])"];
    } remoteExec ["bis_fnc_call", _units];
  };
  case 9: {
    {
      if(((group player) getVariable ["bank_count",0]) > 0 OR !(player getVariable ["arrested", false])) then {
        _cash = ((group player) getVariable "bank_count") * 3000000;
        _anteil = round(_cash / count units(group player));
        player setvariable["cash", (player getvariable["cash",0]) + _anteil, true];
        hint format["Beute Gesamt: $%1\nDein Anteil: $%2", _cash, _anteil];
      } else {
        hint "Tja der Banküberfall war leider umsonst!";
      };
    } remoteExec ["bis_fnc_call", group player];
  };
  case 10: {
    //bank_dome bank_bunker    bank_terminal für bank_dome
    _numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _target) >> "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _target setVariable[format["bis_disabled_Door_%1",_i],1,true];
    };
  };
  case 11: {
    //bank_dome bank_bunker
    _numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _target) >> "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _target setVariable[format["bis_disabled_Door_%1",_i],0,true];
    };
  };
  case 12: {
    uiSleep 60;
    ["Meine Keycard für den Bank Tresorraum würde gestohlen! Bewacht die Bank solange bis Ich sie wieder gefunden habe!","Peter Gibbons",1] remoteExec ["TON_fnc_clientMessage", west, false];
  };
  case 13: {
    _bomb = createVehicle ["SatchelCharge_Remote_Ammo_Scripted", getPosATL bank_tresor, [], 0, "CAN_COLLIDE"];
    [99,["5 Minuten bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 60;
    [99,["4 Minuten bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 60;
    [99,["3 Minuten bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 60;
    [99,["2 Minuten bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 60;
    [99,["1 Minute bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 30;
    [99,["30 Sekunden bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 15;
    [99,["15 Sekunden bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 5;
    [99,["10 Sekunden bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 5;
    [99,["5 Sekunden bis zur Sprengung!","PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 4;
    [99,[format["%1: In Deckung!", name (units(_target) call BIS_fnc_selectRandom)],"PLAIN DOWN"]] remoteExec ["cutText", _target, false];
    uiSleep 1;
    _bomb setDamage 1;
    _alarm = createSoundSource ["Sound_Alarm", position bank_bunker, [], 0];
    _alarm attachTo [bank_bunker];
    [7,_target] call life_fnc_bankmission;
  };
};
