/*
	File:fn_radarCam.sqf
	author: [midgetgrimm]
	Flash/Basic premise idea from preller, trigger function from shems and Yuka for the waitUntil <3
	Runs cams on map for speeders, if speed too many times diff shit happens
*/
#define inarray(__val) (__val in (player getVariable ["licenses", []]))
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//_ticket = 1500;//perm set amount ticket
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticket = round _ticket;
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
_ticketWL = round _ticketWL;
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _driver == civilian) then {
			if(isNil "life_speedTicket") then {life_speedTicket = 0;};
			if(isNil "life_speedCaught") then {life_speedCaught = 0;};
			diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call life_fnc_numberText];
			player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
			sleep 0.05;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
			sleep 0.1;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
		if(inarray("civ_driver") OR inarray("civ_truck")) then {

			life_speedTicket = life_speedTicket + 1;
			if(life_speedTicket <= 3) then {systemChat format["Das ist dein %1 Ticket! Mach weiter so und du verlierst mehr als nur Geld!",life_speedTicket];};
			if(life_speedTicket == 4) then {systemChat format["Das ist dein %1 Ticket! Nächstes mal werden dir deine Führerscheine abgenommen!",life_speedTicket];};
			if(life_speedTicket > 4 && life_speedTicket < 8) exitWith {

					systemChat format["Das ist dein %1 Ticket!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Sie sind ein rücksichtsloser Fahrer! Ihre Führerscheine wurden ihnen abgenommen und sie wurden zur Fahndung ausgeschrieben!",round _speed,_limit,name _driver];
					[4] remoteExec ["life_fnc_removeLicenses", _driver, false];
					[getPlayerUID _driver,name _driver,"120H"] remoteExec ["life_fnc_wantedAdd", 2, false];
					[] spawn REDIS_fnc_save;
			};
			if(life_speedTicket > 8) exitWith {

					systemChat format["Das ist dein %1. TICKET --- Sofort stehen bleiben!!!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>Sie sind ein Raser! Sie werden nun mit Hochdruck von der Nationalgarde gesucht!",round _speed,_limit,name _driver];
					[getPlayerUID _driver,name _driver,"120FS"] remoteExec ["life_fnc_wantedAdd", 2, false];
					[4] remoteExec ["life_fnc_removeLicenses", _driver, false];
					[] spawn REDIS_fnc_save;
			};
			if((player getvariable["cash",0]) <= _ticket) then
			{
				if((player getvariable["bankacc",0]) <= _ticket) exitWith
				{
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4<br/>Da sie ihre Strafe nicht bezahlen konnten, werden sie nun mit einem Haftbefehl gesucht!",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
					[getPlayerUID _driver,name _driver,"120S"] remoteExec ["life_fnc_wantedAdd", 2, false];
				};
				player setvariable["bankacc", (player getvariable["bankacc",0]) - _ticket, true];
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				diag_log "Ticket paid from player bank";
				[] spawn REDIS_fnc_save;
			} else {

				player setvariable["cash", (player getvariable["cash",0]) - _ticket, true];
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				diag_log "Die Geldbuße wurde von ihrem Konto abgebucht.";
				[] spawn REDIS_fnc_save;
			};
		} else {

					life_speedCaught = life_speedCaught + 1;
					if(life_speedCaught <= 5) then { systemChat format["Du wurdest zum %1. mal ohne Führerschein und mit überhöhter Geschwindigkeit geblitzt!",life_speedCaught];};
					if(life_speedCaught == 6) then { systemChat format["Du wurdest zum %1. mal ohne Führerschein und mit überhöhter Geschwindigkeit geblitzt!",life_speedCaught];};

					if(life_speedCaught > 6) exitWith {

							systemChat format["Das ist dein %1. TICKET --- Sofort stehen bleiben!!!",life_speedCaught];
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>Sie werden nun wegen wiederholter Geschwindigkeitsübertretung per Haftbefehl gesucht!",round _speed,_limit,name _driver];
							[getPlayerUID _driver,name _driver,"120FSWL"] remoteExec ["life_fnc_wantedAdd", 2, false];

					};
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Sie werden nun wegen fahren ohne Führerschein per Haftbefehl gesucht!",round _speed,_limit,name _driver];
					[getPlayerUID _driver,name _driver,"120WL"] remoteExec ["life_fnc_wantedAdd", 2, false];
					if((player getvariable["cash",0]) <= _ticketWL) then
					{
						if((player getvariable["bankacc",0]) <= _ticketWL) exitWith
						{
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4<br/>Da sie ihre Strafe nicht bezahlen konnten, werden sie nun mit einem Haftbefehl gesucht!",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
							[getPlayerUID _driver,name _driver,"120S"] remoteExec ["life_fnc_wantedAdd", 2, false];
						};
						player setvariable["bankacc", (player getvariable["bankacc",0]) - _ticketWL, true];
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player bank";//for logging
						[] spawn REDIS_fnc_save;
					} else {

						player setvariable["cash", (player getvariable["cash",0]) - _ticketWL, true];
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Geschwindigkeitsbegrenzung: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Geldbuße: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player cash";//for logging
						[] spawn REDIS_fnc_save;
					};
		};
	};
};
//diag_log "Speed cam script done";//for logging
sleep 5;
