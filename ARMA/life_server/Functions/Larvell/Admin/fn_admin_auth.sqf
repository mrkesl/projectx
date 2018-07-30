/*
File: fn_admin_auth.sqf
Author: Mr.Sears aka Larvell from Libra-Gaming.eu

Description:
Authentification of Admins

Setup the GUID of all Admins allowed to access the Adminmenu
*/
params [["_unit", ObjNull, [ObjNull]]];
private "_playid";
_playid = getPlayerUID _unit;
diag_log format ["admin_auth: _unit= %1 _playid= %2",_unit, _playid];

switch (_playid) do {
	case "76561197978624340": { diag_log "admin_auth: Lou"; };
	case "76561198026093546": { diag_log "admin_auth: Revan"; };
	case "76561197974753800": { diag_log "admin_auth: Larvell"; };
	case "76561197969932881": { diag_log "admin_auth: Creedcoder"; };
	case "76561198064913969": { diag_log "admin_auth: Tim"; };
	case "76561198149541724": { diag_log "admin_auth: Webster"; };
	//case "76561197960679521": { diag_log "admin_auth: Matti"; };
	case "76561198068304864": { diag_log "admin_auth: Vlad"; };
	//case "76561198172473687": { diag_log "admin_auth: John"; };
	default {
		diag_log "admin_auth: case default";
		[] remoteExec ["life_fnc_noAdmin", _unit, false];
			};
 };