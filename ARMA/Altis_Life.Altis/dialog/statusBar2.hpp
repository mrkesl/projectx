#define ST_RIGHT 0x01
class osefStatusBar2 {
idd = -1;
onLoad = "uiNamespace setVariable ['osefStatusBar2', _this select 0]";
onUnload = "uiNamespace setVariable ['osefStatusBar2', objNull]";
onDestroy = "uiNamespace setVariable ['osefStatusBar2', objNull]";
fadein = 0;
fadeout = 0;
duration = 15;
movingEnable = 0;
controlsBackground[] = {};
objects[] = {};
class controls {
class statusBarText {
idc = 1001;
x = safezoneX + safezoneW - 1;
y = safezoneY + safezoneH - 0.04;
w = 1;
h = 0.04;
shadow = 2;
colorBackground[] = { 1, 0.3, 0, 0.0 }; // uncomment and increase 4th number to have a background
font = "PuristaSemibold";
size = 0.03;
type = 13;
style = 1;
text="Lade Spielerinfo...";
class Attributes {
align="right";
color = "#FFFFFF";
};
};
};
};