player createDiarySubject ["updates","Aktuelle Änderungen"];
player createDiarySubject ["kontakt","Kontakt Info"];
player createDiarySubject ["team","Das Serverteam"];
player createDiarySubject ["serverrules","Allgemeine Regeln"];
player createDiarySubject ["strafenkatalog","Bußgeldkatalog"];
player createDiarySubject ["safezones","Safe Zones"];
player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
player createDiarySubject ["controls","Steuerung"];
player createDiarySubject ["tutorial","Wissenswertes"];

player createDiaryRecord ["updates",
	[
"Update vom 21.11.15",
    "
	#Altis Life RedisDB Release<br/>
		Nach monatelanger Arbeit bieten wir nun diesen<br/>
		fantastischen Server an.<br/>
		Der Server läuft nun mit einer RedisDB<br/>
		Das ermöglicht eine deutlich höhere Geschwindigkeit<br/><br/>
	#Altis Life Performance<br/>
		Wir haben ebenfalls viel daran gelegt die Scripte<br/>
		zu überarbeiten. Es hat alles sehr lange gedauert,<br/>
		aber wir reden hier ja auch vom gesamten Altis-Life<br/><br/>
    "
	]
];

        player createDiaryRecord["kontakt",
                [
                        "Kontakt Info",
                                "
	TS3 Server: Libra-Gaming.eu<br/>
	Forum: Libra-Gaming.eu<br/>
                                "
                ]
        ];

