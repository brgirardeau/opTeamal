<<<<<<< HEAD

drop table if exists team;
create table team (
	id integer primary key autoincrement,
	name text not null,
	starterLineupId integer not null, 
	analyzerId integer not null
=======
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
>>>>>>> 64acfb0525d3439f2121c2cbb1c6031f667587dc
);

drop table if exists lineups;
create table lineups (
	id integer primary key autoincrement,
<<<<<<< HEAD
	teamID text not null,
		foreign key (teamId) references team(id)
=======
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)

);
>>>>>>> 64acfb0525d3439f2121c2cbb1c6031f667587dc

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
<<<<<<< HEAD
	teamId integer not null,
		foreign key (teamId) references team(id)
);

drop table if exists statistics;
create table statistics (
	id integer primary key autoincrement,
	teamId integer not null,
		foreign key (teamId) references team(id),
	name text not null,
	pro integer not null,
	weight real not null

)

drop table if exists players;
create table players (
	id integer primary key autoincrememnt,
	name text not null,
	position text not null,
	captain integer not null,
	lineupId integer not null references lineup(id)
	team text not null,
		foreign key (teamId) references team(id)
);
=======
	name text not null,
	position text not null,
	starter integer not null,
	lineupId integer not null references lineup(id),
	teamId integer not null,
		FOREIGN KEY (teamId) REFERENCES team(id)
);


>>>>>>> 64acfb0525d3439f2121c2cbb1c6031f667587dc
