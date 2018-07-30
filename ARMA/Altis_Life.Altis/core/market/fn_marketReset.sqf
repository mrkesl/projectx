/*

	Resets market by calling marketConfiguration

*/

[] call life_fnc_marketconfiguration;

[0,format["ADMIN: %1 Hat die Marktpreise zurückgesetzt.",name player]] remoteExec ["life_fnc_broadcast", 0, false];

hint "Market prices reset.";