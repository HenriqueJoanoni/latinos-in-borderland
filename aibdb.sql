/*AIB DB*/

DROP DATABASE IF EXISTS alice_in_borderland;
CREATE DATABASE IF NOT EXISTS alice_in_borderland;
USE alice_in_borderland;

/** CREATE TABLE STATEMENTS */
DROP TABLE IF EXISTS player;
CREATE TABLE player
(
    player_id          INTEGER PRIMARY KEY,
    player_name        VARCHAR(255),
    player_age         INTEGER,
    player_gender      VARCHAR(255),
    player_occupation  VARCHAR(255)
);

/** FOR DATA INTEGRITY PURPOSES WE WILL HAVE TO REMOVE GAME ID FROM game_master
 * SO WE CAN PROPERLY ADD THE DATA TO THE TABLES WITHOUT HAVING CONSTRAINT PROBLEMS
 */
DROP TABLE IF EXISTS game_master;
CREATE TABLE game_master
(
    game_master_id     INTEGER PRIMARY KEY,
    -- game_id            INTEGER,
    master_role        VARCHAR(255),
    player_id          INTEGER
);

DROP TABLE IF EXISTS game;
CREATE TABLE game
(
    game_id         INTEGER PRIMARY KEY,
    game_master_id  INTEGER,
    objective       MEDIUMTEXT,
    card_type       VARCHAR(255),
    difficulty      VARCHAR(255),
    player_count    INTEGER,
    survivor_count  INTEGER
    -- game_date     DATE,  -- commented out for now
);

DROP TABLE IF EXISTS location;
CREATE TABLE location
(
    location_id    INTEGER PRIMARY KEY,
    location_name  VARCHAR(255),
    location_type  VARCHAR(255),
    time_limit     VARCHAR(255),
    hazard         VARCHAR(255),
    game_id        INTEGER
);

DROP TABLE IF EXISTS player_game;
CREATE TABLE player_game
(
    player_game_id  INTEGER PRIMARY KEY,
    player_role     VARCHAR(255),
    visa_change     INTEGER,
    outcome         VARCHAR(255),
    player_id       INTEGER,
    game_id         INTEGER
);

DROP TABLE IF EXISTS player_status;
CREATE TABLE player_status
(
    status_id     INTEGER PRIMARY KEY,
    injury        TINYINT,
    death         TINYINT,
    player_id     INTEGER,
    game_id       INTEGER
);

DROP TABLE IF EXISTS death_log;
CREATE TABLE death_log
(
    death_log_id  INTEGER PRIMARY KEY,
    death_reason  VARCHAR(255),
    player_id     INTEGER,
    game_id       INTEGER
);

DROP TABLE IF EXISTS injury_log;
CREATE TABLE injury_log
(
    injury_id    INTEGER PRIMARY KEY,
    game_id      INTEGER,
    injury_type  VARCHAR(255),
    severity     VARCHAR(255),
    player_id    INTEGER
);

/** ADD FK'S INTO TABLES */
ALTER TABLE game_master
    -- ADD FOREIGN KEY (game_id) REFERENCES game (game_id),
    ADD FOREIGN KEY (player_id) REFERENCES player (player_id)
    ON DELETE CASCADE;

ALTER TABLE game
    ADD FOREIGN KEY (game_master_id) REFERENCES game_master (game_master_id)
    ON DELETE CASCADE;

ALTER TABLE location
    ADD FOREIGN KEY (game_id) REFERENCES game (game_id)
    ON DELETE CASCADE;

ALTER TABLE player_game
    ADD FOREIGN KEY (player_id) REFERENCES player (player_id),
    ADD FOREIGN KEY (game_id) REFERENCES game (game_id)
    ON DELETE CASCADE;

ALTER TABLE player_status
    ADD FOREIGN KEY (player_id) REFERENCES player (player_id),
    ADD FOREIGN KEY (game_id) REFERENCES game (game_id)
    ON DELETE CASCADE;

