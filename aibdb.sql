/*AIB DB*/

/* >>>>FAE DB DATA<<<< */
DROP DATABASE IF EXISTS alice_in_borderland;
CREATE DATABASE IF NOT EXISTS alice_in_borderland;
USE alice_in_borderland;

CREATE TABLE player
(
    player_id          INTEGER PRIMARY KEY,
    player_name        VARCHAR(255),
    player_age         INTEGER,
    player_gender      VARCHAR(255),
    player_occupation  VARCHAR(255)
);

CREATE TABLE game_master
(
    game_master_id     INTEGER PRIMARY KEY,
    game_id            INTEGER,
    master_role        VARCHAR(255),
    player_id          INTEGER,
    FOREIGN KEY (player) REFERENCES player (player_id)
);

CREATE TABLE game
(
    game_id         INTEGER PRIMARY KEY,
    game_master_id  INTEGER,
    objective       VARCHAR(255),
    card_type       VARCHAR(255),
    difficulty      VARCHAR(255),
    player_count    INTEGER,
    survivor_count  VARCHAR(255),
    game_date       DATE,
    FOREIGN KEY (game_master_id) REFERENCES game_master (game_master_id)
);

CREATE TABLE location
(
    location_id    INTEGER PRIMARY KEY,
    location_name  VARCHAR(255),
    location_type  VARCHAR(255),
    time_limit     VARCHAR(255),
    hazard         VARCHAR(255),
    game_id        INTEGER,
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE player_game
(
    player_game_id  INTEGER PRIMARY KEY,
    player_role     VARCHAR(255),
    visa_change     INTEGER,
    outcome         VARCHAR(255),
    player_id       INTEGER,
    game_id         INTEGER,
    FOREIGN KEY (player_id) REFERENCES player (player_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE player_status /* EDITING TO TABLE */
(
    status_id     INTEGER PRIMARY KEY,
    injury        ENUM(0,1),
    death         ENUM(0,1),
    date_updated  DATE,
    player_id     INTEGER,
    FOREIGN KEY (player_id) REFERENCES player(player_id)
);

CREATE TABLE death_log
(
    death_log_id  INTEGER PRIMARY KEY,
    death_reason  VARCHAR(255),
    date          DATE,
    player_id     INTEGER,
    FOREIGN KEY (player_id) REFERENCES player (player_id)
);

CREATE TABLE injury_log
(
    injury_id    INTEGER PRIMARY KEY,
    injury_date  DATE,
    injury_type  VARCHAR(255),
    severity     VARCHAR(255),
    player_id    INTEGER,
    FOREIGN KEY (player_id) REFERENCES player (player_id)
);

insert into player (player_id, player_name, player_age, player_gender, player_occupation)
values
/* >>>>FAE EDITING<<<< */
    (14, 'Kujo Asahi', 17, 'Female', 'High School Student'),
    (15, 'Aguni Morizono', 37, 'Male', 'Military Officer (Japan Special Defence Force)'),
    (16, 'Yaba Oki', 34, 'Male', 'Con Man'),
    (17, 'Risa', 29, 'Female', 'Unknown'),
    (18, 'An Rizuna', 26, 'Female', 'Forensics Expert (Crime Scene Investigator)'),
    (19, 'Arisu Ryohei', 24, 'Male', 'Unemployed'),
    (20, 'Shibuki Saori', 28, 'Female', 'Office Worker'),
    (21, 'Chishiya Shuntaro', 25, 'Male', 'Medical Student'),
    (22, 'Niragi Suguru', 27, 'Male', 'Video Game Engineer'),
    (23, 'Banda Sunato', 32, 'Male', 'Serial Killer'),
    (24, 'Samura Takatora', 31, 'Male', 'Unemployed'),
    (25, 'Danma Takeru', 35, 'Male', 'Hat Merchant'),
    (26, 'Akamaki Urumi', 33, 'Female', 'Unknown'),
    (27, 'Usagi Yuzuha', 24, 'Female', 'Mountain Climber');

INSERT INTO game (game_id, game_master_id, objective, card_type, difficulty, player_count, survivor_count, game_date)
VALUES
/* >>>>FAE EDITING<<<< */
    (1, NULL,
     'Players must choose between two doors and exit the building. One marked "Live" (生) and the other marked "Death" (死). One door leads to another room, and the other one will lead to death. The door for the room does not represent what the result will be.',
     'Three of Clubs', 'LOW DIFFICULTY', 5, '4', 'YYYY-MM-DD'),
    (2, NULL,
     'The players have to find a safe zone and press a button while avoiding a tagger in the hallways of an apartment building',
     'Five of Spades', 'LOW DIFFICULTY', 13, '6', 'YYYY-MM-DD'),
    (3, NULL, 
     'Game Clear: Be the wolf when 10 minutes have passed. Game Over: Be a sheep when 10 minutes have passed',
     'Seven of Hearts', 'MEDIUM DIFFICULTY', 4, '1', 'YYYY-MM-DD'),
    (4, NULL, 
     'Players must endure the trials and reach the goal.', 
     'Four of Clubs', 'LOW DIFFICULTY', 5, '3', 'YYYY-MM-DD'),
    (5, NULL, 
     'Players must figure out what switch turns on the light', 'Four of Diamonds', 'LOW DIFFICULTY',
     7, '6', 'YYYY-MM-DD'),
    (6, NULL,
     'Players must find a number in each room with matchsticks and get a bingo. Only given nine, it is GAME OVER for the players who have used up all their matches.',
     'Ten of Clubs', 'HIGH DIFFICULTY', 10, '2', 'YYYY-MM-DD'),
    (7, NULL, 
     'Players need to cooperate to defeat all the beasts in the venue', 
     'Six of Spades', 'MEDIUM DIFFICULTY', 4, '4', 'YYYY-MM-DD'),
    (8, NULL,
     'Should the players find the witch, exact divine judgment, and burn their body along with their wretched soul in the Fire of Judgement, Game Clear. It’s Game Over if the witch survives for 120 minutes.',
     'Ten of Hearts', 'HIGH DIFFICULTY', 224, 'N/A', 'YYYY-MM-DD'),
    (9, GAMEMASTER, 
     'Players must have more points than the citizen team by the end of the time limit.',
     'King of Clubs', 'HIGH DIFFICULTY', 10, '4', 'YYYY-MM-DD'),
    (10, GAMEMASTER,
     'Players must guess the card suit symbol that appears on the back of their collar at the end of each round. t is GAME CLEAR for all remaining players when the Jack of Hearts dies',
     'Jack of Hearts', 'HIGH DIFFICULTY', 20, '3', 'YYYY-MM-DD'),
    (11, GAMEMASTER,
     'Players must play a team based version of freeze tag against citizens in which they switch teams when caught until they catch every player and citizen.',
     'Queen of Spades', 'HIGH DIFFICULTY', 20, '4', 'YYYY-MM-DD'),
    (12, GAMEMASTER,
     'Players must select a number from the grid. Once all numbers are selected, the average will be calculated, then multiplied by 0.8. The player closest to the number wins the round. The other players each lose a point. A scale above their heads will fill with sulfuric acid.',
     'King of Diamonds', 'HIGH DIFFICULTY', 5, '1', 'YYYY-MM-DD'),
    (13, GAMEMASTER,
     'Players must throw glowing balls at their opponents to knock them off their beams. It is GAME OVER if a player or citizen falls off their own beam; they will be lasered immediately. It is GAME CLEAR for the last standing pair or player.',
     'Queen of Clubs', 'HIGH DIFFICULTY', 14, '11', 'YYYY-MM-DD'),
    (14, GAMEMASTER,
     'If a player kills the King of Spades, it’s Game Clear for all remaining players. If all players are killed by the King of Spades, Game Over.',
     'King of Spades', 'HIGH DIFFICULTY', 253, 'N/A', 'YYYY-MM-DD'),
    (15, GAMEMASTER,
     'Should the players play 3 sets of croquet according to regulations through to completion, it’s Game Clear. If the players retire, it’s Game Over.',
     'Queen of Hearts', 'HIGH DIFFICULTY', 3, '2', 'YYYY-MM-DD');

INSERT INTO game_master (game_master_id, game_id, master_role, player_id)
VALUES
/* >>>>FAE EDITING<<<< */
(1, 9, 'King of Clubs', PLAYERID (GINJI)),
(2, 10, 'Jack of Hearts', PLAYERID (ENJI)),
(3, 11, 'Queen of Spades', 17),
(4, 12, 'King of Diamonds', PLAYERID (KUZURYU)),
(5, 13, 'Queen of Clubs', NULL),
(6, 14, 'King of Spades', PLAYERID(SHIRABI),
(7, 15, 'Queen of Hearts', PLAYERID (MIRA));

INSERT INTO location (location_id, location_name, location_type, time_limit, hazard, game_id)
VALUES
/* >>>>FAE EDITING<<<< */
(1, 'GM Building', 'Indoor', '2 Minutes per Room, decreases by 10 Seconds each Room', 'Death', 1),
(2, 'Toei Sendagaya Apartment', 'Indoor', '20 Minutes', 'Combat and Survival', 2),
(3, 'Shinjuku Natural Botanical Garden', 'Indoor', '15 Minutes', 'Explosive Collar', 3),
(4, 'Highway Tunnel', 'Indoor', '120 Minutes', 'Black Panther, Physcial Exhaustion and Flood', 4),
(5, 'Sewage Reservoir', 'Indoor', 'N/A', 'Electricity', 5),
(6, 'Tokyo Match Factory', 'Indoor', 'N/A', 'Laser', 6),
(7, 'Amusement Park', 'Outdoor', 'N/A', 'Various Animals', 7),
(8, 'Seaside Paradise Resort', 'Outdoor', '120 Minutes', 'Paranoia and Mistrust', 8),
(9, 'Port', 'Outdoor', '120 Minutes', 'Laser', 9),
(10, 'Teio Prison', 'Indoor', '60 Minutes', 'Explosive Collar', 10),
(11, 'Tokyo Power Plant', 'Outdoor', '80 Minutes', 'Physical Exhaustion', 11),
(12, 'Supreme Court', 'Indoor', '3 Minutes per Round', 'Sulfuric Acid', 12),
(13, 'Sewage Plant', 'Indoor', 'N/A', 'Balance and Targeting', 13),
(14, 'The Borderlands', 'Urban', 'N/A', 'Weapons and Physical Combat', 14),
(15, 'Rooftop Garden', 'Outdoor', 'N/A', 'Mental Game', 15);

INSERT INTO player_game (player_game_id, player_role, visa_change, outcome, player_id, game_id)
VALUES
/* >>>>FAE EDITING<<<< */
(1, 'Identify the witch within the time limit', 
 10, 'Dead', 14, 8),

(2, 'Find safe zone and evade taggers', 
 5, 'Survived', 15, 2),
(3, 'Defeat all the beasts in the venue', 
 6, 'Survived', 15, 7),
(4, 'Identify the witch within the time limit', 
 10, 'Survived', 15, 8),
(5, 'Survive against the King of Spades', 
 10, 'Survived', 15, 14),

(6, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 
 10, 'Survived', 16, 10),

(7, 'Be on the team with the most players by the end of the game', 
 10, 'Dead', 17, 11),

(8, 'Correctly shouts out which switch turns on the light', 
 4, 'Survived', 18, 5),
(9, 'Identify the witch within the time limit', 
 10, 'Survived', 18, 8),
(10, 'Play dodgeball against other teams without falling off the beam', 
 10, 'Survived', 18, 13),
(11, 'Survive against the King of Spades', 
 10, 'Survived', 18, 14),

(12, 'Exit the building safely within the time limit', 
 3, 'Survived', 19, 1),
(13, 'Find safe zone and evade taggers', 
 5, 'Survived', 19, 2),
(14, 'Be the wolf before the time ends', 
 7, 'Survived', 19, 3),
(15, 'Reach the end goal in time', 
 4, 'Survived', 19, 4),
(16, 'Correctly shouts out which switch turns on the light', 
 4, 'Survived', 19, 5),
(17, 'Identify the witch within the time limit', 
 10, 'Survived', 19, 8),
(18, 'Strategically earn points for your team to survive', 
 10, 'Survived', 19, 9),
(19, 'Be on the team with the most players by the end of the game', 
 10, 'Survived', 19, 11),
(20, 'Survive against the King of Spades', 
 10, 'Survived', 19, 14),
(21, 'Play Croquet and try not to be lead astray by the Queen of Hearts', 
 10, 'Survived', 19, 15),

(22, 'Exit the building safely within the time limit', 
 3, 'Survived', 20, 1),
(23, 'Be the wolf before the time ends', 
 7, 'Dead', 20, 3),

(24, 'Find safe zone and evade taggers', 
 5, 'Survived', 21, 2),
(25, 'Identify the witch within the time limit', 
 10, 'Survived', 21, 8),
(26, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 
 10, 'Survived', 21, 10),
(27, 'Must beat the King of Diamonds in a Balance Scale game', 
 10, 'Survived', 21, 12),

(28, 'Defeat all the beasts in the venue', 
 6, 'Survived', 22, 7),
(29, 'Identify the witch within the time limit', 
 10, 'Survived', 22, 8),
(30, 'Strategically earn points for your team to survive', 
 10, 'Survived', 22, 9),

(31, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 
 10, 'Survived', 23, 10),

(32, 'Defeat all the beasts in the venue', 
 6, 'Survived', 24, 7),
(33, 'Identify the witch within the time limit', 
 10, 'Dead', 24, 8),

(34, 'Identify the witch within the time limit', 
 10, 'Dead', 25, 8),

(35, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 
 10, 'Dead', 26, 10),

(36, 'Find safe zone and evade taggers', 
 5, 'Survived', 27, 2),
(37, 'Reach the end goal in time', 
 4, 'Survived', 27, 4),
(38, 'Find all the numbers to complete a row, column, or diagonal on a bingo sheet', 
 10, 'Survived', 27, 6),
(39, 'Identify the witch within the time limit', 
 10, 'Survived', 27, 8),
(40, 'Strategically earn points for your team to survive', 
 10, 'Survived', 27, 9),
(41, 'Be on the team with the most players by the end of the game', 
 10, 'Survived', 27, 11),
(42, 'Survive against the King of Spades', 
 10, 'Survived', 27, 14),
(43, 'Play Croquet and try not to be lead astray by the Queen of Hearts', 
 10, 'Survived', 27, 15);

INSERT INTO player_status (status_id, death, date_updated, player_id) /* EDITING TO TABLE */
VALUES
(1, '0', '2020-10-10', 1),
(2, '1', '2020-10-15', 1),
(3, '1', '2020-10-14', 2),
(4, '0', '2020-09-06', 3),
(5, '1', '2020-09-08', 3),
(6, '0', '2020-09-06', 4),
(7, '1', '2020-09-08', 4),
(8, '1', '2020-09-20', 5),
(9, '1', '2020-09-24', 6),
(10, '0', '2020-09-18', 7),
(11, '0', '2020-10-05', 7),
(12, '0', '2020-09-24', 7),
(13, '0', '2020-10-06', 7),
(14, '0', '2020-');
/* >>>>FAE EDITING<<<< */


INSERT INTO death_log (death_log_id, death_reason, date, player_id)
VALUES
/* >>>>FAE EDITING<<<< */
(1, 'Killed by Explosive Collar', 'YYYY-MM-DD', 20),
(2, 'Killed by Aguni Morizono', 'YYYY-MM-DD', 25),
(3, 'Killed by Laser', 'YYYY-MM-DD', 14),
(4, 'Killed by Fire', 'YYYY-MM-DD', 24),
(5, 'Killed by Explosive Collar after guessing her suit incorrectly', 'YYYY-MM-DD', 26),
(6, 'Killed by Laser', 'YYYY-MM-DD', 17);

INSERT INTO injury_log (injury_id, injury_date, injury_type, severity, player_id)
VALUES
/* >>>>FAE EDITING<<<< */
(1, 'YYYY-MM-DD', 'Knocked Unconscious', 'LOW SEVERITY', 18),
(2, 'YYYY-MM-DD', 'Beaten Up', 'MEDIUM SEVERITY', 15),
(4, 'YYYY-MM-DD', 'Severe Burns on Face and Body', 'HIGH SEVERITY', 22),
(3, 'YYYY-MM-DD', 'Gunshot Wound', 'HIGH SEVERITY', 21),
(5, 'YYYY-MM-DD', 'Gunshot Wound', 'HIGH SEVERITY', 22);