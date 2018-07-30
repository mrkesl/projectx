/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
params [["_ret", [], [[]]], ["_bad", false, [false]], ["_time", 15, [0]]];
private["_bail","_esc","_countDown","_time"];

_time = time + (_time * 60); //x Minutes

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then {
	life_bail_amount = 0;
	{
		life_bail_amount = life_bail_amount + (_x select 1);
	} forEach _ret;
} else {
	life_bail_amount = 20000;
};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then
	{
		//sleep (10 * 60);
		//50% of time
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//sleep (5 * 60);
		//20% of time
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 Minuten",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Zeit verbleibend:\n %1\n\nKann Kaution bezahlen: %3\nHöhe der Kaution: $%2",_countDown,[life_bail_amount] call life_fnc_numberText];
		}
		else
		{
			hintSilent format["Zeit verbleibend:\n %1\n",_countDown];
		};

	};

	if(player distance (getMarkerPos "jail_marker") > 180) exitWith
	{
		_esc = true;
	};

	if(life_bail_paid) exitWith
	{
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{

	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		player setVariable ["arrested", false, true];
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		removeUniform player;
		player addUniform "U_C_Poloshirt_stripped";
		["U_C_Poloshirt_stripped"] spawn life_fnc_texturesync;
		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove", 2, false];
		player setPos (getMarkerPos "jail_release");
		[] spawn REDIS_fnc_save;
	};

	case (_esc) :
	{
		player setVariable ["arrested", false, true];
		hint localize "STR_Jail_EscapeSelf";
		[0,format["%1 ist aus dem Staatsgefängnis ausgebrochen.",profileName]] remoteExec ["life_fnc_broadcast", 0, false];
		[getPlayerUID player,profileName,"901"] remoteExec ["life_fnc_wantedAdd", 2, false];
		[] spawn REDIS_fnc_save;
	};

	case (alive player && !_esc && !_bail) :
	{
		player setVariable ["arrested", false, true];
		hint localize "STR_Jail_Released";
		removeUniform player;
		player addUniform "U_C_Poloshirt_stripped";
		["U_C_Poloshirt_stripped"] spawn life_fnc_texturesync;
		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove", 2, false];
		player setPos (getMarkerPos "jail_release");
		[] spawn REDIS_fnc_save;
	};
};
