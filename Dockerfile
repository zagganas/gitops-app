FROM python:3.8-alpine

COPY . /app

RUN addgroup -g 2000 server

RUN adduser --disabled-password -g "" -h "/app" -G "server" -u "2001" "server"

RUN chown server:server /app -R

USER server

WORKDIR /app

RUN pip install -r requirements.txt

ENV PATH="/app/.local/bin:${PATH}"

CMD ["gunicorn", "--chdir", "app", "app:app", "-w", "2", "--threads", "2", "-b", "0.0.0.0:8080"]