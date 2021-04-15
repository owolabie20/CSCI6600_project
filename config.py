"""Load config from environment variables."""
from os import environ, path
from dotenv import load_dotenv


# Load variables from .env
basedir = path.abspath(path.dirname(__file__))
load_dotenv(path.join(basedir, '.env'))


# Database config
DATABASE_HOST = localhost
DATABASE_USERNAME = postgres
DATABASE_PASSWORD = lovelove
DATABASE_PORT = 5432
DATABASE_NAME = commsys

# SQL queries
SQL_QUERIES_FOLDER = 'sql'