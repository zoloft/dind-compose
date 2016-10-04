FROM docker:dind

RUN apk update && apk -U add python py-pip curl

RUN curl -L -o docker-compose.tar.gz  https://github.com/docker/compose/archive/1.8.1.tar.gz

RUN tar -xzf docker-compose.tar.gz compose-1.8.1/requirements.txt

RUN pip install -r compose-1.8.1/requirements.txt
RUN pip install --no-deps docker-compose.tar.gz

ENTRYPOINT "dockerd-entrypoint.sh"
