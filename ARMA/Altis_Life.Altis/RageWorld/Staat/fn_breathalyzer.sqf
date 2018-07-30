/*
file: fn_breathalyzer 
author:[midgetgrimm]
descrip:allows cop to breathalyze player
http://www.altisliferpg.com/topic/4769-how-toalcohol-with-multiple-item-processingdrunk-effects-passouts-and-police-breathalyzing/ 
 */
params [["_cop", ObjNull, [ObjNull]]];
private "_drinky";

if(isNull _cop) exitWith {};
_drinky = life_drink;
if(_drinky > 0.07) then {
[1,format["Atemprobe %1 \n\n Ergebnis: %2 \n\n Sie sind auf oder über dem legalen Limit!",name player,[_drinky] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", _cop, false];
} else {
[1,format["Atemprobe %1 \n\n Ergebnis: %2 \n\n Unter dem illegalen Limit!",name player,[_drinky] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", _cop, false];
};