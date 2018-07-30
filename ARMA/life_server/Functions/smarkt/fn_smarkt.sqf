comment "Server spawnt den Schwarzmarkt";
uisleep 1800;
_buycounter = 5;
_buyarray = [];
_timeout = 3600;
_posarray = [
[[4765.61,21931.2,0.269318], 146.279],
[[9400.33,20316.3,1.53883], 81.8596],
[[23355.7,24200.9,0.194902], 171.375],
[[28293.3,25783.1,0.29218], 59.6407],
[[28070.3,23760.6,0.0858927], 267.541],
[[25411.9,20324.3,0.00145817], 284.183],
[[23992.2,15444,0.259855], 275.193],
[[22348.7,14142.9,0.215227], 25.2112],
[[22775.1,13573.7,0.00145721], 277.204],
[[22657.5,7782.65,0.279129], 91.9082],
[[19594.9,6631.65,0.00135803], 9.10575],
[[14894.9,11056.4,0.240544], 353.387],
[[21589.1,11048,0.00128555], 253.282],
[[21114.5,11947.8,0.120605], 133.572],
[[10054.2,10170.4,0.00134182], 41.5809],
[[8079.98,14430.3,0.0012207], 329.868],
[[7738.68,10700.6,0.458448], 158.944],
[[4760.72,10315.1,0.226686], 222.041],
[[2735.8,9895.69,0.220311], 218.821],
[[2698.96,11490.3,0.93116], 220.703],
[[7327.56,13989.2,0.20282], 202.427],
[[6398.47,12303.2,0.00138855], 15.0536],
[[17078.5,21997.5,0.074111], 305.784],
[[2074.19,22187.1,0.245613], 113.538]
];
_posdir = _posarray select floor random count _posarray;
_posdir params ["_pos", "_dir"];

_unit = ("I_G_Soldier_exp_F") createUnit [_pos,createGroup independent,";
removeAllWeapons this;
removeBackpack this;
this allowDamage false;
this addAction[""Schwarzmarkt"",{
_buycounter = missionNamespace getVariable[""Schwarzmarkt_BuyCounter"",-1];
_buyarray = missionNamespace getVariable[""Schwarzmarkt_BuyArray"",[]];
_id = getPlayerUID player;
if(_buycounter < 0 && !(_id in _buyarray)) exitWith {Hint ""Waffen? Ich? Nein, ich verkaufe keine Waffen!""};
if !(_id in _buyarray) then {
	_buycounter = _buycounter - 1;
	_buyarray pushBack _id;
	[""Schwarzmarkt_BuyCounter"",_buycounter] remoteExec [""life_fnc_netSetVar"", 0, true];
	[""Schwarzmarkt_BuyArray"",_buyarray] remoteExec [""life_fnc_netSetVar"", 0, true];
};
["""",0,0,""waffenh""] spawn life_fnc_weaponShopMenu;
},nil,1.5,true,true,"""",""player distance _target < 4""];
this setPosATL "+(str _pos)+";
_nul = this spawn {uisleep 5; _this setDir "+(str _dir)+"; _this enableSimulation false};
"];

["Schwarzmarkt_BuyCounter",_buycounter] remoteExec ["life_fnc_netSetVar", 0, true];
["Schwarzmarkt_BuyArray",_buyarray] remoteExec ["life_fnc_netSetVar", 0, true];

_msg = "Geheime Info : Es ist ein geheimer Waffenhändler auf der Insel! Die Position wurde an dein GPS übermittelt!";
[_msg,"dummy",7,_pos] remoteExec ["TON_fnc_clientMessage", 0, true];

_timeout spawn {
	_time = time + _this;
	waitUntil {uisleep 10; time > _time};
	["Schwarzmarkt_BuyCounter", -1] remoteExec ["life_fnc_netSetVar", 0, true];
	["Schwarzmarkt_BuyArray", []] remoteExec ["life_fnc_netSetVar", 0, true];
};
