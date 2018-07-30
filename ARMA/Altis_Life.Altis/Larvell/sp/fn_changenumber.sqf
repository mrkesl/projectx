/*
	File: fn_changenumber.sqf
	Author: Larvell

	Description:
	annoying script for 3 npc to force players to some action :p

	_condition:
		0 = reception
		1 = boss
		2 = technician

	useing change_number_value to controll the npc interaction
	_value:
		0 - reception "hello...", boss "who are you...", tech "get lost..."
		1 - reception "wanna mary me?...", boss "i'm no technician", tech "withou signature..boss..."
		2 - reception "get away from me...", boss "what else? piss off", tech "sure i can..money..."
		3 - reception "you have no life?", boss "you waste my time", tech "money money money"
*/
params [["_condition",0,[0]]];
change_number_value params [["_value",0,[0]]];
private ["_unit","_name"];
_unit = player;
_name = name player;
diag_log "###>>> Changenumber <<<###";
diag_log format["Changenumber gestartet von %1 mit condition %2 und value %3",_unit,_condition,_value];
if((daytime < 8) || (daytime > 17)) exitWith {
			["<t color='#ffffff' size = '.6'>Hallo " + _name + ",<br />auch wir verdienen ein Leben außerhalb dieser Folterkammer. Bitte kommen sie zu unseren Geschätfszeiten wieder. Wir sind täglich von 8:00 bis 17:00 Uhr für sie da.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
switch (_condition) do {
	case 0: {
		switch (_value) do {
			case 0: {
				["<t color='#ffffff' size = '.6'>Hallo " + _name + ",<br />sie wollen ihre Messenger Nummer ändern lassen? Kein Problem! Gehen sie zu unserem Techniker.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
				change_number_value = 1;
			};
			case 1: {
				["<t color='#ffffff' size = '.6'>Was wollen sie denn schon wieder hier? Haben sie nichts besseres zu tun?.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 2: {
				["<t color='#ffffff' size = '.6'>Wollen sie mich zum Mann nehmen oder warum schauen sie so penetrant?</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 3: {
				["<t color='#ffffff' size = '.6'>Ernsthaft, haben sie kein Leben? Hauen sie doch endlich ab!</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
		};
	};
	case 1: {
		switch (_value) do {
			case 0: {
				["<t color='#ffffff' size = '.6'>Wer sind sie? sie sehen mir nicht aus wie der Pizzabote. Raus mit Ihnen!</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 1: {
				["<t color='#ffffff' size = '.6'>Nummer ändern? Sehe ich aus wie ein Computer? Gehen sie zu meinem Techniker, der kann Ihnen weiter helfen.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
				change_number_value = 2;
			};
			case 2: {
				["<t color='#ffffff' size = '.6'>Was wollen sie noch? Verschwinden sie!</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 3: {
				["<t color='#ffffff' size = '.6'>Ich habe keine Zeit mich mit Gesindel abzugeben... Die Tür... von außen, sie wissen schon.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
		};
	};
	case 2: {
		switch (_value) do {
			case 0: {
				["<t color='#ffffff' size = '.6'>Hau ab, ich bin beschäftigt.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 1: {
				["<t color='#ffffff' size = '.6'>Ohne Unterschrift vom Boss mache ich gar nichts für sie.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
			};
			case 2: {
				["<t color='#ffffff' size = '.6'>Sicher kann ich ihre Messenger Nummer ändern, allerdings habe ich noch viel zu Tun. Mit dem nötigen Kleingeld könnte ich mich eventuell überwinden, ein wenig schneller zu sein. Ich denke mit 50.000 für meine Tasche sind wir schnell durch mit der Prozedur.</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
				change_number_value = 3;
			};
			case 3: {
				if((player getvariable["cash",0]) < 50000) exitWith {["<t color='#ffffff' size = '.6'>Kein Geld? Keine Zeit!</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;};
				player setvariable["cash", (player getvariable["cash",0]) - 50000, true];
				["<t color='#ffffff' size = '.6'>Ahhh sie haben interesse am beschleunigten Verfahren, warum haben sie das denn nicht gleich gesagt?</t>",0,0,10,1,0,789] spawn BIS_fnc_dynamicText;
				[_unit] remoteExec ["life_fnc_generate_number", 2, false];
				change_number_value = 0;
			};
		};
	};
	default {diag_log "--- CN Error ---";};
};
