# all the imports
import sqlite3
from flask import Flask, request, session, g, redirect, url_for, abort, \
	render_template, flash

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

if __name__ == '__main__':
	app.run()
