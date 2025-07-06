# Cuvette-SQL -Project-1
My first set of final evaluation projects as a part of my final evaluation
UEFA Overview
The Union of European Football Associations (UEFA) is the administrative and controlling body for European football. Founded on June 15, 1954, in Basel, Switzerland, UEFA is one of the six continental confederations of world football's governing body FIFA. It consists of 55 member associations, each representing a country in Europe. UEFA organizes and oversees some of the most prestigious football competitions globally, including:

UEFA Champions League: An annual club football competition contested by top-division European clubs.

UEFA Europa League: A secondary club competition for European teams.

UEFA European Championship: Also known as the Euros, it is a tournament for national teams in Europe.

UEFA Nations League: A competition involving the men's national teams of the member associations of UEFA.

UEFA's responsibilities include regulating rules of the game, organizing international competitions, and promoting football development and fair play.

Dataset Overview
The dataset provided consists of five CSV files: Goals, Matches, Players, Stadiums, and Teams. These files contain comprehensive data on various aspects of UEFA competitions, enabling detailed analysis and insights into football dynamics. The project focuses on analyzing these datasets using SQL to answer specific questions about teams, players, goals, matches, and stadiums.

Data Dictionary 
Goals.csv

 Column Name 

 Data Type 

 Description                                      

 GOAL_ID     

 String    

 Unique identifier for each goal                  

 MATCH_ID    

 String    

 Identifier for the match in which the goal was scored 

 PID         

 String    

 Identifier for the player who scored the goal    

 DURATION    

 Integer   

 Minute in the match when the goal was scored     

 ASSIST      

 String    

 Identifier for the player who assisted the goal  

 GOAL_DESC   

 String    

 Description of how the goal was scored (e.g., right-footed shot, penalty) 



Matches.csv

Column Name Data Type Description

MATCH_ID String Unique identifier for each match

SEASONUEFA Overview
The Union of European Football Associations (UEFA) is the administrative and controlling body for European football. Founded on June 15, 1954, in Basel, Switzerland, UEFA is one of the six continental confederations of world football's governing body FIFA. It consists of 55 member associations, each representing a country in Europe. UEFA organizes and oversees some of the most prestigious football competitions globally, including:

UEFA Champions League: An annual club football competition contested by top-division European clubs.

UEFA Europa League: A secondary club competition for European teams.

UEFA European Championship: Also known as the Euros, it is a tournament for national teams in Europe.

UEFA Nations League: A competition involving the men's national teams of the member associations of UEFA.

UEFA's responsibilities include regulating rules of the game, organizing international competitions, and promoting football development and fair play.

Dataset Overview
The dataset provided consists of five CSV files: Goals, Matches, Players, Stadiums, and Teams. These files contain comprehensive data on various aspects of UEFA competitions, enabling detailed analysis and insights into football dynamics. The project focuses on analyzing these datasets using SQL to answer specific questions about teams, players, goals, matches, and stadiums.

Data Dictionary 
Goals.csv

 Column Name 

 Data Type 

 Description                                      

 GOAL_ID     

 String    

 Unique identifier for each goal                  

 MATCH_ID    

 String    

 Identifier for the match in which the goal was scored 

 PID         

 String    

 Identifier for the player who scored the goal    

 DURATION    

 Integer   

 Minute in the match when the goal was scored     

 ASSIST      

 String    

 Identifier for the player who assisted the goal  

 GOAL_DESC   

 String    

 Description of how the goal was scored (e.g., right-footed shot, penalty) 



Matches.csv

Column Name

Data Type

Description

MATCH_ID

String

Unique identifier for each match

SEASON

String

The season during which the match took place (e.g., "2021-2022")

DATE

String

The date when the match was played (in DD-MM-YYYY format)

HOME_TEAM

String

The name of the home team

AWAY_TEAM

String

The name of the away team

STADIUM

String

The name of the stadium where the match was played

HOME_TEAM_SCORE

Integer

The score of the home team

