#include <macro.h>
/*
	File: fn_freezePlayer_all.sqf
	Author: Mr.Sears

	Description: Freezes all players
*/
if((player getVariable ["admin_level", 0]) == 0) then
	{
		closeDialog 0;
		hint "guter Witz..."; //Bist du Admin?};
	}
else
	{
		params [["_admin", objNull, [objNull]]];
		_players = allPlayers;
		_playercount = (count _players) - 1;
		_playerint = 0;
		_msg = "";

		if (isNil "freezeem") then
			{
				freezeem = 0;
			};
		if (freezeem == 0) then
			{
				for "_playerint" from 0 to _playercount do
					{
					_selectedUnit = _players select _playerint;
					if (player != _selectedUnit) then
					//if (1 == 1) then
						{
							[] remoteExec ["life_fnc_freezePlayer_all", _selectedunit, false];
							_selectedUnit allowDamage false;
						}
					};
				_msg = "Auf Grund eines enormen Eingriffs in den Spielverlauf mittels illegaler Aktivitäten, sind wir gezwungen das Spiel anzuhalten. Bitte haben sie ein wenig Geduld.";
				[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages", 2, false];
				freezeem = 1;
			}
		else
			{
				for "_playerint" from 0 to _playercount do
					{
					_selectedUnit = _players select _playerint;
					if (player != _selectedUnit) then
					//if (1 == 1) then
						{
							[] remoteExec ["life_fnc_freezePlayer_all", _selectedunit, false];
							_selectedUnit allowDamage true;
						}
					};
				_msg = "Das Problem konnte gelöst werden, das Leben geht weiter.";
				[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages", 2, false];
				freezeem = 0;
			};
	};
