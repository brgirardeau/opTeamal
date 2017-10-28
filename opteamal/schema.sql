
drop table if exists team;
create table team (
	id integer primary key autoincrement,
	name text not null,
	starterLineupId integer not null, 
	analyzerId integer not null
);

drop table if exists analyzer;
create table analyzer (
	id integer primary key autoincrement,
	teamID text not null,
		foreign key (teamId) references team(id)

);

drop table if exists lineup;
create table lineup (
	id integer primary key autoincrement,
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
