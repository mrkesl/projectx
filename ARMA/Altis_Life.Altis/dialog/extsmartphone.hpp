/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
#define ST_MULTI 16  // multi-line textbox
class life_ext_messenger {
	idd = 17000;
	name = "life_ext_messenger_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[1] spawn life_fnc_extsmartphone;";

/*### Backgrounds ###*/

	class controlsBackground {
		class extBackground: Life_RscText
		{
			idc = 17001;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.66};
		};
		class extHeader: Life_RscText
		{
			idc = 17002;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.1876 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
			sizeEx = 1 * GUI_GRID_H;
		};
		class extContactFrame: Life_RscFrame
		{
			idc = 17003;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.528 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
		};
		class extMsgFrame: Life_RscFrame
		{
			idc = 17012;
			x = 0.417502 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.528 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
		};
		class extMsgCentHead: Life_RscText
		{
			idc = 17016;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
		};
		class extBGHelp: Life_RscText
		{
			idc = 17019;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.66};
		};
		class extBGHelpHead: Life_RscText
		{
			idc = 17020;
			x = 0.711408 * safezoneW + safezoneX;
			y = 0.1876 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
			sizeEx = 1 * GUI_GRID_H;
		};
		class extShowMsgFullHead: Life_RscText
		{
			idc = 17026;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
		};
		class extAddNewBack: Life_RscText
		{
			idc = 17029;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.66};
		};
		class extAddNewHead: Life_RscText
		{
			idc = 17030;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.1876 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
			sizeEx = 1 * GUI_GRID_H;
		};
		class extDelNumHead: Life_RscText
		{
			idc = 17036;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.4076 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
			sizeEx = 1 * GUI_GRID_H;
		};
		class extDelNumBack: Life_RscText
		{
			idc = 17037;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.66};
		};
		class extAnoBack: Life_RscText
		{
			idc = 17047;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.66};
		};
		class extHeadAno: Life_RscText
		{
			idc = 17046;
			x = 0.123595 * safezoneW + safezoneX;
			y = 0.6276 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0.3,0.3,0.75};
			sizeEx = 1 * GUI_GRID_H;
		};
	};

