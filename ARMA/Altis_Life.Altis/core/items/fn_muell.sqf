/*
File: fn_kokain.sqf
Description:
Kokain effecte vom weed script.
*/
closeDialog 0;
hint "Was da wohl drin war?";
playsound "drug";
player setFatigue 1;
sleep 5;
life_Junkie = 1;
player setFatigue 1;
"colorCorrections" ppEffectEnable true;
"chromAberration" ppEffectEnable true;
for "_i" from 0 to 44 do
{
addcamShake[random 3, 1, random 3];
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectAdjust [random 15 / 32, random 15 / 32, false];
"chromAberration" ppEffectCommit (0.3 + random 0.1);
player setFatigue 1;
sleep 1;
};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
resetCamShake; 
player setFatigue 0;
life_Junkie = 0;