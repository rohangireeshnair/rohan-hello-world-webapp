FROM python:3
WORKDIR /usr/src/hello-world-webapp
RUN pip install -r requirements.txt
COPY . /usr/src/hello-world-webapp
CMD [ "python", "./app.py" ]
