/*
Author:Ragebone
description: logs a lot of stuff...
Purpose is to get those nasty shop sell spammers etc. 
*/

private["_msg"];
_msg = _this select 0;

diag_log format["LOGGED: %1 ",_msg];