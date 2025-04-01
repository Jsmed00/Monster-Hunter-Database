-- Jonathan Smedley

/* Creates a schema named Monster_Hunter_Schema in the Monster Hunter 
   Database if it does not currently exist. */

Create SCHEMA IF NOT Exists Monster_Hunter_Schema;

-- Sets the search path to the schema Monster_Hunter_Schema.
Set Search_path to Monster_Hunter_Schema;

-- Shows the current search path to ensure it is set to the schema Monster_Hunter.
Show Search_path;


-- Creates the table for the games.
Create table games(
	G_Name										VARCHAR		PRIMARY KEY,
	Release_Date_Japan							DATE,
	Release_Date_NA								DATE,
	Platforms									VARCHAR,
	Generation									VARCHAR,
	Total_Monsters								INT,
	Num_of_Launch_Monsters						INT,
	Num_of_Monsters_by_Title_Update			INT,
	Num_of_First_Appearances					INT,
	Expansion									VARCHAR,
	Game_Expanded								VARCHAR		
);

-- Loads the game data into the games table.
COPY games(G_Name, Release_Date_Japan, Release_Date_NA, Platforms, Generation,
Total_Monsters, Num_of_Launch_Monsters, Num_of_Monsters_by_Title_Update,
Num_of_First_Appearances, Expansion, Game_Expanded)
FROM 'C:\Users\Public\Documents\Monster_Hunter_Excels\monster_games.csv'
DELIMITER ','
CSV HEADER;


/* Creates the table for Monsters. The Foreign Key links the First_Appearance column in
   the monsters table to the G_Name column in the games table. */
drop table monsters;
Create table monsters(
	M_Name						VARCHAR		PRIMARY KEY,
	M_Class						VARCHAR,
	Elements					VARCHAR,
	Ailments					VARCHAR,
	First_Appearance			VARCHAR,
	Latest_Appearance			VARCHAR,
	No_of_Appearances			INT,
	Base_Monster				VARCHAR,
	Sub_Species					VARCHAR,
	Rare_Species				VARCHAR,
	Varient						VARCHAR,
	Deviant						VARCHAR,
	Apex						VARCHAR,
	Risen						VARCHAR,
	Guardian					VARCHAR,
	Orgin_Monster				VARCHAR,
	FOREIGN KEY(First_Appearance) REFERENCES games(G_Name)
);

-- Loads Monster data into the Monster table.
COPY monsters(M_Name, M_Class, Elements, Ailments, First_Appearance,
Latest_Appearance, No_of_Appearances, Base_Monster, Sub_Species, Rare_Species,
Varient, Deviant, Apex, Risen, Guardian, Orgin_Monster)
FROM 'C:\Users\Public\Documents\Monster_Hunter_Excels\monster_data.csv'
DELIMITER ','
CSV HEADER;


