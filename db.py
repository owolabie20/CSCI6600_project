"""Database client."""
from loguru import logger
import psycopg2
import config

    def __init__(self, config):
        self.host = config.DATABASE_HOST
        self.username = config.DATABASE_USERNAME
        self.password = config.DATABASE_PASSWORD
        self.port = config.DATABASE_PORT
        self.dbname = config.DATABASE_NAME
        self.conn = None

    def connect(self):
        """Connect to a Postgres database."""
        if self.conn is None:
            try:
                self.conn = psycopg2.connect(
                    host=self.host,
                    user=self.username,
                    password=self.password,
                    port=self.port,
                    dbname=self.dbname
                )
                return conn
            except psycopg2.DatabaseError as e:
                LOGGER.error(e)
                raise e
            finally:
                LOGGER.info('Connection opened successfully.')

    def cursor(connection):
    	if connection:
    		return connection.cursor()
    	else:
    		print('Ensure database is connected before invoking cursor method.')
