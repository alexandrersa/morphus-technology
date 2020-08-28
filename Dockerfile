FROM python:alpine3.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apk update && apk add build-base openldap-dev python2-dev python3-dev postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade pip
# creation of requirements.txt
#COPY Pipfile ./Pipfile
#RUN pipenv lock -r > requirements.txt
RUN pip install -r requirements.txt
COPY . /code/
ENTRYPOINT ["/code/entrypoint.sh"]
