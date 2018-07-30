/*
File: fn_sendChannel.sqf
Author: alleskapot & Lifted
Thanks again for all the help alleskapot!
Description:
Ermöglicht senden bzw. die Abfrage des Geschriebenen.
*/
private["_message"];
disableSerialization;
waitUntil {!isnull (findDisplay 9000)};
if ((player getvariable["cash",0]) < 6000 ) exitWith { systemChat "Du brauchst 6000€ um eine Nachricht zu senden!"; };
if (playerSide != civilian ) exitWith { systemChat "Du musst ein Zivilist sein!"; };
player setvariable["cash", (player getvariable["cash",0]) - 6000, true];
_message = ctrlText 9001;
[3,format ["Nachricht von Chanel 7 News an Alle: %2",name player,_message]] remoteExec ["life_fnc_broadcast", 0, false];
life_channel_send = false;
[] spawn
{
sleep 600;
life_channel_send = true;
};