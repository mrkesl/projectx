class admin_dialog {
		idd = 3190;
		movingEnable = 0;
		enableSimulation = 1;
		onLoad = "[] spawn life_fnc_adminMenu_Extended; closeDialog 0;[player] remoteExec [""life_fnc_admin_auth"", 2, false];";
		
		class controlsBackground
		{
			class admin_background: Life_RscText
			{
				idc = 1000;
				x = 0.247344 * safezoneW + safezoneX;
				y = 0.247 * safezoneH + safezoneY;
				w = 0.505313 * safezoneW;
				h = 0.55 * safezoneH;
				colorBackground[] = {0,0,0,0.4};
			};
			class admin_titlebc: Life_RscText
			{
				idc = 1001;
				text = "Admin Menu"; //--- ToDo: Localize;
				x = 0.247345 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.505313 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
			class RscText_1002: Life_RscText
			{
				idc = 1002;
				x = 0.262812 * safezoneW + safezoneX;
				y = 0.291 * safezoneH + safezoneY;
				w = 0.0876563 * safezoneW;
				h = 0.11 * safezoneH;
				colorBackground[] = {0,0,0,0.6};
			};
			class admin_geldtitle: Life_RscText
			{
				idc = 1003;
				text = "Geld"; //--- ToDo: Localize;
				x = 0.262812 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.0876563 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
			class RscText_1004: Life_RscText
			{
				idc = 1045;
				x = 0.262812 * safezoneW + safezoneX;
				y = 0.445 * safezoneH + safezoneY;
				w = 0.149531 * safezoneW;
				h = 0.308 * safezoneH;
				colorBackground[] = {0,0,0,0.6};
			};
			class admin_player: Life_RscText
			{
				idc = 1005;
				text = "Spieler"; //--- ToDo: Localize;
				x = 0.262812 * safezoneW + safezoneX;
				y = 0.423 * safezoneH + safezoneY;
				w = 0.149531 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
			class admin_vehlist: Life_RscText
			{
				idc = 1006;
				text = "Fahrzeuge"; //--- ToDo: Localize;
				x = 0.427812 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.139219 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
			class admin_vehback: Life_RscText
			{
				idc = 1007;
				x = 0.427812 * safezoneW + safezoneX;
				y = 0.291 * safezoneH + safezoneY;
				w = 0.139219 * safezoneW;
				h = 0.462 * safezoneH;
				colorBackground[] = {0,0,0,0.6};
			};
			class admin_authors: Life_RscText
			{
				idc = 1004;
				text = "Info"; //--- ToDo: Localize;
				x = 0.628906 * safezoneW + safezoneX;
				y = 0.654 * safezoneH + safezoneY;
				w = 0.12375 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
			class admin_tp: Life_RscText
			{
				idc = 1009;
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.291 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.352 * safezoneH;
				colorBackground[] = {0,0,0,0.6};
			};
			class admin_portort: Life_RscText
			{
				idc = 1010;
				text = "Funktionen"; //--- ToDo: Localize;
				x = 0.582501 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {1,0,0,1};
			};
		};
	class controls
	{	
		class test_description: Life_RscStructuredText
		{
			idc = 2903;
			text = "Jegliche Funktionen sind mit Bedacht zu verwenden!"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class admin_close: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Schließen";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0504063 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
			tooltip = "Klicken Sie hier, um die Anwendung zu beenden.";
		};
		/*class tool_b_marketreset: Life_RscButtonMenu
		{
			idc = -1;
			text = "Marktpreise Reset"; //--- ToDo: Localize;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_marketReset;";
			tooltip = "Marktpreise werden auf den Standardwert gesetzt.";
		};*/
		class admin_geld_10000: Life_RscButtonMenu
		{
			idc = 2401;
			text = "+10000$"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[10000] spawn life_fnc_adminAddMoney;";
		};
		class admin_geld_100000: Life_RscButtonMenu
		{
			idc = 2402;
			text = "+100000$"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[100000] spawn life_fnc_adminAddMoney;";
		};
		class admin_geld_1000000: Life_RscButtonMenu
		{
			idc = 2403;
			text = "+1000000$"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1000000] spawn life_fnc_adminAddMoney;";
		};

		class admin_port2me: Life_RscButtonMenu
		{
			idc = 2404;
			text = "2 me"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um einen ausgewählten Spieler zu sich zu teleportieren.";
			onButtonClick = "[] spawn life_fnc_admin_port2me";
		};
		class admin_portme2: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Tel 2"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um sich zu einem ausgewählten Spieler zu teleportieren.";
			onButtonClick = "[] call life_fnc_admin_portme2; closeDialog 0;";
		};
		class admin_spectate: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Spectate"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Schaue dir an, was die Spieler gerade machen.";
			onButtonClick = "[] spawn life_fnc_admin_Spectate";
		};
		class RPP_Playerlist: Life_RscListbox
		{
			idc = 1500;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.286 * safezoneH;
			sizeEx = 0.015 * safezoneH;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery_Extended";
		};
		class veh_List: Life_RscListbox
		{
			idc = 1501;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.44 * safezoneH;
			sizeEx = 0.015 * safezoneH;
		};
		class veh_b_spawn: Life_RscButtonMenu
		{
			idc = 2409;
			text = "Fahrzeug Spawnen"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um Ihr ausgewaehltes Fahrzeug zu spawnen.";
			onButtonClick = "[] spawn life_fnc_adminSpawnVehicle;";
		};
		
// right buttons
		
		class admin_tele: Life_RscButtonMenu
		{
			idc = 2408;
			text = "Teleport Map"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um einen Teleport-Punkt auf der Map auszuwählen";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_admin_tele;";
		};
		class adm_gd_tg: Life_RscButtonMenu
		{
			idc = 2440;
			text = "God-Toggle"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier um Godmode zu (de)aktivieren";	
			onButtonClick = "[] spawn life_fnc_adm_gd_tg;";
		};
		class car_gd_tg: Life_RscButtonMenu
		{
			idc = 2410;
			text = "Car-God-Toggle"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um Cargod zu (de)aktivieren";
			onButtonClick = "[] spawn life_fnc_car_gd_tg;";
		};
		class admin_1: Life_RscButtonMenu
		{
			idc = 2411;
			text = "Loadout"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um ihr standard Equipment auszurüsten";
			onButtonClick = "[Player] spawn life_fnc_adm_g_loadout;";
		};
		class admin_2: Life_RscButtonMenu
		{
			idc = 2412;
			text = "-"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "";
			onButtonClick = "";		
		};
		class admin_3: Life_RscButtonMenu
		{
			idc = 2413;
			text = "-"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "";
			onButtonClick = "";
		};
		class admin_4: Life_RscButtonMenu
		{
			idc = 2414;
			text = "Show Gear"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um einen Blick in das Inventar der ausgewählten Person zu werfen";
			onButtonClick = "[] spawn life_fnc_adm_sh_gear;";			
		};
		class admin_revive: Life_RscButtonMenu
		{
			idc = 2415;
			text = "Revive / heal player"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken sie hier um den ausgewählten Spieler zurück ins Leben zu führen";
			onButtonClick = "[] call life_fnc_adminRevive;";		
		};
		class admin_freeze_all: Life_RscButtonMenu
		{
			idc = 2416;
			text = "Freeze All"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier um alle Spieler, ausgenommen sich selbst, einzufrieren.";
			onButtonClick = "[] call life_fnc_adminFreeze_all;";		
		};
		class admin_freeze: Life_RscButtonMenu
		{
			idc = 2417;
			text = "Freeze-Toggle"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Klicken Sie hier, um einen ausgewählten Spieler einzufrieren.";
			onButtonClick = "[] call life_fnc_adminFreeze;";	
		};
	};	
};	

