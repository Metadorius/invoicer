FROM golang:latest
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

COPY invoicer /app/invoicer
USER app
# Don't need to expose explicitly, Dokku will do it for us
# EXPOSE 8080
WORKDIR /app
ENTRYPOINT /app/invoicer
