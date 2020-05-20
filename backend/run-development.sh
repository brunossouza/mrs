#!/bin/bash

source venv/bin/activate

export APP_SETTINGS="config.DevelopmentConfig"
export DATABASE_URL="postgresql+psycopg2://postgres:123456@localhost:5432/mrs"

#python run.py runserver
python run.py runserver --host 0.0.0.0
