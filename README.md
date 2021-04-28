# Final Project
### Elizabeth Owolabi owolabie20@students.ecu.edu

## Quick Start
### Set Up Machine
First update system:
```
sudo apt-get update
```
Then install PostgreSQL
```
sudo apt install postgresql postgresql-contrib libpq-dev
```
```
sudo apt install python3-flask
```

### Local Test Setup
First, we need to install a Python 3 virtual environment with:
```
sudo apt-get install python3-venv
```

Create a virtual environment:
```
python3 -m venv python_venv
```

You need to activate the virtual environment when you want to use it:
```
source python_venv/bin/activate
```

To fufill all the requirements for the python server, you need to run:
```
pip3 install -r requirements.txt
```
Because we are now inside a virtual environment. We do not need sudo.

### Steps to set up database:

First, check status of database:

```
service postgresql status
```
If down then restart the database with the command:
```
service postgresql restart
```
Then, check the list of database:
```
psql
```
Now create new database called commsys.
```
CREATE DATABASE commsys;
```
Output would be:
```
CREATE DATABASE 
```
Not your database information.
## Enter site:
```
python3 main.py
```
