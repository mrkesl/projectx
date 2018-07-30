/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_coplevel","_rang"];

_target = cursorTarget;

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_coplevel = (player getVariable ["cop_level", 0]);

switch ( _coplevel ) do
{
	case 1: { _rang = "Rekrut"; };
	case 2: { _rang = "Gefreiter"; };
	case 3: { _rang = "Hauptgefreiter"; };
	case 4: { _rang = "Feldwebel"; };
	case 5: { _rang = "Hauptfeldwebel"; };
	case 6: { _rang = "Leutnant"; };
	case 7: { _rang = "Oberleutnant"; };
	case 8: { _rang = "Major"; };
	default {_rank =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Nationalgarde</t>", name player, _rang];

[player, _message] remoteExec ["life_fnc_copLicenseShown", _target, false];