ALTER TABLE death_log
    ADD FOREIGN KEY (player_id) REFERENCES player (player_id),
    ADD FOREIGN KEY (game_id) REFERENCES game (game_id)
    ON DELETE CASCADE;

ALTER TABLE injury_log
    ADD FOREIGN KEY (player_id) REFERENCES player (player_id),
    ADD FOREIGN KEY (game_id) REFERENCES game (game_id)
    ON DELETE CASCADE;

/** INSERT INTO TABLES */
INSERT INTO player (player_id, player_name, player_age, player_gender, player_occupation)
VALUES
        (1,  'Heiya Akane', 18, 'Female', 'High School Student'),
		(2,  'Yashige Benzo', 29, 'Male', 'Construction Worker'),
		(3,  'Segawa Chota', 26, 'Male', 'IT company worker'),
		(4,  'Karube Daikiche', 34, 'Male', 'Bar Owner'),
		(5,  'Matsushita Enji', 30, 'Male', 'Hypnotherapist'),
        (6,  'Kyuma Ginji', 28, 'Male', 'Musician'),
        (7,  'Hikari Kuina', 24, 'Female', 'Apparels Clerk'),
        (8,  'Ippei Oki', 17, 'Male', 'High School Student'),
        (9,  'Keiichi Kuzuryu', 52, 'Male', 'Lawyer'),
        (10, 'Kodai Tatta', 20, 'Male', 'Freeter'),
        (11, 'Mira Kano', 24, 'Female', 'Psychiatrist'),
        (12, 'Momoka Inoue', 18, 'Female', 'High School Student'),
        (13, 'Kujo Asahi', 17, 'Female', 'High School Student'),
        (14, 'Aguni Morizono', 37, 'Male', 'Military Officer (Japan Special Defence Force)'),
        (15, 'Yaba Oki', 34, 'Male', 'Con Man'),
        (16, 'Risa', 29, 'Female', 'Unknown'),
        (17, 'An Rizuna', 26, 'Female', 'Forensics Expert (Crime Scene Investigator)'),
        (18, 'Arisu Ryohei', 24, 'Male', 'Unemployed'),
        (19, 'Shibuki Saori', 28, 'Female', 'Office Worker'),
        (20, 'Chishiya Shuntaro', 25, 'Male', 'Medical Student'),
        (21, 'Niragi Suguru', 27, 'Male', 'Video Game Engineer'),
        (22, 'Banda Sunato', 32, 'Male', 'Serial Killer'),
        (23, 'Samura Takatora', 31, 'Male', 'Unemployed'),
        (24, 'Danma Takeru', 35, 'Male', 'Hat Merchant'),
        (25, 'Akamaki Urumi', 33, 'Female', 'Unknown'),
        (26, 'Usagi Yuzuha', 24, 'Female', 'Mountain Climber');


/** OLD :
INSERT INTO game_master (game_master_id, game_id, master_role, player_id)
VALUES
(1, 9, 'King of Clubs', 6),
(2, 10, 'Jack of Hearts', 5),
(3, 12, 'Queen of Spades', 16),
(4, 13, 'King of Diamonds', 9),
(5, 14, 'Queen of Clubs', NULL),
(6, 16, 'King of Spades', NULL),
(7, 17, 'Queen of Hearts', 11),
(8, 1, 'Three of Clubs', NULL),
(9, 2, 'Five of Spades', NULL),
(10, 3, 'Seven of Hearts', NULL),
(11, 4, 'Four of Clubs', NULL),
(12, 5, 'Four of Diamonds', Null),
(13, 6, 'Ten of Clubs', NULL),
(14, 15, 'Jack of Spades', 5),
(15, 8, 'Ten of Hearts', NULL),
(16, 7, 'Six of Spades', NULL),
(17, 11, 'Seven of Spades', NULL);

P.S: game_master MUST NEED TO BE CREATED FIRST SINCE game WILL RECEIVE IT'S KEY
*/

