CREATE DATABSE IF NOT EXISTS nba2020;
USE nba2020;

DROP TABLE IF EXISTS "nba2020"."players";
CREATE TABLE "nba2020"."players" (
	"p_id" bigint(20) unsigned NOT NULL auto_increment,
	"fname" char(15) default NULL,
	"lname" char(15) default NULL,
	"total_points" mediumint(10) default NULL,
	"avg_ppg" smallint(6) default NULL,
	"total_rebounds" mediumint(10) default NULL,
	"avg_reb" smallint(6) default NULL,
	"total_assists" mediumint(10) default NULL,
	"avg_assists" smallint(6) default NULL,
	"total_steals" mediumint(10) default NULL,
	"avg_steals" smallint(6) default NULL,
	"total_long" mediumint(10) default NULL,
	"avg_long" smallint(6) default NULL
	PRIMARY KEY ("p_id"),
	UNIQUE KEY ("p_id")
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;