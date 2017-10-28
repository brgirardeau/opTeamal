drop table if exists teams;
create table teams (
	id integer primary key autoincrement,
	name text not null,
	analyzerId integer
);

drop table if exists analyzers;
create table analyzers (
	id integer primary key autoincrement,
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)
);

drop table if exists lineups;
create table lineups (
	id integer primary key autoincrement,
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)

);

drop table if exists statistics;
create table statistics (
	id integer primary key autoincrement,
	name text not null,
	weight real not null,
	pro integer not null,
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)
);

drop table if exists players;
create table players (
	id integer primary key autoincrement,
	name text not null,
	position text not null,
	starter integer not null,
	lineupId integer not null references lineup(id),
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)
);


