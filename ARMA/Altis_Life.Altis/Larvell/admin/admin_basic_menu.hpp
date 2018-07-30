/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
class life_fnc_admin_menu {
	idd = 18000;
	name = "life_fnc_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[0] spawn life_fnc_admin_menu;";

/*### Backgrounds ###*/

class controlsBackground {

	class basics_adminmenu_main_background: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.269 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.517 * safezoneH;
		colorBackground[] = {0,0,0,0.85};
	};
	class basics_adminmenu_main_header_back: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.1766 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.5,0,0,0.75};
	};
	class basics_adminmenu_main_header_text: Life_RscText
	{
		idc = -1;
		text = "RedisDB Adminmenu by Creedcoder & Larvell";
		x = 0.135989 * safezoneW + safezoneX;
		y = 0.180074 * safezoneH + safezoneY;
		w = 0.1975 * safezoneW;
		h = 0.0357778 * safezoneH;
	};
	class basics_adminmenu_main_menubar_back: Life_RscText
	{
		idc = -1;
		x = 0.133906 * safezoneW + safezoneX;
		y = 0.2228 * safezoneH + safezoneY;
		w = 0.721875 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0.2,0.2,0.2,0.75};
	};
	class basics_adminmenu_players_list_frame: Life_RscFrame
	{
		idc = -1;
		x = 0.139062 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.495 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class basics_adminmenu_players_list_title: Life_RscText
	{
		idc = -1;
		text = "Playerlist";
		x = 0.183397 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_players_info_frame: Life_RscFrame
	{
		idc = -1;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.278437 * safezoneW;
		h = 0.495 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class basics_adminmenu_players_info_title: Life_RscText
	{
		idc = -1;
		text = "Playerinfo";
		x = 0.338094 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_players_money_title: Life_RscText
	{
		idc = -1;
		text = "Playermoney";
		x = 0.477292 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_players_lvl_title: Life_RscText
	{
		idc = -1;
		text = "Playerlevels";
		x = 0.479375 * safezoneW + safezoneX;
		y = 0.4296 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_admin_frame: Life_RscFrame
	{
		idc = -1;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.278437 * safezoneW;
		h = 0.495 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class basics_adminmenu_players_admin_keys: Life_RscText
	{
		idc = -1;
		text = "Admin Keys";
		x = 0.477312 * safezoneW + safezoneX;
		y = 0.5946 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_admin_veh_title: Life_RscText
	{
		idc = -1;
		text = "Vehiclelist";
		x = 0.623727 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class basics_adminmenu_admin_keys_title: Life_RscText
	{
		idc = -1;
		text = "More Admin Keys";
		x = 0.755733 * safezoneW + safezoneX;
		y = 0.2844 * safezoneH + safezoneY;
		w = 0.0773437 * safezoneW;
		h = 0.033 * safezoneH;
	};
};
/*### controls ###*/
class controls {
	class basics_adminmenu_main_closeall: Life_RscButtonMenu
	{
		idc = -1;
		text = "X";
		x = 0.841343 * safezoneW + safezoneX;
		y = 0.181 * safezoneH + safezoneY;
		w = 0.0123958 * safezoneW;
		h = 0.023963 * safezoneH;
		tooltip = "Schließe das Adminmenü";
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "closeDialog 0;";
	};
	class basics_adminmenu_main_menubar_db: Life_RscButtonMenu
	{
		idc = -1;
		text = "DB Configuration";
		x = 0.762969 * safezoneW + safezoneX;
		y = 0.236 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "closeDialog 0; createDialog ""life_fnc_admin_db_menu"";";
		tooltip = "Öffme dem DB Configuration Bildschirm";
	};
	class basics_adminmenu_players_list: Life_RscListbox
	{
		idc = 18001;
		x = 0.144219 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.319 * safezoneH;
		colorText[] = {1,1,0,1};
		colorBackground[] = {0,0,0,0.75};
		sizeEx = 0.03;
		onLBSelChanged="[1] call life_fnc_admin_menu;";
	};
	class basics_adminmenu_players_spectate: Life_RscButtonMenu
	{
		idc = -1;
		text = "Spectate Player";
		x = 0.164844 * safezoneW + safezoneX;
		y = 0.665 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[2] spawn life_fnc_admin_menu;";
		tooltip = "Beobachte den gewählten Spieler";
	};
	class basics_adminmenu_players_tel2player: Life_RscButtonMenu
	{
		idc = -1;
		text = "Teleport to Player";
		x = 0.164844 * safezoneW + safezoneX;
		y = 0.698 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[3] spawn life_fnc_admin_menu;";
		tooltip = "Teleportiere zum gewählten Spieler";
	};
	class basics_adminmenu_players_tel2me: Life_RscButtonMenu
	{
		idc = -1;
		text = "Teleport to Me";
		x = 0.164844 * safezoneW + safezoneX;
		y = 0.731 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[4] spawn life_fnc_admin_menu;";
		tooltip = "Teleportiere gewählten Spieler zu dir";
	};
	class basics_adminmenu_players_info_field : Life_RscControlsGroup {
		idc = -1;
		x = 0.298906 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.429 * safezoneH;
		class HScrollbar : HScrollbar {
			height = 0;
		};
		class controls {
			class basics_adminmenu_players_info_text: Life_RscStructuredText
			{
				idc = 18002;
					text = "Wähle einen Spieler aus der Spielerliste aus.";
					x = 0;
					y = 0;
					w = 0.144 * safezoneW;
					h = 1;
				colorText[] = {1,1,0,1};
				colorBackground[] = {0,0,0,0.75};
			};
		};
	};
	class basics_adminmenu_players_addmoney_box: Life_RscEdit
	{
		idc = 18003;
		text = "100000";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class basics_adminmenu_players_addcash_button: Life_RscButtonMenu
	{
		idc = -1;
		text = "Add Player Cash";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.368 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[5] spawn life_fnc_admin_menu;";
		tooltip = "Die eingetragene Menge an Geld dem Spieler hinzufügen.";
	};
	class basics_adminmenu_players_addbank_button: Life_RscButtonMenu
	{
		idc = -1;
		text = "Add Player Bank";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.401 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[6] spawn life_fnc_admin_menu;";
		tooltip = "Die eingetragene Menge an Geld dem Spieler auf der Bank hinzufügen.";
	};
	class basics_adminmenu_players_lvl_box: Life_RscEdit
	{
		idc = 18004;
		text = "0";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.467 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class basics_adminmenu_players_lvl_cop: Life_RscButtonMenu
	{
		idc = -1;
		text = "Set CopLVL";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[7] spawn life_fnc_admin_menu;";
		tooltip = "Setze den entsprechende Coplevel für den Spieler";
	};
	class basics_adminmenu_players_lvl_med: Life_RscButtonMenu
	{
		idc = -1;
		text = "Set MedicLVL";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.533 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[8] spawn life_fnc_admin_menu;";
		tooltip = "Setze den entsprechende Mediclevel für den Spieler";
	};
	class basics_adminmenu_players_lvl_aac: Life_RscButtonMenu
	{
		idc = -1;
		text = "Set AACLVL";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.566 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[9] spawn life_fnc_admin_menu;";
		tooltip = "Setze den entsprechende AAClevel für den Spieler";
	};
	class basics_adminmenu_players_showgear: Life_RscButtonMenu
	{
		idc = -1;
		text = "Show Player Gear";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.632 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[10] spawn life_fnc_admin_menu;";
		tooltip = "Zeige Inventar des gewählten Spielers";
	};
	class basics_adminmenu_players_heal: Life_RscButtonMenu
	{
		idc = -1;
		text = "Heal/Revive Player";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.665 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[11] spawn life_fnc_admin_menu;";
		tooltip = "Gewählten Spieler wiederbeleben oder heilen.";
	};
	class basics_adminmenu_players_troll: Life_RscButtonMenu
	{
		idc = -1;
		text = "Troll to Jail";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.698 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[12] spawn life_fnc_admin_menu;";
		tooltip = "Schicke den Troll für 15 Minuten ins die Besserungsanstalt";
	};
	class basics_adminmenu_players_freeze: Life_RscButtonMenu
	{
		idc = -1;
		text = "Freeze Player";
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.731 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[13] spawn life_fnc_admin_menu;";
		tooltip = "Den gewählten Spieler einfrieren";
	};
	class basics_adminmenu_admin_veh_list: Life_RscListbox
	{
		idc = 18005;
		x = 0.578293 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.396 * safezoneH;
		sizeEx = 0.03;
		colorText[] = {1,1,0,1};
		colorBackground[] = {0,0,0,0.75};
	};
	class basics_adminmenu_admin_veh_spawn: Life_RscButtonMenu
	{
		idc = -1;
		text = "Spawn Vehicle";
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.731 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[14] spawn life_fnc_admin_menu;";
		tooltip = "Lass das ausgwählte Fahrzeug erscheinen";
	};
	class basics_adminmenu_admin_moneyadd: Life_RscEdit
	{
		idc = 18006;
		text = "100000";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class basics_adminmenu_admin_key_cash: Life_RscButtonMenu
	{
		idc = -1;
		text = "Set Admin Cash";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[15] spawn life_fnc_admin_menu;";
		tooltip = "Setze dein Geld auf den eingetragenen Wert";
	};
	class basics_adminmenu_admin_key_bank: Life_RscButtonMenu
	{
		idc = -1;
		text = "Set Admin Bank";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.39 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[16] spawn life_fnc_admin_menu;";
		tooltip = "Setze deine Bank auf den eingetragenen Wert";
	};
	class basics_adminmenu_admin_key_licenses: Life_RscButtonMenu
	{
		idc = -1;
		text = "Give All Licenses";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.423 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[17] spawn life_fnc_admin_menu;";
		tooltip = "Gib dir selbst alle Lizenzen";
	};
	class basics_adminmenu_admin_key_loadout: Life_RscButtonMenu
	{
		idc = -1;
		text = "Get Loadout";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.456 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[18] spawn life_fnc_admin_menu;";
		tooltip = "Lade dein vordifiniertes Setup";
	};
	class basics_adminmenu_admin_key_teleport_map: Life_RscButtonMenu
	{
		idc = -1;
		text = "Teleport Map";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.489 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[19] spawn life_fnc_admin_menu;";
		tooltip = "Teleportiere dich Selbst auf einen Punkt auf der Karte";
	};
	class basics_adminmenu_admin_key_free2: Life_RscButtonMenu
	{
		idc = -1;
		text = "-";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.522 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[20] spawn life_fnc_admin_menu;";
		tooltip = "";
	};
	class basics_adminmenu_admin_key_create_medic: Life_RscButtonMenu
	{
		idc = -1;
		text = "Create Medic";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {1,0,1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[21] spawn life_fnc_admin_menu;";
		tooltip = "Erstelle / Überschreibe den Medic Spielstand des gewählten Spielers";
	};
	class basics_adminmenu_admin_key_create_cop: Life_RscButtonMenu
	{
		idc = -1;
		text = "Create Cop";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.588 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {1,0,1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[22] spawn life_fnc_admin_menu;";
		tooltip = "Erstelle / Überschreibe den Cop Spielstand des gewählten Spielers";
	};
	class basics_adminmenu_admin_key_god: Life_RscButtonMenu
	{
		idc = -1;
		text = "God Mode Toggle";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.621 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[23] spawn life_fnc_admin_menu;";
		tooltip = "Den Godmode umschalten";
	};
	class basics_adminmenu_admin_key_car: Life_RscButtonMenu
	{
		idc = -1;
		text = "Car God Toggle";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[24] spawn life_fnc_admin_menu;";
		tooltip = "Den Cargodmode umschalten";
	};
	class basics_adminmenu_admin_key_freeze: Life_RscButtonMenu
	{
		idc = -1;
		text = "Freeze all Players";
		x = 0.742344 * safezoneW + safezoneX;
		y = 0.687 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.5,-1,-1,0.5};
		class Attributes
		{
			align = "center";
		};
		onButtonClick = "[25] spawn life_fnc_admin_menu;";
		tooltip = "Alle Spieler einfrieren";
	};
};
};
