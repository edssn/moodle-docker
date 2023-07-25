FROM nginx

RUN apt update -y
RUN apt install -y vim rsync telnet htop net-tools wget screen procps

RUN addgroup --gid 3000 --system app
RUN adduser --uid 3000 --system --disabled-login --disabled-password --gid 3000 app

# docker build -t edissonsigua/moodle-web .