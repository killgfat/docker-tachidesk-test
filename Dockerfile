FROM alpine:latest

RUN apk --update add curl openjdk8-jre-base tzdata

RUN mkdir -p /home/suwayomi
USER root

WORKDIR /home/suwayomi

RUN curl -s --create-dirs -L https://raw.githubusercontent.com/suwayomi/docker-tachidesk/main/scripts/startup_script.sh -o /home/suwayomi/startup/startup_script.sh

RUN curl -L $(curl -s https://api.github.com/repos/suwayomi/tachidesk-server/releases/latest | grep -o "https.*jar") -o /home/suwayomi/startup/tachidesk_latest.jar

EXPOSE 4567

CMD ["/bin/sh", "/home/suwayomi/startup/startup_script.sh"]