player createDiaryRecord["team",
	[
"Das Team",
    "
	<br/>Abgesehen von den Zahlreichen Cops und Medics stehen<br/>
	euch selbstverständlich auch Administratoren sowie Supporter<br/>
	zur Verfügung.<br/>
	Bei Problemen die ihr im Spiel nicht regelkonform lösen könnt,<br/>
	wendet euch bitte an unsere:<br/>
	<br/>
	Supporter: Fell, Webster und Larvell<br/>
	Administratoren: Sean Williams, Revan und Larvell<br/>
	<br/>
	Danken möchten wir allen, die an diesem Server mitgewirkt haben<br/>
	und es ermöglicht haben, dass wir unsere Vorstellungen umsetzen<br/>
	konnten.<br/><br/>
	Daher möchten wir namentlich danken:<br/><br/>
	- Revan<br/>
	- Larvell<br/>
	- Creedcoder<br/>
	- Tim<br/>
	- matt<br/>
	- Vlad<br/>
	- Yatheria<br/>
	- skrumbz<br/><br/>
		Achja da war noch einer..<br/>
	Natürlich danke wir auch unserem guten Sean Williams!<br/><br/>
	VIELEN DANK AN EUCH!
    "
	]
];

                player createDiaryRecord["serverrules",
                [
                        "Exploits",
                                "
	Hier ist eine Definition von Dingen, die als 'Exploits' verstanden werden.<br/><br/>
	1. Sich aus dem Gefängnis glitchen.<br/><br/>
	2. Suizid ohne Roleplayhintergrund und um dem Roleplay zu entkommen.<br/><br/>
	3. Items, Ausrüstung oder Geld vervielfältigen. Wenn dir jemand Unbekanntes einen Haufen Geld schickt ohne einen ersichtlichen Grund, melde ihn bei einem Admin oder Supporter und erkläre ihm was los ist.<br/><br/>
	4. Benutzen von ercheateden Items. Sollte ein Hacker online kommen und verschiedene Dinge spawnen, kannst du für die Benutzung dieser Dinge gebannt werden. Melde deshalb diese Items einem Supporter oder Admin.<br/><br/>
	5. Das Ausnutzen von Bugs oder Spielemechaniken. Sollte es herauskommen, dass du soetwas benutzt, kannst du gebannt werden.<br/><br/>
                                "
                ]
        ];

        player createDiaryRecord["safezones",
                [
                        "§20 Safezonen",
                                "
	20.1. An folgenden Bereichen (100 Meter Umkreis) sind alle illegalen Handlungen die einem Spieler schaden können (Fahrzeug stehlen, töten, ausrauben etc.) verboten:<br/>
	- Alle Fahrzeugehändler sowie Garagen und Hangars<br/>
	- Geldautomaten<br/>
	- Lizenzhändler<br/>
	- Marktplatz Kavala<br/>
	- Nationalgarde Trainingsgelände (Schießplätze)<br/>
	- Nationalgarden-, AAC- und MEDIC-Basen (Krankenhäuser)<br/><br/>
	20.2. Ausnahmen<br/>
	Ausnahme ist ein außerhalb der Safezone (100m) gestartetes Roleplay (im aktiven Roleplay sind Safezones außer Kraft gesetzt)<br/><br/>
	Zusatzparagraph:(trifft nicht auf Nationalgarden-, AAC-, MEDIC-Basen und den Marktplatz in Kavala zu)<br/><br/>
	20.3 Weitere Ausnahmen<br/>
	Eine weitere Ausnahme bildet die Rebellenstadt auf dem Server. Hier sind die Safezone-Regeln außer Kraft gesetzt.
                                "
                ]
        ];
		player createDiaryRecord["serverrules",
				[
						"§10 Kriegserklärungen",
								"
	10.1. Eine Kriegserklärung muss im Forum angekündigt werden<br/>
	10.2. Kriegserklärungen können sich nicht gegen die Nationalgarde von Altis richten.<br/>
		Ferner sind Kriegserklärungen gegen AAC und Medics nicht akzeptabel.<br/>
	10.3. Kriegserklärungen müssen von den betroffenen Parteien im Forum bestätigt werden.<br/>
	10.4. Die Safezone-Regeln müssen in Städten weiterhin beachtet werden.<br/>
	10.5. Personen, die während der Kriegshandlung sterben, dürfen an dieser nicht mehr teilnehmen.<br/>
	10.6. Kriege dauern maximal bis zum Widerruf oder bis zur kompletten Tötung einer Fraktion an.<br/>
	10.7. Die Kriegsbedingungen sind von den Parteien im Vorfeld auszuhandeln und im Forum mit zu veröffentlichen. <br/>
		Darunter zählen auch die Siegesforderungen (Geld, Reparationszahlungen, Naturalien, Aufgaben).<br/>
								"
				]
		];
		player createDiaryRecord["serverrules",
				[
						"§9 Regeln MEDICS und AAC",
								"
	9.1.MEDIC/AAC Mitarbeiter dürfen nicht angegriffen, überfallen oder in sonst einer weise an ihrer Arbeit gehindert werden.<br/><br/>
	9.2.MEDIC/AAC Mitarbeiter müssen immer zu erkennen sein. Sie dürfen keine Zivilen Fahrzeuge führen.<br/><br/>
	9.3.Sollte man, nachdem man gestorben ist, den Request Medic-Button drücken, darf man, sofern ein Medic auf dem Server ist, nicht neu spawnen.<br/><br/>
	9.4.Um MEDIC/AAC Mitarbeitern zu helfen euch zu finden, oder falls ihr Fragen habt, gibt es einen jeweiligen Channel im Teamspeak den ihr betreten könnt um mit diesen in direkten Kontakt zu treten.<br/><br/>
	9.5.Das tragen von Waffen für MEDIC/AAC Mitarbeiter ist verboten.<br/><br/>
	9.6.MEDIC/AAC Mitarbeiter unterstehen den Anweisungen der Nationalgarde. Darunter fallen auch Anwärter.<br/><br/>
	9.7.MEDIC/AAC Mitarbeitern ist es nicht erlaubt, während einem laufenden RolePlay oder einem Schusswechsel einzugreifen. Zum Beispiel während eines Bankraubes.<br/><br/>
	9.8.Beim betreten von gefährlichen Gebieten, wie der Rebellenstadt, sollte, falls möglich Unterstützung der Nationalgarde hinzugezogen werden.<br/><br/>
								"
                ]
        ];

        player createDiaryRecord["serverrules",
                [
                        "§8 Aufgaben MEDICS-AAC",
                                "
	8.1. Sollte jemand um Hilfe ruden, muss sich ein MEDIC/AAC-Mitarbeiter auf den Weg machen.<br/><br/>
	8.2. Falls mehr als ein MEDIC/AAC online sein sollte, muss durch den Dienstältesten eine Einweisung der Kräfte auf der Insel erfolgen.<br/><br/>
	8.3. MEDIC/AAC-Mitarbeiter dürfen alleine unterwegs sein.<br/><br/>
	8.4. Sirene und Blaulicht darf nur in Einsätzen verwendet werden.<br/><br/>
	8.5. Jeder der hilfe benötigt, muss seine Hilfe bekommen, egal ob Rebell, Polizist oder Zivilist.<br/><br/>
                                "
                ]
        ];
		player createDiaryRecord["serverrules",
				[
						"§7 Zerstörung von Fahrzeugen",
						"
	7.1	Das absichtliche zerstören von Fahrzeugen, welche nicht dem Spieler gehören ist verboten. <br/>
			Darunter zählt absichtliches zerstören von Fahrzeugen durch Beschuss, Rammaktionen oder versenken von Helikoptern.<br/>
	7.2	Sollte ein Fahrzeug durch zu viel Schaden explodieren, während der Schütze die Intention dazu hatte, das Fahrzeug <br/>
			lediglich manövrierunfähig zu machen, so ist dies keine Entschuldigung gegenüber Punkt 1.<br/>
						"
				]
		];

        player createDiaryRecord["serverrules",
                [
                        "§6 Exploits, Bugusing, u.Ä.",
                                "
	Hier ist eine Definition von Dingen, die als 'Exploits' verstanden werden.<br/><br/>
	6.1 Sich aus dem Gefängnis glitchen.<br/><br/>
	6.2 Suizid ohne Roleplayhintergrund und um dem Roleplay zu entkommen.<br/><br/>
	6.3 Items, Ausrüstung oder Geld vervielfältigen. Wenn dir jemand Unbekanntes einen Haufen Geld schickt ohne einen ersichtlichen Grund, <br/>
		melde ihn bei einem Admin oder Supporter und erkläre ihm was los ist.<br/><br/>
	6.4 Benutzen von ercheateden Items. Sollte ein Hacker online kommen und verschiedene Dinge spawnen, kannst du für die Benutzung dieser Dinge<br/>
		gebannt werden. Melde deshalb diese Items einem Supporter oder Admin.<br/><br/>
	6.5 Das Ausnutzen von Bugs oder Spielemechaniken. Sollte es herauskommen, dass du soetwas benutzt, kannst du gebannt werden.<br/><br/>
                                "
                ]
        ];

        player createDiaryRecord["serverrules",
                [
                        "§5 Umgang mit der Nationalgarde",
                                "
	5.1. Das ständige verfolgen, beschatten oder das weitergeben der Position von Gardisten ist veboten.<br/><br/>
	5.2. Das absichtliche töten von Gardisten ohne RolePlay-Hintergrund ist verboten.<br/><br/>
	5.3. Einen Gardisten daran zu hindern seine Arbeit zu machen ist nicht gestattet und kann zu Verhaftung und/oder einer Gefängnisstrafe führen.<br/><br/>
	5.4. Imaginäre Geiseln finden bei Verhandlungen keine Beachtung.<br/><br/>
	5.6. Gardisten sind ebenfalls Spieler, deren Interesse der Spaß am Roleplay und der Gardistenarbeit gilt. Sie dürfen in keinster Weise menschenunwürdig behandelt werden.<br/><br/>
	5.7. Unsere Insel ist ein Diktaturstaat. Verhaftete oder inhaftierte Zivilisten haben daher kein Recht auf einen Anwalt.<br/><br/>
                                "
                ]
        ];
		player createDiaryRecord["serverrules",
				[
						"§4 Überfälle und Kämpfe",
								"
	4.1. Banditen müssen ihren Opfern klar sagen das es sich um einen Überfall handelt.<br/>
	4.2. Bei Überfällen auf Helikoptern muss dies (nach Möglichkeit) über das Handy mitgeteilt werden.<br/>
	4.2.1 Hierbei ist die Nachricht an den Helikopter allgemein adressiert (z.b. Flugnummer MH9 X1) und nicht an den Piloten oder einen Insassen.<br/>
	4.2.2 Warnschüsse sind erlaubt. Bringen diese Schüsse einen Helikopter allerdings zum Absturz, wird dieses als RDM gewertet.<br/>
	4.3. Das absichtliche erschießen von Raubopfern ist verboten. Wenn das Opfer das Geld oder die Güter herausgegeben hat, darf dieses nicht erschossen werden.<br/>
	4.4. Bei Überfällen muss stets ein Ansprechpartner der überfallenden Partei sich in der Nähe des Opfers befinden, als Repräsentant des Überfalls. Reine Sniper-Überfälle sind nicht gestattet.<br/>
	4.5. Opfer eines Überfalls dürfen sich wehren, sobald ihnen gesagt wurde, dass sie überfallen werden.<br/>
	4.6. Stellt sich ein Räuber in den Weg eines flüchtenden Autos und wird dabei überfahren, gilt dies nicht als VDM sondern als Selbstschutz beziehungsweise Notwehr.<br/>
	4.7. Solltest du als Zivilist in eine Schießerei geraten und dabei sterben, gilt dies nicht als RDM. Hier setzt die New-Life Regel ein.<br/>
	4.8. Solltest du als unbeteiligter oder unakgekündigter Verbündeter einer Partei oder als Dritter in eine Schießerei geraten, darfst du an dieser nicht aktiv teilnehmen.<br/>
	4.9. Bei und vor Überfällen und Kampfhandlungen findet §6: Roleplay besondere Beachtung.<br/>
	4.10 Sollte sich der Verbündete ankündigen, dürfen nicht kurz nach der Ankündigung bereits Schüsse seinerseits fallen.<br/>
								"
				]
		];

        player createDiaryRecord["serverrules",
                [
                        "§3 Kommunikation im Spiel",
                                "
	3.1. Zur Kommunikation mit einem Helikopter muss (nach Möglichkeit) ein Handy benutzt werden.<br/><br/>
	3.2. Das Sprechen im Side Chat ist verboten und kann durch einen Admin oder Supporter zu einem direkten Kick ohne Vorwarnung führen. Ferner ist es verboten, <br/>
		Musik/Sounds über die verschiedenen Channel abzuspielen, besonders im Sidechannel.<br/>
	3.3. Die Chats zu spammen ist verboten.<br/><br/>
	3.4. Das posten von Links oder Werbung ist verboten.<br/><br/>
	3.5. Beleidigungen, rassistische oder extremistische Äußerungen und pornografische Inhalte sind verboten, und können ebenfalls mit einem Kick ohne Vorwarnung <br/>
		durch einen Admin oder Supporter führen, je nach Schwere ist auch ein Ban möglich.<br/>
	3.6. Einer Aufforderung von einem Admin, Supporter oder Gardisten, auf unseren Teamspeakserver (Libra-gaming.eu) zu joinen ist umgehend folge zu leisten.<br/><br/>
	3.7. Der Notruf ist kein Infoschalter! Wie der Name schon sagt ist der Notruf nur für Notrufe zu nutzen. Bei Fragen bitte einen einzelnen Supporter oder Admin anschreiben.<br/><br/>
	3.8. Der Admin-Notruf ist ebenfalls kein Infoschalter! Bei Fragen bitte immer eine einzelne Person anschreiben.<br/><br/>
	3.9 Mangelhafte oder fehlerhafte Absprache zwischen Fraktionsmitgliedern oder Gangmitgliedern ist keine Entschuldigung für Regelbrüche. Die Strafe wird dann an die ausführende Person vergeben, <br/>
		falls sich der eigentliche Fehlinformant nicht stellen sollte. Hierunter zählen zum Beispiel Feuerbefehle.<br/>
                                "
                ]
        ];

        player createDiaryRecord["serverrules",
                [
                        "§2 RDM und VDM",
                                "
	2.1. Das wahllose töten von anderen Spielern ist verboten.<br/><br/>
	2.2. Gezieltes überfahren anderer Spieler ist verboten.<br/><br/>
	2.3. Gezieltes überfahren anderer Spieler in einer Kampfaktion (mit einem gepanzerten Fahrzeug) ist verboten.<br/><br/>
	2.4. Solltest du als Zivilist in eine Schießerei geraten und dabei sterben, gilt dies nicht als RDM.<br/><br/>
	2.5. Das Verteidigen von Freunden oder Gruppenmitgliedern (nach einer Ankündigung!) ist kein RDM.<br/><br/>
	2.6. Der Nationalgarde ist ein Schusswechsel vorher erst anzukündigen, es sei denn, das RP wurde schon von den Gardisten gestartet.<br/>
                                "
                ]
        ];

        player createDiaryRecord["serverrules",
                [
                        "§1 New-Life Regel",
                                "
	1.1. Die New-Life Regel tritt nur nach folgenden Ereignissen in Kraft:<br/>
	- wenn ihr von einem anderen Spieler in einer RolePlay-Aktion getötet werdet<br/>
	- wenn ihr einen Unfall habt (Verkehrsunfall, Helikopterabsturz etc.)<br/><br/>
	1.2. Die New-Life Regel tritt bei folgenden Ereignissen nicht in Kraft:<br/>
	- bei einem absichtlichen Selbstmord<br/>
	- nach einem Serverrestart<br/>
	- durch Bugs zu sterben<br/><br/>
	- wegen Verlust der Verbindung zum Spiel oder Disconnect<br/><br/>
	- wenn man von einem Medic wiederbelebt wird, gilt dies nicht als neues Leben!<br/><br/>
	1.3.Wenn ein Spieler regelkonform an einer Stelle getötet wird, ist es diesem Spieler komplett (bis zum Serverrestart) untersagt, <br/>
		an diese Stelle zurückzukehren, um dort in RP oder Feuergefechte einzugreifen. Ferner ist es dem Spieler untersagt, seinen alten Körper zu looten.<br/>
		Hierbei ist jedoch eine generelle Schonzeit von 30 Minuten zu wahren, bevor man aus anderen Gründen als oben genannt die Todestelle passieren muss.<br/>
                                "
                ]
        ];
		player createDiaryRecord["Roleplay Regeln",
				[
						"Roleplay Regeln",
								"
	Roleplay und Roleplayaktionen sind der Waffengewalt stets vorzuziehen.<br/><br/>
	'Ich bin ein Irrer mit einer Waffe und schieße auf alles was ich sehe' ist kein Roleplay Hintergrund und wird auf dem Server nicht toleriert.<br/><br/>
	Nachteile bei einer Roleplay-Aufforderung müssen klar erkennbar sein. 'Fahren Sie bitte rechts ran' ist keine Ankündigung für angedrohten Schusswechsel, <br/>
		falls der Aufgeforderte der Forderung nicht nachkommt.<br/><br/>
	Absichten nach einer Aufforderung müssen klar erkennbar sein. Hierbei gilt es dem Prinzip der angemessenen Reaktion zu folgen. <br/>
		Auf ein 'Fahren Sie bitte rechts ran, wir führen Fahrzeugkontrollen durch' darf nicht ohne Ankündigung das Feuer eröffnet werden.<br/><br/>
	Das erlangen einer Handynummer muss einen logischen und passenden Rp-Hintergrund beinhalten.<br/>
	Spielern muss auf eine Roleplay-Aufforderung eine angemessene Reaktionszeit geboten werden.<br/>
								"
				]
		];


