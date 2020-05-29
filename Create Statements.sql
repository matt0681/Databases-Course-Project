 
DROP TABLE contact;
DROP TABLE [type];
DROP TABLE stadium;
DROP TABLE game;
DROP TABLE team;
DROP TABLE season;
 
 
CREATE TABLE season(
    szn_id              CHAR(3)     NOT NULL,
    szn_start_date      DATE        NULL,
    szn_end_date        DATE        NULL,
    tourn_start_date    DATE        NULL,
    tourn_end_date      DATE        NULL,
 
    CONSTRAINT season_pk PRIMARY KEY(szn_id)
);
 
INSERT into season VALUES('001', '2020-01-01', '2020-05-05', '2020-04-20', '2020-05-05');
SELECT * FROM season;
 
 
CREATE TABLE team(
    team_id         CHAR(3)         NOT NULL,
    team_name       VARCHAR(20)     NOT NULL,
    home_stadium    CHAR(3)     NOT NULL,
    team_phone      VARCHAR(16)     NULL,
 
    CONSTRAINT team_pk PRIMARY KEY(team_id)
);
 
INSERT into team VALUES('T01', 'Griffins', 'S01', '352-223-6748'),
                       ('T02', 'Gorgons', 'S02', '982-276-5940'),
                       ('T03', 'Warlocks', 'S03', '862-383-9202'),
                       ('T04', 'Beaters', 'S04', '754-222-0998'),
                       ('T05', 'Stags', 'S05', '762-333-9039'),
                       ('T06', 'Merpeople', 'S06', '668-383-1192'),
                       ('T07', 'Quaffles', 'S07', '527-705-2022'),
                       ('T08', 'Keepers', 'S08', '225-882-7474');
SELECT * FROM team;
 
 
CREATE TABLE game(
    game_id            CHAR(3)   NOT NULL,
    game_date          DATE      NULL,
    game_start_time    TIME      NULL,
    szn_id             CHAR(3)   NOT NULL,
    home_team_id       CHAR(3)     NULL,
    away_team_id       CHAR(3)     NULL,
 
    CONSTRAINT game_pk PRIMARY KEY(game_id),
    
    CONSTRAINT game_fk_szn FOREIGN KEY(szn_id) REFERENCES season(szn_id),
    CONSTRAINT game_fk_home_team FOREIGN KEY(home_team_id) REFERENCES team(team_id),
    CONSTRAINT game_fk_away_team FOREIGN KEY(away_team_id) REFERENCES team(team_id)
);
 
INSERT into game(game_id, game_date, game_start_time, szn_id, home_team_id, away_team_id) 
    VALUES('G01', '2020-01-01', '11:00:00', '001', 'T01', 'T02'),
          ('G02', '2020-01-03', '11:00:00', '001', 'T02', 'T03'),
          ('G03', '2020-01-08', '11:00:00', '001', 'T03', 'T04'),
          ('G04', '2020-01-18', '12:00:00', '001', 'T04', 'T05'),
          ('G05', '2020-01-19', '12:00:00', '001', 'T05', 'T06'),
          ('G06', '2020-01-27', '13:00:00', '001', 'T06', 'T07'),
          ('G07', '2020-02-01', '13:00:00', '001', 'T07', 'T08'),
          ('G08', '2020-02-03', '14:00:00', '001', 'T08', 'T01'),
          ('G09', '2020-02-09', '15:00:00', '001', 'T03', 'T08'),
          ('G10', '2020-02-11', '16:00:00', '001', 'T02', 'T07'),
          ('G11', '2020-02-14', '18:00:00', '001', 'T03', 'T06'),
          ('G12', '2020-02-18', '13:00:00', '001', 'T04', 'T02'),
          ('G13', '2020-02-20', '13:00:00', '001', 'T05', 'T08'),
          ('G14', '2020-03-01', '15:00:00', '001', 'T04', 'T01'),
          ('G15', '2020-03-03', '11:00:00', '001', 'T07', 'T03'),
          ('G16', '2020-03-04', '12:00:00', '001', 'T08', 'T02'),
          ('G17', '2020-03-05', '12:00:00', '001', 'T01', 'T07'),
          ('G18', '2020-03-10', '12:00:00', '001', 'T02', 'T05'),
          ('G19', '2020-03-15', '14:00:00', '001', 'T03', 'T01'),
          ('G20', '2020-03-23', '13:00:00', '001', 'T04', 'T06'),
          ('G21', '2020-03-28', '14:00:00', '001', 'T05', 'T01'),
          ('G22', '2020-04-01', '14:00:00', '001', 'T06', 'T08'),
          ('G23', '2020-04-03', '18:00:00', '001', 'T07', 'T04'),
          ('G24', '2020-04-07', '17:00:00', '001', 'T08', 'T04'),
          ('G25', '2020-04-14', '17:00:00', '001', 'T06', 'T01'),
          ('G26', '2020-04-23', '17:00:00', '001', 'T02', 'T06'),
          ('G27', '2020-05-01', '17:00:00', '001', 'T03', 'T05'),
          ('G28', '2020-05-05', '17:00:00', '001', 'T05', 'T07');
SELECT * FROM game;
 
 
CREATE TABLE stadium(
    stadium_id   CHAR(3)        NOT NULL,
    name         VARCHAR(30)    NOT NULL,
    address      VARCHAR(50)    NOT NULL,
    city         VARCHAR(20)    NULL,
    state       CHAR(2)         NULL,
    zip         CHAR(5)         NULL,
    team_id     CHAR(3)         NOT NULL,
 
    CONSTRAINT stadium_pk PRIMARY KEY(stadium_id),
    
    CONSTRAINT stadium_fk FOREIGN KEY(team_id) REFERENCES team(team_id)
);
 