INSERT INTO game_master (game_master_id, master_role, player_id)
VALUES
(1,'King of Clubs', 6),
(2,'Jack of Hearts', 5),
(3,'Queen of Spades', 16),
(4,'King of Diamonds', 9),
(5,'Queen of Clubs', NULL),
(6,'King of Spades', NULL),
(7,'Queen of Hearts', 11),
(8,'Three of Clubs', NULL),
(9,'Five of Spades', NULL),
(10,'Seven of Hearts', NULL),
(11,'Four of Clubs', NULL),
(12,'Four of Diamonds', Null),
(13,'Ten of Clubs', NULL),
(14,'Jack of Spades', 5),
(15,'Ten of Hearts', NULL),
(16,'Six of Spades', NULL),
(17,'Seven of Spades', NULL);

-- OLD: INSERT INTO game (game_id, game_master_id, objective, card_type, difficulty, player_count, survivor_count, game_date)
INSERT INTO game (game_id, game_master_id, objective, card_type, difficulty, player_count, survivor_count)
VALUES
 (1, NULL,
     'Players must choose between two doors and exit the building. One marked "Live" (生) and the other marked "Death" (死). One door leads to another room, and the other one will lead to death. The door for the room does not represent what the result will be.',
     'Three of Clubs', 'LOW DIFFICULTY', 5, 4), -- date: '2020-09-06'
(2, NULL,
     'The players have to find a safe zone and press a button while avoiding a tagger in the hallways of an apartment building',
     'Five of Spades', 'LOW DIFFICULTY', 13, 6), -- '2020-09-10'
(3, NULL,
     'Game Clear: Be the wolf when 10 minutes have passed. Game Over: Be a sheep when 10 minutes have passed',
     'Seven of Hearts', 'MEDIUM DIFFICULTY', 4, 1),-- '2020-09-11'
 (4, NULL,
     'Players must endure the trials and reach the goal.',
     'Four of Clubs', 'LOW DIFFICULTY', 5, 3), -- '2020-09-12'
(5, NULL,
     'Players must figure out what switch turns on the light',
     'Four of Diamonds', 'LOW DIFFICULTY', 7, 6), -- '2020-09-18'
(6, NULL,
     'Players must find a number in each room with matchsticks and get a bingo. Only given nine, it is GAME OVER for the players who have used up all their matches.',
     'Ten of Clubs', 'HIGH DIFFICULTY', 10, 2), -- '2020-09-14'
(7, NULL,
     'Players need to cooperate to defeat all the beasts in the venue',
     'Six of Spades', 'MEDIUM DIFFICULTY', 4, 4), -- '2020-09-17'
(8, NULL,
     'Should the players find the witch, exact divine judgment, and burn their body along with their wretched soul in the Fire of Judgement, Game Clear. It’s Game Over if the witch survives for 120 minutes.',
     'Ten of Hearts', 'MID-HIGH DIFFICULTY', 67, 5), -- '2020-10-05'
(9, 6,
     'Players must have more points than the citizen team by the end of the time limit.',
     'King of Clubs', 'HIGH DIFFICULTY', 10, 4), -- '2020-09-24'
(10, 5,
     'Players must guess the card suit symbol that appears on the back of their collar at the end of each round. It is GAME CLEAR for all remaining players when the Jack of Hearts dies',
     'Jack of Hearts', 'HIGH DIFFICULTY', 20, 3),-- '2020-09-20'
(11, NULL,
    'A massive geyser, full of boiling water, erupts and destroys the stadium. It is Game Clear if the players can escape the venue before it is destroyed. It is Game Over if all players die/if the venue fully collapses before they escape.',
    'Seven of Spades', 'HIGH DIFFICULTY', 35, 6),
(12, 16,
     'Players must play a team based version of freeze tag against citizens in which they switch teams when caught until they catch every player and citizen.',
     'Queen of Spades', 'HIGH DIFFICULTY', 20, 4), -- '2020-09-23'