player createDiaryRecord["strafenkatalog",
				[
								"Der Bußgeldkatalog",
												"
	Verkehrsdelikte<br/>
		Fahren ohne Führerschein: 3.000€<br/>
		Falschparken: 5.000€<br/>
		Versuchter Diebstahl eines zivilen fremden Fahrzeuges: 15.000€<br/>
		Diebstahl/Führen eines gestohlenes Fahrzeuges: 40.000€<br/>
		Fahren ohne Licht bei Dunkelheit oder Dämmerung: 2.000€<br/>
		Überhöhte Geschwindigkeit (10-30km/h zu schnell): 12.000€<br/>
		Überhöhte Geschwindigkeit (>30km/h zu schnell): 30.000€<br/>
		Fahren abseits von Straßen: 10.000€<br/>
		Langanhaltendes Rückwärtsfahren: 10.000€<br/>
		Fahren auf der falschen Straßenseite: 7.000€<br/>
		Versuchter Diebstahl von Polizeifahrzeugen: 40.000€<br/>
		Diebstahl von Polizeifahrzeugen: 80.000€ bei Wiederholung Inhaftierung<br/>
		Landen in einer Flugverbotszone: 100.000€ inkl. Fahrzeugbeschlagnahmung<br/>
		Fliegen in unter 150 Meter: 50.000€ inkl. Fahrzeugbeschlagnahmung<br/>
		Schwebeflug über einer Stadt: 150.000€<br/>
		Fahrerflucht bei Unfall: 20.000€<br/>
		Illegale Strassensperre aufstellen: jeder gefundene Beteiligte 50.000€<br/>
		verbotene Fahrzeuge: 100.000€ und Verwahrung des Fahrzeuges<br/>
		Trunkenheit am Steuer: 30.000€<br/><br/>
	Umgang mit der Polizei<br/>
		Widerstand gegen die Staatsgewalt: 80.000€<br/>
		Nicht befolgen einer staatsautoritären Anordnung: 20.000€, bei Wiederholung Inhaftierung<br/>
		Beleidigung (Spielerisch): 25.000€, bei Wiederholung Inhaftierung<br/>
		Belästigung von Gardesoldaten oder Notärzten: 15.000€<br/>
		Betreten der nationalen Sperrzone: 30.000€<br/>
		Umfahren von Kontrollpunkten: 30.000€<br/>
		Beschuss auf Gardesoldaten/-fahrzeuge/-hubschrauber: 150.000€ inkl. Inhaftierung<br/>
		Zerstörung von Polizeieigentum: Inhaftierung<br/><br/>
		Drogendelikte<br/>
		Verdopplung des Warenwerts wird als Strafe verhängt<br/>
		Ab 50.000€ Warenwert: zusätzliche Inhaftierung<br/>
		Bei extrem geringen Warenwerten: 15.000€<br/><br/>
	Waffendelikte<br/>
		Waffenbesitz ohne Lizenz: 80.000€<br/>
		Mit gezogener Waffe durch Städte laufen: 50.000€<br/>
		Besitz einer verbotenen Waffe bis einschließl. Kaliber 5,56mm: 150.000€ inkl. Beschlagnahmung<br/>
		Besitz einer verbotenen Waffe bis einschließl. Kaliber 6,5mm: 250.000€ inkl. Beschlagnahmung<br/>
		Besitz einer verbotenen Waffe bis einschließl. Kaliber 7,62mm: 350.000€ inkl. Beschlagnahmung<br/>
		Besitz einer verbotenen Waffe über Kaliber 7,62mm: 500.000€ inkl. Beschlagnahmung<br/>
		Schusswaffengebrauch innerhalb von Städten: 200.000€<br/>
		Schalldämpfer auf Waffe: 50.000€<br/><br/>
	Schwere Delikte<br/>
		Mord: Inhaftierung<br/>
		Geiselnahme: Inhaftierung.<br/>
		Überfall auf Personen oder Fahrzeuge: Inhaftierung.<br/>
		Bankraub: Inhaftierung.<br/><br/>
	Diverse Delikte<br/>
		illegale Kleidung: 50.000€ und Abgabe der Kleidung oder Inhaftierung<br/>
		Besitz von Notarzt oder Gardekleidung: 100.000€<br/>
		Vermummung in der Öffentlichkeit: 30.000€<br/>
												"
				]
];