INSERT into stadium(stadium_id, name, address, team_id) 
    VALUES('S01', 'The Coca Cola Stadium', '409 Nelson St. SW, Atlanta, GA 30313', 'T01'),
          ('S02', 'Godric Stadium', '1 Titans Way, Nashville, TN 37213', 'T02'),
          ('S03', 'Butterbeer Stadium', '1 E 161 St, The Bronx, NY 10451', 'T03'),
          ('S04', 'Bojangles Stadium', '1001 Rose Bowl Dr, Pasadena, CA 91103', 'T04'),
          ('S05', 'Chick-Fil-A Stadium', '800 Occidental Ave S, Seattle, WA 98134', 'T05'),
          ('S06', 'Wands-A-Billion Stadium', '347 Don Shula Dr, Miami Gardens, FL 33056', 'T06'),
          ('S07', 'Ford Motor Stadium', '1901 W Madison St, Chicago, IL 60612', 'T07'),
          ('S08', 'Home Depot Stadium', 'NRG Pkwy, Houston, TX 77054', 'T08');
SELECT * FROM stadium;
 
 
CREATE TABLE type(
    type_id     CHAR(3)       NOT NULL,
    title       VARCHAR(20)   NOT NULL,
 
    CONSTRAINT type_pk PRIMARY KEY(type_id)
);
 
INSERT into type VALUES('A01', 'Stadium Manager'),
                       ('A02', 'Team Manager'),
                       ('A03', 'Team Coach'),
                       ('A04', 'Commissioner'),
                       ('A05', 'Secretary'),
                       ('A06', 'Treasurer'),
                       ('A07', 'Consultant');
SELECT * FROM type;
 
 
CREATE TABLE contact(
    contact_id      CHAR(3)        NOT NULL,
    type_id         CHAR(3)        NOT NULL,
    first_name      VARCHAR(15)    NULL,
    last_name       VARCHAR(15)    NULL,
    contact_phone   VARCHAR(16)    NOT NULL,
    comments        TEXT           NULL,
    email           VARCHAR(40)    NULL,
    team_id         CHAR(3)        NULL,
 
    CONSTRAINT contact_pk PRIMARY KEY(contact_id),
 
    CONSTRAINT contact_fk_team FOREIGN KEY(team_id) REFERENCES team(team_id),
    CONSTRAINT contact_fk_type FOREIGN KEY(type_id) REFERENCES type(type_id)
);
 
INSERT into contact(contact_id, type_id, first_name, last_name, contact_phone)
    VALUES('C01', 'A04', 'Matthew', 'Lad', '123-456-7890'),
          ('C02', 'A06', 'Caleb', 'Covert', '098-765-4321'),
          ('C03', 'A05', 'Jen', 'Stone', '123-455-4321'),
          ('C11', 'A07', 'John', 'Burkett', '543-452-1424');
 
INSERT into contact(contact_id, type_id, first_name, last_name, contact_phone, comments, team_id)
    VALUES('C04', 'A03', 'Robert', 'Jones', '111-345-7890', 'Prefers Bob', 'T01'),
          ('C05', 'A03', 'Timothy', 'Sanchez', '(790) 523-1705', 'Prefers Tim', 'T03'),
          ('C06', 'A03', 'Patricia', 'Mitchell', '(406) 214-3309', 'Vegan', 'T04'),
          ('C07', 'A03', 'Craig', 'Stewart', '(289) 674-9398', 'Does not get along with Coach Jones', 'T05'),
          ('C10', 'A01', 'Lauren', 'Gattie', '615-292-3611', 'Prefers Mrs.', 'T02');
 
INSERT into contact(contact_id, type_id, first_name, last_name, contact_phone, team_id)
    VALUES('C08', 'A02', 'Sarah', 'Powers', '972-223-8772', 'T01'),
          ('C09', 'A03', 'Philip', 'Perry', '363-978-3348', 'T06'),
          ('C12', 'A02', 'Timothy', 'Howland', '615-726-2837', 'T02'),
          ('C13', 'A01', 'Howard', 'Williams', '837-292-7583', 'T01'),
          ('C14', 'A02', 'Marcus', 'Mariotta', '363-947-5922', 'T03'),
          ('C15', 'A02', 'Elvis', 'Presley', '678-395-1947', 'T04'),
          ('C16', 'A02', 'Robert', 'Schmitt', '483-285-5839', 'T05'),
          ('C17', 'A03', 'Brittany', 'McCurry', '586-294-2948', 'T02'),
          ('C18', 'A03', 'Mary', 'Stabler', '492-193-5938', 'T07'),
          ('C19', 'A02', 'Chris', 'Lee', '392-4928-5923', 'T06'),
          ('C20', 'A02', 'Grace', 'Thompson', '193-028-4928', 'T07'),
          ('C21', 'A02', 'Lou', 'Riley', '438-937-5382', 'T08'),
          ('C22', 'A03', 'John', 'Smith', '1900-338-9912', 'T08'),
          ('C23', 'A01', 'Jean', 'Gatto', '338-837-1100', 'T03'),
          ('C24', 'A01', 'Brad', 'Frost', '229-575-1183', 'T04'),
          ('C25', 'A01', 'Jack', 'Frost', '394-284-5777', 'T05');
 
SELECT * FROM contact;