AWAY_TEAM_SCORE

Integer

The score of the away team

PENALTY_SHOOT_OUT

Integer

Indicator of whether there was a penalty shootout (1 = Yes, 0 = No)

ATTENDANCE

Integer

The number of spectators attending the match



Players.csv

Column Name

Data Type

Description

PLAYER_ID

String

Unique identifier for each player

FIRST_NAME

String

First name of the player

LAST_NAME

String

Last name of the player

NATIONALITY

String

Nationality of the player

DOB

Date

Date of birth of the player (in YYYY-MM-DD format)

TEAM

String

Team that the player is currently playing for

JERSEY_NUMBER

Float

Jersey number of the player

POSITION

String

Playing position of the player (e.g., Defender, Midfielder)

HEIGHT

Float

Height of the player (in centimeters)

WEIGHT

Float

Weight of the player (in kilograms)

FOOT

String

Preferred foot of the player (R = Right, L = Left)



Teams.csv

Column Name

Data Type

Description

TEAM_NAME

String

Name of the team

COUNTRY

String

Country where the team is based

HOME_STADIUM

String

Name of the team's home stadium



Stadium.csv

column Name

Data Type

Description

Name 

String

Name of the stadium

City

String 

Name of the City

Country 

String

Name of the Country 

Capacity

Int

Capacity of the stadium



Tasks - 

Load up the 5 Tables in your Postgresql and try to solve the questions mentioned below. The link containing the CSV file of the tables is attached below. 

https://drive.google.com/drive/folders/1wo-LFBqkH-6MmwxTMoefVKv1HrLIL3Xi?usp=sharing



--1)Count the Total Number of Teams

--2)Find the Number of Teams per Country

--3)Calculate the Average Team Name Length

--4)Calculate the Average Stadium Capacity in Each Country round it off and sort by the total stadiums in the country.

--5)Calculate the Total Goals Scored.

--6)Find the total teams that have city in their names

--7) Use Text Functions to Concatenate the Team's Name and Country

--8) What is the highest attendance recorded in the dataset, and which match (including home and away teams, and date) does it correspond to?

--9)What is the lowest attendance recorded in the dataset, and which match (including home and away teams, and date) does it correspond to set the criteria as greater than 1 as some matches had 0 attendance because of covid.

--10) Identify the match with the highest total score (sum of home and away team scores) in the dataset. Include the match ID, home and away teams, and the total score.

--11)Find the total goals scored by each team, distinguishing between home and away goals. Use a CASE WHEN statement to differentiate home and away goals within the subquery

--12) windows function - Rank teams based on their total scored goals (home and away combined) using a window function.In the stadium Old Trafford.

--13) TOP 5 l players who scored the most goals in Old Trafford, ensuring null values are not included in the result (especially pertinent for cases where a player might not have scored any goals).

--14)Write a query to list all players along with the total number of goals they have scored. Order the results by the number of goals scored in descending order to easily identify the top 6 scorers.

--15)Identify the Top Scorer for Each Team - Find the player from each team who has scored the most goals in all matches combined. This question requires joining the Players, Goals, and possibly the Matches tables, and then using a subquery to aggregate goals by players and teams.

--16)Find the Total Number of Goals Scored in the Latest Season - Calculate the total number of goals scored in the latest season available in the dataset. This question involves using a subquery to first identify the latest season from the Matches table, then summing the goals from the Goals table that occurred in matches from that season.

--17)Find Matches with Above Average Attendance - Retrieve a list of matches that had an attendance higher than the average attendance across all matches. This question requires a subquery to calculate the average attendance first, then use it to filter matches.

--18)Find the Number of Matches Played Each Month - Count how many matches were played in each month across all seasons. This question requires extracting the month from the match dates and grouping the results by this value. as January Feb marchString

The season during which the match took place (e.g., "2021-2022")

DATE

String

The date when the match was played (in DD-MM-YYYY format)

HOME_TEAM

String

