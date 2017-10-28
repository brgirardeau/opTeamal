
drop table if exists players;
create table players (
	id integer primary key autoincrememnt,
	name text not null,
	position text not null,
	team text not null,
	captain integer not null
);


drop table if exists team;
create table team (
	id integer primary key autoincrememnt,
	name text not null,

)