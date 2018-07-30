enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};

life_versionInfo = "Altis Life RPG v3.1.4.8 modded by Libra-Gaming";
[] execVM "KRON_Strings.sqf";
if(isDedicated && isNil("life_market_prices")) then {
	[] call life_fnc_marketconfiguration;
	diag_log "Marketpreise generiert!";
	"life_market_prices" addPublicVariableEventHandler {
		diag_log format["Marktpreise aktualisiert! %1", _this select 1];
	};
	//Start server fsm
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};
if(!isServer) then {
	[] execVM "Rageworld\fn_RageInit.sqf";
	[] execVM "Rageworld\monitor.sqf";
	[] execVM "Rageworld\monitor2.sqf";
};

StartProgress = true;
fn_whoDunnit = compile preprocessFileLineNumbers "RageWorld\fn_whoDunnit.sqf";
{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];

[2] spawn bis_fnc_sharedObjectives;