(13, 9,
     'Players must select a number from the grid. Once all numbers are selected, the average will be calculated, then multiplied by 0.8. The player closest to the number wins the round. The other players each lose a point. A scale above their heads will fill with sulfuric acid.',
     'King of Diamonds', 'HIGH DIFFICULTY', 5, 1),-- '2020-10-14'
(14, NULL,
     'Players must throw glowing balls at their opponents to knock them off their beams. It is GAME OVER if a player or citizen falls off their own beam; they will be lasered immediately. It is GAME CLEAR for the last standing pair or player.',
     'Queen of Clubs', 'HIGH DIFFICULTY', 14, 11), -- '2020-10-26'
(15, 5,
     'Players must defend themselves against the Jack of Spades and his crew in a physical brawl. It is GAME OVER if the player dies or succumbs to their wounds. It is GAME CLEAR if the players successfully defeat the Jack of Spades and his crew.',
     'Jack of Spades','MID-HIGH DIFFICULTY', 10, 1), -- '2020-10-06'
(16, NULL,
     'If a player kills the King of Spades, it’s Game Clear for all remaining players. If all players are killed by the King of Spades, Game Over.',
     'King of Spades', 'HIGH DIFFICULTY', 253, 2), -- '2020-10-14'
(17, 11,
     'Should the players play 3 sets of croquet according to regulations through to completion, it’s Game Clear. If the players retire, it’s Game Over.',
     'Queen of Hearts', 'HIGH DIFFICULTY', 3, 2); -- '2020-10-29'


INSERT INTO location (location_id, location_name, location_type, time_limit, hazard, game_id)
VALUES
(1, 'GM Building', 'Indoor', '2 Minutes per Room, decreases by 10 Seconds each Room', 'Death', 1),
(2, 'Toei Sendagaya Apartment', 'Indoor', '20 Minutes', 'Combat and Survival', 2),
(3, 'Shinjuku Natural Botanical Garden', 'Indoor', '15 Minutes', 'Explosive Collar', 3),
(4, 'Highway Tunnel', 'Indoor', '120 Minutes', 'Black Panther, Physcial Exhaustion and Flood', 4),
(5, 'Sewage Reservoir', 'Indoor', 'N/A', 'Electricity', 5),
(6, 'Tokyo Match Factory', 'Indoor', 'N/A', 'Laser', 6),
(7, 'Amusement Park', 'Outdoor', 'N/A', 'Various Animals', 7),
(8, 'Seaside Paradise Resort', 'Outdoor', '120 Minutes', 'Paranoia and Mistrust', 8),
(9, 'Port', 'Outdoor', '120 Minutes', 'Laser', 9),
(11, 'Abandoned Athletic Stadium', 'Enclosed', '2 hours', 'Taggers with weapons', 11),
(10, 'Teio Prison', 'Indoor', '60 Minutes', 'Explosive Collar', 10),
(12, 'Tokyo Power Plant', 'Outdoor', '80 Minutes', 'Physical Exhaustion', 12),
(13, 'Supreme Court', 'Indoor', '3 Minutes per Round', 'Sulfuric Acid', 13),
(14, 'Sewage Plant', 'Indoor', 'N/A', 'Balance and Targeting', 14),
(15, 'The Borderlands', 'Urban', 'N/A', 'Weapons and Physical Combat', 16),
(17, 'Rooftop Garden', 'Outdoor', 'N/A', 'Mental Game', 17);

