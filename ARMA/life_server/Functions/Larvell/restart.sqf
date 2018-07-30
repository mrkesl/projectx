/*
	restart.sqf
	Author: Creedcoder
*/
restart_times = [4,8,12,16,20,24];

true spawn {
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 30
 };
 _msg = "30 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 45
 };
 _msg = "15 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 50
 };
 _msg = "10 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 55
 };
 _msg = "5 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 56
 };
 _msg = "4 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 57
 };
 _msg = "3 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 5;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 58
 };
 _msg = "2 Minuten bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 0.2;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 59
 };
 _msg = "1 Minute bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
 waituntil{
  sleep 0.2;
  _timestr = "time" callExtension "";
  _timeh = (parseNumber (_timestr select [0,2])) + 1;
  _timem = parseNumber (_timestr select [3,2]);
  _times = parseNumber (_timestr select [6,2]);
  hintSilent _timestr;
  _timeh in restart_times AND _timem == 59 AND _timem == 30;
  [] remoteExec ["REDIS_fnc_save", allplayers, false];
 };
 _msg = "30 Sekunden bis zum Server Restart!";
 [_msg,"Server",9] remoteExec ["TON_fnc_clientMessage", 0, false];
};