The name of the home team

AWAY_TEAM

String

The name of the away team

STADIUM

String

The name of the stadium where the match was played

HOME_TEAM_SCORE

Integer

The score of the home team

AWAY_TEAM_SCORE

Integer

The score of the away team

PENALTY_SHOOT_OUT

Integer

Indicator of whether there was a penalty shootout (1 = Yes, 0 = No)

ATTENDANCE

Integer

The number of spectators attending the match



Players.csv

Column Name

Data Type

Description

PLAYER_ID

String

Unique identifier for each player

FIRST_NAME

String

First name of the player

LAST_NAME

String

Last name of the player

NATIONALITY

String

Nationality of the player

DOB

Date

Date of birth of the player (in YYYY-MM-DD format)

TEAM

String

Team that the player is currently playing for

JERSEY_NUMBER

Float

Jersey number of the player

POSITION

String

Playing position of the player (e.g., Defender, Midfielder)

HEIGHT

Float

Height of the player (in centimeters)

WEIGHT

Float

Weight of the player (in kilograms)

FOOT

String

Preferred foot of the player (R = Right, L = Left)



Teams.csv

Column Name

Data Type

Description

TEAM_NAME

String

Name of the team

COUNTRY

String

Country where the team is based

HOME_STADIUM

String

Name of the team's home stadium



Stadium.csv

column Name

Data Type

Description

Name 

String

Name of the stadium

City

String 

Name of the City

Country 

String

Name of the Country 

Capacity

Int

Capacity of the stadium



Tasks - 

Load up the 5 Tables in your Postgresql and try to solve the questions mentioned below. The link containing the CSV file of the tables is attached below. 

https://drive.google.com/drive/folders/1wo-LFBqkH-6MmwxTMoefVKv1HrLIL3Xi?usp=sharing



--1)Count the Total Number of Teams

--2)Find the Number of Teams per Country

--3)Calculate the Average Team Name Length

--4)Calculate the Average Stadium Capacity in Each Country round it off and sort by the total stadiums in the country.

--5)Calculate the Total Goals Scored.

--6)Find the total teams that have city in their names

--7) Use Text Functions to Concatenate the Team's Name and Country

--8) What is the highest attendance recorded in the dataset, and which match (including home and away teams, and date) does it correspond to?

--9)What is the lowest attendance recorded in the dataset, and which match (including home and away teams, and date) does it correspond to set the criteria as greater than 1 as some matches had 0 attendance because of covid.

--10) Identify the match with the highest total score (sum of home and away team scores) in the dataset. Include the match ID, home and away teams, and the total score.

--11)Find the total goals scored by each team, distinguishing between home and away goals. Use a CASE WHEN statement to differentiate home and away goals within the subquery

--12) windows function - Rank teams based on their total scored goals (home and away combined) using a window function.In the stadium Old Trafford.

--13) TOP 5 l players who scored the most goals in Old Trafford, ensuring null values are not included in the result (especially pertinent for cases where a player might not have scored any goals).

--14)Write a query to list all players along with the total number of goals they have scored. Order the results by the number of goals scored in descending order to easily identify the top 6 scorers.

--15)Identify the Top Scorer for Each Team - Find the player from each team who has scored the most goals in all matches combined. This question requires joining the Players, Goals, and possibly the Matches tables, and then using a subquery to aggregate goals by players and teams.

--16)Find the Total Number of Goals Scored in the Latest Season - Calculate the total number of goals scored in the latest season available in the dataset. This question involves using a subquery to first identify the latest season from the Matches table, then summing the goals from the Goals table that occurred in matches from that season.

--17)Find Matches with Above Average Attendance - Retrieve a list of matches that had an attendance higher than the average attendance across all matches. This question requires a subquery to calculate the average attendance first, then use it to filter matches.

--18)Find the Number of Matches Played Each Month - Count how many matches were played in each month across all seasons. This question requires extracting the month from the match dates and grouping the results by this value. as January Feb march