INSERT INTO player_game (player_game_id, player_role, visa_change, outcome, player_id, game_id)
VALUES
(1, 'Running away and hide from the threat', 7, 'Survived', 1, 11),
(2, 'Run and fight back against the threat', 30, 'Died', 1, 16),
(3, 'Strategy, psychology and mathematics', 0, 'Died', 2, 13),
(4, 'Survived with the strategy of Arisu', 3, 'Survived', 3, 1),
(5, 'Retain the status of wolf', 0, 'Died', 3, 3),
(6, 'Strategise and survive', 3, 'Survived', 4, 4),
(7, 'Wolf trying to catch sheep', 0, 'Died', 4, 3),
(8, 'Name the correct symbol on the back of the collar', 0, 'Died', 5, 10),
(9, 'Claim the most amount of points for your team', 0, 'Died', 6, 9),
(10, 'Solve the electrical problem before the electrocution', 3, 'Survived', 5, 7),
(11, 'Identify the witch within the time limit', 10, 'Survived', 7, 8),
(12, 'Defeat jack of spades and his crew', 3, 'Survived', 7, 15),
(13, 'Win at dodgeball while balancing over a pit', 7,'Survived', 7, 14),
(14, 'Survive the wrath of King of Spades', 0, 'Died', 7, 16), -- DUPLICATED ID
(15, 'Name the correct symbol on the back of the collar', 0, 'Died', 8, 10),
(16, 'Strategy, psychology and mathematics', 0, 'Died', 9, 3),
(17, 'Assist in solving the electrical problem', 3,'Survived', 10, 7),
(18, 'Find the witch', 10, 'Survived', 11, 8),
(19, 'Find the witch', 0, 'Died', 12, 8),
(20, 'Identify the witch within the time limit', 10, 'Dead', 13, 8),
(21, 'Find safe zone and evade taggers', 5, 'Survived', 14, 2),
(22, 'Defeat all the beasts in the venue', 6, 'Survived', 14, 7),
(23, 'Identify the witch within the time limit', 10, 'Survived', 14, 8),
(24, 'Survive against the King of Spades', 10, 'Survived', 14, 14),
(25, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 10, 'Survived', 15, 10),
(26, 'Be on the team with the most players by the end of the game', 10, 'Dead', 16, 11),
(27, 'Correctly shouts out which switch turns on the light', 4, 'Survived', 17, 5),
(28, 'Identify the witch within the time limit', 10, 'Survived', 17, 8),
(29, 'Play dodgeball against other teams without falling off the beam', 10, 'Survived', 17, 13),
(30, 'Survive against the King of Spades', 10, 'Survived', 17, 14),
(31, 'Exit the building safely within the time limit', 3, 'Survived', 18, 1),
(32, 'Find safe zone and evade taggers', 5, 'Survived', 18, 2),
(33, 'Be the wolf before the time ends', 7, 'Survived', 18, 3),
(34, 'Reach the end goal in time', 4, 'Survived', 18, 4),
(35, 'Correctly shouts out which switch turns on the light', 4, 'Survived', 18, 5),
(36, 'Strategically earn points for your team to survive', 10, 'Survived', 18, 9),
(37, 'Be on the team with the most players by the end of the game', 10, 'Survived', 18, 11),
(38, 'Survive against the King of Spades', 10, 'Survived', 18, 14),
(39, 'Play Croquet and try not to be lead astray by the Queen of Hearts', 10, 'Survived', 18, 15),
(40, 'Exit the building safely within the time limit', 3, 'Survived', 19, 1),
(41, 'Be the wolf before the time ends', 7, 'Dead', 19, 3),
(42, 'Find safe zone and evade taggers', 5, 'Survived', 20, 2),
(43, 'Identify the witch within the time limit', 10, 'Survived', 20, 8),
(44, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 10, 'Survived', 20, 10),
(45, 'Must beat the King of Diamonds in a Balance Scale game', 10, 'Survived', 20, 12),
(46, 'Defeat all the beasts in the venue', 6, 'Survived', 21, 7),
(47, 'Identify the witch within the time limit', 10, 'Survived', 21, 8),
(48, 'Strategically earn points for your team to survive', 10, 'Survived', 21, 9),
(49, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 10, 'Survived', 22, 10),
(50, 'Defeat all the beasts in the venue', 6, 'Survived', 23, 7),
(51, 'Identify the witch within the time limit', 10, 'Dead', 23, 8),
(52, 'Identify the witch within the time limit', 10, 'Dead', 24, 8),
(53, 'Identify the Jack of Hearts and have them guess their collar mark incorrectly', 10, 'Dead', 25, 10),
(54, 'Find safe zone and evade taggers', 5, 'Survived', 26, 2),
(55, 'Reach the end goal in time', 4, 'Survived', 26, 4),
(56, 'Find all the numbers to complete a row, column, or diagonal on a bingo sheet', 10, 'Survived', 26, 6),
(57, 'Identify the witch within the time limit', 10, 'Survived', 26, 8),
(58, 'Strategically earn points for your team to survive', 10, 'Survived', 26, 9),
(59, 'Be on the team with the most players by the end of the game', 10, 'Survived', 26, 11),
(60, 'Survive against the King of Spades', 10, 'Survived', 26, 14),
(61, 'Play Croquet and try not to be lead astray by the Queen of Hearts', 10, 'Survived', 26, 15);




