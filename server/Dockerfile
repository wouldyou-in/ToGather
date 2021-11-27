FROM python:3.8
LABEL maintainer="mansuiki@gmail.com"

COPY . /app
WORKDIR /app

RUN apt-get -y install default-libmysqlclient-dev
RUN pip install -r requirements.txt

CMD ["gunicorn", "--workers", "3", "--bind","0.0.0.0:80", "TOGATHER.wsgi:application"]
