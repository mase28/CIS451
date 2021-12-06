/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT
*/;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS
*/;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION
*/;
/*!40101 SET NAMES utf8*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0*/;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0*/;
/*!40014 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Create Database--;

CREATE DATABASE IF NOT EXISTS nba2020;
USE nba2020;

-- Create Tables--;

DROP TABLE IF EXISTS players;
CREATE TABLE players (
	p_id int NOT NULL auto_increment,
	t_id int,
	c_id int,
	fname varchar(15),
	lname varchar(15),
	total_points int,
	avg_ppg int,
	total_rebounds int,
	avg_reb int,
	total_ast int,
	avg_ast int,
	total_stl int,
	avg_stl int,
	total_thr int,
	avg_thr int,
	PRIMARY KEY (p_id),
	FOREIGN KEY (t_id) REFERENCES teams(t_id),
	FOREIGN KEY (c_id) REFERENCES contracts(c_id),
	UNIQUE KEY (p_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
	t_id int NOT NULL auto_increment,
	coach_fname varchar(15),
	coach_lname varchar(15),
	team_points int,
	avg_points int,
	team_rebounds int,
	avg_rebounds int,
	team_assists int,
	avg_assists int,
	team_steals int,
	avg_steals int,
	team_long int,
	avg_long int,
	cap_space int,
	PRIMARY KEY (t_id),
	UNIQUE KEY (t_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS contracts;
create table contracts(
	c_id int,
	s_date date,
	e_date date,
	amount int,
	PRIMARY KEY (c_id),
	UNIQUE KEY (c_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;