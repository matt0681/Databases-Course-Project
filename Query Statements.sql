/*
 * List of all games that start at 11:00am
 * Ordered by game date
 * Id, Date, Home team, Away team
 */
SELECT g.game_id as 'Game ID', g.game_date as 'Game Date', g.home_team_id as 'Home Team', g.away_team_id as 'Away Team'
    FROM game g
    WHERE g.game_start_time = '11:00:00'
    ORDER BY g.game_date asc;
 
/*
 * List of all contacts that are not affiliated with a team or stadium.
 * (Any contacts with a NULL team field)
 * Ordered by last name
 * Title, Fname, Lname, Phone, Team
 */
SELECT t.title as 'Contact Tile', c.first_name as 'First Name', c.last_name as 'Last Name', c.contact_phone as 'Phone', c.team_id as 'Team/Stadium Affiliation'
    FROM contact c, [type] t
    WHERE c.team_id IS NULL and t.type_id = c.type_id
    ORDER BY c.last_name asc;
 
/*
 * List of all contacts that are type 'Team Coach'
 * Ordered by last name
 * Title, Fname, Lname, Phone, Team, Comments
 */
SELECT t.title as 'Title', c.first_name as 'First Name', c.last_name as 'Last Name', 
       c.contact_phone as 'Phone', c.team_id as 'Team ID', c.comments as 'Comments'
    FROM [type] t, contact c
    WHERE c.type_id = 'A03' and c.type_id = t.type_id
    ORDER BY c.last_name asc;
 
/*
 * List of all home games played by Team ID: 'T03' (Warlocks)
 * Ordered by game date
 * Team ID, Team Name, Game Date, Game ID
 */
SELECT t.team_id as 'Team ID', t.team_name as 'Team Name', g.game_date as 'Home Game Date', g.game_id as 'Game ID'
    FROM team t, game g
    WHERE g.home_team_id = t.team_id and t.team_id = 'T03'
    ORDER BY g.game_date asc;
 
/*
 * List of all games that Team ID: 'T01' (Griffins) will play in.
 * Shows who will be the home team at each game.
 * Ordered by game date.
 * Team ID, Game ID, Game Date
 */
SELECT g.game_id as 'Game ID', g.game_date as 'Game Date', g.home_team_id as 'Home Team', g.away_team_id as 'Away Team'
    FROM team t, game g
    WHERE g.home_team_id = 'T01' OR g.away_team_id = 'T01'
    ORDER BY g.game_date asc;
 
/*
 * List of every game and the stadium contact for the stadium each game will be played at.
 * Ordered by game date or contact's last name.
 * Game ID, Game Date, Game Time, Home Team, Away Team, Stadium, Title, Fname, Lname, Phone, Comments
 */
SELECT g.game_id as 'Game ID', g.game_date as 'Game Date', g.game_start_time as 'Game Start Time', 
       g.home_team_id as 'Home Team', g.away_team_id as 'Away Team', s.name as 'Stadium Name',
       ty.title as 'Title', c.first_name as 'First Name', c.last_name as 'Last Name', c.contact_phone as 'Phone',
       c.comments as 'Comments'
    FROM game g, team t, stadium s, contact c, [type] ty
    WHERE g.home_team_id = t.team_id AND t.home_stadium = s.stadium_id
          AND t.team_id = c.team_id AND c.type_id = ty.type_id AND ty.type_id = 'A01'
    ORDER BY g.game_date asc; /*Or you can do "ORDER BY c.last_name asc;" */
 
 
/*
 * The following three statements update a contact.
 * (The first and last selects just display what is in the contact table before and after the update)
 * It adds an email to John Burkett's contact.
 * Ordered by title.
 *
 */
SELECT ty.title as 'Title', c.last_name as 'Last Name', c.first_name as 'First Name', 
       c.contact_phone as 'Phone', c.email as 'Email', c.comments as 'Comments'
    FROM [type] ty, contact c
    WHERE c.type_id = ty.type_id
    ORDER BY ty.title asc, c.last_name asc;
 
UPDATE contact
    SET email = 'sarah.powers@gmail.com'
    WHERE contact.contact_id = 'C08';
 
SELECT ty.title as 'Title', c.last_name as 'Last Name', c.first_name as 'First Name', 
       c.contact_phone as 'Phone', c.email as 'Email', c.comments as 'Comments'
    FROM [type] ty, contact c
    WHERE c.type_id = ty.type_id
    ORDER BY ty.title asc, c.last_name asc;
