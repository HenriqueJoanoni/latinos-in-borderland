/*AIB DB*/

DROP DATABASE IF EXISTS alice_in_borderland;
CREATE DATABASE IF NOT EXISTS alice_in_borderland;
USE alice_in_borderland;

CREATE TABLE player (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    player_age VARCHAR(255),
    player_gender VARCHAR(255),
    player_occupation VARCHAR(255)
);

CREATE TABLE game_master (
    game_master_id INT PRIMARY KEY,
    master_role VARCHAR(50),
	player_id INTEGER,
	FOREIGN KEY (player) REFERENCES player (player_id)
);

CREATE TABLE game (
    game_id INT PRIMARY KEY,
    game_master_id INT,
    objective VARCHAR(255),
    card_type VARCHAR(255),
    difficulty VARCHAR(255),
    player_count VARCHAR(255),
    survivor_count VARCHAR(255),
    game_date VARCHAR(50),
    FOREIGN KEY (game_master_id) REFERENCES game_master(game_master_id)
);

CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255),
    location_type VARCHAR(255),
    time_limit VARCHAR(255),
    hazard VARCHAR(255),
    game_id INT,
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE player_game (
    player_game_id INT PRIMARY KEY,
    player_role VARCHAR(255),
    visa_change VARCHAR(255),
    outcome VARCHAR(255),
    player_id INT,
    game_id INT,
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE player_status (
    status_id INT PRIMARY KEY,
	injury ENUM(0,1);
    death ENUM(0,1),
    date_updated VARCHAR(60),
    player_id INT,
    FOREIGN KEY (player_id) REFERENCES player(player_id)
);

CREATE TABLE death_log (
    death_log_id INT PRIMARY KEY,
    death_reason VARCHAR(255),
    date VARCHAR(255),
    player_id INT,
    FOREIGN KEY (player_id) REFERENCES player(player_id)
);

CREATE TABLE injury_log (
    injury_id INT PRIMARY KEY,
    injury_date VARCHAR(50),
    injury_type VARCHAR(50),
    severity VARCHAR(255),
    player_id INT,
    FOREIGN KEY (player_id) REFERENCES player(player_id)
);


INSERT INTO player (player_id, player_name, player_age, player_gender, player_occupation)
VALUES 
        (1, 'Heiya Akane', 'Early 20s', 'Female', 'High School Student'),
		(2, 'Yashige Benzo', 'Late 20s', 'Male', 'Construction Worker'),
		(3, 'Segawa Chota', 'Late 20s', 'Male', 'IT company worker'),
		(4, 'Karube Daikiche', 'Early 30s', 'Male', 'Bar Owner'),
		(5, 'Matsushita Enji', 'Late 30s', 'Male', 'Hypnotherapist'),
        (6, 'Kyuma Ginji', 'Late 20s', 'Male', 'Musician'),
        (7, 'Hikari Kuina', 'Mid 20s', 'Female', 'Apparels Clerk')

INSERT INTO game (game_id, game_master_id, objective, card_type, difficulty, player_count, survivor_count, game_date)
VALUES 
(1, NULL, 'A massive geyser, full of boiling water, erupts and destroys the stadium. It is Game Clear if the players can escape the venue before it is destroyed. It is Game Over if all players die or if the venue fully collapses before they escape.', 'Seven of Spades', '4/5', '17', '6', '2020-10-10'),
(2, NULL, 'Players must survive against the King of Spades, who is armed with an assault rifle, pistol and knife. It is a GAME CLEAR for any players who outlive the King of Spades. It is a GAME OVER for any players who are killed by the King. Only the one who defeats the king will get their visa extended.', 'King of Spades', '5/5', '253', '1', '2020-10-14'),
(3, NULL, 'The player must select a number from the grid. Once all numbers are selected, the average will be calculated, then multiplied by 0.8. The player closest to the number wins the round. The other players each lose a point. A scale above their heads will fill with sulfuric acid. If a player reaches -10 points, it is a GAME OVER for that player; their scale will overflow and dump the acid on them.It is GAME CLEAR for the last remaining player.', 'King of Diamonds', '5/5', '5', '1', '2020-10-14'),
(4, NULL, 'There are two doors in each room, one marked "Live" and the other marked "Death". One door leads to another room, and the other one will lead to death. It is GAME CLEAR for a player if they exit the building safely within the time limit. It is GAME OVER for a player if they enter the wrong room or run out of time.', 'Three of Clubs', '1/5', '5', '4', '2020-09-06'),
(5, NULL, 'One player becomes the wolf, and the remaining three become sheep. The wolf shall try to avoid the gaze of the sheep. If the wolf has eye contact with a sheep, the sensor reacts and the sheep becomes the wolf. Once the time limit is reached, the collar around all the sheep will explode.', 'Seven of Hearts', '3/5', '4', '1', '2020-09-08'),
(6, 1, 'Each round, all players must enter a cell and announce the mark that they think is on the back of their collar. If they’re correct, they move onto the next round. Their mark changes, and the cycle repeats. If the player remains silent or says the wrong mark, the collar explodes. Among the players is the Jack of Hearts. When the Jack of Hearts dies, the remaining players all survive and the game is cleared. Game Clear: Kill the Jack of Hearts Game Over: Say the wrong mark.', 'Jack of Hearts', '5/5', '20', '1', '2020-09-20'),
(7, 2, 'The game consists of 5-player teams with a 2-hour limit. Each team starts with 10,000 points, which they can freely distribute among members (minimum 100 points each). Players battle by making contact, and the winner takes 500 points from the loser. Teams have coil bases, and inactive players must return to base to reactivate. Groups can combine points in battles, and winning points are divided among them. The team with the most points after two hours wins, while losing all points results in elimination.','King of Clubs', '5/5', '10', '4', '2020-09-24'),
(8, NULL, 'In the room there is one light-bulb and a door to an adjacent room where there are three switches. There is one switch that connects to the light-bulb. With the door closed, players may flip any switch. While the door is open, players may only flip the switch once. The door will not close if there are people in both rooms or a switch is flipped. It is Game Clear if players can unanimously answer which switch turns on the light. If the water level rises and the surface of the water touches the high current lines then Game Over.', 'Four of Diamonds', '2/5', '4', '2020-09-18'),
(9, 1, 'In the Ten of Hearts game, players must identify and execute the "witch" responsible for a murder among them. If the witch is not correctly identified, everyone will die. The game emphasizes mistrust and paranoia as players turn on each other.', 'Ten of Hearts', '4/5', '67', '5', '2020-10-05'),
(10, NULL, 'Players must defend themselves against the Jack of Spades and his crew in a physical brawl. It is GAME OVER if the player dies or succumbs to their wounds. It is GAME CLEAR if the players successfully defeat the Jack of Spades and his crew.', '4/5', 'Unknown', 'Unknown', '2020-10-06'),
(11, NULL, 'In the Queen of Clubs game, players must work together to compete against the Queen in a series of tasks that challenge cooperation and strategy. It is a Game Clear if the players accumulate more points than the Queen by the end of the game. It is a Game Over if the Queen outperforms the players or if the team’s cooperation collapses, leading to their defeat.', '5/5', '16', '9', '2020-10-26'),
(12, 5, 'It is GAME CLEAR if a player finds and touches the "safe zone" within the time limit. It is GAME OVER if the time limit is reached or if the "Oni" kills all the players.', 11, 4, '2020-09-10')

INSERT INTO game_master (game_master_id, game_id, master_role, player_id)
VALUES
(1, 6, 'Jack of Spades', 5),
(2, 7, 'King of Spades', 6),
(3, 9, 'Ten of Hearts', 14)
(4, 11, 'Queen of Clubs', NULL)
(5, 12, 'Five of Spades', NULL)


INSERT INTO location (location_id, location_name, location_type, time_limit, hazard, game_id)
VALUES 
(1, 'Abandoned Athletic Stadium', 'Enclosed', '2 hours', 'Taggers with weapons', 1),
(2, 'All of Japan', 'Urban', 'None', 'Gunfire', 2),
(5, 'Central City Hall', 'Indoor', 'None', 'Psychological Warfare', 3),
(3, 'Abandoned Warehouse', 'Enclosed', '2 hours', 'Various traps', 3),
(4, 'Urban Cityscape', 'Urban', 'None', 'Psychological Warfare', 4),
(6, 'Prison', 'Indoor', 'None', 'Exploding Collar', 6),
(7, 'Open Urban Area', 'Outdoor', 'None', 'Physical Combat', 6),
(8, 'Indoor Facility', 'Indoor', '1 Hour', 'Mental Puzzle', 7),
(9, 'The Beach Hotel', 'Indoor', '2 Hours', 'Paranoia and Mistrust', 9),
(10, 'Exhibition Hallway', 'Indoor', 'None', 'Physical Combat', 10),
(11, 'Large Indoor Arena', 'Indoor', 'None', 'Dodging balls thrown by opponents', 11);
(12, 'Tall Apartment Complex', 'Outdoor and Indoor', '20 Minutes', 'Escaping the threat', 12)

INSERT INTO player_game (player_game_id, player_role, visa_change, outcome, player_id, game_id)
VALUES 
(1, 'Running away and hide from the threat', '7 Days', 'Survived', 1, 1),
(2, 'Run and fight back against the threat', '30 Days', 'Died', 1, 2),
(3, 'Strategy, psychology and mathematics', '0 Days', 'Died', 2, 3),
(4, 'Survived with the strategy of Arisu', '3 Days', 'Survived', 3, 4),
(5, 'Retain the status of wolf', '0', 'Died', 3, 5),
(6, 'Strategise and survive', '3 Days', 'Survived', 4, 4),
(7, 'Wolf trying to catch sheep', '0', 'Died', 4, 5),
(8, 'Name the correct symbol on the back of the collar', '0', 'Died', 5, 6),
(9, 'Claim the most amount of points through a game of tag', '0', 'Died', 6, 7),
(10, 'Solve the electrical problem before the electrocution', '3 Days', 'Survived', 5, 7), 
(11, 'Identify the witch within the time limit', '10 Days', 'Survived', 7, 9),
(12, 'Defeat jack of spades and his crew', '10 Days', 'Survived', 7, 10),
(13, 'Win at dodgeball while balancing over a pit', '7 Days', 7, 11),

INSERT INTO player_status (status_id, death, date_updated, player_id)
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
(14, '0', ''2020-10-26'),
(15, '1','2020-10-27');



INSERT INTO death_log (death_log_id, death_reason, date, player_id)
VALUES 
(1, 'Killed by King of Spades', '2020-10-15', 1),
(2, 'Killed by sulfuric acid', '2020-10-14', 2),
(3, 'Killed by running out of time', '2020-09-08', 3),
(5, 'Killed by running out of time', '2020-09-08', 4),
(6, 'Killed by saying the wrong mark on the back of his collar', '2020-09-20', 5);
(7, 'Killed by exchanging points at the final moment', '2020-09-24', 6);
(8, 'Killed by being stabbed by the king of spades', '2020-10-27', 8);




INSERT INTO injury_log (injury_id, injury_date, injury_type, severity, player_id)
VALUES 
(1, '2020-10-15', 'Gunshot Wound', 'Severe', 1),
(2, '2020-09-06', 'Severe burn on leg', 'Inconvenient', 3),
(3, '2020-09-24', 'Knocked out', 'Moderate', 7)