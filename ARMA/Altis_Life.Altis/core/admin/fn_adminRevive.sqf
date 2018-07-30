private["_target","_unit"];
params [["_target", objnull ,[]]];
if (isnull _target) then {

_unit = lbData[1500,lbCurSel (1500)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {hint "du hast keinen Spieler ausgewählt"};
if(isNull _unit) exitWith {hint "du hast keinen Spieler ausgewählt"};
hint format["Du hast %1 zurück ins leben geführt / geheilt.",_unit getVariable["realname",name _unit]];
[name player, true] remoteExec ["life_fnc_adminrevived", _unit, false]; //alternative Wiederbelebung (medic funktion)
_unit setDamage 0;

} else {
	[] spawn life_fnc_adm_gd_tg;
	[name player, true] remoteExec ["life_fnc_adminrevived", _target, false];
    _target setDamage 0;
};