// Illegal Items Section
        player createDiaryRecord["illegalitems",
                [
                        "§26 Regeln für Rebellionen",
                                "
	Der Verstoß gegen die folgenden Regeln führt zum Kick oder Ban, abhängig von der Entscheidung des zuständigen Admins oder Supporters!<br/><br/>
	26.1 Rebellionen (Rebellen Roleplay-Events)<br/><br/>
	26.2. Eine Rebellion ist kein Grund das Feuer auf unbeteiligte Zivilisten oder Gardisten zu eröffnen.<br/><br/>
	26.3. Rebellionen müssen einen RolePlay-Hintergrund haben und angekündigt sein.<br/><br/>
                                "
                ]
        ];

        player createDiaryRecord["illegalitems",
                [
                        "§25 Gang Regeln",
                                "
	25.1. Es ist nicht illegal in einer Gang Mitglied zu sein.<br/><br/>
	25.2. Es ist kein Verbrechen auf einem Gang-Areal zu sein. Einzig wenn dort illegale Dinge von statten gehen.<br/><br/>
	25.3. Gangs können Areale besitzen. Andere Gangs können diese Areale angreifen um ihrerseits die Kontrolle dort zu gelangen.<br/><br/>
	25.4. Um einer anderen Gang den Krieg zu erklären, muss der Anführer dies im Global Chat verkünden und alle Mitglieder der beiden Gangs müssen als solche erkenntlich sein.<br/><br/>
	25.5. Gangs dürfen keine unbewaffneten Zivilisten umbringen, außer diese sind Mitglieder einer rivalisierenden Gang und in ihrem Gang-Areal.<br/><br/>
	Zusatzparagraph:<br/>
	Selbstverständlich sind alle Straftaten die man im Zuge eines Gang-Krieges begeht weiterhin Straftaten im Sinne des Bußgeldkatalogs und werden dementsprechend geahndet.
                                "
                ]
        ];

        player createDiaryRecord["illegalitems",
                [
                        "§24 Illegale Fahrzeuge",
                                "
	- Gardistenfahrzeuge<br/>
	- AAC Fahrzeuge<br/>
	- Medic Fahrzeuge<br/>
	- Rebellenfahrzeuge wie Bewaffneter-Offroader,<br/>
		 Rebellenhelikopter, Ifrit<br/>
	- Sollte ein Illegales Fahrzeug von der Nationalgarde<br/>
		 eingezogen werden, so wird dies unter Umständen<br/>
		 in der Sprengzone zerstört.<br/><br/>
                                "
                ]
        ];

                player createDiaryRecord["illegalitems",
                [
                        "§23 Die Rebellenstadt",
                                "
	Die Rebellenstadt ist die Hochburg der Rebellion auf Altis.<br/>
	Hier zählt das Recht des Stärkeren. Die Nationalgarde darf nur unter der Berücksichtigung der Razzia-Regeln die Stadt betreten.<br/>
	Da sogar unter Rebellen ein gewisser Ehrenkodex eingehalten wird, ist die Rebellenstadt als Safezone anzusehen.<br/><br/>
                                "
                ]
        ];

        player createDiaryRecord["illegalitems",
                [
                        "§22 Waffen u. Ausrüstungen",
                                "
	- Alle Waffen die es beim Rebellenshop und im Schwarzmarkt zu kaufen gibt<br/>
	- Gardistenausrüstung wie Waffen, Visiere, Westen, Granaten, Kleidung, Barrieren, Verkehrskegel, Nagelbänder etc.<br/>
	- Scharfschützengewehre<br/>
	- Distanzvisiere SOS etc.<br/><br/>
                                "
                ]
        ];

        player createDiaryRecord["illegalitems",
                [
                        "§21 Illegale Gegenstände",
                                "
	- Kabelbinder<br/>
	- Bolzenschneider<br/>
	- Sprengsätze<br/>
	- Goldbarren<br/>
	- Dietriche<br/>
	- Schildkrötenfleisch<br/>
	- Marihuana<br/>
	- Kokain<br/>
	- Heroin<br/>
	- Moonshine<br/>
	- Angereichertes Uran<br/>
	- Illegale Uranauflösung<br/><br/>
                                "
                ]
        ];

