
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


DROP DATABASE IF EXISTS soccoer_league;

CREATE DATABASE soccoer_league;

\c soccoer_league

CREATE TABLE "Teams" (
    "teamID"  SERIAL PRIMARY KEY,
    "teamName" VARCHAR(100)   NOT NULL,
    "teamranking" INT   NOT NULL
);

CREATE TABLE "Players" (
    "playerID"  SERIAL PRIMARY KEY,
    "playerName" VARCHAR(100)   NOT NULL,
    "teamID" INT   NOT NULL
);

CREATE TABLE "Referees" (
    "refereeID"  SERIAL PRIMARY KEY,
    "refereeName" VARCHAR(100)   NOT NULL
);

CREATE TABLE "Games" (
    "gameID"  SERIAL PRIMARY KEY,
    "team_1" INT   NOT NULL,
    "team_2" INT   NOT NULL
    "gameDate" TIMESTAMP NOT NULL, 
);

CREATE TABLE "Player_Scores" (
    "gameID" INT   NOT NULL,
    "playerID" INT   NOT NULL,
    "Scores" INT   NOT NULL
);

CREATE TABLE "Seasons" (
    "seasonID"  SERIAL PRIMARY KEY,
    "season_start" TEXT   NOT NULL,
    "season_end" INT   NOT NULL
);

CREATE TABLE "Referee_Game" (
    "gameID" INT   NOT NULL,
    "refree_1" INT   NOT NULL,
    "refree_2" INT   NOT NULL,
    "refree_3" INT   NOT NULL
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_teamID" FOREIGN KEY("teamID")
REFERENCES "Teams" ("teamID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team_1" FOREIGN KEY("team_1")
REFERENCES "Teams" ("teamID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team_2" FOREIGN KEY("team_2")
REFERENCES "Teams" ("teamID");

ALTER TABLE "Player_Scores" ADD CONSTRAINT "fk_Player_Scores_gameID" FOREIGN KEY("gameID")
REFERENCES "Games" ("gameID");

ALTER TABLE "Player_Scores" ADD CONSTRAINT "fk_Player_Scores_playerID" FOREIGN KEY("playerID")
REFERENCES "Players" ("playerID");

ALTER TABLE "Referee_Game" ADD CONSTRAINT "fk_Referee_Game_gameID" FOREIGN KEY("gameID")
REFERENCES "Games" ("gameID");

ALTER TABLE "Referee_Game" ADD CONSTRAINT "fk_Referee_Game_refree_1" FOREIGN KEY("refree_1")
REFERENCES "Referees" ("refereeID");

ALTER TABLE "Referee_Game" ADD CONSTRAINT "fk_Referee_Game_refree_2" FOREIGN KEY("refree_2")
REFERENCES "Referees" ("refereeID");

ALTER TABLE "Referee_Game" ADD CONSTRAINT "fk_Referee_Game_refree_3" FOREIGN KEY("refree_3")
REFERENCES "Referees" ("refereeID");

