from flask import Flask, render_template, jsonify, json
import os
import db

db.__init__()
connection = db.connect()
cursor = db.cursor(connection)

app = Flask(__name__)

@app.route('/')
def index():
    # this is your index page
    log = 'Home'
    return render_template('index.html', log_index = log)

@app.route('/daily')
def daily():
    log = 'Daily Entries'
    cursor.execute(f'SELECT SNN, first, last FROM clients;')
    clients = set(c for c in cursor.fetchall())
    return render_template('daily.html', log_daily=log, log_clients=clients)

@app.route('/forms')
def forms():
    log = 'Forms'
    return render_template('forms.html', log_forms=log)

@app.route('/facility')
def facility():
    log = 'Facility'
    return render_template('facility.html', log_facility=log)

if __name__ == '__main__':
    app.debug = True
    ip = '127.0.0.1'
    app.run(host=ip)