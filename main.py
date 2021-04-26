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
    log = 'Daily Entry'
    return render_template('daily.html', log_daily=log)

@app.route('/clients')
def client():
    log = 'Clients'
    return render_template('client.html', log_client=log)

@app.route('/facilities')
def facility():
    log = 'Facilities'
    return render_template('facility.html', log_facility=log)

@app.route('/employees')
def employee()"
    log = 'Employees'
    return render_template('employee.html', log_employee=log)

if __name__ == '__main__':
    app.debug = True
    ip = '127.0.0.1'
    app.run(host=ip)
