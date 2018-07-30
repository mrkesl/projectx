#include <macro.h>
/*

	file: fn_newMsg.sqf
	Author: Silex

*/
params [["_type", -1, [0]], ["_playerData", -1, [0]], ["_msg", "", [""]]];
private["_to","_count"];
disableSerialization;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if(((player getVariable ["admin_level", 0]) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[88885, true];};
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages", 2, false];
		hint format["Du hast eine Nachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg];
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Nationalgarde ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888895,true];};
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages", 2, false];
		_to = "An die Nationalgarde";
		hint format["Du hast eine Nachricht an %1 gesendet %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888896,true];};
		[ObjNull,_msg,player,2] remoteExec ["TON_fnc_handleMessages", 2, false];
		_to = "An Admin";
		hint format["Du hast eine Nachricht an %1 gesendet : %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888899,true];};
		[ObjNull,_msg,player,3] remoteExec ["TON_fnc_handleMessages", 2, false];
		hint format["Du hast den Notartzt gerufen.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((player getVariable ["admin_level", 0]) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages", 2, false];
		hint format["Admin Nachricht gesendet an: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if(((player getVariable ["admin_level", 0]) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
			if(((player getVariable ["cop_level", 0]) < 5)) then {ctrlShow[888901,false];} else {ctrlShow[888901,true];};
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
			ctrlShow[888901,true];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((player getVariable ["admin_level", 0]) < 1) exitWith {hint "You are not an admin!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages", 2, false];
		hint format["Admin an alle: %1",_msg];
		closeDialog 887890;
	};
	//aacrequest
	case 8:
	{
		_count = {_x getvariable["onDuty", false]} count allPlayers;
		if (player getvariable["onDuty", false]) exitWith {hint format["Du kannst dir selbst helfen!"];};
		if(_count == 0) exitWith {hint format["Zurzeit ist kein AAC im Dienst. Bitte probiere es später nochmal."];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888900,true];};
		//[ObjNull,_msg,player,6] remoteExec ["TON_fnc_handleMessages", 2, false];
		[player,name player,_msg,getposATL player] remoteExec ["life_fnc_aac_newtask", -2, false];
		hint format["Notruf wurde abgesetzt.",_msg];
		closeDialog 887890;
	};
	//untergrund informiert
	case 9:
	{
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,7] remoteExec ["TON_fnc_handleMessages", 2, false];
		hint format["Nachricht wurde abgesetzt.",_msg];
		closeDialog 887890;
	};
};
