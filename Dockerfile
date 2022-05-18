FROM openjdk:8-jdk-alpine
MAINTAINER jiangore <1066985081@qq.com>

# set environment
ENV BASE_DIR="/opt/sentinel" \
    SERVER_PORT="8080" \
	USERNAME="sentinel" \
	PASSWORD="sentinel" \
    DASHBOARD_SERVER="localhost:8080" \
    PROJECT_NAME="sentinel-dashboard" \
    JAVA_OPTS="" \
    TIME_ZONE="Asia/Shanghai"

ARG SENTINEL_DASHBOARD_VERSION=1.8.4

VOLUME /tmp

WORKDIR $BASE_DIR

RUN set -x \
    && apk update \
    && apk --no-cache add ca-certificates wget \
    && update-ca-certificates \
    && wget https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_DASHBOARD_VERSION}/sentinel-dashboard-${SENTINEL_DASHBOARD_VERSION}.jar -P $BASE_DIR -O sentinel-dashboard.jar \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo '$TIME_ZONE' > /etc/timezone
	
ADD bin/docker-entrypoint.sh /root/docker-entrypoint.sh

RUN chmod 777 /root/docker-entrypoint.sh

RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo '$TIME_ZONE' > /etc/timezone

EXPOSE 8080
ENTRYPOINT ["/root/docker-entrypoint.sh"]
