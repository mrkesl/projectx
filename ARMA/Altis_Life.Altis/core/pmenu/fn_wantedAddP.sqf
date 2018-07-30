private["_unit","_amount"];
if(playerSide != west) exitWith {hint "Was denkst du wer du bist?"};
if((lbCurSel 2406) == -1) exitWith {hint "Du musst eine Person auswählen."};
if((lbCurSel 2407) == -1) exitWith {hint "Du hast kein Verbrechen ausgewählt."};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(side _unit == west) exitWith {hint "Leg dich lieber nicht mit der Nationalgarde an!" };
if(_unit == player) exitWith {hint "Du kannst dich nicht selbst zur Fahndung ausschreiben.";};
if(isNull _unit) exitWith {};

[1,format["%1 wurde zur Fahndung ausgeschrieben.",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]] remoteExec ["life_fnc_broadcast", west, false];
[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount] remoteExec ["life_fnc_wantedAdd", 2, false];
