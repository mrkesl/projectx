/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
#define ST_MULTI 16  // multi-line textbox
class life_fnc_admin_db_menu {
	idd = 18050;
	name = "life_fnc_admin_db_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[0] spawn life_fnc_admin_db_menu;";

/*### Backgrounds ###*/

class controlsBackground {

	class db_adminmenu_main_background: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.269 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.517 * safezoneH;
		colorBackground[] = {0,0,0,0.75};
	};
	class db_adminmenu_main_header_back: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.1766 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.5,0,0,0.75};
	};
	class db_adminmenu_main_header_text: Life_RscText
	{
		idc = -1;
		text = "RedisDB Adminmenu by Creedcoder & Larvell";
		x = 0.135989 * safezoneW + safezoneX;
		y = 0.180074 * safezoneH + safezoneY;
		w = 0.1975 * safezoneW;
		h = 0.0357778 * safezoneH;
	};
	class db_adminmenu_main_menubar_back: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.2228 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.2,0.2,0.2,0.75};
	};
	class db_adminmenu_frame: Life_RscFrame
	{
		idc = -1;
		x = 0.139062 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.711563 * safezoneW;
		h = 0.506 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class db_adminmenu_source_list_title: Life_RscText
	{
		idc = -1;
		text = "Choose Source";
		x = 0.183397 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class db_adminmenu_info_title: Life_RscText
	{
		idc = -1;
		text = "Key Informations";
		x = 0.460812 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0773437 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class db_adminmenu_key_controls_title: Life_RscText
	{
		idc = -1;
		text = "Key Controls";
		x = 0.744152 * safezoneW + safezoneX;
		y = 0.641059 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class db_adminmenu_admin_lvl_title: Life_RscText
	{
		idc = -1;
		text = "Adminlevel";
		x = 0.747677 * safezoneW + safezoneX;
		y = 0.28559 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
};

/*### controls ###*/

class controls {

	class db_adminmenu_main_closeall: Life_RscButtonMenu
	{
		idc = -1;
		text = "X";
		x = 0.841343 * safezoneW + safezoneX;
		y = 0.181 * safezoneH + safezoneY;
		w = 0.0123958 * safezoneW;
		h = 0.023963 * safezoneH;
		tooltip = "Schließe das Adminmenu";
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "closeDialog 0;";
	};
	class db_adminmenu_main_menubar_basics: Life_RscButtonMenu
	{
		idc = -1;
		text = "Basics";
		x = 0.135971 * safezoneW + safezoneX;
		y = 0.2338 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "closeDialog 0; createDialog ""life_fnc_admin_menu"";";
		tooltip = "Wechsel zum Basic Adminmenü";
	};
	class db_adminmenu_source_list: Life_RscCombo
	{
		idc = 18051;
		x = 0.156247 * safezoneW + safezoneX;
		y = 0.330729 * safezoneH + safezoneY;
		w = 0.123399 * safezoneW;
		h = 0.0188079 * safezoneH;
		onLBSelChanged="[1] call life_fnc_admin_db_menu;";
	};
	class db_adminmenu_player_list: Life_RscListbox
	{
		idc = 18052;
		x = 0.144219 * safezoneW + safezoneX;
		y = 0.368 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.33 * safezoneH;
		sizeEx = 0.03;
		colorText[] = {0,1,0,1};
		colorBackground[] = {0,0,0,0.75};
		onLBSelChanged="[2] call life_fnc_admin_db_menu;";
	};
	class db_adminmenu_load_key: Life_RscButtonMenu
	{
		idc = -1;
		text = "Load Key";
		x = 0.164844 * safezoneW + safezoneX;
		y = 0.742 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[3] spawn life_fnc_admin_db_menu;";
		tooltip = "Lade den angegebenen Key aus der DB";
	};
	class db_adminmenu_key: Life_RscEdit
	{
		idc = 18053;
		text = "76561197974753800_CIV";
		x = 0.144219 * safezoneW + safezoneX;
		y = 0.709 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class db_adminmenu_key_info : Life_RscControlsGroup {
		idc = -1;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.451 * safezoneH;
		colorText[] = {0,1,0,1};
		colorBackground[] = {0,0,0,0.75};
		class HScrollbar : HScrollbar {
			height = 0;
		};
		class controls {
			class db_adminmenu_key_info_text: Life_RscEdit
			{
				style = ST_MULTI;
				idc = 18054;
				text = "Lade einen Key aus der DB.";
					x = 0;
					y = 0;
					w = 0.4 * safezoneW;
					h = 1;
				sizeEx = 0.035;
				colorText[] = {0,1,0,1};
				colorBackground[] = {0,0,0,0.75};
			};
		};
	};
	class db_adminmenu_save_key: Life_RscButtonMenu
	{
		idc = 18057;
		text = "Save Key";
		x = 0.726524 * safezoneW + safezoneX;
		y = 0.697482 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[4] spawn life_fnc_admin_db_menu;";
		tooltip = "Speichere den Key";
	};
	class db_adminmenu_reload_player: Life_RscButtonMenu
	{
		idc = 18058;
		text = "Reload Player";
		x = 0.726524 * safezoneW + safezoneX;
		y = 0.735098 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[5] spawn life_fnc_admin_db_menu;";
		tooltip = "Zwinge Spieler neu zu Laden";
	};
};
};