INSERT INTO player_status (status_id, injury, death, game_id, player_id)
VALUES
(1, 1, 0, 11, 1),
(2, 0, 1, 15, 1),
(3, 1, 1, 1, 2),
(4, 0, 0, 1, 3),
(5, 0, 1, 3, 3),
(6, 0, 0, 2, 4),
(7, 1, 1, 3, 4),
(8, 0, 1, 10, 5),
(9, 0, 1, 9, 6),
(10, 0, 0, 5, 7),
(11, 0, 0, 8, 7),
(12, 1, 0, 9, 7),
(13, 0, 0, 15, 7),
(14, 0, 0, 14, 7),
(15, 0, 1, 16, 7),
(16, 0, 1, 10, 8),
(17, 0, 1, 13, 9),
(18, 0, 0, 9, 10),
(19, 0, 1, 14, 10),
(20, 0, 0, 8, 11),
(21, 0, 1, 17, 11),
(22, 0, 1, 16, 12),
(23, 0, 1, 3, 13),
(24, 0, 0, 2, 14),
(25, 1, 0, 6, 14),
(26, 0, 0, 16, 14),
(27, 0, 1, 16, 14),
(28, 0, 0, 2, 15),
(29, 0, 1, 14, 16),
(30, 0, 0, 5, 17), 
(31, 1, 0, 8, 17),
(32, 0, 0, 14, 17),
(33, 0, 0, 16, 17),
(34, 0, 0, 1, 18),
(35, 0, 0, 2, 18),
(36, 1, 0, 3, 18),
(37, 0, 0, 5, 18),
(38, 0, 0, 8, 18),
(39, 0, 0, 9, 18),
(40, 0, 0, 12, 18),
(41, 0, 0, 14, 18),
(42, 0, 0, 16, 18),
(43, 0, 0, 17, 18),
(44, 0, 0, 1, 19),
(45, 0, 1, 3, 19),
(46, 0, 0, 2, 20),
(47, 0, 0, 10, 20),
(48, 0, 0, 13, 20),
(49, 0, 0, 16, 20),
(50, 0, 0, 2, 21),
(51, 1, 1, 8, 21),
(52, 0, 0, 16, 21),
(53, 1, 0, 10, 22),
(54, 0, 0, 8, 23),
(55, 1, 1, 16, 23),
(56, 1, 1, 8, 24),
(57, 1, 1, 10, 25),
(58, 0, 0, 2, 26),
(59, 0, 0, 4, 26),
(60, 0, 0, 8, 26),
(61, 0, 0, 9, 26),
(62, 0, 0, 12, 26),
(63, 0, 0, 14, 26),
(64, 0, 0, 16, 26),
(65, 0, 0, 17, 26);
-- If we end up not needing game_id here it will be easy to remove



