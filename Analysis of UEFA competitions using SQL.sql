/* 1) Count the Total Number of Teams
This query counts the total number of teams in the "Teams" table.
*/
select distinct count(*) as total_no_of_teams
from teams;
/* 2) Find the Number of Teams per Country
-- This query groups teams by country and counts the number of teams in each country.
*/
select 
	country,
	count(team_name) as no_of_teams 
from teams 
group by country 
order by no_of_teams desc;
/* 3) Calculate the Average Team Name Length
This query calculates the average length of team names using the LENGTH() function.
*/
select 
	avg(length(team_name)) as avg_team_name_length 
	from teams;
/* 4) Calculate the Average Stadium Capacity in Each Country
 This query calculates the average stadium capacity per country, rounds the result,
 and sorts by the number of stadiums in each country (descending).
 */
select 
	country,
	round(avg(capacity)) as avg_capacity,
	count(*) as total_stadiums 
from stadiums 
group by country 
order by total_stadiums desc;
/* 5) Calculate the Total Goals Scored
 This query counts the total number of goals recorded in the "Matches" table.
 */
SELECT SUM(home_team_score+away_team_score+penalty_shoot_out) AS total_goals
FROM Matches; 
SELECT count(*)as total_goals 
from goals;
/*6) Find the Total Teams That Have "City" in Their Names
This query filters team names that contain the word "City" (case-insensitive).
*/
SELECT COUNT(*) AS total_teams
FROM teams
WHERE LOWER(team_name) LIKE '%city%';
/* 7) Concatenate the Team's Name and Country
 This query combines team names and their country using concatenation.
 */
SELECT 
    CONCAT(team_name, ',', country) AS team_country
FROM teams;
/* 8) Find the Highest Attendance Match
This query finds the match with the highest recorded attendance, including match details.
*/
SELECT 
    MATCH_ID,
    HOME_TEAM,
    AWAY_TEAM,
    DATE,
    ATTENDANCE
FROM Matches
WHERE ATTENDANCE = (SELECT MAX(ATTENDANCE) FROM Matches);
/* 9) Find the Lowest Attendance Match (Excluding 0 Attendance)
 This query retrieves the match with the lowest attendance (greater than 1 due to COVID-19 restrictions).
*/
SELECT 
    MATCH_ID,
    HOME_TEAM,
    AWAY_TEAM,
    DATE,
    ATTENDANCE
FROM Matches
WHERE ATTENDANCE = (
    SELECT MIN(ATTENDANCE)
    FROM Matches
    WHERE ATTENDANCE > 1
);
/* 10) Identify the Match with the Highest Total Score
 This query finds the match with the highest combined score (home + away).
*/
SELECT 
    MATCH_ID,
    HOME_TEAM,
    AWAY_TEAM,
    (HOME_TEAM_SCORE + AWAY_TEAM_SCORE) AS total_score
FROM Matches
ORDER BY total_score DESC
LIMIT 1;
/* 11) Find the Total Goals Scored by Each Team (Home & Away)
 This query calculates goals scored by teams in home and away matches separately.
*/ 
SELECT 
    TEAM_NAME,
    SUM(CASE WHEN TEAM_NAME = Matches.HOME_TEAM THEN HOME_TEAM_SCORE ELSE 0 END) AS home_goals,
    SUM(CASE WHEN TEAM_NAME = Matches.AWAY_TEAM THEN AWAY_TEAM_SCORE ELSE 0 END) AS away_goals,
    SUM(CASE WHEN TEAM_NAME = Matches.HOME_TEAM THEN HOME_TEAM_SCORE ELSE 0 END +
        CASE WHEN TEAM_NAME = Matches.AWAY_TEAM THEN AWAY_TEAM_SCORE ELSE 0 END) AS total_goals
