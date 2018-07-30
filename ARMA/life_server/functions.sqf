life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};
	[player,life_sidechat,playerSide] remoteExec [""TON_fnc_managesc"", 2, false];
	[] call life_fnc_settingsMenu;
";

publicVariable "life_fnc_sidechat";

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[(player getvariable[""bankacc"",0]),(player getvariable[""cash"",0]),owner player,player] remoteExec [""life_fnc_admininfo"", _ret, false];
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	player setvariable[""bankacc"", (player getvariable[""bankacc"",0]) + _val, true];
	hint format[""%1 hat dir $%2 überwiesen."",_from,[_val] call life_fnc_numberText];

";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Du wurdest aus der Gang geschmissen."";

	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir die Schlüssel von %2 gegeben."",_giver,_name];
		life_vehicles pushBack _vehicle;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist jetzt der neue Anführer."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""Rettungssanitäter"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3022,true];};

	[_msg,name player,5] remoteExec [""TON_fnc_clientMessage"", independent, false];
	[] call life_fnc_cellphone;
	hint format[""Du hast alle Notärzte informiert."",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Du musst einen Spieler auswählen dem du die Nachricht schicken willst""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3015,true];};

	[_msg,name player,0] remoteExec [""TON_fnc_clientMessage"", _to, false];
	[] call life_fnc_cellphone;
	hint format[""Du hast %1 eine Nachricht gesendet: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben um sie abzusenden!"";ctrlShow[3016,true];};

	[_msg,name player,1] remoteExec [""TON_fnc_clientMessage"", 0, false];
	[] call life_fnc_cellphone;
	hint format[""Du hast %1 eine Nachricht gesendet: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben um sie abzusenden!"";ctrlShow[3017,true];};

	[_msg,name player,2] remoteExec [""TON_fnc_clientMessage"", 0, false];
	[] call life_fnc_cellphone;
	hint format[""Du hast %1 eine Nachricht gesendet: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((player getVariable [""admin_level"", 0]) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben um sie abzusenden!"";};

	[_msg,name player,3] remoteExec [""TON_fnc_clientMessage"", _to, false];
	[] call life_fnc_cellphone;
	hint format[""Admin Nachricht gesendet an: %1 - Nachricht: %2"",name _to,_msg];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((player getVariable [""admin_level"", 0]) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben um sie abzusenden!"";};

	[_msg,name player,4] remoteExec [""TON_fnc_clientMessage"", 0, false];
	[] call life_fnc_cellphone;
	hint format[""Admin Nachricht an alle: %1"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>NACHRICHT VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Du hat eine neue Nachricht von %1 erhalten."",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""NOTRUF VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Neuer Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Gardisten<br/><t color='#33CC33'>von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""PoliceDispatch"",[format[""Notruf von: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2 :
		{
			if((player getVariable [""admin_level"", 0]) < 1) exitWith {};
			private[""_message""];
			_message = format[""???ADMIN REQUEST VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Admins<br/><t color='#33CC33'>von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""AdminDispatch"",[format[""%1 hat einen Admin angefordert!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""!!!NACHRICHT VON ADMIN: %1"",_msg];
			_admin = format[""Gesendet von Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>von: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Du hast eine Nachricht von einem Admin erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((player getVariable [""admin_level"", 0]) > 0) then {systemChat _admin;};
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Nachricht vom Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>alle Spieler<br/><t color='#33CC33'>von: <t color='#ffffff'>den Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Du hast eine Nachricht von einem Admin erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((player getVariable [""admin_level"", 0]) > 0) then {systemChat _admin;};
		};

		case 5: {
			private[""_message""];
			_message = format[""!!!NOTRUF!!!: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>You<br/><t color='#33CC33'>von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Notruf von %1"",_from]]] call bis_fnc_showNotification;
		};
		case 6 : {
			if(!(player getvariable[""onDuty"", false])) exitWith {};
			private[""_message""];
			_message = format[""AAC Notruf von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Neuer Auftrag<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>An AAC<br/><t color='#33CC33'>von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""AAC Auftrag von: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		case 7 : {
			if ((""civ_rebel"" in (player getVariable [""licenses"", []]))) then{
				private[""_message"",""_marker""];
				_marker = createMarkerLocal [""Schwarzmarkt"", (_this select 3)];
				_marker setMarkerTypeLocal ""mil_destroy"";
				_marker setMarkerSizeLocal [1.25, 1.25];
				_marker setMarkerColorLocal ""ColorRed"";
				_marker setMarkerTextLocal ""Schwarzmarkt"";
				_message = format[""Der Untergrund informiert :%1"",_msg];
				hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Untergrund Info<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>an alle Rebellen<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
				[""TextMessage"",[format[""Der Untergrund informiert""]]] call bis_fnc_showNotification;
				systemChat _message;
			};
		};
		case 8 : {
			if ((""civ_rebel"" in (player getVariable [""licenses"", []]))) then{
				private[""_message""];
				_message = format[""Der Untergrund informiert :%1"",_msg];
				hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Untergrund Info<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>an alle Rebellen<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
				[""TextMessage"",[format[""Der Untergrund informiert""]]] call bis_fnc_showNotification;
				systemChat _message;
			};
		};
		case 9 : {
			private[""_message""];
			_message = format[""Achtung! %1"",_msg];
			systemChat _message;
			if(_from == ""Restart"") then {
			uisleep 30;
			(findDisplay 46) closeDisplay 0;
			};
		};
		case 10 : {
				private[""_message""];
				_message = format[""Rundschreiben der Nationalgarde :%1"",_msg];
				hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Notstand<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>Alle Bürger<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
				[""TextMessage"",[format[""Rundschreiben der Nationalgarde""]]] call bis_fnc_showNotification;
				systemChat _message;
		};
		case 11 : {
				private[""_message""];
				_message = format[""Rundschreiben der Nationalgarde :%1"",_msg];
				hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Notstand<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>Alle Gardisten<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
				[""TextMessage"",[format[""Rundschreiben der Nationalgarde""]]] call bis_fnc_showNotification;
				systemChat _message;
		};
	};
";
publicVariable "TON_fnc_clientMessage";

CC_fnc_VehFuelSave =
compileFinal "
    if(isServer) then {
        params [
            [""_vehicle"",ObjNull,[ObjNull]]
        ];
        _vehicle addEventHandler[""GetOut"", {
            if(isServer) then {
                _vehicle = _this select 0;
                if(isNull _vehicle) exitWith {};
                _array = (_vehicle getVariable[""dbInfo"",[]]);
                _array params [[""_plate"",0,[0]],[""_uid"","""",[""""]]];
                if(_plate == 0) exitWith {};
                _fuelvalue = fuel _vehicle;
                _query = format[""UPDATE vehicles SET fuel='%3' WHERE pid='%1' AND plate='%2'"",_uid,_plate,_fuelvalue];
                waitUntil{sleep (random 0.3); !DB_Async_Active};
                _queryResult = [_query,1] call DB_fnc_asyncCall;
            };
        }];
    };
";
publicVariable "CC_fnc_VehFuelSave";