// Controls Section
                player createDiaryRecord["controls",
                [
                        "Steuerung",
                                "
	Z: Z-Inventar öffnen<br/>
	U: Fahrzeuge sowie Haustür auf- und abschließen<br/>
	T: Fahrzeug Kofferaum<br/>
	F: Sirene 1<br/>
	Shift + F: Sirene 2 (Yelp)<br/>
	Strg + F: Nationalgardisten durchsage<br/>
	Shift + L: Blaulicht<br/>
	Shift + B: Ergeben<br/>
	Shift + R: Festnehmen / Fesseln<br/>
	Shift + G: Niederschlagen<br/>
	Shift + BildDown: Ohrstöpsel<br/>
	Tabulator: Warnblinker einschalten<br/><br/>
	Aktionstaste 10 (üblicherweise die linke Windowstaste):<br/>
	- Rohstoffe sammeln<br/>
	- Spitzhacke Sowie Axt benutzen<br/>
	- Diverse Aktionen an Personen, Fahrzeugen und Gebäuden<br/><br/>
                                "
                ]
        ];
                player createDiaryRecord["tutorial",
                [
                        "Wissenswertes",
                                "
	- Es gibt mehr Waffen als es den Anschein hat.<br/><br/>
	- Die Nationalgarde ist in ihrer Härte nicht mit der Polizei zu
		vergleichen.<br/><br/>
	- Die Nationalgarde ist Militärisch organisiert.<br/><br/>
	- Es lohnt sich die gegend zu Erkunden.<br/><br/>
	- Graben nach Hoffnung kann sich auszahlen.<br/><br/>
	- Es gibt Geschenke des Himmels.<br/><br/>
                                "
                ]
        ];
