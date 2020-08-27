#!/bin/bash

# Load Environment Variables
export $(grep -v '^#' .env | xargs)

# Do build and put server UP
docker-compose up --build -d

docker exec web python manage.py makemigrations --noinput
docker exec web python manage.py migrate --noinput

# Import csv data
docker exec web python manage.py runscript import_vulnerability

# Create super user
docker exec -it web python manage.py createsuperuser --email $EMAIL --username $USER
