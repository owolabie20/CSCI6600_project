from flask import Flask, redirect, request, render_template, jsonify, json
import os
import psycopg2

DATABASE = 'postgres'
DATABASE_USERNAME = 'postgres'
DATABASE_PASSWORD = 'password'
DATABASE_HOST = '127.0.0.1'
DATABASE_PORT = '5432'

def connectdb():
	try:
		conn = psycopg2.connect(
			host=DATABASE_HOST,
			database=DATABASE,
			user=DATABASE_USERNAME,
			password=DATABASE_PASSWORD,
			port=DATABASE_PORT)
		return conn
	except:
		print('Could not connect to database')

def cursor(connection):
	if connection:
		return connection.cursor()
	else:
		print('Ensure database is connected before invoking cursor method.')


connection = connectdb()
cur = cursor(connection)

app = Flask(__name__)


@app.route('/')
def index():
	# this is your index page
	log = 'Home'
	return render_template('index.html', log_index = log)

@app.route('/daily')
def daily():
	log = 'Daily Entry'
	#cur.execute('SELECT SSN from employees')
	#employees = cur.fetchall()
	#cur.execute('SELECT SSN from clients')
	#clients = cur.fetchall()
	return render_template('daily.html', log_daily=log) #clients=clients, employees=employees)

@app.route('/clients')
def client():
	log = 'Clients'
	cur.execute('SELECT * FROM clients')
	clients = cur.fetchall()
	connection.commit()
	return render_template('client.html', log_client=log, clients=clients)

@app.route('/clients/add', methods=['POST', 'GET'])
def addClient():
	if request.method == 'POST':
		data = request.form.to_dict()
		print(data)
		cur.execute("INSERT INTO clients VALUES (%s, %s, %s, %s, %s, %s, %s)",
				(f"{data['address']}",f"{data['gender']}",f"{data['dob']}",f"{data['first']}",
				f"{data['last']}",f"{data['SSN']}",f"{data['enroll-date']}"))
		connection.commit()
		return redirect('/clients')
	else:
		return 'Form submission failed'

@app.route('/clients/delete', methods=['DELETE','GET'])
def deleteClient():
	if request.method == 'DELETE':
		data = request.form.get('SSN')
		delete_query = """DELETE FROM clients WHERE SSN = %s"""
		cur.execute(delete_query, (data))
		connection.commit()
		return redirect('/clients')
	else:
                return 'Unable to delete client'

@app.route('/clients/update', methods=['GET','PUT'])
def updateClient():
	if request.method == 'PUT':
		data = request.form.to_dict()
		print(data)
		update_query = """UPDATE clients SET address = %s, gender = %s, dob = %s, first = %s, last = %s, "enroll-date" = %s where SSN=%s"""
		cur.execute(update_query, (f"{data['address']}",f"{data['gender']}",f"{data['dob']}",f"{data['first']}",
                                f"{data['last']}",f"{data['enroll-date']}",f"{data['SSN']}"))
		connection.commit()
		return redirect('/clients')
	else:
		return 'Unable to update client'

@app.route('/facilities')
def facility():
	log = 'Facilities'
	cur.execute('SELECT * FROM facilities')
	facilities = cur.fetchall()
	connection.commit()
	return render_template('facility.html', log_facility=log, facilities=facilities)

@app.route('/facilities/add', methods=['POST', 'GET'])
def addFacility():
	if request.method == 'POST':
		data = request.form.to_dict()
		print(data)
		cur.execute("INSERT INTO facilities VALUES (%s, %s, %s, %s, %s)",
                                (f"{data['address']}",f"{data['liscense-date']}",f"{data['name']}",
                                f"{data['site_id']}",f"{data['service']}"))
		connection.commit()
		return redirect('/facilities')
	else:
		return 'Form submission failed'

@app.route('/facilities/delete', methods=['DELETE','GET'])
def deleteFacility():
	if request.method == 'DELETE':
	        data = request.form.get('SSN')
        	cur.execute("DELETE FROM facilities WHERE site_id= %s", data)
        	connection.commit()
        	return redirect('/facilities')
	else:
		return 'Unable to delete facility'

@app.route('/employees')
def employee():
	log = 'Employees'
	cur.execute('SELECT * FROM employees')
	employees = cur.fetchall()
	connection.commit()
	return render_template('employee.html', log_employee=log, employees=employees)

@app.route('/employees/add', methods=['POST', 'GET'])
def addEmployee():
	if request.method == 'POST':
		data = request.form.to_dict()
		print(data)
		cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s, %s)",
				(f"{data['address']}",f"{data['gender']}",f"{data['first']}",
				f"{data['last']}",f"{data['SSN']}",f"{data['hire-date']}", f"{data['position']}"))
		connection.commit()
		return redirect('/employees')
	else:
		return 'Form submission failed'

@app.route('/employees/delete', methods=['DELETE','GET'])
def deleteEmployee():
	if request.method == 'DELETE':
	        data = request.form.get('SSN')
        	cur.execute(f"DELETE FROM employees WHERE SSN={data}")
        	connection.commit()
        	return redirect('/employees')
	else:
		return 'Unable to remove employee'

@app.route('/history')
def history():
	log = 'History'
	cur.execute('SELECT * FROM previous_employees')
	employees = cur.fetchall()
	cur.execute('SELECT * FROM previous_clients')
	clients = cur.fetchall()
	return render_template('history.html', log_history=log, employees=employees, clients=clients)

if __name__ == '__main__':
	app.debug = True
	ip = '127.0.0.1'
	app.run(host=ip)