FROM Teams
LEFT JOIN Matches ON TEAM_NAME = HOME_TEAM OR TEAM_NAME = AWAY_TEAM
GROUP BY TEAM_NAME;
/*12) Rank Teams by Total Scored Goals Using a Window Function (in Old Trafford)
 This query ranks teams based on total goals scored in matches played at Old Trafford.
*/
WITH TeamGoals AS (
    SELECT HOME_TEAM AS TEAM_NAME, SUM(HOME_TEAM_SCORE) AS total_goals
    FROM Matches
    WHERE STADIUM = 'Old Trafford'
    GROUP BY HOME_TEAM
    
    UNION ALL
    
    SELECT AWAY_TEAM AS TEAM_NAME, SUM(AWAY_TEAM_SCORE) AS total_goals
    FROM Matches
    WHERE STADIUM = 'Old Trafford'
    GROUP BY AWAY_TEAM
)

SELECT TEAM_NAME, 
       SUM(total_goals) AS total_goals_scored,
       RANK() OVER (ORDER BY SUM(total_goals) DESC) AS ranking
FROM TeamGoals
GROUP BY TEAM_NAME
ORDER BY ranking;
/*13) Find the Top 5 Players Who Scored the Most Goals in Old Trafford
This query finds the top 5 players who scored the most goals in Old Trafford, excluding null values.
*/
SELECT 
    p.player_id, 
    p.first_name, 
    p.last_name, 
    COUNT(g.match_id) AS goals 
FROM players p 
JOIN goals g ON p.player_id = g.pid 
WHERE g.match_id IN (SELECT match_id FROM matches WHERE stadium = 'Old Trafford')
GROUP BY p.player_id, p.first_name, p.last_name 
HAVING COUNT(g.match_id) > 0  -- Ensures players with zero goals are excluded
ORDER BY goals DESC 
LIMIT 5;


/*14) List All Players and Their Total Goals Scored (Top 6)
 This query counts goals per player and sorts the results in descending order.
*/ 
SELECT 
    p.player_id, 
    p.first_name, 
    p.last_name, 
    COUNT(*) AS total_goals 
FROM players p 
JOIN goals g ON p.player_id = g.pid 
GROUP BY p.player_id, p.first_name, p.last_name 
ORDER BY total_goals DESC
LIMIT 6;

/*15) Identify the Top Scorer for Each Team
This query finds the player with the highest number of goals for each team.
*/
WITH PlayerGoalCounts AS (
    SELECT 
        P.TEAM, 
        P.PLAYER_ID, 
        P.FIRST_NAME || ' ' || P.LAST_NAME AS PLAYER_NAME, 
        COUNT(G.GOAL_ID) AS total_goals,
        RANK() OVER (PARTITION BY P.TEAM ORDER BY COUNT(G.GOAL_ID) DESC) AS rank
    FROM Players P
    JOIN Goals G ON P.PLAYER_ID = G.PID
    GROUP BY P.TEAM, P.PLAYER_ID, P.FIRST_NAME, P.LAST_NAME
)

SELECT TEAM, PLAYER_ID, PLAYER_NAME, total_goals
FROM PlayerGoalCounts
WHERE rank = 1
ORDER BY TEAM;

/* 16) Find the Total Number of Goals Scored in the Latest Season
This query finds the latest season and calculates the total goals scored in that season.
*/
SELECT SUM(total_goals) AS total_goals_latest_season
FROM (
    SELECT COUNT(*) AS total_goals
    FROM Goals
    WHERE MATCH_ID IN (
        SELECT MATCH_ID
        FROM Matches
        WHERE SEASON = (SELECT MAX(SEASON) FROM Matches)
    )
) AS goals_latest;
/*17) Find Matches with Above Average Attendance
This query identifies matches with attendance higher than the average.
*/
SELECT 
    MATCH_ID,
    HOME_TEAM,
    AWAY_TEAM,
    DATE,
    ATTENDANCE
FROM Matches
WHERE ATTENDANCE > (SELECT AVG(ATTENDANCE) FROM Matches);
/*18) Find the Number of Matches Played Each Month
This query extracts the month from match dates and counts matches per month.
*/
SELECT 
    TO_CHAR("date", 'Month') AS month,
    COUNT(*) AS total_matches
FROM Matches
GROUP BY TO_CHAR("date", 'Month')
ORDER BY MIN("date");
