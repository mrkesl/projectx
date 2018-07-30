[] spawn  {
        while{true}do{
                if(player getvariable["hunger", 100] < 1) then {
                        player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";
                }else{
                        player setvariable["hunger",(player getvariable["hunger", 100]) - 1, true];
                        [] call life_fnc_hudUpdate;
                        if(player getvariable["hunger", 100] < 1) then {
                                player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";
                        };
                        switch(player getvariable["hunger", 100]) do {
                                case 30: {hint localize "STR_NOTF_EatMSG_1";};
                                case 20: {hint localize "STR_NOTF_EatMSG_2";};
                                case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
                        };
                };
                uisleep 240;
        };
};
[] spawn {
    private["_fnc_battery"];
        while{true}do{
                if(player getvariable["thirst", 100] < 1) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";
                }else{
                        player setvariable["thirst",(player getvariable["thirst", 100]) - 2, true];
                        [] call life_fnc_hudUpdate;
                        if(player getvariable["thirst", 100] < 1) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
                        switch(player getvariable["thirst", 100]) do{
                                case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
                                case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
                                case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
                        };
                };
                uisleep 240;
        };
};

[] spawn
{
        private["_bp","_load","_cfg"];
        while{true} do
        {
                waitUntil {backpack player != ""};
                _bp = backpack player;
                _cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
                _load = round(_cfg / 8);
                if (backpack player == "B_Bergen_blk") then { _load = 66; };
                if (backpack player == "B_Carryall_oucamo") then { _load = 66; }; //66 ist die größe vom rucksack
                if (backpack player == "B_Carryall_mcamo") then { _load = 66; };
                if (backpack player == "B_Carryall_oli") then { _load = 66; };
                if (backpack player == "B_Carryall_khk") then { _load = 66; };
                if (backpack player == "B_Carryall_cbr") then { _load = 66; };
                if (backpack player == "B_Carryall_ocamo") then { _load = 66; };
                life_maxWeight = life_maxWeightT + _load;
                waitUntil {backpack player != _bp};
                if(backpack player == "") then
                {
                        life_maxWeight = life_maxWeightT;
                };
        };
};
[] spawn
{
        while {true} do
        {
                sleep 1.5;
                if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
                        player forceWalk true;
                        player setFatigue 1;
                        hint localize "STR_NOTF_MaxWeight";
                } else {
                        if(isForcedWalk player) then {
                                player forceWalk false;
                        };
                };
        };
};
[] spawn
{
        private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
        _walkDis = 0;
        _myLastPos = (getPos player select 0) + (getPos player select 1);
        _MaxWalk = 1200;
        while{true} do
        {
                uisleep 0.5;
                if(!alive player) then {_walkDis = 0;}
                else
                {
                        _CurPos = (getPos player select 0) + (getPos player select 1);
                        if((_CurPos != _myLastPos) && (vehicle player == player)) then
                        {
                                _walkDis = _walkDis + 1;
                                if(_walkDis == _MaxWalk) then
                                {
                                        _walkDis = 0;
                                        player setvariable["hunger",(player getvariable["hunger", 100]) - 5, true];
                                        player setvariable["thirst",(player getvariable["thirst", 100]) - 7, true];
                                        [] call life_fnc_hudUpdate;
                                };
                        };
                        _myLastPos = (getPos player select 0) + (getPos player select 1);
                };
        };
};
//part of alcohol system written by [midgetgrimm]
[] spawn
{
        while {true} do
        {
                waitUntil {(life_drink > 0)};
                while{(life_drink > 0)} do {

                        if(life_drink > 0.08) then {
                        "radialBlur" ppEffectEnable true;
                        "radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
                        "radialBlur" ppEffectCommit 3;
                        uisleep 240;
                        life_drink = life_drink - 0.02;
                        } else {
                        "radialBlur" ppEffectEnable true;
                        "radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
                        "radialBlur" ppEffectCommit 1;
                        uisleep 180;
                        life_drink = life_drink - 0.02;
                        };
                };

                "radialBlur" ppEffectAdjust  [0,0,0,0];
                "radialBlur" ppEffectCommit 5;
                "radialBlur" ppEffectEnable false;
                life_drink = 0;

        };
};
true spawn {
 while {true} do {
  uiSleep 60;
  player setVariable ["playtime", (player getVariable ["playtime", 0]) + (1/60)];
 };
};
[] execVM "briefing.sqf"; //Load Briefing
[] spawn
{
while {true} do
{
sleep 1.5;
if(life_inv_uranium2 != 0) then {
player forceWalk true;
player setFatigue 1;
hint "Meine Güte, das ist aber schwer! Schnell laufen kann man damit aber nicht!";
} else {
if(isForcedWalk player) then {
player forceWalk false;
};
};
};
};
[] spawn {
while {true} do {
  private["_damage","_rad"];
  uisleep 1;
  _rad = false;
  while {((player distance (getMarkerPos "Warm_Marker") < 300) && (player getVariable["Revive",TRUE]))} do {
   if(!_rad) then {
    _rad = true;
    "colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
    "colorCorrections" ppEffectCommit 5;
    "colorCorrections" ppEffectEnable true;

    "dynamicBlur" ppEffectAdjust [random 0.3];
    "dynamicBlur" ppEffectCommit 5;
    "dynamicBlur" ppEffectEnable true;
    "filmGrain" ppEffectAdjust [0.02, 1, 2.5, 0.5, 1, true];
    "filmGrain" ppEffectCommit 5;
    "filmGrain" ppEffectEnable true;
   };
   playsound "ractive";
   if((uniform player == "U_C_Scientist") && (headgear player == "H_PilotHelmetFighter_B")) then {
    hint "Du betrittst die Radioaktive Sperrzone!";
    uisleep 5;
   } else {
    hint "Du betrittst die Radioaktive Sperrzone! Hast du an deine Schutzkleidung gedacht?";
    _damage = damage player;
    _damage = _damage + 0.1;
    player setDamage (_damage);
    [] call life_fnc_hudUpdate;
    uisleep 5;
   };
  };
  if(_rad) then {
   "dynamicBlur" ppEffectAdjust [0];
   "dynamicBlur" ppEffectCommit 5;
   "dynamicBlur" ppEffectEnable true;
   "colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
   "colorCorrections" ppEffectCommit 10;
   "colorCorrections" ppEffectEnable TRUE;
   "filmGrain" ppEffectAdjust [0.001, 0.001, 0.001, 0.001, 0.001, true];
   "filmGrain" ppEffectCommit 5;
   "filmGrain" ppEffectEnable true;
   uisleep 10;
   "dynamicBlur" ppEffectEnable false;
   "filmGrain" ppEffectEnable false;
   "colorCorrections" ppEffectEnable false;
  };
 };
};
