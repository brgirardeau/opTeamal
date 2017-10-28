# all the imports
import sqlite3
from flask import Flask, request, session, g, redirect, url_for, abort, \
	render_template, flash
from contextlib import closing

# configuration
DATABASE = '/tmp/opteamal.db'
DEBUG = True
SECRET_KEY = 'devkey'
USERNAME = 'admin'
PASSWORD = 'default'

# Create the application
app = Flask(__name__)
# Load a config from this file
app.config.from_object(__name__)

def connect_db():
	return sqlite3.connect(app.config['DATABASE'])

def init_db():
	with closing(connect_db()) as db:
		with app.open_resource('schema.sql', mode='r') as f:
			db.cursor().executescript(f.read())
		db.commit()

def get_db():
	db = getattr(g, '_database', None)
	if db is None:
		db = g._database = connect_db()
	db.row_factory = sqlite3.Row
	return db

def query_db(query, args=(), one=False):
	cur = get_db().execute(query, args)
	rv = cur.fetchall()
	cur.close()
	return (rv[0] if rv else None) if one else rv


@app.before_request
def before_request():
	g.db = get_db()


@app.teardown_request
def teardown_request(exception):
	db = getattr(g, 'db', None)
	if db is not None:
		db.close()

@app.route('/')
def show_teams():
	teams = query_db('select * from teams t')
	print(teams)
	return render_template('show_teams.html', teams=teams)

@app.route('/team/<int:team_id>')
def manage_team(team_id):
	team = query_db('select * from teams where id = ' + str(team_id), (), True)
	players = query_db('select * from players where teamId = ' + str(team_id))
	return render_template('manage_team.html', team = team, players = players)

@app.route('/addTeam', methods=['POST'])
def add_team():
	mydb = get_db()
	query_db('insert into teams (name) values (?)',
				 ([request.form['name']]))

	teamid = query_db('SELECT last_insert_rowid()', (), True)

	g.db.commit()
	flash('New entry was successfully posted')
	return redirect(url_for('show_teams'))

@app.route('/addPlayer', methods=['POST'])
def add_player():
	mydb = get_db()
	query_db('insert into players (name, position) values (?), (?)',
				 ([request.form['name']], [request.form['position']]))

	playerid = query_db('SELECT last_insert_rowid()', (), True)

	g.db.commit()
	flash('New entry was successfully posted')
	return redirect(url_for('show_teams'))


if __name__ == '__main__':
	app.run()

