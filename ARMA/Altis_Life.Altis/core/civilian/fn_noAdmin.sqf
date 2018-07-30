/*
	File: fn_noAdmin.sqf
	Author: Mr.Sears

	Description: Close Admin Menu and inform Player
*/
params [["_unit", ObjNull, [ObjNull]]];
diag_log format ["admin_auth: _unit= %1 is no Admin",_unit];
hint "Du bist kein Admin, deine Daten wurden gespeichert und werden bei BIS als Global-Ban-Reuquest eingereicht. Wir wünschen noch einen wunderschönen Tag.";
closeDialog 0;
closeDialog 2900;
closeDialog 3190;