/*### controls ###*/

	class controls {
		class extContacts: Life_RscListbox
		{
			idc = 17004;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.275 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 0.03;
			rowHeight = 0.031;
			wholeHeight = 0.031;
			onLBSelChanged="[3] call life_fnc_extsmartphone;";
		};
		class extListfilter: Life_RscCombo
		{
			idc = 17005;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			onLBSelChanged="[2] call life_fnc_extsmartphone;";
		};
		class extClosebutton: Life_RscButtonMenu
		{
			idc = 17006;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class extSendMsg: Life_RscButtonMenu
		{
			idc = 17007;
			text = "Senden";
			x = 0.326749 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0578125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Nachricht an ausgewaehlte Person Senden";
			onButtonClick = "[8] spawn life_fnc_extsmartphone;";
			class Attributes
			{
				align = "center";
			};
		};
		class extHeaderText: Life_RscText
		{
			idc = 17008;
			text = "Satellite Messenger";
			x = 0.297875 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extHelp: Life_RscButtonMenu
		{
			idc = 17009;
			text = "Hilfe";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			tooltip = "Hier erhaelst du eine kleine Hilfe zu unserem Extended SQL Messenger";
			onButtonClick = "[11] spawn life_fnc_extsmartphone;";
			class Attributes
			{
				align = "center";
			};
		};
		class extContactAdd: Life_RscButtonMenu
		{
			idc = 17010;
			text = "Verwalten";
			x = 0.326751 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0582812 * safezoneW;
			h = 0.0229259 * safezoneH;
			tooltip = "Kontakte Verwalten";
			onButtonClick = "[6] spawn life_fnc_extsmartphone;";
		};
		class extContactsText: Life_RscText
		{
			idc = 17011;
			text = "Kontakte";
			x = 0.322622 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.06;
		};
		class extMsgText: Life_RscText
		{
			idc = 17013;
			text = "Nachrichten";
			x = 0.424721 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.06;
		};
		class extEmergencyCall: Life_RscButtonMenu
		{
			idc = 17014;
			text = "Notruf";
			x = 0.33499 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,0.75};
			tooltip = "Klicke hier um einen Notruf abzusetzen";
			onButtonClick = "createDialog ""Life_extsmartphone_notruf"";";
			class Attributes
			{
				align = "center";
			};
		};
		class extMsgCenterMsg: Life_RscListbox
		{
			idc = 17015;
			text = "";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.198 * safezoneH;
			sizeEx = 0.03;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			onLBSelChanged="[7] call life_fnc_extsmartphone;";
		};
		class extMsgCentFrom: Life_RscText
		{
			idc = 17017;
			text = "Absender:";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extMsgCentMsg: Life_RscText
		{
			idc = 17018;
			text = "Nachricht";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extHelpHeader: Life_RscText
		{
			idc = 17021;
			text = "Hilfe zum Messenger";
			x = 0.717595 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.151562 * safezoneW;
			h = 0.0201481 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extHelpText : Life_RscControlsGroup {
			idc = 17054;
			x = 0.716563 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.528 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class extMsgShowHelpText: Life_RscStructuredText
				{
					idc = 17022;
						text = "In der Titelleiste dieses Messengers findest du deine eigene Nummer. Damit dir andere schreiben können, brauchen sie diese nummer. Über den Knopf VERWALTEN kannst du die Nummern anderer Spieler zu deinen Kontakten hinzufügen und wieder löschen. Die Nachrichtenvorschau dient gleichzeitig als Messagebox. Die dort angezeigte oder eingegebene Nachricht kann via DIREKT ANTWORTEN an den ausgewählten Absender, via SCHREIBEN an den ausgewählten Kontakt und via ANONYM SCHREIBEN an die eingegebene Nummer gesendet werden. Über den Notruf erreicht man Nationalgarde, Sanitäter, AAC sowie die Admins. Deine Eigene Nummer kannst du in der Fiale von Satellite ändern lassen. Je nach Fraktion hat man unterschiedliche unique Nummern. Achja, das Speichern der Kontaktliste ist an die Autosave Funktion von Altis-Life geknüpft. Für etwaigen Verlust übernehmen wir keine Haftung :p";
						x = 0;
						y = 0;
						w = 0.154687 * safezoneW;
						h = 1;
					sizeEx = 0.5 * GUI_GRID_H;
					colorText[] = {1,1,1,1};
					colorBackground[] = {-1,-1,-1,0};

				};
			};
		};
		class extShowNumber: Life_RscText
		{
			idc = 17024;
			text = "XXXXYYYZZZZZZZ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extHeadShNum: Life_RscText
		{
			idc = 17025;
			text = "Meine Nummer:";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extShowMsgFull: Life_RscText
		{
			idc = 17027;
			text = "Nachrichtenfenster";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extFullText : Life_RscControlsGroup {
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.187 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class extMsgShowFullText: Life_RscEdit
				{
					style = ST_MULTI;
					idc = 17028;
					text = "";
						x = 0;
						y = 0;
						w = 0.25 * safezoneW;
						h = 1;//h = 2.15;
					sizeEx = 0.035;
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,1};

				};
			};
		};
		class extAddNewHeadText: Life_RscText
		{
			idc = 17031;
			text = "Neuen Kontakt hinzufuegen";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extAddNewCap: Life_RscText
		{
			idc = 17033;
			text = "Neue Kontaktnummer eingeben:";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extAddNewNumber: Life_RscEdit
		{
			idc = 17034;
			text = "";
			x = 0.126687 * safezoneW + safezoneX;
			y = 0.2712 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.065;
		};
		class extAddNewOkay: Life_RscButtonMenu
		{
			idc = 17035;
			text = "Okay";
			x = 0.123595 * safezoneW + safezoneX;
			y = 0.3372 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.5,0,0.75};
			class Attributes
			{
				align = "center";
			};
			onButtonClick ="[4] call life_fnc_extsmartphone;";
		};
		class extDelNumOk: Life_RscButtonMenu
		{
			idc = 17039;
			text = "Loeschen";
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.5572 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0,0,0.75};
			onButtonClick ="[5] call life_fnc_extsmartphone;";
		};
		class extDelNumHeadText: Life_RscText
		{
			idc = 17041;
			text = "Kontakt loeschen";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.4142 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extDelNumCap: Life_RscText
		{
			idc = 17042;
			text = "Ausgewaehlte Nummer loeschen?";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extDelNumNumber: Life_RscEdit
		{
			idc = 17043;
			text = "";
			x = 0.125656 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.065;
		};
		class extDelMsgs: Life_RscButtonMenu
		{
			idc = 17044;
			text = "Nachrichten loeschen";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Nachrichten löschen";
			colorBackground[] = {0.5,0,0,0.75};
			onButtonClick = "[13] spawn life_fnc_extsmartphone;";
			class Attributes
			{
				align = "center";
			};
		};
		class extCallQuaddrop: Life_RscButtonMenu
		{
			idc = 17045;
			//text = "Rufe Quaddrop";
			//onButtonClick = "[position player] spawn TON_fnc_quaddrop;";
			text = "Notstand!";
			onButtonClick = "[player, 1] call life_fnc_notstand;";
			x = 0.417481 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.5,0.75};
			tooltip = "Erteile die Freigabe für den Notstand";
			class Attributes
			{
				align = "center";
			};
		};
		class extAnoHeadText: Life_RscText
		{
			idc = 17048;
			text = "Anonym senden";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.6342 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extSendMsgAno: Life_RscButtonMenu
		{
			idc = 17049;
			text = "Anonym Schreiben";
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Nachricht an Nummer schreiben";
			onButtonClick = "[12] spawn life_fnc_extsmartphone;";
			class Attributes
			{
				align = "center";
			};
		};
		class extAnoSendCap: Life_RscText
		{
			idc = 17050;
			text = "Nummer eingeben:";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class extAnoSendNum: Life_RscEdit
		{
			idc = 17051;
			text = "";
			x = 0.125657 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.065;
		};
		class countcont: Life_RscText
		{
			idc = 17052;
			text = "Kontakte:  0 / 50";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.6474 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.033;
			class Attributes
			{
				align = "center";
			};
		};
		class selnum: Life_RscText
		{
			idc = 17053;
			text = "";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.033;
			class Attributes
			{
				align = "center";
			};
		};
		class schnellant: Life_RscButtonMenu
		{
			text = "Direkt antworten";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Nachricht an ausgewaehlte Person schreiben";
			onButtonClick = "[9] spawn life_fnc_extsmartphone;";
			class Attributes
			{
				align = "center";
			};
		};
	};
};

class Life_extsmartphone_notruf {
	idd = 887890;
	name= "life_extsmartphone_notruf";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[6] spawn life_fnc_newMsg;";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3,0.3,0.75};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.85;
			h = 0.04;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.244;
			w = 0.85;
			h = 0.13;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 888892;
			text = "$STR_SMARTPHONE_Notruftitle";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class textEdit : Life_RscEdit {

		idc = 888894;

		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.25;
		w = 0.83; h = 0.03;

		};

		class TxtCopButton : life_RscButtonMenu
		{
			idc = 888895;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {0,0,0.5,0.75};
			onButtonClick = "[2,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.32;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class TxtAdminButton : life_RscButtonMenu
		{
			idc = 888896;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {0,0,0,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};


		class AdminMsgAll : life_RscButtonMenu
		{
			idc = 888898;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {0,0,0,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class EMSReq : life_RscButtonMenu
		{
			idc = 888899;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {0.5,0,0,0.75};
			onButtonClick = "[4,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.11;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class AACReq : life_RscButtonMenu
		{
			idc = 888900;
			text = "$STR_CELL_AACRequest";
			colorBackground[] = {0.5,0.5,0,0.75};
			onButtonClick = "[8,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.74;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		class underground : life_RscButtonMenu
		{
			idc = 888901;
			text = "Untergrund";
			colorBackground[] = {0,0.5,0,0.75};
			onButtonClick = "[9,-1,(ctrlText 888894)] call life_fnc_newMsg;";

			x = 0.74;
			y = 0.38 + (1 / 50);
			w = 0.2;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class CloseButton : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.38 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
	};
};
