/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast kürzlich eine Bank ausgeraubt! Du kannst zur Zeit kein Geld weitergeben.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Du hast keine korrekte Anzahl angegeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst eine Anzahl von dem was du abgeben willst angeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) > (player getvariable["cash",0])) exitWith {hint "Du hast nicht die Menge die du abgeben willst";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der ausgewählt Spieler ist nicht in der Umgebung";};
hint format["Du hast $%1 %2 gegeben.",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
player setvariable["cash", (player getvariable["cash",0]) - (parseNumber(_amount)), true];
[] spawn REDIS_fnc_save;
[_unit,_amount,player] remoteExec ["life_fnc_receiveMoney", _unit, false];
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];
