FROM cm2network/steamcmd
MAINTAINER jared.lite@gmail.com

ENV KF_LOGIN=admin
ENV KF_PASS=admin
ENV KF_GAMEPASS=admin
ENV KF_GAME_LENGTH=2
ENV KF_DIFFICULTY=7.000000
ENV KF_SERVER_NAME="Killing Floor Server"
ENV KF_MAIL="admin@killingfloor.com"

ADD scripts/run.sh run.sh

EXPOSE 7707/udp
EXPOSE 7708/udp
EXPOSE 7717/udp
EXPOSE 8075/tcp
EXPOSE 20650/udp
EXPOSE 28852

CMD bash run.sh
