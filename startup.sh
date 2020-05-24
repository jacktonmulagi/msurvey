#!/bin/sh
WORK_DIR={$PWD}
SERVICE_NAME=msurvey
PATH_TO_JAR=${WORK_DIR}/msurvey.jar
PID_PATH_NAME=/tmp/msurvey-pid
JAVA_OPTS="-Dlogback.configurationFile=${WORK_DIR}/logback.xml"
export JAVA_OPTS

echo "Starting ${SERVICE_NAME} ...";
if [ ! -f $PID_PATH_NAME ]; then
    nohup java $JAVA_OPTS -jar $PATH_TO_JAR $ARGS /tmp 2>> /dev/null >> /dev/null &
                echo $! > $PID_PATH_NAME
    echo "$SERVICE_NAME started ...";
else
    echo "$SERVICE_NAME is already running ...";
fi
