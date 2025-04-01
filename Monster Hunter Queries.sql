-- Jonathan Smedley

-- Sets the search path to the Monster Hunter Schema.
set search_path to  Monster_Hunter_Schema;

-- Shows that the search path is correctly set to the Monster Hunter Schema.
show search_path;




select *
from monsters
where ailments like '%Fireblight%';




select M_Name, ailments, value 
from monsters
CROSS apply split_part(ailment, '/');



select count(orgin_monster)
from monsters
where orgin_monster = 'Rathalos';

/*
Select G_Name, Num_of_Monsters_by_Title_Update
From games;
Group by Generation;
*/

/* Takes all of the Monsters Names that has an Orgin Monster
   and orders it by the order monsters name. */
   
Select Orgin_Monster, M_Name
From monsters
Where Orgin_Monster is NOT NULL
Order By Orgin_Monster;

/*
Select Count(Orgin_Monster)
From monsters
Order By Orgin_Monster;
*/

-- Gives the Orgin Monsters name and the deviants monsters name.

Select Orgin_Monster, M_Name
From Monsters
Where Deviant = 'Yes';

/* Takes the number of occurences for each monster (Orgin Monster)
that has a sub-type of monster species. It then groups the results
by the orgin monster and orders the data in ascending order based on
number of occurences for each orgin monster. */

Select count(Orgin_Monster), Orgin_Monster
From Monsters
Where Sub_Species ='Yes' or Rare_Species ='Yes' or
Varient ='Yes' or Deviant ='Yes' or
Apex ='Yes' or Risen ='Yes' or Guardian ='Yes'
Group By Orgin_Monster
Order By count(Orgin_Monster) asc;

/*
Select G_Name, Total_Monsters, if(expansion, "cool", "not cool")
From Games;
Order By Total_Monsters desc;
*/


Select G_Name, Total_Monsters
From Games
Order By Total_Monsters desc;


Select Games.Release_Date_Japan, Monsters.M_Name, Monsters.First_Appearance
From Games, Monsters
Where First_Appearance = 'MH Freedom Unite';