INSERT INTO death_log (death_log_id, death_reason, game_id, player_id)
VALUES
(1, 'Killed by King of Spades', 16, 1),
(2, 'Killed by sulfuric acid', 11, 2),
(3, 'Killed by running out of time', 3, 3),
(5, 'Killed by running out of time', 3, 4),
(6, 'Killed by saying the wrong mark on the back of his collar', 10, 5),
(7, 'Killed by exchanging points at the final moment', 9, 6),
(8, 'Killed by being stabbed by the King of Spades', 16, 7),
(9, 'Killed by self sacrifice', 10, 8),
(10, 'Killed by sacrificing himself for another player', 13, 9),
(11, 'Killed by King of Spades', 16, 10),
(12, 'Killed by being defeated in croquette', 17, 11),
(13, 'Killed through self-sacrifce', 16, 12);

/** CHECK IT LATER */
-- (13, 'Killed by Explosive Collar', 20),
-- (14, 'Killed by Aguni Morizono', 25),
-- (15, 'Killed by Laser', 14),
-- (16, 'Killed by Fire', 24),
-- (17, 'Killed by Explosive Collar after guessing her suit incorrectly', 26),
-- (18, 'Killed by Laser', 17);


INSERT INTO injury_log (injury_id, game_id, injury_type, severity, player_id)
VALUES
(1, 11, 'Gunshot Wound', 'Severe', 1),
(2, 1, 'Severe burn on leg', 'Inconvenient', 3),
(3, 9, 'Knocked out', 'Moderate', 7),
(4, 3, 'Knocked Unconscious', 'LOW SEVERITY', 17),
(5, 8, 'Beaten Up', 'MEDIUM SEVERITY', 14),
(6, 8, 'Severe Burns on Face and Body', 'HIGH SEVERITY', 21),
(7, NULL, 'Gunshot Wound', 'HIGH SEVERITY', 21), /*THE INJURY IS NOT IN A GAME - DID NOT RECORD IN PLAYER_STATUS TABLE*/
(8, NULL, 'Gunshot Wound', 'HIGH SEVERITY', 22); /*THE INJURY IS NOT IN A GAME - DID NOT RECORD IN PLAYER_STATUS TABLE*/

/** TRIGGERS AND VIEWS */
CREATE TRIGGER death_trigger
    AFTER UPDATE
    ON death_log
    FOR EACH ROW
BEGIN
    INSERT INTO death_log (death_reason, "date", player_id)
    VALUES('REASON FOR DEATH','20/10/2024',7);
END;

CREATE TRIGGER visa_trigger
    AFTER UPDATE
    ON player_game
    FOR EACH ROW
BEGIN
    INSERT INTO player_game(player_game_id, player_role, visa_change, outcome, player_id, game_id)
    VALUES(14,'ROLE OF THE PLAYER','VISA DATE CHANGE','SURVIVED',9,15);
END;

CREATE TRIGGER diff_level
    AFTER UPDATE
    ON game
    FOR EACH ROW
BEGIN
    INSERT INTO game(game_id, game_master_id, objective, card_type, difficulty, player_count, survivor_count, game_date)
    VALUES(12,null,'objective of the player','card type','1/5','250','4','4/4/2020');
END;

CREATE INDEX idx_playergameinfo
    ON player_game(player_id, game_id);

CREATE INDEX idx_playerdeath
    ON death_log(player_id,death_reason);

CREATE INDEX idx_gamedate
    ON game(game_date);


CREATE VIEW vw_game_overview AS
SELECT
    game.game_id,
    game.objective,
    game.card_type,
    game.difficulty,
    game.player_count,
    game.survivor_count,
    location.location_name,
    location.location_type,
    game_master.master_role,
    player.player_name AS game_master_name
FROM
    game game
        JOIN location ON game.game_id = location.game_id
        LEFT JOIN game_master ON game.game_id = game_master.game_id
        LEFT JOIN player ON game_master.player_id = player.player_id;