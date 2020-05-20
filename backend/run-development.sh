#!/bin/bash

source venv/bin/activate

export APP_SETTINGS="config.DevelopmentConfig"
export DATABASE_URL="postgresql+psycopg2://postgres:PG1q2w3e4r5t@localhost:5432/mrs"

#python run.py runserver
python manage.py runserver --host '0.0.0.0'
