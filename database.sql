/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT
*/;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHRACTER_SET_RESULTS
*/;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION
*/;
/*!40101 SET NAMES utf8*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0*/;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0*/;
/*!40014 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;



CREATE DATABASE IF NOT EXISTS nba2020;
USE nba2020;

DROP TABLE IF EXISTS 'nba2020'.'players';
CREATE TABLE 'nba2020'.'players' (
	'p_id' bigint(20) unsigned NOT NULL auto_increment,
	'fname' char(15) default NULL,
	'lname' char(15) default NULL,
	'total_points' mediumint(10) default NULL,
	'avg_ppg' smallint(6) default NULL,
	'total_rebounds' mediumint(10) default NULL,
	'avg_reb' smallint(6) default NULL,
	'total_assists' mediumint(10) default NULL,
	'avg_assists' smallint(6) default NULL,
	'total_steals' mediumint(10) default NULL,
	'avg_steals' smallint(6) default NULL,
	'total_long' mediumint(10) default NULL,
	'avg_long' smallint(6) default NULL,
	PRIMARY KEY ('p_id'),
	UNIQUE KEY 'p_id' ('p_id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;