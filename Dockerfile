# We Use an official Python runtime as a parent image
FROM  python:3.7-alpine
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
# create root directory for our project in the container
RUN mkdir /usr/src/app
# Set the working directory to 
WORKDIR /usr/src/app

ADD . /usr/src/app
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8000
CMD exec gunicorn Employer_Module.wsgi:application — bind 0.0.0.0:8000 — workers 3