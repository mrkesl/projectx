/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
removeallactions player;
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];

		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ((animationState cursorTarget == "Incapacitated") OR (cursorTarget getVariable"surrender") OR (cursorTarget getVariable "gefesselt")) && !(cursorTarget getVariable["robbed",FALSE]) ']];

		// Suicide Bomb
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Sprengstoffweste aktivieren</t>",life_fnc_suicideBomb,"",0,false,false,"",
        'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
	  	//'vest player == "DESIRED VEST GOES HERE" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];

		//Ausweis
		life_actions = life_actions + [player addAction["<t color='#00BB00'>Ausweis zeigen</t>",life_fnc_civShowLicense,"",1,false,true,"",' playerSide == civilian && isplayer cursorTarget && !isNull cursorTarget && cursorTarget isKindOf "Man" && (player distance cursorTarget < 2) ']];

		//Stempelkarte AAC
		//life_actions = life_actions + [player addAction["<t color='#DBDB00'>Stempelkarte vorzeigen</t>",life_fnc_Stempelkarte,"",1,false,true,"",' playerSide == civilian && (player getVariable ["onDuty", false]) && isplayer cursorTarget && !isNull cursorTarget && cursorTarget isKindOf "Man" && (player distance cursorTarget < 2) ']];

		//Soeldnerpass
		//life_actions = life_actions + [player addAction["<t color='#DBA000'>Söldnerpass vorzeigen</t>",life_fnc_soeldnerpass,"",1,false,true,"",' playerSide == civilian && (call life_soeldnerlevel > 0) && isplayer cursorTarget && !isNull cursorTarget && cursorTarget isKindOf "Man" && (player distance cursorTarget < 2) ']];
	};
	case west:
	{
		// Del Test.
		life_actions = life_actions + [player addAction["Waffe beschlagnahmen",life_fnc_delObjectstest,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		//Polizeimarke
		life_actions = life_actions + [player addAction["<t color='#00BB00'>Dienstmarke zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && isplayer cursorTarget && !isNull cursorTarget && cursorTarget isKindOf "Man" && (player distance cursorTarget < 2) ']];
	};

	case independent:
	{
		//Dienstausweis
		life_actions = life_actions + [player addAction["<t color='#00BB00'>Dienstausweis zeigen</t>",life_fnc_medShowLicense,"",1,false,true,"",' playerSide == independent && isplayer cursorTarget && !isNull cursorTarget && cursorTarget isKindOf "Man" && (player distance cursorTarget < 2) ']];
	};
};
