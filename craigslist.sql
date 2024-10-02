-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE "Regions" (
    "regionID" SERIAL   NULL,
    "regionName" VARCHAR(100)   NOT NULL
);

CREATE TABLE "Users" (
    "userID" SERIAL   NULL,
    "userame" VARCHAR(100)   NOT NULL,
    "prefered_region" INT   NOT NULL
);

CREATE TABLE "Posts" (
    "PostID" SERIAL   NULL,
    "title" VARCHAR(100)   NOT NULL,
    "post_text" TEXT   NOT NULL,
    "userID" INT   NOT NULL,
    "post_location" VARCHAR(100)   NOT NULL,
    "regionID" INT   NOT NULL
);

CREATE TABLE "Categories" (
    "catergoryid" SERIAL   NULL,
    "categoryName" VARCHAR(100)   NOT NULL
);

CREATE TABLE "Post_Categories" (
    "postId" INT   NOT NULL,
    "categortyId" INT   NOT NULL
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_userID" FOREIGN KEY("userID")
REFERENCES "Users" ("userID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_regionID" FOREIGN KEY("regionID")
REFERENCES "Regions" ("regionID");

ALTER TABLE "Post_Categories" ADD CONSTRAINT "fk_Post_Categories_postId" FOREIGN KEY("postId")
REFERENCES "Posts" ("PostID");

ALTER TABLE "Post_Categories" ADD CONSTRAINT "fk_Post_Categories_categortyId" FOREIGN KEY("categortyId")
REFERENCES "Categories" ("catergoryid");